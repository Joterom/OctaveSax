-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;

-- Top architecture module
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
        select_memo : in STD_LOGIC; -- 1 when buffer 1, 0 when buffer 2
        memo_address : in STD_LOGIC_VECTOR (13 downto 0);
        storaged_sample : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        writing_sample : in STD_LOGIC_VECTOR (sample_size - 1 downto 0)
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
                              
    signal frame_number : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal enable_shift, enable_shift_next, sample_in_ready, sample_towrite_ready, start_reading, start_reading_next, DATA_OUTr, DATA_OUTn : STD_LOGIC := '0';    
    signal input_reg, output_sample, output_sample_next, sum_result, sum_result_next : SIGNED ((sample_size - 1) downto 0) := (others => '0');    
    signal MCLK, SCLK, LR_W_SEL : STD_LOGIC := '0';
    
    signal sample_towrite : signed (23 downto 0) := (others => '0');
    signal counter_buf1, counter_buf1_next, counter_buf1_r, counter_buf1_r_next : UNSIGNED (8 downto 0) := (others => '0'); 
    signal counter_buf2, counter_buf2_next, counter_buf2_r, counter_buf2_r_next : UNSIGNED (8 downto 0) := (others => '0'); 
    -- Memo controller signals
    signal write_sample_memo, read_sample_memo, read_sample_memo_int, read_sample_memo_int2, write_sample_memo_next, read_sample_memo_next
           , select_memo, select_memo_next : STD_LOGIC := '0';
    signal address, address_next, address_buf1, address_buf2, address_buf1_next, address_buf2_next
           , address_buf1_read, address_buf2_read, address_buf1_read_next, address_buf2_read_next : STD_LOGIC_VECTOR (13 downto 0) := (others => '0');
    signal storaged_sample, storaged_buf1, storaged_buf1_next, storaged_buf2, storaged_buf2_next
           , writing_sample_memo, writing_sample_memo_next : STD_LOGIC_VECTOR (sample_size - 1 downto 0) := (others => '0');
    -- Control signals
    signal first, first_next, first_r, first_r_next : STD_LOGIC := '1';
    signal control_sampling : STD_LOGIC_VECTOR (2 downto 0);
    signal event_read, event_write, event_new_frame : STD_LOGIC;
    -- Window signals
    signal start_proc_win, start_proc_win_next, end_proc_win, for_inv, for_inv_next : STD_LOGIC;
    signal multiplicand, multiplicand_next, win_result : SIGNED (sample_size - 1 downto 0) := (others => '0');
    signal sample_number, sample_number_next : STD_LOGIC_VECTOR (8 downto 0);
    signal reading_ready, reading_ready_n, reading_ready_nn, reading_ready_nn_next : STD_LOGIC := '0';
    -- FSM State signals 
    type buffer_fsm_t is (BUFFER1, BUFFER2, SOLAPA_INI, SOLAPA_FIN, REST);   
    signal buf_fsm_w_state, buf_fsm_w_state_next : buffer_fsm_t := BUFFER1;  
    signal buf_fsm_r_state, buf_fsm_r_state_next : buffer_fsm_t := REST;
    type memo_fsm_t is (IDLE, WRITE1, WRITE2, READ1, READ2, READ_SUM);   
    signal memo_fsm_state, memo_fsm_state_next : memo_fsm_t := IDLE;
    
