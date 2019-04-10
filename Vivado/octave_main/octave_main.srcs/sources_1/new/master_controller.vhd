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
    
    component memo_controller port(
        clk : in STD_LOGIC;
        write_sample : in STD_LOGIC;
        read_sample : in STD_LOGIC;
        memo1_address : in STD_LOGIC_VECTOR (9 downto 0);
        memo2_address : in STD_LOGIC_VECTOR (9 downto 0);
        storaged_sample1 : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        storaged_sample2 : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        writing_sample1 : in STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        writing_sample2 : in STD_LOGIC_VECTOR (sample_size - 1 downto 0)
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
        frame_number : in STD_LOGIC_VECTOR (4 downto 0);
        control_signals : in STD_LOGIC_VECTOR (0 downto 0);
        input_fsm : out STD_LOGIC_VECTOR (2 downto 0)
    ); end component;
    
--    component freq_dom_controller port(
--        clk : in STD_LOGIC;
--        reset : in STD_LOGIC;
--        use_buffer : in STD_LOGIC_VECTOR (1 downto 0);
--        data_in : in SIGNED (15 downto 0);
--        cont_sample : in STD_LOGIC;
--        req_sample : in STD_LOGIC;
--        req_sample_ready : out STD_LOGIC;
--        data_out : out SIGNED (15 downto 0)
--    ); end component;
    -- Signal declaration                          
    signal frame_number : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal enable_shift, enable_shift_next, sample_in_ready, sample_towrite_ready, start_reading, start_reading_next, DATA_OUTr, DATA_OUTn : STD_LOGIC := '0';    
    signal input_reg, output_sample, output_sample_next, sum_result, sum_result_next : SIGNED ((sample_size - 1) downto 0) := (others => '0');    
    signal MCLK, SCLK, LR_W_SEL : STD_LOGIC := '0';
    -- Counter and address signals
    signal sample_towrite : signed (23 downto 0) := (others => '0');
    signal start_buffer1, start_buffer2, start_buffer3, start_buffer1_next, start_buffer2_next, start_buffer3_next, start_buffer1r, start_buffer2r
           , start_buffer3r, start_buffer1r_next, start_buffer2r_next, start_buffer3r_next : STD_LOGIC := '0';
    signal counter_buf0, counter_buf0_next, counter_buf1, counter_buf1_next, counter_buf2, counter_buf2_next, counter_buf3
           , counter_buf3_next, counter_buf0r, counter_buf0r_next, counter_buf1r, counter_buf1r_next, counter_buf2r, counter_buf2r_next
           , counter_buf3r, counter_buf3r_next  : UNSIGNED (8 downto 0) := (others => '0'); 
    signal address_buf0, address_buf0_next, address_buf2, address_buf2_next, address_buf0r, address_buf0r_next, address_buf2r
           , address_buf2r_next : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal address_buf1, address_buf1_next, address_buf3, address_buf3_next, address_buf1r, address_buf1r_next, address_buf3r
           , address_buf3r_next : STD_LOGIC_VECTOR(9 downto 0) := "1000000000";
    -- Memo controller signals
    signal write_sample_memo, read_sample_memo, read_sample_memo_next, write_sample_memo_next : STD_LOGIC := '0';
    signal memo1_address, memo2_address, memo1_address_next, memo2_address_next : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
    signal storaged_sample1, storaged_sample2, writing_sample_memo1, writing_sample_memo2, writing_sample_memo1_next
           , writing_sample_memo2_next : STD_LOGIC_VECTOR (sample_size - 1 downto 0) := (others => '0');
    signal reading_ready, reading_ready_n, reading_ready_nn, reading_ready_nn_next : STD_LOGIC := '0';
    signal read_buffer0, read_buffer1, read_buffer2, read_buffer3, read_buffer0_next, read_buffer1_next, read_buffer2_next
           , read_buffer3_next : SIGNED (15 downto 0);
    -- Control signals
    signal control_sampling : STD_LOGIC_VECTOR (2 downto 0);
    signal event_read, event_write, event_new_frame : STD_LOGIC;
    -- Window signals
    signal start_proc_win1, start_proc_win1_next, end_proc_win1, start_proc_win2, start_proc_win2_next, end_proc_win2
           , for_inv, for_inv_next : STD_LOGIC := '0';
    signal multiplicand1, multiplicand2, multiplicand1_next, multiplicand2_next, win_result1, win_result2 : SIGNED (sample_size - 1 downto 0) := (others => '0');
    signal sample_number1, sample_number1_next, sample_number2, sample_number2_next : STD_LOGIC_VECTOR (8 downto 0);
    signal win_stage, win_stage_next : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal output_sample_ov_next : SIGNED (sample_size downto 0) := (others => '0');
    -- Load FFT module signals
    signal load_address0, load_address0_next, load_address2, load_address2_next : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
    signal load_address1, load_address1_next, load_address3, load_address3_next : STD_LOGIC_VECTOR (9 downto 0) := "1000000000";
    signal start_load0, start_load0_next, start_load1, start_load1_next, start_load2, start_load2_next, start_load3
           , start_load3_next : STD_LOGIC := '0';
    signal fft_input, fft_input_next, fft_output : SIGNED (15 downto 0) := (others => '0');
    signal use_buffer_fft, use_buffer_fft_load, use_buffer_fft_load_next, use_buffer_fft_unload
           , use_buffer_fft_unload_next : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal cont_sample_freq, cont_sample_freq_next, req_sample_freq, req_sample_freq_next, req_sample_ready_freq : STD_LOGIC := '0';
    -- FSM State signals 
    type input_fsm_t is (IDLE, WRITE_INPUT, WRITE_ODD, LOAD_FFT_EVEN, LOAD_FFT_ODD, READ_EVEN, READ_ODD, READ_SUM);   
    signal input_state : input_fsm_t := IDLE;
    signal input_fsm : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal control_signals : STD_LOGIC_VECTOR (0 downto 0) := "0";
    
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
    
    IN_MEMO : memo_controller port map(            
        clk => clk_100MHz,
        write_sample => write_sample_memo,
        read_sample => read_sample_memo,
        memo1_address => memo1_address,
        memo2_address => memo2_address,
        storaged_sample1 => storaged_sample1,
        storaged_sample2 => storaged_sample2,
        writing_sample1 => writing_sample_memo1,
        writing_sample2 => writing_sample_memo2
    );  
    
    WIN1 : window_controller port map(
        clk => clk_100MHz,
        reset => reset,
        start_proc_win => start_proc_win1,
        end_proc_win => end_proc_win1,
        for_inv => for_inv,
        multiplicand => multiplicand1,
        sample_number => sample_number1,
        result => win_result1
    );
    
    WIN2 : window_controller port map(
        clk => clk_100MHz,
        reset => reset,
        start_proc_win => start_proc_win2,
        end_proc_win => end_proc_win2,
        for_inv => for_inv,
        multiplicand => multiplicand2,
        sample_number => sample_number2,
        result => win_result2
        ); 
    
    FSM : fsm_control port map (
        clk => clk_100MHz,
        reset => reset,
        frame_number => frame_number,
        control_signals => control_signals,
        input_fsm => input_fsm
    );        
    
