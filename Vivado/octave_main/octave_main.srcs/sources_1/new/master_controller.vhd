-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;

-- Reading and writing controller
entity master_controller is 
  Port (
        -- Master FPGA CLK
        clk_100MHz : in STD_LOGIC;
        clk_50MHz : in STD_LOGIC;   
        reset : in STD_LOGIC;    
        -- CLKs
        MCLK_ADC : out STD_LOGIC;
        SCLK_ADC : out STD_LOGIC;
        LR_W_SEL_ADC : out STD_LOGIC;
        MCLK_DAC : out STD_LOGIC;
        SCLK_DAC : out STD_LOGIC;
        LR_W_SEL_DAC : out STD_LOGIC;
        -- INput/OUTput       
        global_state : in STD_LOGIC_VECTOR (1 downto 0); 
        DATA_IN : in STD_LOGIC;
        DATA_OUT : out STD_LOGIC         
   );
end master_controller;

architecture Behavioral of master_controller is

    -- Component declaration
    component sampling port(
        -- Master FPGA CLK
        clk_100MHz : in STD_LOGIC;
        clk_50MHz : in STD_LOGIC;
        frame_number : out STD_LOGIC_VECTOR (4 downto 0);
        reset : in STD_LOGIC;
        sample_in_ready : out STD_LOGIC;
        sample_towrite_ready : out STD_LOGIC;
        control : out STD_LOGIC_VECTOR (2 downto 0);
        -- CLKs
        MCLK : out STD_LOGIC;
        SCLK : out STD_LOGIC;    
        SC_2 : out STD_LOGIC;    
        LR_W_SEL : out STD_LOGIC    
    ); end component;
  
    component shift_register port(
        clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        reset : in STD_LOGIC;
        data_in : in STD_LOGIC;
        data_out : out signed (sample_size - 1 downto 0)
    ); end component;
    
    component window_controller port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        start_proc_win : in STD_LOGIC;
        end_proc_win : out STD_LOGIC;
        for_inv : in STD_LOGIC; -- 1 = STFT, 0 = iSTFT
        multiplicand : in signed (sample_size - 1 downto 0);
        sample_number : in STD_LOGIC_VECTOR (8 downto 0);
        result : out signed (sample_size - 1 downto 0)
    ); end component;
    
    component fsm_control port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        start_output : in STD_LOGIC;
        frame_number : in STD_LOGIC_VECTOR (4 downto 0);
        control_signals : in STD_LOGIC_VECTOR (0 downto 0);
        input_fsm : out STD_LOGIC_VECTOR (2 downto 0)
    ); end component;
    
    component manager_memo port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        start_proc : in STD_LOGIC;
        sample_in : in SIGNED (sample_size - 1 downto 0);
        memo_address : in STD_LOGIC_VECTOR (8 downto 0);
        rw : in STD_LOGIC;
        end_proc : out STD_LOGIC;
        memo_event : out STD_LOGIC;
        out_rdy : out STD_LOGIC;
        use_mem : out UNSIGNED (1 downto 0);
        samp_out : out SIGNED (sample_size - 1 downto 0)
    ); end component;
    
    component man_out_memo port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        start_proc_w : in STD_LOGIC;
        start_proc_r : in STD_LOGIC;
        sample_in : in SIGNED (sample_size - 1 downto 0);
        write_address : in STD_LOGIC_VECTOR (10 downto 0);
        read_address : in STD_LOGIC_VECTOR (10 downto 0);
        event_write : out STD_LOGIC;
        event_read : out STD_LOGIC;
        out_rdy : out STD_LOGIC;
        memw : out UNSIGNED (1 downto 0);
        memr : out UNSIGNED (1 downto 0);
        samp_out : out SIGNED (sample_size - 1 downto 0)
    ); end component;
    
    component freq_dom_controller port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        state : in STD_LOGIC_VECTOR (2 downto 0);
        add_req : in STD_LOGIC; -- Cuando requiere una direccion -> event_write
        load_even : in STD_LOGIC; -- Cuando tiene que cargar en la memoria par
        load_odd : in STD_LOGIC; -- Cuando tiene que cargar en la memoria impar
        even_mem : in STD_LOGIC; -- 0 para la memoria 0 y 1 para la 2
        odd_mem : in STD_LOGIC; -- 0 para la memoria 1 y 1 para la 3
        end_load_even : out STD_LOGIC;
        end_load_odd : out STD_LOGIC;
        load_add_even : out STD_LOGIC_VECTOR (8 downto 0);
        load_add_odd : out STD_LOGIC_VECTOR (8 downto 0)
    ); end component;

    -- Signal declaration                          
    signal frame_number : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal enable_shift, enable_shift_next, sample_in_ready, sample_towrite_ready, start_output, start_reading, start_reading_next
           , DATA_OUTr, DATA_OUTn : STD_LOGIC := '0';    
    signal input_reg, output_sample, output_sample_next : SIGNED ((sample_size - 1) downto 0) := (others => '0');    
    signal MCLK, SCLK, LR_W_SEL : STD_LOGIC := '0';
    -- Counter and address signals
    signal sample_towrite : signed (23 downto 0) := (others => '0');
    signal start_buffer1, start_buffer2, start_buffer3, start_buffer1_next, start_buffer2_next, start_buffer3_next, start_buffer1r, start_buffer2r
           , start_buffer3r, start_buffer1r_next, start_buffer2r_next, start_buffer3r_next : STD_LOGIC := '0';
    signal counter_buf0, counter_buf0_next : UNSIGNED (8 downto 0) := (others => '1'); 
    signal counter_buf1, counter_buf1_next, counter_buf2, counter_buf2_next, counter_buf3
           , counter_buf3_next, counter_buf1r, counter_buf1r_next, counter_buf2r, counter_buf2r_next
           , counter_buf3r, counter_buf3r_next, counter_buf0r, counter_buf0r_next  : UNSIGNED (8 downto 0) := (others => '0'); 
    signal address_buf0, address_buf0_next : STD_LOGIC_VECTOR(8 downto 0) := (others => '1');
    signal address_buf2r, address_buf2r_next, address_buf2, address_buf2_next, address_buf0r, address_buf0r_next, address_buf1, address_buf1_next
           , address_buf3, address_buf3_next, address_buf1r, address_buf1r_next, address_buf3r 
           , address_buf3r_next : STD_LOGIC_VECTOR(8 downto 0) := "000000000";
    -- Memo controller signals
    signal start_proc_inmemo, start_proc_inmemo_next, rw_inmemo_next, memo_event_inmemo : STD_LOGIC := '0';
    signal end_proc_inmemo, out_ready_inmemo : STD_LOGIC := '0';
    signal read_buffer0, read_buffer1, read_buffer2, read_buffer3, read_buffer0_next, read_buffer1_next, read_buffer2_next
           , read_buffer3_next, sample_in_inmemo, sample_in_inmemo_next, samp_out_inmemo : SIGNED (15 downto 0) := (others => '0');
    signal use_mem_inmemo : UNSIGNED (1 downto 0) := "00";
    signal address_inmemo, address_inmemo_next : STD_LOGIC_VECTOR (8 downto 0) := (others => '0');
    signal output_read, output_read_next : UNSIGNED (1 downto 0) := "00";
    -- Output memo
    signal start_procw_outmemo, start_procw_outmemo_next, start_procr_outmemo, start_procr_outmemo_next, end_proc_outmemo, out_rdy_outmemo
           , ev_r_outmemo, ev_w_outmemo, read_outmemo, read_outmemo_next, wr_outmemo, wr_outmemo_next : STD_LOGIC := '0';
    signal sample_in_outmemo, sample_in_outmemo_next, sample_out_outmemo: SIGNED (sample_size - 1 downto 0) := (others => '0');
    signal mem_re_outmemo, mem_wr_outmemo : UNSIGNED (1 downto 0) := "00";
    signal wa_outmemo, wa_outmemo_next, ra_outmemo, ra_outmemo_next : STD_LOGIC_VECTOR (10 downto 0) := (others => '0');
    -- Control signals
    signal control_sampling : STD_LOGIC_VECTOR (2 downto 0);
    signal event_read, event_write, event_new_frame : STD_LOGIC;
    -- Window signals
    signal start_proc_win, start_proc_win_next, end_proc_win, for_inv, for_inv_next, rw_inmemo : STD_LOGIC := '0';
    signal multiplicand, multiplicand_next, win_result : SIGNED (sample_size - 1 downto 0) := (others => '0');
    signal sample_number, sample_number_next : STD_LOGIC_VECTOR (8 downto 0);
    signal stage, win_stage, win_stage_next : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal winbuf0, winbuf0n, winbuf1, winbuf1n, winbuf2, winbuf2n, winbuf3, winbuf3n : SIGNED (sample_size - 1 downto 0) := (others => '0');
    -- FSM State signals 
    type input_fsm_t is (IDLE, WRITE_INPUT, LOAD_FREQ, UNLOAD_FREQ, READ_OUTPUT, READ_SUM);   
    signal input_state : input_fsm_t := IDLE;
    signal input_fsm : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal control_signals : STD_LOGIC_VECTOR (0 downto 0) := "0";
    -- Freq. dom signals
    signal end_load_even, end_load_odd, even_mem, even_mem_nn, odd_mem, odd_mem_nn : STD_LOGIC := '0';
    signal load_even, load_odd : STD_LOGIC; -- OJOOO
    signal load_add_even, load_add_odd : STD_LOGIC_VECTOR (8 downto 0);
    
