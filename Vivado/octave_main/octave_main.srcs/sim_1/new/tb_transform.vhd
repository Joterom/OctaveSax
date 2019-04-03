library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_transform is
--  Port ( );
end tb_transform;

architecture Behavioral of tb_transform is
    component FFT_transform port (
        aclk : IN STD_LOGIC;
        aclken : IN STD_LOGIC;
        s_axis_config_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        s_axis_config_tvalid : IN STD_LOGIC;
        s_axis_config_tready : OUT STD_LOGIC;
        s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_data_tvalid : IN STD_LOGIC;
        s_axis_data_tready : OUT STD_LOGIC;
        s_axis_data_tlast : IN STD_LOGIC;
        m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
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
       
    signal clk, enable_fft : STD_LOGIC;
    signal event_frame_started, event_tlast_unexpected, event_tlast_missing, event_status_channel_halt, event_data_in_channel_halt
           , event_data_out_channel_halt, config_tvalid, config_tready, input_tvalid, input_tready, input_tlast
           , output_tvalid, output_tready, output_tlast : STD_LOGIC := '0';
    signal config_data, output_user, im_in, re_in : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
    signal input_data, output_data : STD_LOGIC_VECTOR(31 DOWNTO 0);
begin
    
    FFT : FFT_transform port map (
        aclk => clk,
        aclken => enable_fft,
        s_axis_config_tdata => config_data,
        s_axis_config_tvalid => config_tvalid,
        s_axis_config_tready => config_tready,
        s_axis_data_tdata => input_data,
        s_axis_data_tvalid => input_tvalid,
        s_axis_data_tready => input_tready,
        s_axis_data_tlast => input_tlast,
        m_axis_data_tdata => output_data,
        m_axis_data_tuser => output_user,
        m_axis_data_tvalid => output_tvalid,
        m_axis_data_tready => output_tready,
        m_axis_data_tlast => output_tlast,
        event_frame_started => event_frame_started,
        event_tlast_unexpected => event_tlast_unexpected,
        event_tlast_missing => event_tlast_missing,
        event_status_channel_halt => event_status_channel_halt,
        event_data_in_channel_halt => event_data_in_channel_halt,
        event_data_out_channel_halt => event_data_out_channel_halt
    );
    
    clk_gen : process
        begin
            clk <= '1';
        wait for 5 ns;
            clk <= '0';
        wait for 5 ns;
    end process;
    
    process
        begin
            enable_fft <= '1';
            re_in <= "0100000000000000";
        wait for 25 ns;   
            config_data <= "0000001101010101";
            config_tvalid <= '1';
        wait for 95 ns;
            input_tvalid <= '1';
        wait for 0 ns;
            --config_tvalid <= '0';
            re_in <= "0000000000000000";
            im_in <= "0000000000000000";         
        wait for 10 ns;
            re_in <= "0000000000000000";
            im_in <= "0000000000000000";
        wait for 55 ns;
            config_tvalid <= '0';
        wait for 5040 ns;
            input_tlast <= '1';
        wait for 10 ns;
            input_tlast <= '0';
            output_tready <= '1';
        wait;
    end process;

    input_data <= im_in & re_in;
end Behavioral;
