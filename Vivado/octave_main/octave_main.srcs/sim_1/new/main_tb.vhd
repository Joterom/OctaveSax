library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_tb is
--  Port ( );
end main_tb;

architecture Behavioral of main_tb is

    component sampling port (
        -- Master FPGA CLK
        clk_100MHz : in STD_LOGIC;
        enable : in STD_LOGIC;
        sample : in STD_LOGIC;
        reset : in STD_LOGIC;
        -- Data provided by ADC
        DATA_IN : in STD_LOGIC;
        -- Data to be sent to DAC
        DATA_OUT : out STD_LOGIC;
        led_inforead : out STD_LOGIC;
        led_infowrite : out STD_LOGIC;
        -- Pmod configuration
        MCLK : out STD_LOGIC;
        SCLK : out STD_LOGIC;
        LR_W_SEL : out STD_LOGIC
    ); end component;
    
    signal clk_100MHz, enable, sample, led_inforead, led_infowrite, reset, MCLK, SCLK, LR_W_SEL : STD_LOGIC := '0';
    signal DATA_IN, DATA_OUT : STD_LOGIC := '0';
    
begin

    UUT: sampling port map (
        clk_100MHz => clk_100MHz,
        enable => enable,
        sample => sample,
        reset => reset,
        DATA_IN => DATA_IN,
        DATA_OUT => DATA_OUT,
        led_inforead => led_inforead,
        led_infowrite => led_infowrite,
        MCLK => MCLK,
        SCLK => SCLK,
        LR_W_SEL => LR_W_SEL);
        
    clk_gen : process
        begin
            clk_100MHz <= '0';
        wait for 10 ns;
            clk_100MHz <= '1';
        wait for 10 ns;
    end process;
    
    stim : process
        begin
        wait for 1 us;
           enable <= '1';
        wait for 1 us;
            sample <= '1';
        wait for 100 ns;
            sample <= '0';
        wait for 11718.577 ns;
            DATA_IN <= '1';       -- 1
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';     -- 11
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';     --21
        wait for 354.282 ns;
            DATA_IN <= '0';
        wait for 354.282 ns;
            DATA_IN <= '1';     
        wait for 354.282 ns;
            DATA_IN <= '0';    -- 24
        wait;
    end process;
end Behavioral;
