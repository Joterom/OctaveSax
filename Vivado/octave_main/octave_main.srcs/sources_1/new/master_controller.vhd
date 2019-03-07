-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all; 
use work.project_trunk.all;

-- Top architecture module
entity master_controller is 
  Port (
        -- Master FPGA CLK
        clk_fpga : in STD_LOGIC;
        -- Displays
        seg : out STD_LOGIC_VECTOR (6 downto 0);
        an : out STD_LOGIC_VECTOR (7 downto 0);
        -- CLKs
        MCLK_ADC : out STD_LOGIC;
        SCLK_ADC : out STD_LOGIC;
        LR_W_SEL_ADC : out STD_LOGIC;
        MCLK_DAC : out STD_LOGIC;
        SCLK_DAC : out STD_LOGIC;
        LR_W_SEL_DAC : out STD_LOGIC;
        -- INput/OUTput
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
        reset : in STD_LOGIC;
        write_sample : in STD_LOGIC;
        read_sample : in STD_LOGIC;
        memo_address : in STD_LOGIC_VECTOR (11 downto 0);
        storaged_sample : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        writing_sample : in STD_LOGIC_VECTOR (sample_size - 1 downto 0)
    ); end component;
    
    component clk_generator port(
        clk_fpga : in STD_LOGIC;
        clk_100MHz : out STD_LOGIC;
        clk_50MHz : out STD_LOGIC
    ); end component;
          
    component display_interface port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        seg : out STD_LOGIC_VECTOR (6 downto 0);
        an : out STD_LOGIC_VECTOR (7 downto 0)
    ); end component;
    
    component window_controller port(
        enable : in STD_LOGIC;
        for_inv : in STD_LOGIC; -- 1 = STFT, 0 = iSTFT
        buf1_2 : in STD_LOGIC;
        multiplicand : in STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        factor_buf1 : in STD_LOGIC_VECTOR (8 downto 0);
        factor_buf2 : in STD_LOGIC_VECTOR (8 downto 0);
        result : out STD_LOGIC_VECTOR (sample_size - 1 downto 0)
    ); end component;
    
    signal frame_number : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal reset, enable_shift, enable_shift_next : STD_LOGIC := '0';    
    signal input_reg, storaged_sample : STD_LOGIC_VECTOR ((sample_size - 1) downto 0) := (others => '0');    
    signal MCLK, SCLK, LR_W_SEL, clk_100MHz, clk_50MHz : STD_LOGIC := '0';
    
    signal write_address, write_address_next, read_address, read_address_next, address  : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal read_sample, sample_towrite_ready, sample_in_ready, write_sample : STD_LOGIC := '0';
    signal start_reading, start_reading_next, DATA_OUT_n, DATA_OUTr : STD_LOGIC := '0';
    signal sample_towrite : STD_LOGIC_VECTOR (23 downto 0) := (others => '0');
    
    signal buffer1, buffer1_next : STD_LOGIC_VECTOR (8 downto 0) := (others => '0');
    signal buffer2, buffer2_next : STD_LOGIC_VECTOR (8 downto 0) := "110000000"; -- Set at 384 --> 3 * fft_width / 4
    signal win_output, framed_sample, framed_sample_next : STD_LOGIC_VECTOR (sample_size - 1 downto 0) := (others => '0');
    signal for_inv, for_inv_next, enable_win_next, enable_win, buf1_2, buf1_2_next : STD_LOGIC := '1';
    
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
        reset => reset,
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
    
    displays : display_interface port map (
        clk => clk_100MHz,
        reset => reset,
        seg => seg,
        an => an
    );
    
    clk_gen : clk_generator port map (
        clk_fpga => clk_fpga,
        clk_100MHz => clk_100MHz,
        clk_50MHz => clk_50MHz
    );
    
    WIN : window_controller port map (
        enable => enable_win,
        for_inv => for_inv,-- 1 = STFT, 0 = iSTFT
        buf1_2 => buf1_2,
        multiplicand => input_reg,
        factor_buf1 => buffer1,
        factor_buf2 => buffer2,
        result => win_output
    );
    -- Register logic
    process(clk_100MHz, reset)
        begin            
            if reset = '1' then
                enable_shift <= '0';                               
                write_address <= (others => '0');
                read_address <= (others => '0');
                start_reading <= '0';
                DATA_OUTr <= '0';
                buffer1 <= (others => '0');
                buffer2 <= "110000000";
                framed_sample <= (others => '0');
                for_inv <= '1';
                enable_win <= '0';
                buf1_2 <= '1';
            elsif rising_edge(clk_100MHz) then                
                enable_shift <= enable_shift_next;                               
                write_address <= write_address_next;
                read_address <= read_address_next;
                start_reading <= start_reading_next;
                DATA_OUTr <= DATA_OUT_n;
                buffer1 <= buffer1_next;
                buffer2 <= buffer2_next;
                framed_sample <= framed_sample_next;
                for_inv <= for_inv_next;
                enable_win <= enable_win_next;
                buf1_2 <= buf1_2_next;
            end if;           
    end process;
    
    -- Generates enable signal used by the shift-register
    enable_shift_next <= '1' when (frame_number >= 1 and frame_number <= sample_size and LR_W_SEL = '0') else                         
                         '0';
                         
    -- Decides which window is being applicated to the sample   
    for_inv_next <= '1' when frame_number = 23 else
               '0';
               
     -- Register windowed sample   
    framed_sample_next <= win_output when frame_number = 23 else
                          (others => '0');
    
    -- Enables windowing                      
    enable_win_next <= '1' when frame_number = 23 else
                       '0';
    
    memo_logic : process(sample_in_ready, sample_towrite_ready, write_address, start_reading, read_address)
        begin            
            -- Default output
            write_sample <= '0';
            start_reading_next <= start_reading;
            read_address_next <= read_address;
            write_address_next <= write_address;
            read_sample <= '0';
            -- Writing memo - reading adc mode
            if sample_in_ready = '1' then                    
                write_sample <= '1';               
                if write_address = 1530 then
                    start_reading_next <= '1'; -- SOLO PARA DEJAR ESTE HUECO OJO
                    write_address_next <= write_address + 1;                    
                elsif write_address = 6*fft_width/4 - 1 then -- Keep taking samples from the beginning
                    write_address_next <= (others => '0');
                else 
                    write_address_next <= write_address + 1;                    
                end if;--                
            end if;
            -- Reading memo mode. Load previous storaged sample into the variable
            if sample_towrite_ready = '1' then
                if start_reading = '1' then
                    read_sample <= '1';
                    if read_address = 6*fft_width/4 - 1 then -- Keep taking samples from the beginning
                        read_address_next <= (others => '0');
                    else
                        read_address_next <= read_address + 1;
                    end if;
                end if;
            end if;
    end process;
          
    process(sample_in_ready)
        begin
            buffer1_next <= buffer1;
            buffer2_next <= buffer2;
            if rising_edge(sample_in_ready) then
                if write_address < fft_width/4 - 1 then --127
                    buffer1_next <= buffer1 + 1;
                    buffer2_next <= buffer2 + 1;
                elsif write_address < 3 * fft_width/4 then -- 384
                    buffer1_next <= buffer1 + 1;
                    buffer2_next <= (others => '0');
                    buf1_2_next <= '0';
                elsif write_address = 3 * fft_width/4 then -- 384
                    buffer1_next <= buffer1 + 1;
                    buffer2_next <= buffer2 + 1;                    
                elsif write_address < fft_width then -- 512
                    buffer1_next <= buffer1 + 1;
                    buffer2_next <= buffer2 + 1;
                elsif write_address < 6 * fft_width/4 - 1 then -- 767                   
                    buffer2_next <= buffer2 + 1;
                    buffer1_next <= (others => '0');
                    buf1_2_next <= '1';
                elsif write_address = 6 * fft_width/4 - 1 then -- 767                   
                    buffer2_next <= buffer2 + 1;
                end if;
            end if;
    end process;
    
    -- Writing dac mode: takes sample from the previously loaded register and links it to output data
    write_dac : process(frame_number, start_reading, sample_towrite)
        begin 
            DATA_OUT_n <= '0';
            if start_reading = '1' then                
               --if clk_reg = '1' then
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
                --else
                   -- DATA_OUT_n <= DATA_OUTr;
               -- end if;
            end if;
    end process; 
     
    -- Toggles ram address depending on current mode  
    address <= write_address when write_sample = '1' else
               read_address when read_sample = '1' else
               (others => '0');
            
    -- Output signals assignment
    MCLK_ADC <= MCLK;
    SCLK_ADC <= SCLK;
    LR_W_SEL_ADC <= LR_W_SEL;
    MCLK_DAC  <= MCLK; --and start_reading;
    SCLK_DAC <= SCLK; --and start_reading;
    LR_W_SEL_DAC <= LR_W_SEL; --and start_reading;  
    sample_towrite <= storaged_sample & "00000000"; --when LR_W_SEL = '0' else
                      --(others => '0');
    
    DATA_OUT <= DATA_OUTr;
    
end Behavioral;
