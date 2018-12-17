library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity module_ALU is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           enable : in STD_LOGIC;
           abs_result : out STD_LOGIC_VECTOR (15 downto 0));
end module_ALU;

architecture Behavioral of module_ALU is
    
    signal a_un, b_un, x, y : unsigned(15 downto 0);
    signal t1, t2, t3, t4, t5, t6, t7, t8 : unsigned(15 downto 0);

begin

    a_un <= unsigned(a);
    b_un <= unsigned(b);
    
    t1 <= a_un when a(15) = '0' else
        unsigned('0' & std_logic_vector(a(14 downto 0)));
    t2 <= b_un when b(15) = '0' else
        unsigned('0' & std_logic_vector(b(14 downto 0)));
    x <= t1 when (t1 - t2) > 0 else
        t2;
    y <= t2 when (t1 - t2) > 0 else
        t1;
    t3 <= "000" & x(15 downto 3);
    t4 <= "0" & y(15 downto 1);
    t5 <= x - t3;
    t6 <= t4 + t5;
    t7 <= t6 when t6 - x > 0 else
        x;
    t8 <= t7 when (t7(15) = '0') else 
        unsigned('0' & std_logic_vector(t7(15 downto 1))); -- PENSAR QUE PASA CUANDO DESBORDA
    abs_result <= std_logic_vector(t8) when enable = '1' else
        (others => '0');
end Behavioral;
