-- TFG OctaveSax UPM 2018-19
-- Javier Otero Martinez

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pmod_clk_gen is
    Port ( enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           MCLK : in STD_LOGIC;
           SCLK : out STD_LOGIC;
           LR_W_SEL : out STD_LOGIC);
end pmod_clk_gen;

architecture Behavioral of pmod_clk_gen is
    
    signal count8, count64 : integer := 0;
begin
    
    process (MCLK)
    begin
       if reset = '1' then
           count8 <= 0;
       elsif rising_edge (MCLK) then
           if (count64 >= 8) then
               count64 <= 1;
           elsif (count8 >= 8) then
               count8 <= 1;
               count64 <= count64 + 1;
           else
               count8 <= count8 + 1;
           end if;
       end if;
    end process;    
    
    with count8 select
        SCLK <= '0' when 1,
                '0' when 2,
                '0' when 3,
                '0' when 4,
                '1' when others;
                
    with count64 select
        LR_W_SEL <= '0' when 1,
                '0' when 2,
                '0' when 3,
                '0' when 4,
                '1' when others;
end Behavioral;
