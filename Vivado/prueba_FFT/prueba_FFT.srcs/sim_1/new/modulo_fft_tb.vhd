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
        tuser : out STD_LOGIC_VECTOR (7 downto 0);
        
        data_out_tvalid : out STD_LOGIC;
        re_out : out STD_LOGIC_VECTOR (19 downto 0);
        im_out : out STD_LOGIC_VECTOR (19 downto 0)
    ); end component;
    
    signal re_in, im_in : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal re_out, im_out : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');
    signal clk, enable, config_tvalid, config_tready, data_in_tlast, data_in_tvalid, data_in_tready, data_out_tvalid : STD_LOGIC := '0';
    signal config_data : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    signal tuser : STD_LOGIC_VECTOR (7 downto 0);
  
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
        tuser => tuser,
        
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
            config_data <= "11111111";
            enable <= '1';
        wait for 20 ns;
            config_tvalid <= '1';
        wait for 40 ns;
        --wait until config_tready = '1';
        wait for 40 ns;
            --config_tvalid <= '0';
        wait for 380 ns;
        
            data_in_tvalid <= '1';
            im_in <= (others => '0');
            re_in <= x"1000";
        wait for 80 ns;
            re_in <= x"2000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"3000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"4000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"5000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"6000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"7000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"8000";
            im_in <= x"0000";
            data_in_tlast <= '1';
        wait for 40 ns;
            data_in_tlast <= '0';
            data_in_tvalid <= '0';
            config_data <= "00000000";
        wait for 1000 ns;
            config_tvalid <= '1';
        wait for 40 ns;
            config_tvalid <= '0';
        wait for 480 ns; 
            data_in_tvalid <= '1';
            re_in <= x"1000";
            im_in <= x"0000";
        wait for 80 ns;
            re_in <= x"2000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"3000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"4000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"5000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"6000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"7000";
            im_in <= x"0000";
        wait for 40 ns;
            re_in <= x"8000";
            im_in <= x"0000";
            data_in_tlast <= '1';
        wait for 40 ns;
            data_in_tlast <= '0';
            data_in_tvalid <= '0';
        wait;
    end process;

end Behavioral;
