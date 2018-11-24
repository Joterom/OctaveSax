----------------------------------------------------------------------------------
-- Javier Otero Martinez
-- Trabajo fin de carrera
-- Sept - 2018
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity modulo_fft is
  Port ( 
    clk : in STD_LOGIC;
    re_in : in STD_LOGIC_VECTOR (15 downto 0);
    im_in : in STD_LOGIC_VECTOR (15 downto 0);
    enable : in STD_LOGIC;
    
    config_tvalid : in STD_LOGIC;
    config_data : in STD_LOGIC_VECTOR(7 downto 0);    
    config_tready : out STD_LOGIC;
    
    data_in_tlast : in STD_LOGIC;
    data_in_tvalid : in STD_LOGIC;
    data_in_tready : out STD_LOGIC;
    tuser : out STD_LOGIC_VECTOR (7 downto 0);
    
    data_out_tvalid : out STD_LOGIC;
    re_out : out STD_LOGIC_VECTOR (19 downto 0);
    im_out : out STD_LOGIC_VECTOR (19 downto 0)
  );
end modulo_fft;

architecture Behavioral of modulo_fft is

component comp_fft port (
    s_axis_data_tdata : in STD_LOGIC_VECTOR (31 downto 0);
    s_axis_data_tlast : in STD_LOGIC;
    s_axis_data_tready : out STD_LOGIC;
    s_axis_data_tvalid : in STD_LOGIC;
  
    s_axis_config_tdata : in STD_LOGIC_VECTOR (7 downto 0);
    s_axis_config_tready : out STD_LOGIC;
    s_axis_config_tvalid : in STD_LOGIC;
    
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    
    m_axis_data_tdata : out STD_LOGIC_VECTOR (47 downto 0);
    m_axis_data_tlast : out STD_LOGIC;
    m_axis_data_tuser : out STD_LOGIC_VECTOR (7 downto 0);
    m_axis_data_tvalid : out STD_LOGIC;
    
    event_frame_started : out STD_LOGIC;
    event_tlast_unexpected : out STD_LOGIC;
    event_tlast_missing : out STD_LOGIC;
    --event_status_channel_halt : out STD_LOGIC;
    --event_data_out_channel_halt : out STD_LOGIC;
    event_data_in_channel_halt : out STD_LOGIC
    ); end component;

    signal datos_in : STD_LOGIC_VECTOR (31 downto 0);
    signal datos_out : STD_LOGIC_VECTOR (47 downto 0);
    signal config_tdata : STD_LOGIC_VECTOR (7 downto 0);
    signal event_frame_started,event_tlast_unexpected, event_tlast_missing,
        event_data_in_channel_halt, data_out_tlast, data_out_tvalido : STD_LOGIC;
begin

FFT : comp_fft port map (
      aclk                        => clk,
      aclken                      => enable,
      
      s_axis_config_tvalid        => config_tvalid,
      s_axis_config_tready        => config_tready,
      s_axis_config_tdata         => config_data,
      
      s_axis_data_tvalid          => data_in_tvalid,
      s_axis_data_tready          => data_in_tready,
      s_axis_data_tdata           => datos_in,
      s_axis_data_tlast           => data_in_tlast,
      
      m_axis_data_tvalid          => data_out_tvalid,
      m_axis_data_tdata           => datos_out,
      m_axis_data_tlast           => data_out_tlast,
      m_axis_data_tuser           => tuser,
      
      event_frame_started         => event_frame_started,
      event_tlast_unexpected      => event_tlast_unexpected,
      event_tlast_missing         => event_tlast_missing,
      event_data_in_channel_halt  => event_data_in_channel_halt
      );
      
        datos_in <= im_in & re_in;
        im_out <= datos_out(43 downto 24); 
        re_out <= datos_out(19 downto 0);
    
end Behavioral;
