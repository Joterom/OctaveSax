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
        re_out : out STD_LOGIC_VECTOR (15 downto 0);
        im_out : out STD_LOGIC_VECTOR (15 downto 0)
    ); end component;
    
    signal re_in, im_in, re_out, im_out : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
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
            config_data <= "10000000";
            enable <= '1';
        wait for 60 ns;
            config_tvalid <= '1';
        wait for 80 ns;
            config_tvalid <= '0';
        wait for 120 ns;
            data_in_tvalid <= '1';
        wait for 60 ns;
            im_in <= (others => '0');
            re_in <= "0000000000000001";
        wait for 40 ns;
            re_in <= "0000000000000010";
        wait for 40 ns;
            re_in <= "0000000000000011";
        wait for 40 ns;
            re_in <= "0000000000000100";
        wait for 40 ns;
            re_in <= "0000000000000101";
        wait for 40 ns;
            re_in <= "0000000000000110";
        wait for 40 ns;
            re_in <= "0000000000000111";
            data_in_tlast <= '1';
        wait for 40 ns;
            re_in <= "0000000000001000";
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
