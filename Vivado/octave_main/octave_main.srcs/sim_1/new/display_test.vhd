
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity display_test is
--  Port ( );
end display_test;

architecture Behavioral of display_test is

    component display_interface port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        seg : out STD_LOGIC_VECTOR (6 downto 0);
        an : out STD_LOGIC_VECTOR (7 downto 0)
    ); end component;
    
    signal clk, reset : STD_LOGIC;
    signal seg : STD_LOGIC_VECTOR (6 downto 0);
    signal an : STD_LOGIC_VECTOR (7 downto 0);
    
begin
    
    displays : display_interface port map(
        clk => clk,
        reset => reset,
        seg  => seg,
        an => an
    );
    
    process
        begin
            clk <= '1';
        wait for 5 ns;
            clk <= '0';
        wait for 5 ns;
    end process;
    
    reset <= '0';
            

end Behavioral;
