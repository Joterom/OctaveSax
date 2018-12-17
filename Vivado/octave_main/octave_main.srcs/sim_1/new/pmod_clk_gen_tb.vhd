library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.project_trunk.all;

entity pmod_clk_gen_tb is
end pmod_clk_gen_tb;

architecture Behavioral of pmod_clk_gen_tb is

    component pmod_clk_gen port(
        reset : in STD_LOGIC;
        MCLK : in STD_LOGIC;
        SCLK : out STD_LOGIC;
        LR_W_SEL : out STD_LOGIC
    ); end component;
    
    signal reset, MCLK, SCLK, LR_W_SEL : STD_LOGIC;
    
begin

    UUT : pmod_clk_gen port map(
        reset => reset,
        MCLK => MCLK,
        SCLK => SCLK,
        LR_W_SEL => LR_W_SEL
        );
        
    clk_gen : process
        begin
            MCLK <= '1';
        wait for MCLK_freq*0.5 ns;
            MCLK <= '0';
        wait for MCLK_freq*0.5 ns;
    end process;
       
    reset <= '0';
    
end Behavioral;