begin  

    SAMP : sampling port map(
        clk_100MHz => clk_100MHz,
        clk_50MHz => clk_50MHz,
        frame_number => frame_number,
        reset => reset,
        sample_in_ready => sample_in_ready,
        sample_towrite_ready => sample_towrite_ready,
        control => control_sampling,   
        MCLK => MCLK, 
        SCLK => SCLK,        
        LR_W_SEL => LR_W_SEL        
    );
       
    SHFT : shift_register port map(
        clk => sclk,
        enable => enable_shift,
        reset => reset,
        data_in => DATA_IN,
        data_out => input_reg
    );   
    
    INPUT_MEMO : manager_memo port map(
        clk => clk_100MHz,
        reset => reset,
        start_proc => start_proc_inmemo,
        sample_in => sample_in_inmemo,
        memo_address => address_inmemo,
        rw => rw_inmemo,
        end_proc => end_proc_inmemo,
        memo_event => memo_event_inmemo,
        out_rdy => out_ready_inmemo,
        use_mem => use_mem_inmemo,
        samp_out => samp_out_inmemo
    );
    
    OUTPUT_MEMO : man_out_memo port map(
        clk => clk_100MHz, --
        reset => reset, --
        start_proc_w => start_procw_outmemo,
        start_proc_r => start_procr_outmemo, --
        sample_in => sample_in_outmemo,
        write_address => wa_outmemo,
        read_address => ra_outmemo,
        event_write => ev_w_outmemo, --
        event_read => ev_r_outmemo, --
        out_rdy => out_rdy_outmemo, --
        memw => mem_wr_outmemo, --
        memr => mem_re_outmemo, 
        samp_out => sample_out_outmemo
    );
    
    WIN1 : window_controller port map(
        clk => clk_100MHz,
        reset => reset,
        start_proc_win => start_proc_win,
        end_proc_win => end_proc_win,
        for_inv => for_inv,
        multiplicand => multiplicand,
        sample_number => sample_number,
        result => win_result
    );
        
    FSM : fsm_control port map (
        clk => clk_100MHz,
        reset => reset,
        frame_number => frame_number,
        control_signals => control_signals,
        start_output => start_output,
        input_fsm => input_fsm
    ); 
    
