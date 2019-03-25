library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;
 
entity memo_controller is 
  Port ( 
    clk : in STD_LOGIC;
    write_sample : in STD_LOGIC;
    read_sample : in STD_LOGIC;
    select_memo : in STD_LOGIC; -- 1 when buffer 1, 0 when buffer 2
    memo_address : in STD_LOGIC_VECTOR (14 downto 0);
    storaged_sample : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    writing_sample : in STD_LOGIC_VECTOR (sample_size - 1 downto 0)
    );
end memo_controller;

architecture Behavioral of memo_controller is

    component ram_memo port(
        addra : in STD_LOGIC_VECTOR (14 downto 0);
        clka : in STD_LOGIC;
        dina : in STD_LOGIC_VECTOR (sample_size-1 downto 0);
        douta : out STD_LOGIC_VECTOR (sample_size-1 downto 0);
        ena : in STD_LOGIC;
        wea : in STD_LOGIC_VECTOR (0 downto 0)
    ); end component;

    signal wea1, wea2 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ena1, ena2 : STD_LOGIC;
    --signal ws, ss : STD_LOGIC_VECTOR (sample_size-1 downto 0) := (others => '0');
    signal storaged_sample1, storaged_sample2 : STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    
begin

    ram1 : ram_memo port map(
        addra => memo_address,
        clka => clk,
        dina => writing_sample,
        douta => storaged_sample1,
        ena => ena1,
        wea => wea1
    );
    
    ram2 : ram_memo port map(
        addra => memo_address,
        clka => clk,
        dina => writing_sample,
        douta => storaged_sample2,
        ena => ena2,
        wea => wea2
    );
    
    wea1 <= "1"  when (write_sample = '1' and read_sample = '0') else
            "0";
    
    wea2 <= "1" when (write_sample = '1' and read_sample = '0') else
            "0";
    
    ena1 <= select_memo and (read_sample or write_sample);
    ena2 <= (not select_memo) and (read_sample or write_sample);

    storaged_sample <= storaged_sample1 when select_memo = '1' else
                       storaged_sample2;
end Behavioral;
