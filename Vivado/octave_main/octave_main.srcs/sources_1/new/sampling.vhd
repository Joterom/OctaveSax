library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.project_trunk.all;

entity sampling is
    Port (
       -- Master FPGA CLK
       clk_100MHz : in STD_LOGIC;
       MCLK : out STD_LOGIC;
       SCLK : out STD_LOGIC;
       LR_W_SEL : out STD_LOGIC;
       test_out : out STD_LOGIC;
       test_in : out STD_LOGIC;
       DATA_IN : in STD_LOGIC;
       DATA_OUT : out STD_LOGIC
       );
end sampling;

architecture Behavioral of sampling is

    component clock_change port(
        clk_100MHz : in STD_LOGIC;
        clk_30MHz : out STD_LOGIC;
        clk_48MHz : out STD_LOGIC
    ); end component;
    
    component square_wave port(
        clk : in STD_LOGIC;
        wave : out STD_LOGIC
    ); end component;
    
   
    signal clk_48MHz, lr, lr_next, sc, sc_next, mc, mc_next, clk_30MHz, wave : STD_LOGIC := '0';
    signal count : unsigned (9 downto 0) := (others => '0');
        
begin

    CLK : clock_change port map (
        clk_100MHz => clk_100MHz,
        clk_30MHz => clk_30MHz,
        clk_48MHz => clk_48MHz
    );
    
    WA : square_wave port map(
        clk => clk_30MHz,
        wave => wave
    );
    
    process (clk_48MHz)
        begin
           if rising_edge(clk_48MHz) then              
               count <= count + "00000001";
               lr <= lr_next;
               sc <= sc_next;
               mc <= mc_next;                            
           end if; 
    end process;
    
    lr_next <= count(9);
    sc_next <= count(3);
    mc_next <= count(0);
    LR_W_SEL <= lr;
    SCLK <= sc;
    MCLK <= mc;
    DATA_OUT <= DATA_IN;
    test_in <= data_in;
    test_out <= wave;
    
end Behavioral;
