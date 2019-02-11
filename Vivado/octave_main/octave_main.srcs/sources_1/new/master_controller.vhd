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
        MCLK_ADC : out STD_LOGIC;
        SCLK_ADC : out STD_LOGIC;
        LR_W_SEL_ADC : out STD_LOGIC;
        MCLK_DAC : out STD_LOGIC;
        SCLK_DAC : out STD_LOGIC;
        LR_W_SEL_DAC : out STD_LOGIC    
    ); end component;
    
    component shift_register port(
        clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        reset : in STD_LOGIC;
        data_in : in STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR (11 downto 0)
    ); end component;
    
    signal frame_number : integer := 0;
    signal reset, enable_shift : STD_LOGIC := '0';    
    signal input_reg : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    
begin

    SAMP : sampling port map(
        -- Master FPGA CLK
        clk_100MHz => clk_100MHz,
        -- Control signals
        frame_number => frame_number,
        reset => reset,
        -- CLKs
        MCLK_ADC => MCLK_ADC,
        SCLK_ADC => SCLK_ADC,
        LR_W_SEL_ADC => LR_W_SEL_ADC,
        MCLK_DAC => MCLK_DAC,
        SCLK_DAC => SCLK_DAC,
        LR_W_SEL_DAC => LR_W_SEL_DAC        
    );
    
    SHFT : shift_register port map(
        clk => clk_100MHz,
        enable => enable_shift,
        reset => reset,
        data_in => DATA_IN,
        data_out => input_reg
    );
    
        
    
end Behavioral;
