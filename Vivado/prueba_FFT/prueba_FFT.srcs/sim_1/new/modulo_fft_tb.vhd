----------------------------------------------------------------------------------
-- Javier Otero Martinez
-- Trabajo fin de carrera
-- Sept - 2018
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity modulo_fft_tb is
end modulo_fft_tb;

architecture Behavioral of modulo_fft_tb is

    component modulo_fft port ( 
        clk : in STD_LOGIC;
        re_in : in STD_LOGIC_VECTOR (15 downto 0);
        im_in : in STD_LOGIC_VECTOR (15 downto 0);
        enable : in STD_LOGIC;
        
        config_data : in STD_LOGIC_VECTOR (7 downto 0);
        config_tvalid : in STD_LOGIC;    
        config_tready : out STD_LOGIC;
        
        data_in_tlast : in STD_LOGIC;
        data_in_tvalid : in STD_LOGIC;
        data_in_tready : out STD_LOGIC;
        
        data_out_tvalid : out STD_LOGIC;
        re_out : out STD_LOGIC_VECTOR (23 downto 0);
        im_out : out STD_LOGIC_VECTOR (23 downto 0)
    ); end component;
    
    signal re_in, im_in : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal re_out, im_out : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
    signal clk, enable, config_tvalid, config_tready, data_in_tlast, data_in_tvalid, data_in_tready, data_out_tvalid : STD_LOGIC := '0';
    signal config_data : STD_LOGIC_VECTOR (7 downto 0);
  
begin

    UUT : modulo_fft port map ( 
        clk => clk,
        re_in => re_in,
        im_in => im_in,
        enable => enable,
        
        config_data => config_data,
        config_tvalid => config_tvalid,
        config_tready => config_tready,
        
        data_in_tlast => data_in_tlast,
        data_in_tvalid => data_in_tvalid,
        data_in_tready => data_in_tready,
        
        data_out_tvalid => data_out_tvalid,
        re_out => re_out,
        im_out => im_out
    );
    
    clk_gen : process
    begin
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
    end process;
    
    signal_proc : process
        begin
            config_data <= "00000001";
            enable <= '1';
        wait for 60 ns;
            config_tvalid <= '1';
        wait for 80 ns;
            config_tvalid <= '0';
        wait for 300 ns;
            data_in_tvalid <= '1';
            im_in <= (others => '0');
            re_in <= x"4000";
        wait for 80 ns;
            re_in <= x"e2f2";
            im_in <= x"c6fa";
        wait for 40 ns;
            re_in <= x"da62";
            im_in <= x"33c7";
        wait for 40 ns;
            re_in <= x"3f36";
            im_in <= x"0a03";
        wait for 40 ns;
            re_in <= x"ec39";
            im_in <= x"c322";
        wait for 40 ns;
            re_in <= x"d2bf";
            im_in <= x"2d41";
        wait for 40 ns;
            re_in <= x"3cde";
            im_in <= x"13c7";
        wait for 40 ns;
            re_in <= x"f5fd";
            im_in <= x"c0ca";
            data_in_tlast <= '1';
        wait for 40 ns;
            data_in_tlast <= '0';
            data_in_tvalid <= '0';
            config_data <= "00000000";
        wait for 1000 ns;
            config_tvalid <= '1';
        wait for 40 ns;
            config_tvalid <= '0';
        wait for 580 ns;
            data_in_tvalid <= '1';
        wait for 20 ns;
            re_in <= "0000000000011100";
            im_in <= (others => '0');
        wait for 80 ns;
            re_in <= "1111111111111100";
            im_in <= "0000000011111111";
        wait for 40 ns;
            im_in <= "0000010011111111";
        wait for 40 ns;
            im_in <= "1111110011111111";
        wait for 40 ns;
            im_in <= "0000100111111111";
        wait for 40 ns;
            im_in <= "1111111111111111";
        wait for 40 ns;
            im_in <= "0000000111111111";
            data_in_tlast <= '1';
        wait for 40 ns;
            im_in <= "1111011111111111";
            data_in_tlast <= '0';
            data_in_tvalid <= '0';
        wait;
    end process;

end Behavioral;
