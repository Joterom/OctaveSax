library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fft_controller is
    Port ( 
        clk : in STD_LOGIC;
        data_in_re : in STD_LOGIC_VECTOR (15 downto 0);
        data_in_im : in STD_LOGIC_VECTOR (15 downto 0)
    );
end fft_controller;

architecture Behavioral of fft_controller is

    component fft_ip port(
        aclk : IN STD_LOGIC;
        s_axis_config_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        s_axis_config_tvalid : IN STD_LOGIC;
        s_axis_config_tready : OUT STD_LOGIC;
        s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_data_tvalid : IN STD_LOGIC;
        s_axis_data_tready : OUT STD_LOGIC;
        s_axis_data_tlast : IN STD_LOGIC;
        m_axis_data_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
        m_axis_data_tuser : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        m_axis_data_tvalid : OUT STD_LOGIC;
        m_axis_data_tready : IN STD_LOGIC;
        m_axis_data_tlast : OUT STD_LOGIC;
        event_frame_started : OUT STD_LOGIC;
        event_tlast_unexpected : OUT STD_LOGIC;
        event_tlast_missing : OUT STD_LOGIC;
        event_status_channel_halt : OUT STD_LOGIC;
        event_data_in_channel_halt : OUT STD_LOGIC;
        event_data_out_channel_halt : OUT STD_LOGIC
    ); end component;
    
    signal event_frame_started, event_tlast_unexpected, event_tlast_missing, event_status_channel_halt,
        event_data_in_channel_halt, event_data_out_channel_halt : STD_LOGIC := '0';
    signal data_in : STD_LOGIC_VECTOR(32 downto 0) := (others => '0');
        
begin

    forward : fft_ip port map (
        aclk => clk,
        s_axis_config_tdata => config_data_in,
        s_axis_config_tvalid => config_valid_in,
        s_axis_config_tready => config_ready_in,
        s_axis_data_tdata => data_in,
        s_axis_data_tvalid => data_in_valid,
        s_axis_data_tready => data_in_ready,
        s_axis_data_tlast => data_in_last,
        m_axis_data_tdata => data_out,
        m_axis_data_tuser => tuser_data,
        m_axis_data_tvalid => data_out_valid,
        m_axis_data_tready => data_out_ready,
        m_axis_data_tlast => data_out_last,
        event_frame_started => event_frame_started, 
        event_tlast_unexpected => event_tlast_unexpected,
        event_tlast_missing => event_tlast_missing,
        event_status_channel_halt => event_status_channel_halt,
        event_data_in_channel_halt => event_data_in_channel_halt,
        event_data_out_channel_halt => event_data_out_channel_halt
    );
    
    inverse : fft_ip port map
    );
    
    data_in <= data_in_re & data_in_im;
    
end Behavioral;
