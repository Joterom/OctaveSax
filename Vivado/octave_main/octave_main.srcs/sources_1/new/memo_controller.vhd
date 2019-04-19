library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;
 
entity memo_controller is  
  Port (  
    clk : in STD_LOGIC;
    write_sample : in STD_LOGIC;
    read_sample : in STD_LOGIC;
    stage : in STD_LOGIC_VECTOR (1 downto 0);
    memo1_address : in STD_LOGIC_VECTOR (9 downto 0);
    memo2_address : in STD_LOGIC_VECTOR (9 downto 0); 
    storaged_sample1 : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    storaged_sample2 : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    writing_sample1 : in STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    writing_sample2 : in STD_LOGIC_VECTOR (sample_size - 1 downto 0)
    );
end memo_controller;

architecture Behavioral of memo_controller is

    component ram_memo port(
        addra : in STD_LOGIC_VECTOR (9 downto 0);
        clka : in STD_LOGIC;
        dina : in STD_LOGIC_VECTOR (sample_size-1 downto 0);
        douta : out STD_LOGIC_VECTOR (sample_size-1 downto 0);
        ena : in STD_LOGIC;
        wea : in STD_LOGIC_VECTOR (0 downto 0)
    ); end component;

    signal wea1, wea2 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ena1, ena2 : STD_LOGIC;
    
begin

    ram1 : ram_memo port map(
        addra => memo1_address,
        clka => clk,
        dina => writing_sample1,
        douta => storaged_sample1,
        ena => ena1,
        wea => wea1
    );
    
    ram2 : ram_memo port map(
        addra => memo2_address,
        clka => clk,
        dina => writing_sample2,
        douta => storaged_sample2,
        ena => ena2,
        wea => wea2
    );
    
    wea1 <= "1"  when (write_sample = '1' and read_sample = '0') else
            "0";
    
    wea2 <= "1" when (write_sample = '1' and read_sample = '0') else
            "0";
    
    ena1 <= write_sample or read_sample when stage = "00" else
            write_sample or read_sample when stage = "01" else
            '0';
    ena2 <= write_sample or read_sample when stage = "10" else
            write_sample or read_sample when stage = "11" else
            '0';

end Behavioral;