--    FREQ : freq_dom_controller port map(
--        clk => clk_100MHz,
--        reset => reset,
--        use_buffer => use_buffer_fft,
--        cont_sample => cont_sample_freq,
--        req_sample => req_sample_freq,
--        req_sample_ready => req_sample_ready_freq,
--        data_in => fft_input,
--        data_out => fft_output
--    );
    -- Register logic
    process(clk_100MHz, reset)
        begin            
            if reset = '1' then           
                output_sample <= (others => '0'); 
                DATA_OUTr <= '0';
                enable_shift <= '0';
                write_sample_memo <= '0';
                start_proc_win1 <= '0';
                start_proc_win2 <= '0';
                for_inv <= '0';
                reading_ready <= '0';
                reading_ready_n <= '0';    
                reading_ready_nn <= '0';
                sample_number1 <= (others => '0');
                sample_number2 <= (others => '0');
                multiplicand1 <= (others => '0');
                multiplicand2 <= (others => '0');
                win_stage <= "00";
                -- Counters and address
                counter_buf0 <= (others => '0');
                counter_buf1 <= (others => '0');
                counter_buf2 <= (others => '0');
                counter_buf2 <= (others => '0');
                address_buf0 <= (others => '0');
                address_buf1 <= "1000000000";
                address_buf2 <= (others => '0');
                address_buf3 <= "1000000000";
                start_buffer1 <= '0';
                start_buffer3 <= '0';
                start_buffer2 <= '0';
                -- Reading
                counter_buf0r <= (others => '0');
                counter_buf1r <= (others => '0');
                counter_buf2r <= (others => '0');
                counter_buf2r <= (others => '0');
                address_buf0r <= (others => '0');
                address_buf1r <= "1000000000";
                address_buf2r <= (others => '0');
                address_buf3r <= "1000000000";
                start_buffer1r <= '0';
                start_buffer3r <= '0';
                start_buffer2r <= '0';
                read_sample_memo <= '0';
                read_buffer0 <= (others => '0');
                read_buffer1 <= (others => '0');
                read_buffer2 <= (others => '0');
                read_buffer3 <= (others => '0');
                -- Memo
                memo1_address <= (others => '0');
                memo1_address <= (others => '0');
                writing_sample_memo1 <= (others => '0');
                writing_sample_memo2 <= (others => '0');
                start_reading <= '0';
                -- FFT
                load_address0 <= (others => '0');
                load_address1 <= "1000000000";
                load_address2 <= (others => '0');
                load_address3 <= "1000000000";
                start_load0 <= '0';
                start_load1 <= '0';
                start_load2 <= '0';
                start_load3 <= '0';
                fft_input <= (others => '0');
                use_buffer_fft_load <= "00";
                use_buffer_fft_unload <= "00";
                cont_sample_freq <= '0';
                req_sample_freq <= '0';
            elsif rising_edge(clk_100MHz) then                
                output_sample <= output_sample_next;
                --output_sample_next <= output_sample_ov_next(sample_size downto 1);
                DATA_OUTr <= DATA_OUTn;
                enable_shift <= enable_shift_next;                
                write_sample_memo <= write_sample_memo_next;              
                start_proc_win1 <= start_proc_win1_next;
                start_proc_win2 <= start_proc_win2_next;
                for_inv <= for_inv_next;           
                reading_ready <= reading_ready_n;
                reading_ready_n <= reading_ready_nn;    
                reading_ready_nn <= reading_ready_nn_next;    
                sample_number1 <= sample_number1_next;
                sample_number2 <= sample_number2_next;
                multiplicand1 <= multiplicand1_next;
                multiplicand2 <= multiplicand2_next;
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
                read_sample_memo <= read_sample_memo_next;
                read_buffer0 <= read_buffer0_next;
                read_buffer1 <= read_buffer1_next;
                read_buffer2 <= read_buffer2_next;
                read_buffer3 <= read_buffer3_next;
                memo1_address <= memo1_address_next;
                memo2_address <= memo2_address_next;
                writing_sample_memo1 <= writing_sample_memo1_next;
                writing_sample_memo2 <= writing_sample_memo2_next;
                start_reading <= start_reading_next;
                -- FFT
                load_address0 <= load_address0_next;
                load_address1 <= load_address1_next;
                load_address2 <= load_address2_next;
                load_address3 <= load_address3_next;
                start_load0 <= start_load0_next;
                start_load1 <= start_load1_next;
                start_load2 <= start_load2_next;
                start_load3 <= start_load3_next;
                fft_input <= fft_input_next;
                use_buffer_fft_load <= use_buffer_fft_load_next;
                use_buffer_fft_unload <= use_buffer_fft_unload_next;
                cont_sample_freq <= cont_sample_freq_next;
                req_sample_freq <= req_sample_freq_next;
            end if;           
    end process;         
    -- Uses wrting fsm state to generate its control signals and counters
    
        
        -- Makes every w/r operation possible by activating target signals when corresponds, depending on memory state (memo_state)
        input_state_outputs : process(input_state, event_write, counter_buf0, counter_buf1, counter_buf2, counter_buf3
                                      , start_buffer1, start_buffer2, start_buffer3, input_reg, address_buf0, address_buf1
                                      , address_buf2, address_buf3, win_result1, win_result2, end_proc_win1, end_proc_win2
                                      , sample_number1, sample_number2, multiplicand1, multiplicand2, reading_ready, read_sample_memo
                                      , event_read, counter_buf0r, counter_buf1r, counter_buf2r, counter_buf3r, start_buffer1r
                                      , start_buffer2r, start_buffer3r, address_buf0r, address_buf1r, address_buf2r, address_buf3r
                                      , storaged_sample1, storaged_sample2, read_buffer0, read_buffer1 ,read_buffer2 ,read_buffer3
                                      , output_sample, memo1_address, memo2_address, writing_sample_memo1, writing_sample_memo2
                                      , start_load0, start_load1, start_load2, start_load3, load_address0, load_address1, load_address2
                                      , load_address3, use_buffer_fft_load, use_buffer_fft_unload, fft_input, win_stage)
            begin 
                -- Default
                start_proc_win1_next <= '0';
                start_proc_win2_next <= '0';
                sample_number1_next <= sample_number1;
                sample_number2_next <= sample_number2;
                multiplicand1_next <= multiplicand1;
                multiplicand2_next <= multiplicand2;
                memo1_address_next <= memo1_address;
                memo2_address_next <= memo2_address;
                write_sample_memo_next <= '0';
                writing_sample_memo1_next <= writing_sample_memo1;
                writing_sample_memo2_next <= writing_sample_memo2;
                for_inv_next <= '0';
                reading_ready_nn_next <= '0';
                read_sample_memo_next <= read_sample_memo;
                read_buffer0_next <= read_buffer0;
                read_buffer1_next <= read_buffer1;
                read_buffer2_next <= read_buffer2;
                read_buffer3_next <= read_buffer3;
                output_sample_next <= output_sample;
                use_buffer_fft_load_next <= use_buffer_fft_load;
                use_buffer_fft_unload_next <= use_buffer_fft_unload;
                cont_sample_freq_next <= '0';
                fft_input_next <= fft_input;
                load_address0_next <= load_address0;
                load_address1_next <= load_address1;
                load_address2_next <= load_address2;
                load_address3_next <= load_address3;
                start_load0_next <= start_load0;
                start_load1_next <= start_load1;
                start_load2_next <= start_load2;
                start_load3_next <= start_load3;
                win_stage_next <= win_stage;
                
                case input_state is   
                    when WRITE_INPUT => -- Reads from input reg and writes this sample into memory buffer 1
                        for_inv_next <= '1'; -- STFT window
                        if event_write = '1' then -- Start window proccessing and sets its parameters
                            -- Buffer0
                            start_proc_win1_next <= '1';
                            sample_number1_next <= std_logic_vector(counter_buf0);                   
                            multiplicand1_next <= input_reg;
                            win_stage_next <= "00";
                        elsif end_proc_win1 = '1' and win_stage = "00" then -- Proccessing ended, saves result in memory 1
                            memo1_address_next <= address_buf0;
                            write_sample_memo_next <= '1';
                            writing_sample_memo1_next <= std_logic_vector(win_result1);
                            -- Buffer1
                            start_proc_win1_next <= '1';
                            sample_number1_next <= std_logic_vector(counter_buf1);                   
                            multiplicand1_next <= input_reg;
                            win_stage_next <= "01";
                        elsif end_proc_win1 = '1' and win_stage = "01" then -- Proccessing ended, saves result in memory 1
                            memo2_address_next <= address_buf1;
                            write_sample_memo_next <= '1';
                            writing_sample_memo2_next <= std_logic_vector(win_result1);
                            -- Buffer2
                            start_proc_win1_next <= '1';
                            sample_number1_next <= std_logic_vector(counter_buf2);                   
                            multiplicand1_next <= input_reg;
                            win_stage_next <= "10";
                        elsif end_proc_win1 = '1' and win_stage = "10" then -- Proccessing ended, saves result in memory 1
                            memo1_address_next <= address_buf2;
                            write_sample_memo_next <= '1';
                            writing_sample_memo1_next <= std_logic_vector(win_result1);
                            -- Buffer3
                            start_proc_win1_next <= '1';
                            sample_number1_next <= std_logic_vector(counter_buf3);                   
                            multiplicand1_next <= input_reg;
                            win_stage_next <= "11";
                        elsif end_proc_win1 = '1' and win_stage = "11" then -- Proccessing ended, saves result in memory 1
                            memo2_address_next <= address_buf3;
                            write_sample_memo_next <= '1';
                            writing_sample_memo2_next <= std_logic_vector(win_result1);
                        end if;
                        
