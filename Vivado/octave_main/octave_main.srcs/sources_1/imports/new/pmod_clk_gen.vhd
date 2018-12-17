-- TFG OctaveSax UPM 2018-19
-- Javier Otero Martinez

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pmod_clk_gen is
    Port ( 
        reset : in STD_LOGIC;
        enable : in STD_LOGIC;
        MCLK : in STD_LOGIC;
        SCLK : out STD_LOGIC;
        LR_W_SEL : out STD_LOGIC
    );
end pmod_clk_gen;

architecture Behavioral of pmod_clk_gen is
    
    signal count8, count256 : integer := 0;
begin
    
    process (MCLK, reset, enable)
    begin
       if reset = '1' then
           count8 <= 0;
           count256 <= 0;
       elsif rising_edge (MCLK) and enable = '1' then
           if (count8 = 3) then
               count8 <= 0;
           else
               count8 <= count8 + 1;
           end if;
           if (count256 = 255) then
               count256 <= 0;
           else
               count256 <= count256 + 1;
           end if;
       end if;
    end process;    
    
    SCLK <= '0' and enable when count8 >= 2 else
            '1' and enable;
                
    LR_W_SEL <= '0' and enable when count256 >= 128 else
            '1' and enable;
                
end Behavioral;
