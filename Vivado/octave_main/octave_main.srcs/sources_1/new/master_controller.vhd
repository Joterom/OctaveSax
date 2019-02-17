library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all; 
use work.project_trunk.all;


entity master_controller is 
  Port (
        -- Master FPGA CLK
        clk_100MHz : in STD_LOGIC;
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

    component sampling port(
        -- Master FPGA CLK
        clk_100MHz : in STD_LOGIC;
        frame_number : out integer;
        reset : in STD_LOGIC;
        sample_in_ready : out STD_LOGIC;
        sample_towrite_ready : out STD_LOGIC;
        -- CLKs
        MCLK : out STD_LOGIC;
        SCLK : out STD_LOGIC;        
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
          
          
    signal frame_number : integer := 0;
    signal reset, enable_shift, enable_shift_next : STD_LOGIC := '0';    
    signal input_reg : STD_LOGIC_VECTOR ((sample_size - 1) downto 0) := (others => '0');
    --signal end_frame, end_frame_next : STD_LOGIC := '0';
    signal MCLK, SCLK, LR_W_SEL : STD_LOGIC := '0';
    signal write_address, write_address_next, read_address, read_address_next, address, storaged_sample : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal read_sample, sample_towrite_ready, sample_in_ready, write_sample : STD_LOGIC := '0';
    signal start_reading, start_reading_next : STD_LOGIC := '0';
    
begin

    SAMP : sampling port map(
        -- Master FPGA CLK
        clk_100MHz => clk_100MHz,
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
        writing_sample => input_reg
    );
    
    SHFT : shift_register port map(
        clk => SCLK,
        enable => enable_shift,
        reset => reset,
        data_in => DATA_IN,
        data_out => input_reg
    );
    
    process(clk_100MHz, reset)
        begin            
            if rising_edge(clk_100MHz) then                
                enable_shift <= enable_shift_next;
                --end_frame <= end_frame_next;                
                write_address <= write_address_next;
                read_address <= read_address_next;
                start_reading <= start_reading_next;
            end if;           
    end process;
    
    reading : process(clk_100MHz, frame_number)
        begin
            if rising_edge(clk_100MHz) then
                if (frame_number <= sample_size - 1 and frame_number >= 0) then
                    enable_shift_next <= '1';                                 
                else
                    enable_shift_next <= '0';                              
                end if;                                
            end if;
    end process;
    
    memo_logic : process(clk_100MHz, sample_in_ready, write_address, start_reading, read_address)
        begin
            if rising_edge(clk_100MHz) then
                -- Writing memo - reading adc mode
                if sample_in_ready = '1' then                    
                    write_sample <= '1';
                    if write_address = 15 then
                        start_reading_next <= '1'; -- SOLO PARA DEJAR ESTE HUECO OJO
                        write_address_next <= write_address + 1;
                    elsif write_address = "111111111111" then
                        write_address_next <= (others => '0');
                    else 
                        write_address_next <= write_address + 1;
                    end if;
                else
                    write_sample <= '0';
                end if;
                -- Reading memo mode. Load previous storaged sample into the variable
                if sample_towrite_ready = '1' then
                    if start_reading = '1' then
                        read_sample <= '1';
                        if read_address = "111111111111" then
                            read_address_next <= (others => '0');
                        else
                            read_address_next <= read_address + 1;
                        end if;
                    end if;
                else
                    read_sample <= '0';
                end if;
            end if;
    end process;
    
    write_dac : process(frame_number, start_reading, storaged_sample)
        begin 
            DATA_OUT <= '0';
            if start_reading = '1' then                
                case frame_number is
                    when 1 => DATA_OUT <= storaged_sample(sample_size-1);
                    when 2 => DATA_OUT <= storaged_sample(sample_size-2);
                    when 3 => DATA_OUT <= storaged_sample(sample_size-3);
                    when 4 => DATA_OUT <= storaged_sample(sample_size-4);
                    when 5 => DATA_OUT <= storaged_sample(sample_size-5);
                    when 6 => DATA_OUT <= storaged_sample(sample_size-6);
                    when 7 => DATA_OUT <= storaged_sample(sample_size-7);
                    when 8 => DATA_OUT <= storaged_sample(sample_size-8);
                    when 9 => DATA_OUT <= storaged_sample(sample_size-9);
                    when 10 => DATA_OUT <= storaged_sample(sample_size-10);
                    when 11 => DATA_OUT <= storaged_sample(sample_size-11);
                    when 12 => DATA_OUT <= storaged_sample(sample_size-12);                    
                    when others => DATA_OUT <= '0';
                end case;
            end if;
    end process;
        
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
    
end Behavioral;
