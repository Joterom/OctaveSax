-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;

entity transform_controller is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    enable_fft : in STD_LOGIC;
    start_proc_fft : in STD_LOGIC;
    data_in_for : in STD_LOGIC_VECTOR (15 downto 0);
    enable_ifft : in STD_LOGIC;
    data_out_for_re : out STD_LOGIC_VECTOR (15 downto 0);
    data_out_for_im : out STD_LOGIC_VECTOR (15 downto 0);
    out_ctrl_for : out STD_LOGIC_VECTOR (8 downto 0)
  );
end transform_controller;

architecture Behavioral of transform_controller is
    
    component counter512 port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        start_count : in STD_LOGIC;
        count_value : out UNSIGNED (8 downto 0);
        count_ended : out STD_LOGIC
    ); end component;
    
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
    
    type transform_fsm is (IDLE, CONFIG, INPUT, OUTPUT, PROC);
    signal state_fft, state_fft_next : transform_fsm;
    signal processing, processing_next : STD_LOGIC := '0';
    -- Counter
    signal start_count, count_ended : STD_LOGIC := '0';
    signal count_value : UNSIGNED (8 downto 0) := (others => '0');
    --FFT module
    signal config_tvalid, config_tready, input_tvalid, input_tready, input_tlast, output_tvalid
        , output_tready, output_tlast : STD_LOGIC := '0';
    signal event_frame_started, event_tlast_unexpected, event_tlast_missing, event_status_channel_halt
        , event_data_in_channel_halt, event_data_out_channel_halt : STD_LOGIC := '0';
    signal config_tdata, output_tuser : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal input_data, output_data : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    
begin

    CNT : counter512 port map (
        clk => clk,
        reset => reset, 
        start_count => start_count,
        count_value => count_value,
        count_ended => count_ended
    );
    FFT : FFT_transform port map (
        aclk => clk,
        aclken => enable_fft,
        s_axis_config_tdata => config_tdata,
        s_axis_config_tvalid => config_tvalid,
        s_axis_config_tready => config_tready,
        s_axis_data_tdata => input_data,
        s_axis_data_tvalid => input_tvalid,
        s_axis_data_tready => input_tready,
        s_axis_data_tlast => input_tlast,
        m_axis_data_tdata => output_data,
        m_axis_data_tuser => output_tuser,
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
    
    process(clk, reset)
        begin
            if reset = '1' then
                processing <= '0';
                state_fft <= IDLE;
            elsif rising_edge(clk) then
                processing <= processing_next;
                state_fft <= state_fft_next;
            end if;
    end process;
    
    process(state_fft)
        begin
        -- Default
        case state_fft is
            when IDLE =>
            when PROC =>
            when others =>
        end case;
    end process;
     
    process(state_fft, start_proc_fft)
        begin
            if start_proc_fft = '1' then
                processing_next <= '1';
            end if;
    end process;
    
    out_ctrl_for <= output_tuser(8 downto 0);
    data_out_for_re <= output_data(15 downto 0);
    data_out_for_im <= output_data(31 downto 16);
        
end Behavioral;