--    FREQ : freq_dom_controller port map (
--        clk => clk_100MHz,
--        state => input_fsm,
--        reset => reset,
--        add_req => event_write,
--        load_even => load_even, -- Cuando tiene que cargar en la memoria par
--        load_odd => load_odd, -- Cuando tiene que cargar en la memoria impar
--        even_mem => even_mem, -- 0 para la memoria 0 y 1 para la 2
--        odd_mem => odd_mem, -- 0 para la memoria 1 y 1 para la 3
--        end_load_even => end_load_even,
--        end_load_odd => end_load_odd,
--        load_add_even => load_add_even,
--        load_add_odd => load_add_odd
--    );       

    -- Register logic
    process(clk_100MHz, reset)
        begin            
            if reset = '1' then           
                output_sample <= (others => '0'); 
                DATA_OUTr <= '0';
                enable_shift <= '0';
                start_proc_win <= '0';
                for_inv <= '0';
                sample_number <= (others => '0');
                multiplicand <= (others => '0');
                win_stage <= "00";
                -- Counters and address
                counter_buf0 <= (others => '0');
                counter_buf1 <= (others => '0');
                counter_buf2 <= (others => '0');
                counter_buf2 <= (others => '0');
                address_buf0 <= (others => '0');
                address_buf1 <= (others => '0');
                address_buf2 <= (others => '0');
                address_buf3 <= (others => '0');
                start_buffer1 <= '0';
                start_buffer3 <= '0';
                start_buffer2 <= '0';
                -- Reading
                counter_buf0r <= (others => '0');
                counter_buf1r <= (others => '0');
                counter_buf2r <= (others => '0');
                counter_buf2r <= (others => '0');
                address_buf0r <= (others => '0');
                address_buf1r <= (others => '0');
                address_buf2r <= (others => '0');
                address_buf3r <= (others => '0');
                start_buffer1r <= '0';
                start_buffer3r <= '0';
                start_buffer2r <= '0';
                read_buffer0 <= (others => '0');
                read_buffer1 <= (others => '0');
                read_buffer2 <= (others => '0');
                read_buffer3 <= (others => '0');
                start_reading <= '0';
                -- FFT
                winbuf0 <= (others => '0');
                winbuf1 <= (others => '0');
                winbuf2 <= (others => '0');
                winbuf3 <= (others => '0');
                start_proc_inmemo <= '0';
                sample_in_inmemo <= (others => '0');
                address_inmemo <= (others => '0');
                rw_inmemo <= '0';
                output_read <= "00";
                start_procw_outmemo <= '0';
                start_procr_outmemo <= '0';
                sample_in_outmemo <= (others => '0');
                wa_outmemo <= (others => '0');
                ra_outmemo <= (others => '0');
                read_outmemo <= '0';
                wr_outmemo <= '0';
                -- Freq
                even_mem <= '0';
                odd_mem <= '0';
            elsif rising_edge(clk_100MHz) then                
                output_sample <= output_sample_next;
                DATA_OUTr <= DATA_OUTn;
                enable_shift <= enable_shift_next;                             
                start_proc_win <= start_proc_win_next;
                for_inv <= for_inv_next;            
                sample_number <= sample_number_next;
                multiplicand <= multiplicand_next;
                win_stage <= win_stage_next;
                --Counters and address
                counter_buf0 <= counter_buf0_next;
                counter_buf1 <= counter_buf1_next;
                counter_buf2 <= counter_buf2_next;
                counter_buf3 <= counter_buf3_next;
                address_buf0 <= address_buf0_next;
                address_buf1 <= address_buf1_next;
                address_buf2 <= address_buf2_next;
                address_buf3 <= address_buf3_next;
                start_buffer1 <= start_buffer1_next;
                start_buffer2 <= start_buffer2_next;
                start_buffer3 <= start_buffer3_next;
                -- Reading
                counter_buf0r <= counter_buf0r_next;
                counter_buf1r <= counter_buf1r_next;
                counter_buf2r <= counter_buf2r_next;
                counter_buf3r <= counter_buf3r_next;
                address_buf0r <= address_buf0r_next;
                address_buf1r <= address_buf1r_next;
                address_buf2r <= address_buf2r_next;
                address_buf3r <= address_buf3r_next;
                start_buffer1r <= start_buffer1r_next;
                start_buffer2r <= start_buffer2r_next;
                start_buffer3r <= start_buffer3r_next;
                read_buffer0 <= read_buffer0_next;
                read_buffer1 <= read_buffer1_next;
                read_buffer2 <= read_buffer2_next;
                read_buffer3 <= read_buffer3_next;
                start_reading <= start_reading_next;
                -- FFT
                winbuf0 <= winbuf0n;
                winbuf1 <= winbuf1n;
                winbuf2 <= winbuf2n;
                winbuf3 <= winbuf3n;
                start_proc_inmemo <= start_proc_inmemo_next;
                sample_in_inmemo <= sample_in_inmemo_next;
                address_inmemo <= address_inmemo_next;
                rw_inmemo <= rw_inmemo_next;
                output_read <= output_read_next;
                start_procr_outmemo <= start_procr_outmemo_next;
                start_procw_outmemo <= start_procw_outmemo_next;
                sample_in_outmemo <= sample_in_outmemo_next;
                wa_outmemo <= wa_outmemo_next;
                ra_outmemo <= ra_outmemo_next;
                read_outmemo <= read_outmemo_next;
                wr_outmemo <= wr_outmemo_next;
                even_mem <= even_mem_nn;
                odd_mem <= odd_mem_nn;
            end if;           
    end process;         
    -- Uses wrting fsm state to generate its control signals and counters
    
        
        -- Makes every w/r operation possible by activating target signals when corresponds, depending on memory state (memo_state)
        input_state_outputs : process(input_state, for_inv, start_proc_win, sample_number, win_stage, winbuf0, winbuf1, winbuf2
                                      , winbuf3, address_inmemo, sample_in_inmemo, event_write, event_read, counter_buf0, counter_buf1, counter_buf2
                                      , counter_buf3, end_proc_win, win_result, address_buf0, address_buf1, address_buf2, address_buf3
                                      , input_reg, multiplicand, rw_inmemo, memo_event_inmemo, out_ready_inmemo, output_read, samp_out_inmemo
                                      , read_buffer0, read_buffer1, read_buffer2, read_buffer3, output_sample, use_mem_inmemo, start_buffer1
                                      , start_buffer2, start_buffer3, start_buffer1r, start_buffer2r, start_buffer3r, address_buf0r
                                      , address_buf1r, address_buf2r, address_buf3r, counter_buf0r, counter_buf1r, counter_buf2r
                                      , counter_buf3r, read_outmemo, wr_outmemo, ev_r_outmemo, out_rdy_outmemo, mem_re_outmemo, wa_outmemo
                                      , sample_in_outmemo, mem_wr_outmemo, ev_w_outmemo)
            begin 
                -- Default
                for_inv_next <= for_inv;
                start_proc_win_next <= '0';
                sample_number_next <= sample_number;
                win_stage_next <= win_stage;
                winbuf0n <= winbuf0;
                winbuf1n <= winbuf1;
                winbuf2n <= winbuf2;
                winbuf3n <= winbuf3;
                address_inmemo_next <= address_inmemo;
                sample_in_inmemo_next <= sample_in_inmemo;
                start_proc_inmemo_next <= '0';
                sample_in_outmemo_next <= sample_in_outmemo;
                start_procw_outmemo_next <= '0';
                start_procr_outmemo_next <= '0';
                multiplicand_next <= multiplicand;
                rw_inmemo_next <= rw_inmemo;
                output_read_next <= output_read;
                read_buffer0_next <= read_buffer0;
                read_buffer1_next <= read_buffer1;
                read_buffer2_next <= read_buffer2;
                read_buffer3_next <= read_buffer3;
                output_read_next <= output_read;
                output_sample_next <= output_sample;              
                case input_state is                       
                    when WRITE_INPUT =>
                        for_inv_next <= '1';                       
                        rw_inmemo_next <= '1';
                        if event_write = '1' then
                            start_proc_win_next <= '1';
                            sample_number_next <= std_logic_vector(counter_buf0);
                            win_stage_next <= "00";
                            multiplicand_next <= input_reg;
                        elsif end_proc_win = '1'then
                            if win_stage = "00" then
                                start_proc_win_next <= '1';
                                sample_number_next <= std_logic_vector(counter_buf1);
                                win_stage_next <= "01";
                                winbuf0n <= win_result;
                            elsif win_stage = "01" then
                                start_proc_win_next <= '1';
                                sample_number_next <= std_logic_vector(counter_buf2);
                                win_stage_next <= "10";
                                winbuf1n <= win_result;
                            elsif win_stage = "10" then
                                start_proc_win_next <= '1';
                                sample_number_next <= std_logic_vector(counter_buf3);
                                winbuf2n <= win_result;
                                win_stage_next <= "11";
                                start_proc_inmemo_next <= '1';
                            elsif win_stage = "11" then
                                winbuf3n <= win_result;
                                win_stage_next <= "00";
                            end if;
                        end if;
                        if memo_event_inmemo = '1' then
                            if use_mem_inmemo = "00" then
                                address_inmemo_next <= address_buf0;
                                sample_in_inmemo_next <= winbuf0;
                            elsif use_mem_inmemo = "01" and start_buffer1 = '1' then
                                address_inmemo_next <= address_buf1;
                                sample_in_inmemo_next <= winbuf1;
                            elsif use_mem_inmemo = "10" and start_buffer2 = '1' then
                                address_inmemo_next <= address_buf2;
                                sample_in_inmemo_next <= winbuf2;
                            elsif use_mem_inmemo = "11" and start_buffer3 = '1' then
                                address_inmemo_next <= address_buf3;
                                sample_in_inmemo_next <= winbuf3;
                            end if;
                        end if;
                    
