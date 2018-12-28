library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.project_trunk.all;

entity square_wave is
    Port ( clk : in STD_LOGIC;
           wave : out STD_LOGIC);
end square_wave;

architecture Behavioral of square_wave is

    signal counter100 : integer := 0;
    signal reg, reg_next : STD_LOGIC := '0';
    
begin

    process(clk)
        begin
            if rising_edge(clk) then
                reg <= reg_next;
                if counter100 = 49 then
                    counter100 <= 0;
                    reg_next <= not reg;
                else
                    counter100 <= counter100 + 1;
                    
                end if;
            end if;
    end process;
    
    wave <= reg;
    
end Behavioral;