begin  

    SAMP : sampling port map(
        -- Master FPGA CLK
        clk_100MHz => clk_100MHz,
        clk_50MHz => clk_50MHz,
        -- Control signals
        frame_number => frame_number,
        reset => reset,
        sample_in_ready => sample_in_ready,
        sample_towrite_ready => sample_towrite_ready,
        control => control_sampling,
        -- CLKs        
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
    
    MEMO : memo_controller port map(
        clk => clk_100MHz,
        write_sample => write_sample_memo,
        read_sample => read_sample_memo,
        select_memo => select_memo, -- 1 when buffer 1, 0 when buffer 2
        memo_address => address,
        storaged_sample => storaged_sample,
        writing_sample => writing_sample_memo
    );  
    
    WIN : window_controller port map(
        clk => clk_100MHz,
        reset => reset,
        start_proc_win => start_proc_win,
        end_proc_win => end_proc_win,
        for_inv => for_inv,
        multiplicand => multiplicand,
        sample_number => sample_number,
        result => win_result
    ); 
            
    -- Register logic
    process(clk_100MHz, reset)
        begin            
            if reset = '1' then           
                output_sample <= (others => '0'); 
                DATA_OUTr <= '0';
                enable_shift <= '0';
                buf_fsm_w_state <= BUFFER1;
                buf_fsm_r_state <= REST;
                memo_fsm_state <= IDLE;
                counter_buf1 <= (others => '0');
                counter_buf2 <= (others => '0');
                counter_buf1_r <= (others => '0');
                counter_buf2_r <= (others => '0');
                address <= (others => '0');
                first <= '1';
                first_r <= '1';
                select_memo <= '0';
                write_sample_memo <= '0';
                writing_sample_memo <= (others => '0');
                address_buf1 <= (others => '0');
                address_buf2 <= (others => '0');
                address_buf2_read <= (others => '0');
                address_buf1_read <= (others => '0');
                start_reading <= '0';
                storaged_buf1 <= (others => '0');
                storaged_buf2 <= (others => '0');
                read_sample_memo_int <= '0';
                read_sample_memo_int2 <= '0';
                sum_result <= (others => '0');
                start_proc_win <= '0';
                for_inv <= '0';
                reading_ready <= '0';
                reading_ready_n <= '0';    
                reading_ready_nn <= '0';
                sample_number <= (others => '0');
                multiplicand <= (others => '0');
            elsif rising_edge(clk_100MHz) then                
                output_sample <= output_sample_next;
                DATA_OUTr <= DATA_OUTn;
                enable_shift <= enable_shift_next;
                buf_fsm_w_state <= buf_fsm_w_state_next;
                buf_fsm_r_state <= buf_fsm_r_state_next;
                memo_fsm_state <= memo_fsm_state_next;
                counter_buf1 <= counter_buf1_next;
                counter_buf2 <= counter_buf2_next;
                counter_buf1_r <= counter_buf1_r_next;
                counter_buf2_r <= counter_buf2_r_next;
                address <= address_next;
                first <= first_next;
                first_r <= first_r_next;
                select_memo <= select_memo_next;
                read_sample_memo_int2 <= read_sample_memo_next;
                read_sample_memo_int <= read_sample_memo_int2;
                write_sample_memo <= write_sample_memo_next;
                writing_sample_memo <= writing_sample_memo_next;
                address_buf1 <= address_buf1_next;
                address_buf1_read <= address_buf1_read_next;
                address_buf2 <= address_buf2_next;
                address_buf2_read <= address_buf2_read_next;
                start_reading <= start_reading_next;                                
                storaged_buf1 <= storaged_buf1_next;
                storaged_buf2 <= storaged_buf2_next;
                sum_result <= sum_result_next;
                start_proc_win <= start_proc_win_next;
                for_inv <= for_inv_next;
                reading_ready <= reading_ready_n;
                reading_ready_n <= reading_ready_nn;
                reading_ready_nn <= reading_ready_nn_next;
                sample_number <= sample_number_next;
                multiplicand <= multiplicand_next;
            end if;           
    end process;         
    
    
    
    write_buffer_state_change : process(buf_fsm_w_state, counter_buf1, counter_buf2)
        begin
            buf_fsm_w_state_next <= buf_fsm_w_state;
            case buf_fsm_w_state is    
                when BUFFER1 =>
                    if counter_buf1 = "110000000" then
                        buf_fsm_w_state_next <= SOLAPA_FIN;
                    end if;
                    
                when BUFFER2 =>
                    if counter_buf2 = "110000000" then
                        buf_fsm_w_state_next <= SOLAPA_INI;
                    end if;
                    
                when SOLAPA_INI =>
                    if counter_buf1 = "010000000" then
                        buf_fsm_w_state_next <= BUFFER1;
                    end if;
                                    
                when SOLAPA_FIN =>
                    if counter_buf2 = "010000000" then
                        buf_fsm_w_state_next <= BUFFER2;
                    end if;
                    
                when others =>
            end case;
    end process;
    
    read_buffer_state_change : process(buf_fsm_r_state, counter_buf1_r, counter_buf2_r, event_new_frame, start_reading)
            begin
                buf_fsm_r_state_next <= buf_fsm_r_state;
                case buf_fsm_r_state is    
                    when BUFFER1 =>
                        if counter_buf1_r = "110000000" then
                            buf_fsm_r_state_next <= SOLAPA_FIN;
                        end if;
                        
                    when BUFFER2 =>
                        if counter_buf2_r = "110000000" then
                            buf_fsm_r_state_next <= SOLAPA_INI;
                        end if;
                        
                    when SOLAPA_INI =>
                        if counter_buf1_r = "010000000" then
                            buf_fsm_r_state_next <= BUFFER1;
                        end if;
                                        
                    when SOLAPA_FIN =>
                        if counter_buf2_r = "010000000" then
                            buf_fsm_r_state_next <= BUFFER2;
                        end if;
                        
                    when others =>
                        if event_new_frame = '1' then
                            if start_reading = '1' then
                                buf_fsm_r_state_next <= BUFFER1;    
                            end if;
                        end if;
                end case;
        end process;
    
    memo_state_change : process(memo_fsm_state, frame_number, buf_fsm_w_state, buf_fsm_r_state, LR_W_SEL, start_reading)
            begin
                memo_fsm_state_next <= memo_fsm_state;
                case memo_fsm_state is    
                    when WRITE1 =>
                        if frame_number = write_cicle2 then
                            if buf_fsm_w_state = BUFFER1 then
                                memo_fsm_state_next <= IDLE;
                            else
                                memo_fsm_state_next <= WRITE2;
                            end if;
                        end if;
                        
                    when WRITE2 =>
                        if frame_number = wait_cicle then
                            memo_fsm_state_next <= IDLE;
                        end if;
                        
                    when READ1 => 
                        if frame_number = read_cicle2 then
                            if buf_fsm_r_state = BUFFER1 then
                                memo_fsm_state_next <= IDLE;
                            else
                                memo_fsm_state_next <= READ2;
                            end if;
                        end if;
                                        
                    when READ2 =>
                        if frame_number = read_sum_cicle then
                            if buf_fsm_r_state = SOLAPA_FIN or buf_fsm_r_state = SOLAPA_INI then
                                memo_fsm_state_next <= READ_SUM;
                            else
                                memo_fsm_state_next <= IDLE;
                            end if;
                        end if;
                    
                    when READ_SUM =>
                        if frame_number = "00000" then
                            memo_fsm_state_next <= IDLE;
                        end if;
                    
                    when others => -- IDLE
                        if LR_W_SEL = '0' then
                            if frame_number = write_cicle1 then
                                if buf_fsm_w_state /= BUFFER2 then
                                    memo_fsm_state_next <= WRITE1;
                                end if;
                            elsif frame_number = write_cicle2 then
                                if buf_fsm_w_state = BUFFER2 then
                                    memo_fsm_state_next <= WRITE2;
                                end if;
                            end if;
                            if buf_fsm_r_state /= REST then
                                if frame_number = read_cicle1 then
                                    if buf_fsm_r_state /= BUFFER2 then
                                        memo_fsm_state_next <= READ1;
                                    end if;
                                elsif frame_number = read_cicle2 then
                                    if buf_fsm_r_state = BUFFER2 then
                                        memo_fsm_state_next <= READ2;
                                    end if;
                                end if;
                            end if;
                        end if;
                        
                end case;
        end process;
    
    write_buffer_state_output : process(buf_fsm_w_state, event_new_frame, counter_buf1, counter_buf2, first, start_reading)
            begin
                counter_buf1_next <= counter_buf1;
                counter_buf2_next <= counter_buf2;
                first_next <= first;
                start_reading_next <= start_reading;
                case buf_fsm_w_state is    
                    when BUFFER1 =>
                        counter_buf2_next <= (others => '0');
                        
                        if event_new_frame = '1' then
                            if first = '1' then
                                first_next <= '0';
                            else
                                counter_buf1_next <= counter_buf1 + "000000001"; 
                            end if;
                        end if;         
                                     
                    when BUFFER2 =>
                        counter_buf1_next <= (others => '0');
                        if event_new_frame = '1' then
                            counter_buf2_next <= counter_buf2 + "000000001";
                        end if;
                        
                    when SOLAPA_INI =>
                        if event_new_frame = '1' then
                            counter_buf1_next <= counter_buf1 + "000000001";
                            counter_buf2_next <= counter_buf2 + "000000001";
                        end if;
                        
                    when SOLAPA_FIN =>      
                        start_reading_next <= '1'; -- OJO PROVISIONAL              
                        if event_new_frame = '1' then
                            counter_buf1_next <= counter_buf1 + "000000001";
                            counter_buf2_next <= counter_buf2 + "000000001";
                        end if;                        
                    when others =>
                end case;
        end process;
        
        read_buffer_state_output : process(buf_fsm_r_state, event_new_frame, counter_buf1_r, counter_buf2_r, first_r)
            begin
                counter_buf1_r_next <= counter_buf1_r;
                counter_buf2_r_next <= counter_buf2_r;
                first_r_next <= first_r;
                case buf_fsm_r_state is    
                    when BUFFER1 =>
                        counter_buf2_r_next <= (others => '0');
                        if event_new_frame = '1' then
--                            if first_r = '1' then
--                                first_r_next <= '0';
--                            else
                                counter_buf1_r_next <= counter_buf1_r + "000000001"; 
                            --end if;
                        end if;         
                                     
                    when BUFFER2 =>
                        counter_buf1_r_next <= (others => '0');
                        if event_new_frame = '1' then
                            counter_buf2_r_next <= counter_buf2_r + "000000001";
                        end if;
                        
                    when SOLAPA_INI =>
                        if event_new_frame = '1' then
                            counter_buf1_r_next <= counter_buf1_r + "000000001";
                            counter_buf2_r_next <= counter_buf2_r + "000000001";
                        end if;
                        
                    when SOLAPA_FIN =>
                        if event_new_frame = '1' then
                            counter_buf1_r_next <= counter_buf1_r + "000000001";
                            counter_buf2_r_next <= counter_buf2_r + "000000001";
                        end if;                        
                    when others =>
                end case;
        end process;
        
        -- Makes every w/r operation possible by activating target signals when corresponds, depending on memory state (memo_fsm_state)
        memo_state_outputs : process(memo_fsm_state, address, select_memo, event_write, event_read, input_reg, address_buf1, address_buf1_read
                                     , address_buf2, address_buf2_read, writing_sample_memo, storaged_sample, storaged_buf1
                                     , storaged_buf2, sum_result, for_inv, end_proc_win, reading_ready, sample_number, counter_buf1
                                     , counter_buf2, counter_buf1_r, counter_buf2_r, win_result, multiplicand)
            begin
                -- Default values
                address_next <= address;
                select_memo_next <= select_memo;
                write_sample_memo_next <= '0';
                writing_sample_memo_next <= writing_sample_memo;
                address_buf1_next <= address_buf1;
                address_buf1_read_next <= address_buf1_read;
                address_buf2_next <= address_buf2;
                address_buf2_read_next <= address_buf2_read;
                storaged_buf1_next <= storaged_buf1;
                storaged_buf2_next <= storaged_buf2;
                read_sample_memo_next <= '0';
                sum_result_next <= sum_result;
                for_inv_next <= for_inv;
                start_proc_win_next <= '0';
                reading_ready_nn_next <= '0';
                sample_number_next <= sample_number;
                multiplicand_next <= multiplicand;
                
                case memo_fsm_state is   
                    when WRITE1 => -- Reads from input reg and writes this sample into memory buffer1
                        select_memo_next <= '1';
                        for_inv_next <= '1';
                        if event_write = '1' then
                            start_proc_win_next <= '1';
                            sample_number_next <= std_logic_vector(counter_buf1);
                            multiplicand_next <= input_reg;
                        elsif end_proc_win = '1' then
                            address_next <= address_buf1;
                            write_sample_memo_next <= '1';
                            writing_sample_memo_next <= std_logic_vector(win_result);
                            address_buf1_next <= std_logic_vector(unsigned(address_buf1) + 1);
                        end if;
                        
                    when WRITE2 => -- Reads from input reg and writes this sample into memory buffer1
                        --address_next <= address_buf2;
                        select_memo_next <= '0';
                        for_inv_next <= '1';
                        if event_write = '1' then
                            start_proc_win_next <= '1';
                            sample_number_next <= std_logic_vector(counter_buf2);
                            multiplicand_next <= input_reg;
                        elsif end_proc_win = '1' then
                            address_next <= address_buf2;
                            write_sample_memo_next <= '1';
                            writing_sample_memo_next <= std_logic_vector(win_result);
                            address_buf2_next <= std_logic_vector(unsigned(address_buf2) + 1);
                        end if;
                        
                    when READ1 => -- Reads from memory 1 and registers each sample                       
                        select_memo_next <= '1';
                        for_inv_next <= '0';
                        if event_read = '1' then
                            address_next <= address_buf1_read;
                            address_buf1_read_next <=  std_logic_vector(unsigned(address_buf1_read) + 1); 
                            read_sample_memo_next <= '1';
                            reading_ready_nn_next <= '1';                            
                        elsif reading_ready = '1' then
                            start_proc_win_next <= '1';
                            sample_number_next <= std_logic_vector(counter_buf1_r);
                            multiplicand_next <= signed(storaged_sample);
                        elsif end_proc_win = '1' then
                            storaged_buf1_next <= std_logic_vector(win_result);
                        end if;
                                                          
                    when READ2 => -- Reads from memory 2 and registers each sample                        
                        select_memo_next <= '0';
                        for_inv_next <= '0';
                        if event_read = '1' then
                            address_next <= address_buf2_read;
                            address_buf2_read_next <=  std_logic_vector(unsigned(address_buf2_read) + 1); 
                            read_sample_memo_next <= '1';           
                            reading_ready_nn_next <= '1';
                        elsif reading_ready = '1' then
                            start_proc_win_next <= '1';
                            sample_number_next <= std_logic_vector(counter_buf2_r);
                            multiplicand_next <= signed(storaged_sample);
                        elsif end_proc_win = '1' then
                            storaged_buf2_next <= std_logic_vector(win_result);
                        end if;
                    
                    when READ_SUM => -- Reads from both read1 and read2 registers, adding them if necessary   
                        if event_read = '1' then
                            --sum_result_next <= (signed(storaged_buf1)+signed(storaged_buf2))/2; 
                            sum_result_next <= (signed(storaged_buf1)+signed(storaged_buf2));
                        end if;
                    when others => --IDLE
                        --read_sample_memo_next <= '1';
                        
                end case;
        end process;
        
    -- Writing dac mode: takes sample from the previously loaded register and links it to output data channel
    write_dac : process(frame_number, start_reading, sample_towrite, LR_W_SEL)
        begin 
            DATA_OUTn <= '0';
            if start_reading = '1' then  -- OJO CAMBIAR PARA QUE SI NO ESTA ACTIVO, ESCRIBA 0              
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
    
     
    -- Generates enable signal used by the shift-register
    enable_shift_next <= '1' when (frame_number >= std_logic_vector(to_unsigned(1, 5)) and frame_number <= std_logic_vector(to_unsigned(sample_size, 5)) 
                                    and LR_W_SEL = '0') else                         
                         '0';
                                              
    read_sample_memo <= read_sample_memo_int or read_sample_memo_int2;
   
    
                              
    event_read <= control_sampling(0);
    event_write <= control_sampling(1);
    event_new_frame <= control_sampling(2);
    
    -- DEPRECATED --
    --output_sample_next <= input_reg when LR_W_SEL = '1' else
    --                          output_sample;
    with buf_fsm_r_state select output_sample_next <= 
        signed(storaged_buf1) when BUFFER1,
        signed(storaged_buf2) when BUFFER2,
        sum_result when SOLAPA_INI,
        sum_result when SOLAPA_FIN,
        output_sample when others;
        
    -- Output signals assignment
    MCLK_ADC <= MCLK;
    SCLK_ADC <= SCLK;
    LR_W_SEL_ADC <= LR_W_SEL;
    MCLK_DAC  <= MCLK; --and start_reading;
    SCLK_DAC <= SCLK; --and start_reading;
    LR_W_SEL_DAC <= LR_W_SEL; --and start_reading;  
    sample_towrite <= output_sample & "00000000" when global_state = "11" else
                      (others => '0'); --when LR_W_SEL = '0' else
    DATA_OUT <= DATA_OUTr; 
    --DATA_OUT <= DATA_IN; 
    
end Behavioral;
