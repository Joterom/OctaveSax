library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_tb is
--  Port ( );
end main_tb;

architecture Behavioral of main_tb is  

    component master_controller port (
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
    ); end component;
    
    signal clk_100MHz, clk_50MHz, MCLK_DAC, SCLK_DAC, LR_W_SEL_DAC, MCLK_ADC, SCLK_ADC, LR_W_SEL_ADC,
        DATA_IN, DATA_OUT : STD_LOGIC := '0';
    signal seg : STD_LOGIC_VECTOR (6 downto 0);
    signal an : STD_LOGIC_VECTOR (7 downto 0);
    
begin


    UUT: master_controller port map (
        -- Master FPGA CLK
        clk_100MHz => clk_100MHz,
        clk_50MHz => clk_50MHz,
        reset => '0',
        -- CLKs
        MCLK_ADC => MCLK_ADC,
        SCLK_ADC => SCLK_ADC,
        LR_W_SEL_ADC => LR_W_SEL_ADC,
        MCLK_DAC => MCLK_DAC,
        SCLK_DAC => SCLK_DAC,
        LR_W_SEL_DAC => LR_W_SEL_DAC,
        global_state => "11",
        -- INput/OUTput
        DATA_IN => DATA_IN,
        DATA_OUT => DATA_OUT 
        );
        
    clk_gen : process
        begin
            clk_100MHz <= '1';
            clk_50MHz <= '0';
        wait for 5 ns;
            clk_100MHz <= '0';
        wait for 5 ns;
            clk_100MHz <= '1';
            clk_50MHz <= '1';
        wait for 5 ns;
            clk_100MHz <= '0';
        wait for 5 ns;
    end process;
    
    process
        begin
            DATA_IN <= '0';
        wait for 63 ns;
            DATA_IN <= '1';
        wait for 47 ns;
            DATA_IN <= '0';
        wait for 39 ns;
            DATA_IN <= '1';
        wait for 51 ns;
    end process;
    
end Behavioral;
