library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;
 
entity memo_controller is 
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    write_sample : in STD_LOGIC;
    read_sample : in STD_LOGIC;
    memo_address : in STD_LOGIC_VECTOR (11 downto 0);
    storaged_sample : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    writing_sample : in STD_LOGIC_VECTOR (sample_size - 1 downto 0)
    );
end memo_controller;

architecture Behavioral of memo_controller is

    component ram_memory port(
        addra : in STD_LOGIC_VECTOR (11 downto 0);
        clka : in STD_LOGIC;
        dina : in STD_LOGIC_VECTOR (sample_size-1 downto 0);
        douta : out STD_LOGIC_VECTOR (sample_size-1 downto 0);
        ena : in STD_LOGIC;
        wea : in STD_LOGIC_VECTOR (0 downto 0)
    ); end component;

    signal wea : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ena : STD_LOGIC;
    
begin

    ram : ram_memory port map(
        addra => memo_address,
        clka => clk,
        dina => writing_sample,
        douta => storaged_sample,
        ena => ena,
        wea => wea
    );
    
    wea <= "1" when (write_sample = '1' and read_sample = '0') else
           "0";
    
    ena <= read_sample or write_sample;

end Behavioral;
