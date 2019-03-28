
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity window_tb is
--  Port ( );
end window_tb;

architecture Behavioral of window_tb is

    component window_controller port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        start_proc_win : in STD_LOGIC;
        end_proc_win : out STD_LOGIC;
        for_inv : in STD_LOGIC; -- 1 = STFT, 0 = iSTFT
        multiplicand : in signed (sample_size - 1 downto 0);
        sample_number : in STD_LOGIC_VECTOR (8 downto 0);
        result : out signed (sample_size - 1 downto 0)
    ); end component;
    
    signal clk, start_proc_win, end_proc_win, for_inv, reset: STD_LOGIC;
    signal multiplicand, result: signed (sample_size - 1 downto 0);
    signal sample_number : STD_LOGIC_VECTOR (8 downto 0);
    --signal s1, s2, s3 : signed (4 downto 0);
    
begin

    UUT : window_controller port map(
        clk => clk,
        reset => reset,
        start_proc_win => start_proc_win,
        end_proc_win => end_proc_win,
        for_inv => for_inv,
        multiplicand => multiplicand,
        sample_number => sample_number,
        result => result
    );
    
    process
        begin
            clk <= '1';
        wait for 5 ns;
            clk <= '0';
        wait for 5 ns;
    end process;
    
        
    process
        begin
            for_inv <= '1';
            sample_number <= "010000000";
            multiplicand <= "1100110011001100";
            start_proc_win <= '0';
            reset <= '0';
        wait for 30 ns;
            start_proc_win <= '1';
        wait for 10 ns;
            start_proc_win <= '0';
        wait;  
    end process;
        
end Behavioral;