--                    when LOAD_FREQ => 
--                        if event_read = '1' then
--                            start_proc_inmemo_next <= '1';
--                        elsif memo_event_inmemo = '1' then
--                            if use_mem_inmemo = "00" then
--                                address_inmemo_next <= address_buf0r;
--                            elsif use_mem_inmemo = "01" then
--                                address_inmemo_next <= address_buf1r;
--                            elsif use_mem_inmemo = "10" then
--                                address_inmemo_next <= address_buf2r;
--                            elsif use_mem_inmemo = "11" then
--                                address_inmemo_next <= address_buf3r;
--                            end if;
--                        end if;
--                        if out_ready_inmemo = '1' then
--                            if output_read = "00" then
--                                read_buffer0_next <= samp_out_inmemo;
--                                output_read_next <= output_read + 1;
--                            elsif output_read = "01" then
--                                read_buffer1_next <= samp_out_inmemo;
--                                output_read_next <= output_read + 1;
--                            elsif output_read = "10" then
--                                read_buffer2_next <= samp_out_inmemo;
--                                output_read_next <= output_read + 1;
--                            elsif output_read = "11" then
--                                read_buffer3_next <= samp_out_inmemo;
--                                output_read_next <= output_read + 1;                            
--                            end if;
--                        end if;
--                        if ev_w_outmemo = '1' then
--                            if mem_wr_outmemo = "00" then
--                                address_inmemo_next <= address_buf0;
--                                sample_in_inmemo_next <= winbuf0;
--                            elsif mem_wr_outmemo = "01" and start_buffer1 = '1' then
--                                address_inmemo_next <= address_buf1;
--                                sample_in_inmemo_next <= winbuf1;
--                            elsif mem_wr_outmemo = "10" and start_buffer2 = '1' then
--                                address_inmemo_next <= address_buf2;
--                                sample_in_inmemo_next <= winbuf2;
--                            elsif mem_wr_outmemo = "11" and start_buffer3 = '1' then
--                                address_inmemo_next <= address_buf3;
--                                sample_in_inmemo_next <= winbuf3;
--                            end if;
--                        end if;
                         
                    when READ_OUTPUT => 
                        for_inv_next <= '0';    
                        rw_inmemo_next <= '0';                    
                        if event_read = '1' then
                            start_proc_inmemo_next <= '1';
                        elsif memo_event_inmemo = '1' then
                            if use_mem_inmemo = "00" then
                                address_inmemo_next <= address_buf0r;
                            elsif use_mem_inmemo = "01" then
                                address_inmemo_next <= address_buf1r;
                            elsif use_mem_inmemo = "10" then
                                address_inmemo_next <= address_buf2r;
                            elsif use_mem_inmemo = "11" then
                                address_inmemo_next <= address_buf3r;
                            end if;
                        end if;
                        if out_ready_inmemo = '1' then
                            if output_read = "00" then
                                read_buffer0_next <= samp_out_inmemo;
                                output_read_next <= output_read + 1;
                            elsif output_read = "01" then
                                read_buffer1_next <= samp_out_inmemo;
                                output_read_next <= output_read + 1;
                            elsif output_read = "10" then
                                read_buffer2_next <= samp_out_inmemo;
                                output_read_next <= output_read + 1;
                            elsif output_read = "11" then
                                read_buffer3_next <= samp_out_inmemo;
                                output_read_next <= output_read + 1;                            
                            end if;
                        end if;                        
                    
                    when READ_SUM => 
                        for_inv_next <= '1';
                        if event_read = '1' then
                            start_proc_win_next <= '1';
                            sample_number_next <= std_logic_vector(counter_buf0r);
                            multiplicand_next <= read_buffer0;
                            win_stage_next <= "00";
                        elsif end_proc_win = '1' then
                            if win_stage = "00" then
                                if win_result(15) = '1' then -- Signed /4 division
                                    output_sample_next <= "11" & win_result(15 downto 2);
                                else
                                    output_sample_next <= "00" & win_result(15 downto 2);
                                end if;
                                if start_buffer1r = '1' then
                                    start_proc_win_next <= '1';
                                    sample_number_next <= std_logic_vector(counter_buf1r);
                                    multiplicand_next <= read_buffer1;
                                    win_stage_next <= "01";
                                end if;
                            elsif win_stage = "01" then
                                if win_result(15) = '1' then -- Signed /4 division
                                    output_sample_next <= ("11" & win_result(15 downto 2)) + output_sample; -- OJO
                                else
                                    output_sample_next <= ("00" & win_result(15 downto 2)) + output_sample;
                                end if;
                                if start_buffer2r = '1' then
                                    start_proc_win_next <= '1';
                                    sample_number_next <= std_logic_vector(counter_buf2r);
                                    multiplicand_next <= read_buffer2;
                                    win_stage_next <= "10";
                                end if;
                            elsif win_stage = "10" then
                                if win_result(15) = '1' then -- Signed /4 division
                                    output_sample_next <= ("11" & win_result(15 downto 2)) + output_sample; -- OJO
                                else
                                    output_sample_next <= ("00" & win_result(15 downto 2)) + output_sample;
                                end if;
                                if start_buffer3r = '1' then
                                    start_proc_win_next <= '1';
                                    sample_number_next <= std_logic_vector(counter_buf3r);
                                    multiplicand_next <= read_buffer3;
                                    win_stage_next <= "11";
                                end if;
                            elsif win_stage = "11" then
                                if win_result(15) = '1' then -- Signed /4 division
                                    output_sample_next <= ("11" & win_result(15 downto 2)) + output_sample; -- OJO
                                else
                                    output_sample_next <= ("00" & win_result(15 downto 2)) + output_sample;
                                end if;
                            end if;
                        end if;

                    when others => --IDLE                     
                end case;
        end process;
            
    process(event_new_frame, start_buffer1, start_buffer2, start_buffer3, counter_buf0, counter_buf1, counter_buf2
            , counter_buf3, address_buf0, address_buf1, address_buf2, address_buf3, start_buffer1r, start_buffer2r
            , start_buffer3r, counter_buf0r, counter_buf1r, counter_buf2r, counter_buf3r, address_buf0r, address_buf1r
            , address_buf2r, address_buf3r, start_reading)
        begin
            counter_buf0_next <= counter_buf0;
            counter_buf1_next <= counter_buf1;
            counter_buf2_next <= counter_buf2;
            counter_buf3_next <= counter_buf3;
            address_buf0_next <= address_buf0;
            address_buf1_next <= address_buf1;
            address_buf2_next <= address_buf2;
            address_buf3_next <= address_buf3;    
            start_buffer1_next <= start_buffer1;
            start_buffer2_next <= start_buffer2;
            start_buffer3_next <= start_buffer3; 
            -- Read   
            counter_buf0r_next <= counter_buf0r;
            counter_buf1r_next <= counter_buf1r;
            counter_buf2r_next <= counter_buf2r;
            counter_buf3r_next <= counter_buf3r;
            address_buf0r_next <= address_buf0r;
            address_buf1r_next <= address_buf1r;
            address_buf2r_next <= address_buf2r;
            address_buf3r_next <= address_buf3r;    
            start_buffer1r_next <= start_buffer1r;
            start_buffer2r_next <= start_buffer2r;
            start_buffer3r_next <= start_buffer3r;   
            start_reading_next <= start_reading;  
            --start_reading_next <= '1';     
            if event_new_frame = '1' then
                if start_reading = '1' then -- READING
                counter_buf0r_next <= counter_buf0r + 1;
                --if address_buf0r = "0111111111" then
                --    address_buf0r_next <= (others => '0');
                --else
                    address_buf0r_next <= std_logic_vector(unsigned(address_buf0r) + 1);
                --end if;
                if start_buffer1r = '1' then
                    counter_buf1r_next <= counter_buf1r + 1;
                    --if address_buf1r = "0111111111" then
                    --    address_buf1r_next <= "0000000000";
                    --else
                        address_buf1r_next <= std_logic_vector(unsigned(address_buf1r) + 1);
                    --end if;
                    if start_buffer2r = '1' then
                        counter_buf2r_next <= counter_buf2r + 1;
                        --if address_buf2r = "0111111111" then
                        --    address_buf2r_next <= (others => '0');
                        --else
                            address_buf2r_next <= std_logic_vector(unsigned(address_buf2r) + 1);
                        --end if;
                        if start_buffer3r = '1' then
                            counter_buf3r_next <= counter_buf3r + 1;
                            --if address_buf3r = "0111111111" then
                            --    address_buf3r_next <= "0000000000";
                            --else
                                address_buf3r_next <= std_logic_vector(unsigned(address_buf3r) + 1);
                            --end if;
                        end if;
                    end if;
                end if;
                if counter_buf0r = "00000001111111" then
                    start_buffer1r_next <= '1';                       
                elsif counter_buf0r = "00000011111111" then
                    start_buffer2r_next <= '1';
                elsif counter_buf0r = "00000101111111" then
                    start_buffer3r_next <= '1';
                end if;         
            end if;
            -- WRITING
            counter_buf0_next <= counter_buf0 + 1;
            --if address_buf0 = "0111111111" then
            --    address_buf0_next <= (others => '0');
            --else
                address_buf0_next <= std_logic_vector(unsigned(address_buf0) + 1);
            --end if;
            if start_buffer1 = '1' then
                counter_buf1_next <= counter_buf1 + 1;
                --if address_buf1 = "0111111111" then
                --    address_buf1_next <= "0000000000";
                --else
                    address_buf1_next <= std_logic_vector(unsigned(address_buf1) + 1);
                --end if;
                if start_buffer2 = '1' then
                    counter_buf2_next <= counter_buf2 + 1;
                    --if address_buf2 = "0111111111" then
                    --    address_buf2_next <= (others => '0');
                    --else
                        address_buf2_next <= std_logic_vector(unsigned(address_buf2) + 1);
                    --end if;
                    if start_buffer3 = '1' then
                        counter_buf3_next <= counter_buf3 + 1;
                        --if address_buf3 = "0111111111" then
                        --    address_buf3_next <= "0000000000";
                        --else
                            address_buf3_next <= std_logic_vector(unsigned(address_buf3) + 1);
                        --end if;
                    end if;
                    end if;
                end if;               
            end if;
            if counter_buf0 = "00000010000000" then
                start_buffer1_next <= '1';
                start_reading_next <= '1';
            elsif counter_buf0 = "00000100000000" then
                start_buffer2_next <= '1';              
            elsif counter_buf0 = "00000110000000" then
                start_buffer3_next <= '1';
            end if;            
    end process;
    -- Writing dac mode: takes each sample from the previously loaded register and links it to output data channel
    write_dac : process(frame_number, start_reading, sample_towrite, LR_W_SEL)
        begin 
            DATA_OUTn <= '0';
            if start_reading = '1' then     
                    case frame_number is
                        when "00001" => DATA_OUTn <= sample_towrite(23);
                        when "00010" => DATA_OUTn <= sample_towrite(22);
                        when "00011" => DATA_OUTn <= sample_towrite(21);
                        when "00100" => DATA_OUTn <= sample_towrite(20);
                        when "00101" => DATA_OUTn <= sample_towrite(19);
                        when "00110" => DATA_OUTn <= sample_towrite(18);
                        when "00111" => DATA_OUTn <= sample_towrite(17);
                        when "01000" => DATA_OUTn <= sample_towrite(16);
                        when "01001" => DATA_OUTn <= sample_towrite(15);
                        when "01010" => DATA_OUTn <= sample_towrite(14);
                        when "01011" => DATA_OUTn <= sample_towrite(13);
                        when "01100" => DATA_OUTn <= sample_towrite(12);
                        when "01101" => DATA_OUTn <= sample_towrite(11);
                        when "01110" => DATA_OUTn <= sample_towrite(10);
                        when "01111" => DATA_OUTn <= sample_towrite(9);
                        when "10000" => DATA_OUTn <= sample_towrite(8);
                        when "10001" => DATA_OUTn <= sample_towrite(7);
                        when "10010" => DATA_OUTn <= sample_towrite(6);
                        when "10011" => DATA_OUTn <= sample_towrite(5);
                        when "10100" => DATA_OUTn <= sample_towrite(4);
                        when "10101" => DATA_OUTn <= sample_towrite(3);
                        when "10110" => DATA_OUTn <= sample_towrite(2);
                        when "10111" => DATA_OUTn <= sample_towrite(1);
                        when "11000" => DATA_OUTn <= sample_towrite(0);
                        when others => DATA_OUTn <= '0';
                    end case;
            end if;
    end process;
    
