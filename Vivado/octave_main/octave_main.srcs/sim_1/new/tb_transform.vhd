library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_transform is
--  Port ( );
end tb_transform;

architecture Behavioral of tb_transform is
    
    component transform_controller port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        enable_fft : in STD_LOGIC;
        start_proc_fft : in STD_LOGIC;
        input_ready : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR (15 downto 0)
        --data_out_for_re : out STD_LOGIC_VECTOR (15 downto 0);
        --data_out_for_im : out STD_LOGIC_VECTOR (15 downto 0)
    ); end component;
    
    signal clk : STD_LOGIC := '1';   
    signal enable_fft, reset, start_proc_fft, input_ready : STD_LOGIC := '0';
    signal data_in : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
begin
    
    FFT : transform_controller port map (
        clk => clk,
        reset => reset,
        enable_fft => enable_fft,
        start_proc_fft => start_proc_fft,
        input_ready => input_ready,
        data_in => data_in        
    );
    
    clk_gen : process
        begin
        wait for 5 ns;
            clk <= '0';
        wait for 5 ns;
            clk <= '1';        
    end process;
    
    process
        begin
        wait for 70 ns;
            input_ready <= '1';
        wait for 10 ns;
            input_ready <= '0';
        wait for 20 us;
    end process;
    
    process
        begin
            reset <= '0';
            enable_fft <= '1';
        wait for 60 ns;
            start_proc_fft <= '1';
        wait for 10 ns;
            start_proc_fft <= '0';
            data_in <= "0100000000000000";
        wait for 70 ns;
            data_in <= "0010000000000000";
        wait;
    end process;
end Behavioral;
