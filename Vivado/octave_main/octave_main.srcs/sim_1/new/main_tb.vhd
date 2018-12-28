library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_tb is
--  Port ( );
end main_tb;

architecture Behavioral of main_tb is

    component sampling port (
        -- Master FPGA CLK
        clk_100MHz : in STD_LOGIC;
        MCLK : out STD_LOGIC;
        SCLK : out STD_LOGIC;
        LR_W_SEL : out STD_LOGIC;
        test_out : out STD_LOGIC;
        DATA_IN : in STD_LOGIC;
        DATA_OUT : out STD_LOGIC
       
    ); end component;
    
    signal clk_100MHz, MCLK, SCLK, LR_W_SEL, test_out, DATA_IN, DATA_OUT : STD_LOGIC := '0';
    
    
begin

    UUT: sampling port map (
        clk_100MHz => clk_100MHz,        
        MCLK => MCLK,
        SCLK  => SCLK,
        LR_W_SEL => LR_W_SEL,
        test_out => test_out,
        DATA_IN => DATA_IN,
        DATA_OUT => DATA_OUT
        );
        
    clk_gen : process
        begin
            clk_100MHz <= '0';
        wait for 5 ns;
            clk_100MHz <= '1';
        wait for 5 ns;
    end process;
    
    DATA_IN <= '0';
end Behavioral;
