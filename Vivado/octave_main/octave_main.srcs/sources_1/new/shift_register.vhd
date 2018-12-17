library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (23 downto 0));
end shift_register;

architecture Behavioral of shift_register is

    signal r_reg, r_next : STD_LOGIC_VECTOR (23 downto 0);
    
    begin
    
    process(clk, reset, enable)
        begin
            if reset = '1' then
                r_reg <= (others => '0');
            elsif rising_edge(clk) and enable = '1' then
                r_reg <= r_next;
            end if;
    end process;
    
    r_next <= r_reg(22 downto 0) & data_in;
    
    data_out <= r_reg;
    
end Behavioral;