--    process(end_load_even, end_load_odd, even_mem, odd_mem)
--        begin
--            even_mem_nn <= even_mem;
--            odd_mem_nn <= odd_mem;
--            if end_load_even = '1' then
--                even_mem_nn <= not even_mem;
--            end if;
--            if end_load_odd = '1' then
--                odd_mem_nn <= not odd_mem;
--            end if;
--    end process;
    -- Generates enable signal used by the shift-register
    enable_shift_next <= '1' when (frame_number >= std_logic_vector(to_unsigned(1, 5)) and frame_number <= std_logic_vector(to_unsigned(sample_size, 5)) 
                                    and LR_W_SEL = '0') else                         
                         '0';
    -- Takes control bus from sampling.vhd and renames its ports                        
    event_read <= control_sampling(0);
    event_write <= control_sampling(1);
    event_new_frame <= control_sampling(2);
    -- Takes control bus from fsm_control.vhd and renames its ports
    control_signals(0) <= LR_W_SEL;
    -- Loads the output register into output buffer when global state is "play"
    sample_towrite <= output_sample & "00000000" when global_state = "11" else
                  (others => '0'); 
    
    -- Renames fsm states to ease coding
    with input_fsm select input_state <=
        WRITE_INPUT when "001",
        READ_OUTPUT when "010",
        READ_SUM when "011",
        LOAD_FREQ when "101",
        UNLOAD_FREQ when "111" ,
        IDLE when others;        
    -- Output signals assignment
    MCLK_ADC <= MCLK;
    SCLK_ADC <= SCLK;
    LR_W_SEL_ADC <= LR_W_SEL;
    MCLK_DAC  <= MCLK; 
    SCLK_DAC <= SCLK; 
    LR_W_SEL_DAC <= LR_W_SEL; 
    DATA_OUT <= DATA_OUTr; 
    stage <= win_stage;
    start_output <= start_reading;
    
end Behavioral;
