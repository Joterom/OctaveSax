-- DSED Project 2017 Group 02
-- Daniel Sanchez Garcia-Monge
-- Javier Otero Martinez

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.package_dsed.all;

-- Generates different enable signals for desired timing
entity en_4_cycles is
    Port ( 
           -- In
           clk_12MHz : in STD_LOGIC;
           reset : in STD_LOGIC;
           -- Out
           clk_3MHz : out STD_LOGIC;
           en_2_cycles : out STD_LOGIC;
           en_4_cycles : out STD_LOGIC);
           
end en_4_cycles;

architecture Behavioral of en_4_cycles is

    signal count : integer := 0;
    
begin

    process (clk_12MHz, reset)
    begin
        if reset = '1' then
            count <= 0;
        elsif rising_edge (clk_12MHz) then
            if (count >= 4) then
                count <= 1;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    
    
    with count select
            clk_3MHZ <= '1' when 2,
                        '1' when 3,
                        '0' when others;
                        
    with count select
            en_2_cycles <= '1' when 1,
                           '1' when 3,
                           '1' when 5,
                           '0' when others;
    with count select 
            en_4_cycles <= '1' when 2,
                           '0' when others;
        
end Behavioral;
