-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;

entity counter512 is
  Port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    start_count : in STD_LOGIC;
    count_value : out UNSIGNED (8 downto 0);
    count_ended : out STD_LOGIC
  );
end counter512; 

architecture Behavioral of counter512 is

    signal count, count_next : UNSIGNED (8 downto 0) := (others => '0');
    signal counting, counting_next, count_end : STD_LOGIC := '0';
    
begin

    reg : process(clk, reset)
        begin
            if reset = '1' then
                count <= (others => '0');
            elsif rising_edge(clk) then
                count <= count_next;
            end if;
    end process;
    
    process(count, counting)
        begin
            count_next <= count;
            if counting = '1' then
                count_next <= count + 1;
            end if;
    end process;
    
    process(start_count, counting, count_end)
        begin
            counting_next <= counting;
        if start_count = '1' then
            counting_next <= '1';
        elsif count_end = '1' then
            counting_next <= '0';
        end if;
    end process;
    
    count_ended <= count_end;
    count_value <= count;
    
end Behavioral;
