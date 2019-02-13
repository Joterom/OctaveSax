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
    signal end_frame, end_frame_next : STD_LOGIC := '0';
    signal MCLK, SCLK, LR_W_SEL : STD_LOGIC := '0';
    signal address, addra_next, storaged_sample : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal read_sample : STD_LOGIC;
    
begin

    SAMP : sampling port map(
        -- Master FPGA CLK
        clk_100MHz => clk_100MHz,
        -- Control signals
        frame_number => frame_number,
        reset => reset,
        -- CLKs        
        MCLK => MCLK,
        SCLK => SCLK,
        LR_W_SEL => LR_W_SEL        
    );
    
    RAM : memo_controller port map(
        clk => clk_100MHZ,
        reset => reset,
        write_sample => end_frame,
        read_sample => read_sample,
        memo_address => address,
        storaged_sample => storaged_sample,
        writing_sample => input_reg
    );
    
    SHFT : shift_register port map(
        clk => clk_100MHz,
        enable => enable_shift,
        reset => reset,
        data_in => DATA_IN,
        data_out => input_reg
    );
    
    process(clk_100MHz, reset)
        begin            
            if rising_edge(clk_100MHz) then                
                enable_shift <= enable_shift_next;
                end_frame <= end_frame_next;
                address <= addra_next;
            end if;           
    end process;
    
    reading : process(clk_100MHz, frame_number)
        begin
            if rising_edge(clk_100MHz) then
                if (frame_number <= sample_size and frame_number >= 1) then
                    enable_shift_next <= '1';            
                elsif frame_number = 25 then
                    if MCLK = '1' then
                        end_frame_next <= '1';
                        addra_next <= address + 1;
                    end if;
                else
                    enable_shift_next <= '0';    
                    end_frame_next <= '0';           
                end if;                
            end if;
    end process;
    
    -- Output signals assignment
    MCLK_ADC <= MCLK;
    SCLK_ADC <= SCLK;
    LR_W_SEL_ADC <= LR_W_SEL;
    MCLK_DAC  <= MCLK;
    SCLK_DAC <= SCLK;
    LR_W_SEL_DAC <= LR_W_SEL;  
    
end Behavioral;
