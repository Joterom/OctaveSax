-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all; 
use work.project_trunk.all;


-- Multiplicates input sample by its correspondant factor previously calculated by Matlab. Each sample has a position
--     among the frame used to know by which factor should be scaled.
entity window_controller is
  Port ( 
    enable : in STD_LOGIC;
    for_inv : in STD_LOGIC; -- 1 = STFT, 0 = iSTFT
    buf1_2 : in STD_LOGIC;
    multiplicand : in STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    factor_buf1 : in STD_LOGIC_VECTOR (8 downto 0);
    factor_buf2 : in STD_LOGIC_VECTOR (8 downto 0);
    result : out STD_LOGIC_VECTOR (sample_size - 1 downto 0)
  );
end window_controller;

architecture Behavioral of window_controller is

    component stft_window_rom port(
        in_frame : in STD_LOGIC_VECTOR (8 downto 0);
        out_win : out STD_LOGIC_VECTOR (15 downto 0)
    ); end component;
    
    component istft_window_rom port(
        in_frame : in STD_LOGIC_VECTOR (8 downto 0);
        out_win : out STD_LOGIC_VECTOR (15 downto 0)
    ); end component;
    
    signal multiplicatorSTFT, multiplicatoriSTFT : STD_LOGIC_VECTOR (15 downto 0);
    signal pre_resultSTFT, pre_resultiSTFT : STD_LOGIC_VECTOR (31 downto 0);
    signal factor : STD_LOGIC_VECTOR (8 downto 0);
    
begin
    -- Instantiate STFT ROM values
    STFT : stft_window_rom port map(
        in_frame => factor,
        out_win => multiplicatorSTFT
    );
    -- Instantiate iSTFT ROM values
    iSTFT : istft_window_rom port map(
        in_frame => factor,
        out_win => multiplicatoriSTFT
    );
    -- Operation
    pre_resultSTFT <= multiplicatorSTFT*multiplicand;
    pre_resultiSTFT <= multiplicatoriSTFT*multiplicand;
    
    -- Select right result using for_inv value and enable
    result <= pre_resultSTFT(30 downto 15) when for_inv = '1' and enable = '1' else
            pre_resultiSTFT(30 downto 15) when for_inv = '0' and enable = '1' else
            (others => '0');
            
    factor <= factor_buf1 when buf1_2 = '1' else
              factor_buf2;

end Behavioral;
