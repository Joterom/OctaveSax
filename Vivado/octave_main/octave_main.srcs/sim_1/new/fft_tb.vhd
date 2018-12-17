library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fft_tb is
--  Port ( );
end fft_tb;

architecture Behavioral of fft_tb is

    component fft_module port(
    
        aclk : in STD_LOGIC;
        aresetn : in STD_LOGIC;
        
        s_axis_data_tlast : in STD_LOGIC;
        s_axis_data_tvalid : in STD_LOGIC;
        s_axis_data_tdata : in STD_LOGIC_VECTOR (31 downto 0);
        
        s_axis_config_tdata : in STD_LOGIC_VECTOR (7 downto 0);
        s_axis_config_tvalid : in STD_LOGIC;
         
        s_axis_config_tready : out STD_LOGIC;
        s_axis_data_tready : out STD_LOGIC;
        
        m_axis_data_tdata : out STD_LOGIC_VECTOR (47 downto 0);
        m_axis_data_tlast : out STD_LOGIC;
        m_axis_data_tready : in STD_LOGIC;
        m_axis_data_tuser : out STD_LOGIC_VECTOR (15 downto 0);
        m_axis_data_tvalid : out STD_LOGIC;
        
        event_frame_started : out STD_LOGIC;
        event_tlast_missing : out STD_LOGIC;
        event_status_channel_halt : out STD_LOGIC;
        event_data_in_channel_halt : out STD_LOGIC;
        event_data_out_channel_halt : out STD_LOGIC;
        event_tlast_unexpected : out STD_LOGIC
    ); end component;
    
    signal clk, reset, tlast_in, tvalid_in, tvalid_config, tready_config, tready_in, tlast_out, tready_out, tvalid_out : STD_LOGIC;
    signal data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal data_out : STD_LOGIC_VECTOR (47 downto 0);
    signal config_data : STD_LOGIC_VECTOR (7 downto 0);
    signal tuser : STD_LOGIC_VECTOR (15 downto 0);
    signal events : STD_LOGIC_VECTOR (5 downto 0);
    signal padding : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal frame_number : integer := 0;
    
begin
      
    FFT : fft_module port map (
        aclk => clk,
        aresetn => reset,
        
        s_axis_data_tdata => data_in,
        s_axis_data_tlast => tlast_in,
        s_axis_data_tvalid => tvalid_in,
        
        s_axis_config_tdata => config_data,
        s_axis_config_tvalid => tvalid_config,
        
        s_axis_config_tready => tready_config,
        s_axis_data_tready => tready_in,
        
        m_axis_data_tdata => data_out,
        m_axis_data_tlast => tlast_out,
        m_axis_data_tready => tready_out,
        m_axis_data_tuser => tuser,
        m_axis_data_tvalid => tvalid_out,
        
        event_frame_started => events(5),
        event_tlast_missing => events(4),
        event_status_channel_halt => events(3),
        event_data_in_channel_halt => events(2),
        event_data_out_channel_halt => events(1),
        event_tlast_unexpected => events(0)
    );

    clk_gen: process
        begin
            clk <= '1';
        wait for 5 ns;
            clk <= '0';
        wait for 5 ns;
    end process;
    
    stim : process
        begin   
            reset <= '0';
            config_data <= (others => '0');
        wait for 20 ns;
            reset <= '1';
        wait for 20 ns;
            tvalid_config <= '1';
        wait for 20 ns;
            tvalid_config <= '0';
            data_in <= padding & "000000000001" & padding & "000000000001";
            tvalid_in <= '1';
        wait for 50 ns;
            data_in <= padding & "000000000000" & padding & "100000000000";
        wait;
    end process;
    
    count : process(clk)
        begin
            if events(5) = '1' then
                frame_number <= 1;
                tlast_in <= '0';
            end if;
            if frame_number = 512 then
                tlast_in <= '0';
                frame_number <= 0;
            elsif frame_number = 511 then
                tlast_in <= '1';
                frame_number <= frame_number + 1;
            elsif rising_edge(clk) and frame_number /= 0 then
                frame_number <= frame_number + 1;
                tlast_in <= '0';
            end if;
    end process;

end Behavioral;
