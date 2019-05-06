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
    input_ready : in STD_LOGIC;
    start_readn : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR (15 downto 0)   
    --data_out_for_re : out STD_LOGIC_VECTOR (15 downto 0);
    --data_out_for_im : out STD_LOGIC_VECTOR (15 downto 0)
  );
end transform_controller;

architecture Behavioral of transform_controller is
    
--    component counter512 port(
--        clk : in STD_LOGIC;
--        reset : in STD_LOGIC;
--        start_count : in STD_LOGIC;
--        count_value : out UNSIGNED (8 downto 0);
--        count_ended : out STD_LOGIC
--    ); end component;
    
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
    
    component freq_memo port (
        douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
        clka : in STD_LOGIC;
        ena : in STD_LOGIC;
        addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
        dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
        wea : in STD_LOGIC_VECTOR ( 0 to 0 )
    ); end component;
    
--    type transform_fsm is (IDLE, CONFIG, INPUT, OUTPUT, PROC);
--    signal state_fft, state_fft_next : transform_fsm;
    signal processing, processing_next : STD_LOGIC := '0';
    -- Counter
    --signal start_count, count_ended : STD_LOGIC := '0';
    signal count_value, count_valuenn, count_read, count_readnn, count_value_inv, count_valuenn_inv : UNSIGNED (8 downto 0) := (others => '1');
    --FFT module
    signal config_tready, input_tvalid, input_tvalidnn, input_tready, input_tlast, input_tlastnn, output_tvalid
        , output_tready, output_treadynn, output_tlast : STD_LOGIC := '0';
    signal config_tvalidnn, config_tvalid : STD_LOGIC := '1';
    signal event_frame_started, event_tlast_unexpected, event_tlast_missing, event_status_channel_halt
        , event_data_in_channel_halt, event_data_out_channel_halt : STD_LOGIC := '0';
    signal output_tuser, data_out_for_re, data_out_for_im : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal input_data, input_data_next, output_data : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    -- iFFT module
    signal config_tready_inv, input_tvalid_inv, input_tvalidnn_inv, input_tready_inv, input_tlast_inv, input_tlastnn_inv, output_tvalid_inv
        , output_tready_inv, output_treadynn_inv, output_tlast_inv, start_proc_ifft, start_proc_ifftn, proc_ifft, proc_ifftn : STD_LOGIC := '0';
    signal config_tvalidnn_inv, config_tvalid_inv : STD_LOGIC := '1';
    signal event_frame_started_inv, event_tlast_unexpected_inv, event_tlast_missing_inv, event_status_channel_halt_inv
        , event_data_in_channel_halt_inv, event_data_out_channel_halt_inv : STD_LOGIC := '0';
    signal output_tuser_inv, data_out_for_re_inv, data_out_for_im_inv : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal input_data_inv, input_data_inv_next, output_data_inv : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    --
    signal in_data_im : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal stage, stagenn, stage_inv, stagenn_inv : STD_LOGIC := '0';
    --
    signal ena, ena_next : STD_LOGIC := '0';
    signal douta, dina, dina_next, membuf, membufn : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal wea, wea_next : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal addra, addra_next : STD_LOGIC_VECTOR (8 downto 0) := (others => '1');
    signal warn2, warn2n, warn2nn, start_read, read_next, read_nextn : STD_LOGIC := '0';
    --signal start_readn : STD_LOGIC := '0';
    
begin

--    FFT : FFT_transform port map (
--        aclk => clk,
--        aclken => enable_fft,
--        s_axis_config_tdata => config_tdata_for,
--        s_axis_config_tvalid => config_tvalid,
--        s_axis_config_tready => config_tready,
--        s_axis_data_tdata => input_data,
--        s_axis_data_tvalid => input_tvalid,
--        s_axis_data_tready => input_tready,
--        s_axis_data_tlast => input_tlast,
--        m_axis_data_tdata => output_data,
--        m_axis_data_tuser => output_tuser,
--        m_axis_data_tvalid => output_tvalid,
--        m_axis_data_tready => output_tready,
--        m_axis_data_tlast => output_tlast,
--        event_frame_started => event_frame_started,
--        event_tlast_unexpected => event_tlast_unexpected,
--        event_tlast_missing => event_tlast_missing,
--        event_status_channel_halt => event_status_channel_halt,
--        event_data_in_channel_halt => event_data_in_channel_halt,
--        event_data_out_channel_halt => event_data_out_channel_halt
--    );
    
    iFFT : FFT_transform port map (
        aclk => clk,
        aclken => enable_fft,
        s_axis_config_tdata => config_tdata_inv,
        s_axis_config_tvalid => config_tvalid_inv,
        s_axis_config_tready => config_tready_inv,
        s_axis_data_tdata => input_data_inv,
        s_axis_data_tvalid => input_tvalid_inv,
        s_axis_data_tready => input_tready_inv,
        s_axis_data_tlast => input_tlast_inv,
        m_axis_data_tdata => output_data_inv,
        m_axis_data_tuser => output_tuser_inv,
        m_axis_data_tvalid => output_tvalid_inv,
        m_axis_data_tready => output_tready_inv,
        m_axis_data_tlast => output_tlast_inv,
        event_frame_started => event_frame_started_inv,
        event_tlast_unexpected => event_tlast_unexpected_inv,
        event_tlast_missing => event_tlast_missing_inv,
        event_status_channel_halt => event_status_channel_halt_inv,
        event_data_in_channel_halt => event_data_in_channel_halt_inv,
        event_data_out_channel_halt => event_data_out_channel_halt_inv
    );
    
    MEMO : freq_memo port map (
        douta => douta,
        clka => clk,
        ena => ena,
        addra => addra,
        dina => dina,
        wea => wea
    );
    
    process(clk, reset)
        begin
            if reset = '1' then
                processing <= '0';   
                input_data <= (others => '0');  
                input_data_inv <= (others => '0'); 
                stage <= '0';    
                stage_inv <= '0';     
                input_tvalid <= '0';
                config_tvalid <= '1';
                count_value <= (others => '1');
                count_value_inv <= (others => '1');
                input_tlast <= '0';
                output_tready <= '0';
                addra <= (others => '1');
                dina <= (others => '0');
                ena <= '0';
                wea <= "0";
                warn2 <= '0';
                warn2n <= '0'; 
                start_read <= '0';
                read_next <= '0';
                count_read <= (others => '0');
                start_proc_ifft <= '0';
                proc_ifft <= '0';
            elsif rising_edge(clk) then
                processing <= processing_next;
                input_data <= input_data_next;
                input_data_inv <= input_data_inv_next;
                stage <= stagenn;
                stage_inv <= stagenn_inv;
                input_tvalid <= input_tvalidnn;
                config_tvalid <= config_tvalidnn;
                count_value <= count_valuenn;
                count_value_inv <= count_valuenn_inv;
                input_tlast <= input_tlastnn;
                output_tready <= output_treadynn;
                addra <= addra_next;
                dina <= dina_next;
                ena <= ena_next;
                wea <= wea_next;
                warn2 <= warn2n;
                warn2n <= warn2nn;
                start_read <= start_readn;
                read_next <= read_nextn;
                input_tvalid_inv <= input_tvalidnn_inv;
                config_tvalid_inv <= config_tvalidnn_inv;
                input_tlast_inv <= input_tlastnn_inv;
                output_tready_inv <= output_treadynn_inv;
                membuf <= membufn;
                count_read <= count_readnn;
                start_proc_ifft <= start_proc_ifftn;
                proc_ifft <= proc_ifftn;
            end if;
    end process;
    

     
