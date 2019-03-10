
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
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
        start_proc_win : in STD_LOGIC;
        end_proc_win : out STD_LOGIC;
        for_inv : in STD_LOGIC; -- 1 = STFT, 0 = iSTFT
        multiplicand : in STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        factor_buf1 : in STD_LOGIC_VECTOR (8 downto 0);
        factor_buf2 : in STD_LOGIC_VECTOR (8 downto 0);
        buf1_2 : out STD_LOGIC;
        result1 : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        result2 : out STD_LOGIC_VECTOR (sample_size - 1 downto 0)
    ); end component;
    
    signal clk, start_proc_win, end_proc_win, for_inv, buf1_2 : STD_LOGIC;
    signal multiplicand, result1, result2 : STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    signal factor_buf1, factor_buf2 : STD_LOGIC_VECTOR (8 downto 0);
    
begin

    UUT : window_controller port map(
        clk => clk,
        start_proc_win => start_proc_win,
        end_proc_win => end_proc_win,
        for_inv => for_inv,
        multiplicand => multiplicand,
        factor_buf1 => factor_buf1,
        factor_buf2 => factor_buf2,
        buf1_2 => buf1_2,
        result1 => result1,
        result2 => result2
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
            multiplicand <= "0100000000000000";
            factor_buf1 <= "010000000";
            factor_buf2 <= "010000000";
            for_inv <= '1';
            start_proc_win <= '0';
         wait for 1 us;
            start_proc_win <= '1';
         wait for 10 ns;
            start_proc_win <= '0';
        wait;
    end process;
        
end Behavioral;
