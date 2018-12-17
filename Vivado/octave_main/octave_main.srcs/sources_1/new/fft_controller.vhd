library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.project_trunk.all;

entity fft_controller is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC; -- Activo a nivel bajo
        
        inverse: in STD_LOGIC;
        
        in_real : in STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        in_img : in STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        sample_ready : in STD_LOGIC;
        
        make_config : in STD_LOGIC;
        config_done : out STD_LOGIC;
        
        
        start_frame : out STD_LOGIC;
        end_frame : out STD_LOGIC;
        
        sample_out_ready : out STD_LOGIC;
        tready_out : in STD_LOGIC;
        next_frame : out STD_LOGIC;
        out_real : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
        out_img : out STD_LOGIC_VECTOR (sample_size - 1 downto 0)
    );
end fft_controller;

architecture Behavioral of fft_controller is

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

    type state_type is (IDLE, PROC);
    signal current_state, next_state : state_type;
    
    signal padding : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal data_out : STD_LOGIC_VECTOR (47 downto 0);
    signal tlast_in, tvalid_in, tvalid_config, tready_config, tready_in, tlast_out, tvalid_out : STD_LOGIC;
    signal tlast_in_next, tvalid_in_next, next_frame_next, start_frame_next, end_frame_next : STD_LOGIC;
    signal config_data : STD_LOGIC_VECTOR (7 downto 0);
    signal events : STD_LOGIC_VECTOR (5 downto 0);
    signal tuser : STD_LOGIC_VECTOR (15 downto 0);
    signal counter : integer := 0;
    
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

    out_real <= data_out (22 downto 11);
    out_img <= data_out (46 downto 35);
    
    registers : process(clk, reset)
    begin
        if reset = '1' then
            current_state <= IDLE;
            tlast_in <= '0';
            tvalid_in <= '0';
            next_frame <= '0';
            start_frame <= '0';
            end_frame <= '0';
        elsif rising_edge(clk) then
            current_state <= next_state;
            tlast_in <= tlast_in_next;
            tvalid_in <= tvalid_in_next;
            next_frame <= next_frame_next;
            start_frame <= start_frame_next;
            end_frame <= end_frame_next;
        end if;
    end process;
    
    next_state_logic : process(clk, current_state, sample_ready, tlast_in, sample_ready)
    begin
        if rising_edge(clk) then
            case current_state is
                when IDLE =>
                    if sample_ready = '1' then
                        next_state <= PROC;
                    end if;
                when others =>
                    if tlast_in = '0' then
                        next_state <= PROC;
                    elsif sample_ready = '1' then
                        next_state <= PROC;
                    else
                        next_state <= IDLE;
                    end if;                    
            end case;
        end if;
    end process;
    
    Moore_output : process(current_state)
        begin
            tvalid_in <= '0';
            config_data <= (others => '0');
            case current_state is
                when IDLE =>
                    tvalid_in_next <= '0';
                when others =>
                    tvalid_in_next <= '1';
            end case;
        end process;
        
    Mealy_output : process(current_state)
        begin
            tvalid_in_next <= '0';
            start_frame_next <= '0';
            end_frame_next <= '0';
            case current_state is
                when IDLE =>
                    if tvalid_in = '1' then
                        start_frame_next <= '1';
                    end if;
                when others =>
                    if tlast_in = '0' then
                        counter <= counter + 1;
                        next_frame_next <= '1';
                    elsif sample_ready = '1' then
                        counter <= 0;
                    else
                        end_frame_next <= '1'; 
                        next_frame_next <= '0';
                        counter <= 0;
                    end if;
            end case;
        end process;
    
end Behavioral;
