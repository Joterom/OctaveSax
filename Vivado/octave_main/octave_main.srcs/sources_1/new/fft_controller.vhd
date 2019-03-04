library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fft_controller is
    Port ( 
        clk : in STD_LOGIC;
        
        data_in_re_for : in STD_LOGIC_VECTOR (11 downto 0);
        data_in_im_for : in STD_LOGIC_VECTOR (11 downto 0);
        data_in_re_inv : in STD_LOGIC_VECTOR (11 downto 0);
        data_in_im_inv : in STD_LOGIC_VECTOR (11 downto 0);
        data_out_re_for : out STD_LOGIC_VECTOR (11 downto 0);
        data_out_im_for : out STD_LOGIC_VECTOR (11 downto 0);
        data_out_re_inv : out STD_LOGIC_VECTOR (11 downto 0);
        data_out_im_inv : out STD_LOGIC_VECTOR (11 downto 0)
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
        m_axis_data_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
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
    
    -- FORWARD
   
    signal data_in_for : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');   
    signal config_valid_in_for, config_ready_in_for, data_in_valid_for, data_in_ready_for, data_in_last_for, data_out_valid_for
        , data_out_last_for, data_out_ready_for : STD_LOGIC := '0';
    signal data_out_for : STD_LOGIC_VECTOR (47 downto 0);
    signal tuser_data_for: STD_LOGIC_VECTOR (15 downto 0);
   
    --INVERSE
    
    signal data_in_inv: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');    
    signal config_valid_in_inv, config_ready_in_inv, data_in_valid_inv, data_in_ready_inv, data_in_last_inv, data_out_valid_inv
        , data_out_last_inv, data_out_ready_inv : STD_LOGIC := '0';
    signal data_out_inv : STD_LOGIC_VECTOR (47 downto 0);
    signal tuser_data_inv : STD_LOGIC_VECTOR (15 downto 0);
    
begin

    forward : fft_ip port map (
        aclk => clk,
        s_axis_config_tdata => (others => '1'),
        s_axis_config_tvalid => config_valid_in_for,
        s_axis_config_tready => config_ready_in_for,
        s_axis_data_tdata => data_in_for,
        s_axis_data_tvalid => data_in_valid_for,
        s_axis_data_tready => data_in_ready_for,
        s_axis_data_tlast => data_in_last_for,
        m_axis_data_tdata => data_out_for,
        m_axis_data_tuser => tuser_data_for,
        m_axis_data_tvalid => data_out_valid_for,
        m_axis_data_tready => data_out_ready_for,
        m_axis_data_tlast => data_out_last_for,
        event_frame_started => open, 
        event_tlast_unexpected => open,
        event_tlast_missing => open,
        event_status_channel_halt => open,
        event_data_in_channel_halt => open,
        event_data_out_channel_halt => open
    );
    
    inverse : fft_ip port map (
        aclk => clk,
        s_axis_config_tdata => (others => '0'),
        s_axis_config_tvalid => config_valid_in_inv,
        s_axis_config_tready => config_ready_in_inv,
        s_axis_data_tdata => data_in_inv,
        s_axis_data_tvalid => data_in_valid_inv,
        s_axis_data_tready => data_in_ready_inv,
        s_axis_data_tlast => data_in_last_inv,
        m_axis_data_tdata => data_out_inv,
        m_axis_data_tuser => tuser_data_inv,
        m_axis_data_tvalid => data_out_valid_inv,
        m_axis_data_tready => data_out_ready_inv,
        m_axis_data_tlast => data_out_last_inv,
        event_frame_started => open, 
        event_tlast_unexpected => open,
        event_tlast_missing => open,
        event_status_channel_halt => open,
        event_data_in_channel_halt => open,
        event_data_out_channel_halt => open
    );
    
    data_in_for <= data_in_re_for & data_in_im_for;
    data_in_inv <= data_in_re_inv & data_in_im_inv;
    
    data_out_re_for <= data_out_for(0) & data_out_for(1) & data_out_for(2) & data_out_for(3) & data_out_for(4) & data_out_for(5)
        & data_out_for(6) & data_out_for(7) & data_out_for(8) & data_out_for(9) & data_out_for(10) & data_out_for(11);
    
    data_out_re_inv <= data_out_inv(0) & data_out_inv(1) & data_out_inv(2) & data_out_inv(3) & data_out_inv(4) & data_out_inv(5)
        & data_out_inv(6) & data_out_inv(7) & data_out_inv(8) & data_out_inv(9) & data_out_inv(10) & data_out_inv(11);
        
    data_out_im_for <= data_out_for(24) & data_out_for(25) & data_out_for(26) & data_out_for(27) & data_out_for(28) & data_out_for(29)
        & data_out_for(30) & data_out_for(31) & data_out_for(32) & data_out_for(33) & data_out_for(34) & data_out_for(35);
                
    data_out_im_inv <= data_out_inv(24) & data_out_inv(25) & data_out_inv(26) & data_out_inv(27) & data_out_inv(28) & data_out_inv(29)
        & data_out_inv(30) & data_out_inv(31) & data_out_inv(32) & data_out_inv(33) & data_out_inv(34) & data_out_inv(35);
    
end Behavioral;
