-- Javier Otero Martinez
-- OctaveSax project -- TFG 
-- June 2019

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;


-- Multiplicates input sample by its correspondant factor previously calculated by Matlab. Each sample has a position
--     among the frame used to know by which factor should be scaled.
entity window_controller is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    start_proc_win : in STD_LOGIC;
    end_proc_win : out STD_LOGIC;
    for_inv : in STD_LOGIC; -- 1 = STFT, 0 = iSTFT
    multiplicand : in signed (sample_size - 1 downto 0);
    sample_number : in STD_LOGIC_VECTOR (8 downto 0);
    result : out signed (sample_size - 1 downto 0)
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
    
    signal end_proc_win_next : STD_LOGIC := '0';
    signal window_data, window_data_i, window_data_next, window_data_i_next, pre_win : STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    signal result_pre, result_next : signed(2*sample_size - 1 downto 0) := (others => '0');
    
begin
    -- Instantiate STFT ROM values
    STFT : stft_window_rom port map(
        in_frame => sample_number,
        out_win => window_data
    );
    -- Instantiate iSTFT ROM values
    iSTFT : istft_window_rom port map(
        in_frame => sample_number,
        out_win => window_data_i
    );
    
   
    reg_logic : process(clk, reset)
        begin
            if reset = '1' then
               result_pre <= (others => '0'); 
               end_proc_win <= '0';
            elsif rising_edge(clk) then
               result_pre <= result_next;
               end_proc_win <= end_proc_win_next;
            end if;
    end process;
    
    process(start_proc_win, pre_win, multiplicand)
        begin
            result_next <= (others => '0');
            end_proc_win_next <= '0';
            if start_proc_win = '1' then
                result_next <= signed(pre_win)*multiplicand;
                end_proc_win_next <= '1';
            end if;
    end process;
    
    pre_win <= window_data when for_inv = '1' else
               window_data_i;
               
    result <= result_pre(30 downto 15);
    
end Behavioral;
