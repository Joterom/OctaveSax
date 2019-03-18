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
        data_out : out STD_LOGIC_VECTOR (sample_size - 1 downto 0)
    ); end component;
    
    component memo_controller port(
        clk : in STD_LOGIC;
        write_sample : in STD_LOGIC;
        read_sample : in STD_LOGIC;
        memo_address : in STD_LOGIC_VECTOR (11 downto 0);
        storaged_sample : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        writing_sample : in STD_LOGIC_VECTOR (sample_size - 1 downto 0)
    ); end component;
                  
    component window_controller port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        start_proc_win : in STD_LOGIC;
        end_proc_win : out STD_LOGIC;
        for_inv : in STD_LOGIC; -- 1 = STFT, 0 = iSTFT
        multiplicand : in STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        factor_buf1 : in STD_LOGIC_VECTOR (8 downto 0);
        factor_buf2 : in STD_LOGIC_VECTOR (8 downto 0);
        buf1_2 : out STD_LOGIC;
        result1 : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        result2 : out STD_LOGIC_VECTOR (sample_size - 1 downto 0)
    ); end component;
            
    signal frame_number : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal enable_shift, enable_shift_next, start_proc_win_next : STD_LOGIC := '0';    
    signal input_reg, storaged_sample, multiplicand, multiplicand_out, output_sample
           , output_sample_next : STD_LOGIC_VECTOR ((sample_size - 1) downto 0) := (others => '0');    
    signal MCLK, SCLK, LR_W_SEL : STD_LOGIC := '0';
    
    signal write_address, write_address1, write_address2, write_address_next, write_address1_next, write_address2_next
           , read_address, read_address_next, read_address1, read_address1_next, read_address2, read_address2_next
           , address  : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal read_sample, sample_towrite_ready, sample_in_ready, write_sample : STD_LOGIC := '0';
    signal start_reading, start_reading_next, DATA_OUT_n, DATA_OUTr : STD_LOGIC := '0';
    signal sample_towrite : STD_LOGIC_VECTOR (23 downto 0) := (others => '0');
    
    signal address_in_ref, address_in_ref_next, address_out_ref, address_out_ref_next : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal buffer1, buffer1_next, buffer1_out, buffer1_out_next, factor_buf1 : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal buffer2, buffer2_next, buffer2_out, buffer2_out_next, factor_buf2 : STD_LOGIC_VECTOR (11 downto 0) := (others => '0'); -- Set at 384 --> 3 * fft_width / 4
    signal windowed_sample_buf1, windowed_sample_buf2, framed_sample, framed_sample_next : STD_LOGIC_VECTOR (sample_size - 1 downto 0) := (others => '0');
    signal buf1_2, val, val_next, val2_next, val2 : STD_LOGIC := '1';
    signal for_inv, for_inv_next, start_proc_win, end_proc_win, change_memo, change_memo_next
           , change_memo_out, change_memo_out_next, read_samplen, read_samplenn, read_samplenn_next : STD_LOGIC := '0';
    
    type memo_state_pos is (IDLE, REST, WRITE, READ);
    signal memo_state, memo_state_next : memo_state_pos := IDLE;
        
    signal buffer_aux : STD_LOGIC_VECTOR (8 downto 0) := "111111110";
    
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
        -- CLKs        
        MCLK => MCLK,
        SCLK => SCLK,        
        LR_W_SEL => LR_W_SEL        
    );
    
    RAM : memo_controller port map(
        clk => clk_100MHz,
        write_sample => write_sample,
        read_sample => read_sample,
        memo_address => address,
        storaged_sample => storaged_sample,
        writing_sample => framed_sample
    );
    
    SHFT : shift_register port map(
        clk => sclk,
        enable => enable_shift,
        reset => reset,
        data_in => DATA_IN,
        data_out => input_reg
    );      
        
    WIN : window_controller port map (
        clk => clk_100MHz,
        reset => reset,
        start_proc_win => start_proc_win,
        end_proc_win => end_proc_win,
        for_inv => for_inv, -- 1 = STFT, 0 = iSTFT
        multiplicand => multiplicand,
        factor_buf1 => factor_buf1(8 downto 0),
        factor_buf2 => factor_buf2(8 downto 0),
        buf1_2 => buf1_2,
        result1 => windowed_sample_buf1,
        result2 => windowed_sample_buf2
    );
    
    -- Register logic
    process(clk_100MHz, reset)
        begin            
            if reset = '1' then
                enable_shift <= '0';                               
                write_address <= (others => '0');
                write_address1 <= (others => '0');
                write_address2 <= (others => '0');
                read_address1 <= (others => '0');
                read_address2 <= (others => '0');
                change_memo <= '0';
                change_memo_out <= '0';
                read_address <= (others => '0');
                start_reading <= '0';
                DATA_OUTr <= '0';
                buffer1 <= (others => '0');
                buffer2 <= (others => '0');
                buffer1_out <= (others => '0');
                buffer2_out <= (others => '0'); 
                address_in_ref <= (others => '0');  
                address_out_ref <= (others => '0');           
                start_proc_win <= '0';     
                val <= '1';     
                val2 <= '1';
                read_samplen <= '0';
                read_samplenn <= '0';
                memo_state <= IDLE;                
                output_sample <= (others => '0');
            elsif rising_edge(clk_100MHz) then                
                enable_shift <= enable_shift_next;                               
                write_address <= write_address_next;
                write_address1 <= write_address1_next;
                write_address2 <= write_address2_next;
                read_address1 <= read_address1_next;
                read_address2 <= read_address2_next;
                change_memo <= change_memo_next;
                change_memo_out <= change_memo_out_next;
                read_samplen <= read_samplenn;
                read_samplenn <= read_samplenn_next;
                read_address <= read_address_next;
                start_reading <= start_reading_next;
                DATA_OUTr <= DATA_OUT_n;
                buffer1 <= buffer1_next;
                buffer2 <= buffer2_next;  
                buffer1_out <= buffer1_out_next;
                buffer2_out <= buffer2_out_next; 
                start_proc_win <= start_proc_win_next;         
                address_in_ref <= address_in_ref_next;
                address_out_ref <= address_out_ref_next;         
                val <= val_next; 
                val2 <= val2_next;    
                memo_state <= memo_state_next;
                output_sample <= output_sample_next;
            end if;           
    end process;         
    
    -- Assigns different values to both input buffers (1 and 2), depending on reference address       
    in_buf : process(address_in_ref, start_reading, for_inv, buffer1, buffer2, write_address1, start_reading, write_address2, start_reading)
        begin
           start_reading_next <= start_reading;
            if for_inv <= '1' then 
                if address_in_ref < (std_logic_vector(to_unsigned(128, 12))) then --127
                    buffer1_next <= std_logic_vector(unsigned(address_in_ref));
                    buffer2_next <= std_logic_vector(unsigned(address_in_ref) + 384);
                    write_address1_next <= std_logic_vector(unsigned(address_in_ref));
                    write_address2_next <= std_logic_vector(unsigned(address_in_ref) + 896);
                elsif address_in_ref < (std_logic_vector(to_unsigned(384, 12))) then -- 384
                    buffer1_next <= std_logic_vector(unsigned(address_in_ref));
                    buffer2_next <= (others => '0');
                    write_address1_next <= std_logic_vector(unsigned(address_in_ref));
                    write_address2_next <= "010000000001";
                    start_reading_next <= '1'; -- OJO PROVISIONAL!!!!          
                elsif address_in_ref < (std_logic_vector(to_unsigned(512, 12))) then -- 511
                    buffer1_next <= std_logic_vector(unsigned(address_in_ref));
                    buffer2_next <= std_logic_vector(unsigned(address_in_ref) - 384);
                    write_address1_next <= std_logic_vector(unsigned(address_in_ref));
                    write_address2_next <= std_logic_vector(unsigned(address_in_ref) + 128);
                    val2_next <= '0';
                else
                --elsif address_in_ref < std_logic_vector(to_unsigned(768, 12)) then -- 511
                    buffer1_next <= (others => '0'); 
                    buffer2_next <= std_logic_vector(unsigned(address_in_ref) - 384); 
                    write_address1_next <= "010000000001"; -- Hueco de memoria sin usar 
                    write_address2_next <= std_logic_vector(unsigned(address_in_ref) + 128);
                end if;
            else
               buffer1_next <=  buffer1;
                buffer2_next <= buffer2;
                write_address1_next <= write_address1;
                write_address2_next <= write_address2; 
                start_reading_next <= start_reading;
            end if;          
    end process;
    
    -- Assigns different values to both output buffers (1 and 2), depending on reference output address 
    out_buf : process(address_out_ref,start_reading)
        begin
            if address_out_ref < (std_logic_vector(to_unsigned(128, 12))) then -- First 25% overlapping
                buffer1_out_next <= std_logic_vector(unsigned(address_out_ref));
                buffer2_out_next <= std_logic_vector(unsigned(address_out_ref) + 384);
                read_address1_next <= std_logic_vector(unsigned(address_out_ref));
                read_address2_next <= std_logic_vector(unsigned(address_out_ref) + 896);
            elsif address_out_ref < (std_logic_vector(to_unsigned(384, 12))) then -- Using just first buffer
                buffer1_out_next <= std_logic_vector(unsigned(address_out_ref));
                buffer2_out_next <= (others => '0');
                read_address1_next <= std_logic_vector(unsigned(address_out_ref));
                read_address2_next <= (others => '0'); -- Empty memo address                             
            elsif address_out_ref < (std_logic_vector(to_unsigned(512, 12))) then -- Second 25% overlapping
                buffer1_out_next <= std_logic_vector(unsigned(address_out_ref));
                buffer2_out_next <= std_logic_vector(unsigned(address_out_ref) - 384);
                read_address1_next <= std_logic_vector(unsigned(address_out_ref));
                read_address2_next <= std_logic_vector(unsigned(address_out_ref) + 128);
            else
            --elsif address_out_ref < std_logic_vector(to_unsigned(768, 12)) then -- Using just second buffer
                buffer1_out_next <= (others => '0'); 
                buffer2_out_next <= std_logic_vector(unsigned(address_out_ref) - 384); 
                read_address1_next <= (others => '0'); -- Empty memo address
                read_address2_next <= std_logic_vector(unsigned(address_out_ref) + 128);
            end if;
    end process;
   
   -- Creates references for input and output 
    addr_ref : process(LR_W_SEL, frame_number, address_in_ref, address_out_ref, change_memo, start_reading)
        begin
            address_in_ref_next <= address_in_ref;
            address_out_ref_next <= address_out_ref;
            -- Input
            if change_memo = '1' then
                if address_in_ref = (std_logic_vector(to_unsigned(767, 12))) then
                    address_in_ref_next <= (others => '0');                                   
                else
                    address_in_ref_next <= std_logic_vector(unsigned(address_in_ref) + 1);
                end if;
                if start_reading = '1' then
                    if address_out_ref = (std_logic_vector(to_unsigned(767, 12))) then
                        address_out_ref_next <= (others => '0');                                  
                    else
                        address_out_ref_next <= std_logic_vector(unsigned(address_out_ref) + 1);
                    end if;
                end if;
            end if;                 
    end process;
        
    -- Writing dac mode: takes sample from the previously loaded register and links it to output data
    write_dac : process(frame_number, start_reading, sample_towrite)
        begin 
            DATA_OUT_n <= '0';
            if start_reading = '1' then                
                    case frame_number is
                        when "00001" => DATA_OUT_n <= sample_towrite(23);
                        when "00010" => DATA_OUT_n <= sample_towrite(22);
                        when "00011" => DATA_OUT_n <= sample_towrite(21);
                        when "00100" => DATA_OUT_n <= sample_towrite(20);
                        when "00101" => DATA_OUT_n <= sample_towrite(19);
                        when "00110" => DATA_OUT_n <= sample_towrite(18);
                        when "00111" => DATA_OUT_n <= sample_towrite(17);
                        when "01000" => DATA_OUT_n <= sample_towrite(16);
                        when "01001" => DATA_OUT_n <= sample_towrite(15);
                        when "01010" => DATA_OUT_n <= sample_towrite(14);
                        when "01011" => DATA_OUT_n <= sample_towrite(13);
                        when "01100" => DATA_OUT_n <= sample_towrite(12);
                        when "01101" => DATA_OUT_n <= sample_towrite(11);
                        when "01110" => DATA_OUT_n <= sample_towrite(10);
                        when "01111" => DATA_OUT_n <= sample_towrite(9);
                        when "10000" => DATA_OUT_n <= sample_towrite(8);
                        when "10001" => DATA_OUT_n <= sample_towrite(7);
                        when "10010" => DATA_OUT_n <= sample_towrite(6);
                        when "10011" => DATA_OUT_n <= sample_towrite(5);
                        when "10100" => DATA_OUT_n <= sample_towrite(4);
                        when "10101" => DATA_OUT_n <= sample_towrite(3);
                        when "10110" => DATA_OUT_n <= sample_towrite(2);
                        when "10111" => DATA_OUT_n <= sample_towrite(1);
                        when "11000" => DATA_OUT_n <= sample_towrite(0);
                        when others => DATA_OUT_n <= '0';
                    end case;
            end if;
    end process; 
    
    change_state_log : process (frame_number, memo_state, start_reading)
        begin   
            memo_state_next <= memo_state;
            case memo_state is 
                when IDLE => -- IDLE
                    if frame_number = std_logic_vector(to_unsigned(1, 5)) then
                        memo_state_next <= REST;
                    end if;
                    
                when REST => -- REST
                    if LR_W_SEL = '0' then
                        if frame_number = std_logic_vector(to_unsigned(25, 5)) then
                            memo_state_next <= WRITE;
                        end if;
                    end if;
                    
                when WRITE => -- WRITE              
                    if start_reading = '1' then
                        if frame_number = std_logic_vector(to_unsigned(27, 5)) then
                            memo_state_next <= READ;
                        end if;
                    else
                        if frame_number = std_logic_vector(to_unsigned(27, 5)) then
                            memo_state_next <= REST;
                        end if;
                    end if;
                
                when READ =>
                    if frame_number = std_logic_vector(to_unsigned(29, 5)) then
                       memo_state_next <= REST;
                    end if;
                                    
                when others =>
                    memo_state_next <= IDLE;
            end case;
     end process;
          
     process(memo_state, sample_in_ready, buf1_2, sample_towrite_ready, read_address, 
                write_address, start_proc_win, end_proc_win, start_reading, storaged_sample,
                read_address1, read_address2, write_address1, write_address2, windowed_sample_buf2,
                input_reg, output_sample)
        begin
            start_proc_win_next <= '0';
            for_inv_next <= for_inv;
            write_address_next <= write_address;
            write_sample <= '0';
            read_samplenn_next <= '0';
            read_address_next <= read_address;
            multiplicand <= input_reg;
            output_sample_next <= output_sample;
            change_memo_next <= '0';
            factor_buf1 <= (others => '0');
            factor_buf2 <= (others => '0');
            for_inv <= '0';            
            case memo_state is
                when REST => --REST
                
                when WRITE => --WRITE
                    multiplicand <= input_reg;
                    factor_buf1 <= buffer1;
                    factor_buf2 <= buffer2;
                    for_inv <= '1';
                    if sample_in_ready = '1' then  
                        start_proc_win_next <= '1';
                    end if;
                        if end_proc_win = '1' then
                            if buf1_2 = '1' then
                                write_sample <= '1';
                                write_address_next <= write_address2;
                            else
                                write_sample <= '1';
                                write_address_next <= write_address1;
                            end if;    
                        end if;               
                    if end_proc_win = '1' and buf1_2 = '1' then
                        change_memo_next <= '1';
                    end if;
                    
                when READ => --READ
                    multiplicand <= storaged_sample;
                    output_sample_next <= windowed_sample_buf2;
                    factor_buf1 <= buffer1_out;
                    factor_buf2 <= buffer2_out;
                    for_inv <= '0';
                    if sample_towrite_ready = '1' then                   
                        start_proc_win_next <= '1';
                        read_samplenn_next <= '1';
                        read_address_next <= read_address2;
                    elsif buf1_2 = '1' then
                        read_samplenn_next <= '1';
                        read_address_next <= read_address1;                                         
                    end if;                                      
                when others => 
            end case;
    end process;
     
    read_sample <= read_samplen or read_samplenn; 
     
    -- Generates enable signal used by the shift-register
    enable_shift_next <= '1' when (frame_number >= std_logic_vector(to_unsigned(1, 5 )) and frame_number <= std_logic_vector(to_unsigned(sample_size, 5)) 
                                    and LR_W_SEL = '0') else                         
                         '0';
                         
    -- Sample which is written into ram memory after first windowing  
    framed_sample <= windowed_sample_buf1 when buf1_2 = '1' else
                     windowed_sample_buf2;
                     
    -- Toggles ram address depending on current mode  
    address <= write_address when write_sample = '1' else
               read_address when read_sample = '1' else
               (others => '1');
            
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
    
end Behavioral;