--                    when WRITE_ODD => -- Reads from input reg and writes this sample into memory buffer 2
--                        for_inv_next <= '1'; -- STFT window
--                        if event_write = '1' then -- Start window proccessing and sets its parameters
--                            if start_buffer1 = '1' then
--                                start_proc_win1_next <= '1';
--                                sample_number1_next <= std_logic_vector(counter_buf1);
--                            end if;
--                            if start_buffer3 = '1' then
--                                start_proc_win2_next <= '1';
--                                sample_number2_next <= std_logic_vector(counter_buf3);
--                            end if;
--                            multiplicand1_next <= input_reg;
--                            multiplicand2_next <= input_reg;
--                        elsif end_proc_win1 = '1' or end_proc_win2 = '1' then -- Proccessing ended, saves result in memory 2
--                            memo1_address_next <= address_buf1;
--                            memo2_address_next <= address_buf3;
--                            write_sample_memo_next <= '1';
--                            writing_sample_memo1_next <= std_logic_vector(win_result1);
--                            writing_sample_memo2_next <= std_logic_vector(win_result2);
--                        end if;
                        
                    when LOAD_FFT_EVEN =>           
                        if start_load0 = '1' then
                            if event_read = '1' then
                                reading_ready_nn_next <= '1';
                                read_sample_memo_next <= '1';
                                memo1_address_next <= load_address0;                               
                            elsif reading_ready = '1' then
                                read_sample_memo_next <= '0';
                                use_buffer_fft_load_next <= "00";
                                cont_sample_freq_next <= '1';
                                fft_input_next <= signed(storaged_sample1);
                                if load_address0 >= "0111111111" then
                                    load_address0_next <= (others => '0');
                                    start_load0_next <= '0';
                                    start_load2_next <= '1';
                                else
                                    load_address0_next <= std_logic_vector(unsigned(load_address0) + 1);
                                end if;
                            end if;
                        elsif start_load2 = '1' then
                            if event_read = '1' then
                                reading_ready_nn_next <= '1';
                                read_sample_memo_next <= '1';
                                memo2_address_next <= load_address2;
                            elsif reading_ready = '1' then
                                read_sample_memo_next <= '0';
                                use_buffer_fft_load_next <= "10";
                                cont_sample_freq_next <= '1';
                                fft_input_next <= signed(storaged_sample2);
                                if load_address2 >= "1111111111" then
                                    load_address2_next <= (others => '0');
                                    start_load0_next <= '1';
                                    start_load2_next <= '0';
                                else
                                    load_address2_next <= std_logic_vector(unsigned(load_address2) + 1);
                                end if;
                            end if;
                        end if;
                        
                    when LOAD_FFT_ODD =>
                        if start_load1 = '1' then
                            if event_read = '1' then
                                reading_ready_nn_next <= '1';
                                read_sample_memo_next <= '1';
                                memo1_address_next <= load_address1;                               
                            elsif reading_ready = '1' then
                                read_sample_memo_next <= '0';
                                use_buffer_fft_load_next <= "01";
                                cont_sample_freq_next <= '1';
                                fft_input_next <= signed(storaged_sample1);
                                if load_address1 >= "0111111111" then
                                    load_address1_next <= (others => '0');
                                    start_load1_next <= '0';
                                    start_load3_next <= '1';
                                else
                                    load_address1_next <= std_logic_vector(unsigned(load_address1) + 1);
                                end if;
                            end if;
                        elsif start_load3 = '1' then
                            if event_read = '1' then
                                reading_ready_nn_next <= '1';
                                read_sample_memo_next <= '1';
                                memo2_address_next <= load_address3;
                            elsif reading_ready = '1' then
                                read_sample_memo_next <= '0';
                                use_buffer_fft_load_next <= "10";
                                cont_sample_freq_next <= '1';
                                fft_input_next <= signed(storaged_sample2);
                                if load_address3 >= "1111111111" then
                                    load_address3_next <= (others => '0');
                                    start_load1_next <= '1';
                                    start_load3_next <= '0';
                                else
                                    load_address3_next <= std_logic_vector(unsigned(load_address3) + 1);
                                end if;
                            end if;
                        end if;
                        
                    when READ_EVEN => -- REPENSAR
                        for_inv_next <= '0';
                        if event_read = '1' then
                            reading_ready_nn_next <= '1';
                            read_sample_memo_next <= '1';
                            memo1_address_next <= address_buf0r;
                            memo2_address_next <= address_buf2r;
                        elsif reading_ready = '1' then
                            read_sample_memo_next <= '0';
                            start_proc_win1_next <= '1';
                            sample_number1_next <= std_logic_vector(counter_buf0r);
                            multiplicand1_next <= signed(storaged_sample1);
                            start_proc_win2_next <= '1';
                            sample_number2_next <= std_logic_vector(counter_buf2r);
                            multiplicand2_next <= signed(storaged_sample2);
                        elsif end_proc_win1 = '1' or end_proc_win2 = '1' then
                            read_buffer0_next <= win_result1/4;
                            read_buffer2_next <= win_result2/4;
                        end if;
                        
                    when READ_ODD =>
                        for_inv_next <= '0';
                        if event_read = '1' then
                            reading_ready_nn_next <= '1';
                            read_sample_memo_next <= '1';
                            memo1_address_next <= address_buf1r;
                            memo2_address_next <= address_buf3r;
                        elsif reading_ready = '1' then
                            read_sample_memo_next <= '0';
                            start_proc_win1_next <= '1';
                            sample_number1_next <= std_logic_vector(counter_buf1r);
                            multiplicand1_next <= signed(storaged_sample1);
                            start_proc_win2_next <= '1';
                            sample_number2_next <= std_logic_vector(counter_buf3r);
                            multiplicand2_next <= signed(storaged_sample2);
                        elsif end_proc_win1 = '1' or end_proc_win2 = '1' then
                            read_buffer1_next <= win_result1/4;
                            read_buffer3_next <= win_result2/4;
                        end if;
                    
                    when READ_SUM => 
                        if start_buffer1r = '0' and start_buffer2r = '0' and start_buffer3r = '0' then
                            output_sample_next <= read_buffer0;
                        elsif start_buffer1r = '1' and start_buffer2r = '0' and start_buffer3r = '0' then
                            output_sample_next <= (read_buffer0 + read_buffer1);
                        elsif start_buffer1r = '1' and start_buffer2r = '1' and start_buffer3r = '0' then
                            output_sample_next <= (read_buffer0 + read_buffer1 + read_buffer2);
                        elsif start_buffer1r = '1' and start_buffer2r = '1' and start_buffer3r = '1' then
                            output_sample_next <= (read_buffer0 + read_buffer1 + read_buffer2 + read_buffer3);
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
            if event_new_frame = '1' then
                if start_reading = '1' then
                    counter_buf0r_next <= counter_buf0r + 1;
                    if address_buf0r = "0111111111" then
                        address_buf0r_next <= (others => '0');
                    else
                        address_buf0r_next <= std_logic_vector(unsigned(address_buf0r) + 1);
                    end if;
                    if start_buffer1r = '1' then
                        counter_buf1r_next <= counter_buf1r + 1;
                        if address_buf1r = "1111111111" then
                            address_buf1r_next <= "1000000000";
                        else
                            address_buf1r_next <= std_logic_vector(unsigned(address_buf1r) + 1);
                        end if;
                        if start_buffer2r = '1' then
                            counter_buf2r_next <= counter_buf2r + 1;
                            if address_buf2r = "0111111111" then
                                address_buf2r_next <= (others => '0');
                            else
                                address_buf2r_next <= std_logic_vector(unsigned(address_buf2r) + 1);
                            end if;
                            if start_buffer3r = '1' then
                                counter_buf3r_next <= counter_buf3r + 1;
                                if address_buf3r = "1111111111" then
                                    address_buf3r_next <= "1000000000";
                                else
                                    address_buf3r_next <= std_logic_vector(unsigned(address_buf3r) + 1);
                                end if;
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
                counter_buf0_next <= counter_buf0 + 1;
                if address_buf0 = "0111111111" then
                    address_buf0_next <= (others => '0');
                else
                    address_buf0_next <= std_logic_vector(unsigned(address_buf0) + 1);
                end if;
                if start_buffer1 = '1' then
                    counter_buf1_next <= counter_buf1 + 1;
                    if address_buf1 = "1111111111" then
                        address_buf1_next <= "1000000000";
                    else
                        address_buf1_next <= std_logic_vector(unsigned(address_buf1) + 1);
                    end if;
                    if start_buffer2 = '1' then
                        counter_buf2_next <= counter_buf2 + 1;
                        if address_buf2 = "0111111111" then
                            address_buf2_next <= (others => '0');
                        else
                            address_buf2_next <= std_logic_vector(unsigned(address_buf2) + 1);
                        end if;
                        if start_buffer3 = '1' then
                            counter_buf3_next <= counter_buf3 + 1;
                            if address_buf3 = "1111111111" then
                                address_buf3_next <= "1000000000";
                            else
                                address_buf3_next <= std_logic_vector(unsigned(address_buf3) + 1);
                            end if;
                        end if;
                    end if;
                end if;               
            end if;
            if counter_buf0 = "00000010000000" then
                start_buffer1_next <= '1';
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
    use_buffer_fft <= use_buffer_fft_load when input_state = LOAD_FFT_EVEN else
                      use_buffer_fft_load when input_state = LOAD_FFT_ODD else
                      use_buffer_fft_unload;
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
    start_reading_next <= '1';
    -- Renames fsm states to ease coding
    with input_fsm select input_state <=
        WRITE_INPUT when "001",
        READ_EVEN when "011",
        READ_ODD when "100",
        READ_SUM when "101",
        LOAD_FFT_EVEN when "110",
        LOAD_FFT_ODD when "111",
        IDLE when others;        
    -- Output signals assignment
    MCLK_ADC <= MCLK;
    SCLK_ADC <= SCLK;
    LR_W_SEL_ADC <= LR_W_SEL;
    MCLK_DAC  <= MCLK; 
    SCLK_DAC <= SCLK; 
    LR_W_SEL_DAC <= LR_W_SEL; 
    DATA_OUT <= DATA_OUTr; 
    
end Behavioral;