--    process(start_proc_fft, processing, input_data, input_ready, in_data_im, stage, config_tvalid, count_value, output_tready
--            , start_read)
--        begin
--            processing_next <= processing;
--            input_data_next <= input_data;
--            stagenn <= '0';
--            input_tvalidnn <= '0';
--            config_tvalidnn <= config_tvalid;
--            count_valuenn <= count_value;
--            input_tlastnn <= '0';
--            output_treadynn <= output_tready;
--            start_readn <= '0';
--            if start_proc_fft = '1' then
--                processing_next <= '1';
--                config_tvalidnn <= '0';
--            end if;
--            if input_ready = '1' then
--                input_data_next <= in_data_im & data_in; 
--                stagenn <= '1';
--                count_valuenn <= count_value + 1;               
--            end if;
--            if stage = '1' then
--                input_tvalidnn <= '1';
--                if count_value = to_unsigned(511,9) then
--                    input_tlastnn <= '1';
--                    output_treadynn <= '1';
--                    processing_next <= '0';
--                    start_readn <= '1';
--                end if;
--            end if;
--    end process;
    
    process (output_data, output_tvalid, output_tready, addra, dina, ena, wea, douta, warn2, start_read, douta, read_next)
        begin
            -- Write memory
--            addra_next <= addra;
--            wea_next <= wea;
--            ena_next <= '0';
--            dina_next <= dina;                      
--            if output_tready = '1' then
--                if output_tvalid = '1' then
--                    addra_next <= std_logic_vector(unsigned(addra) + 1);
--                    wea_next <= "1";
--                    ena_next <= '1';
--                    dina_next <= output_data;
--                end if;
--            end if; 
            -- Read memory
            warn2nn <= '0';
            read_nextn <= read_next; 
            start_proc_ifftn <= '0';
            if start_read = '1' then
                if warn2 = '0' then
                    if ena = '0' then
                        addra_next <= std_logic_vector(unsigned(addra) + 1);
                    end if;
                    wea_next <= "0";
                    ena_next <= '1';
                    warn2nn <= '1';
                else
                    ena_next <= '0';
                    read_nextn <= '1'; 
                end if;
            end if;
            if read_next = '1' then
                read_nextn <= '0'; 
                --membufn <= douta;
                if addra = "1111111111" then
                    start_proc_ifftn <= '1';
                    --start_readn <= '0';
                end if;
            end if;
    end process;
    
    process(start_proc_ifft, read_next,stage_inv, config_tvalid_inv, count_value_inv, output_tready_inv
            , start_read, douta, proc_ifft)
        begin
            --processing_next <= processing;
            stagenn_inv <= '0';
            input_tvalidnn_inv <= '0';
            config_tvalidnn_inv <= config_tvalid_inv;
            count_valuenn_inv <= count_value_inv;
            input_tlastnn_inv <= '0';
            output_treadynn_inv <= output_tready_inv;
            proc_ifftn <= proc_ifft;
            if start_proc_ifft = '1' then
                proc_ifftn <= '1';
                config_tvalidnn_inv <= '0';
            elsif proc_ifft = '1' then
                if read_next = '1' then
                    input_data_inv_next <= douta; 
                    stagenn_inv <= '1';
                    count_valuenn_inv <= count_value_inv + 1;               
                end if;
                if stage_inv = '1' then
                    input_tvalidnn_inv <= '1';
                    if count_value_inv = to_unsigned(511,9) then
                        input_tlastnn_inv <= '1';
                        output_treadynn_inv <= '1';
                        proc_ifftn <= '0';
                    end if;
                end if;
            end if;
    end process;
    
    data_out_for_re <= output_data(15 downto 0);
    data_out_for_im <= output_data(31 downto 16);
    in_data_im <= "0000000000000000"; 
        
end Behavioral;
