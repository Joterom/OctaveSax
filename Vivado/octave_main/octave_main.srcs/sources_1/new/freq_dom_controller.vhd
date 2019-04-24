-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;

entity freq_dom_controller is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    use_buffer : in STD_LOGIC_VECTOR (1 downto 0);
    data_in : in SIGNED (15 downto 0);
    cont_sample : in STD_LOGIC;
    req_sample : in STD_LOGIC;
    req_sample_ready : out STD_LOGIC;
    data_out : out SIGNED (15 downto 0)
  );
end freq_dom_controller;

architecture Behavioral of freq_dom_controller is

    component transform_controller port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        enable_fft : in STD_LOGIC;
        start_proc_fft : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        data_out_for_re : out STD_LOGIC_VECTOR (15 downto 0);
        data_out_for_im : out STD_LOGIC_VECTOR (15 downto 0)
    ); end component;
    
    component freq_short_memo port(
        clka : in STD_LOGIC;
        ena : in STD_LOGIC;
        wea : in STD_LOGIC_VECTOR ( 0 to 0 );
        addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
        dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
        douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
    ); end component;
    signal enable_fft, start_proc_fft : STD_LOGIC := '0';
    signal data_out_re, data_out_im : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    -- MEMOs
    signal ena0, ena1, ena2, ena3, ena0_next, ena1_next, ena2_next, ena3_next : STD_LOGIC := '0';
    signal wea0, wea1, wea2 ,wea3, wea0_next, wea1_next, wea2_next, wea3_next : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal addra0, addra1, addra2, addra3, addra0_next, addra1_next, addra2_next, addra3_next, addra0r, addra1r
           , addra2r, addra3r, addra0r_next, addra1r_next, addra2r_next, add0, add1, add2, add3
           , addra3r_next : STD_LOGIC_VECTOR (9 downto 0) := (others => '1');
    signal dina0, douta0, dina1, douta1, dina2, douta2, dina3, douta3 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal reading_ready, reading_ready_n, reading_ready_nn, reading_ready_next : STD_LOGIC := '0';
    signal req_samp_ready, req_sample_ready_next : STD_LOGIC := '0';
    signal out_memo, out_memo_next : SIGNED (15 downto 0) := (others => '0');
    signal dina0_next, dina1_next, dina2_next, dina3_next : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    -- FSM State
    type memo_freq is (READ, WRITE);
    signal memo_freq_state, memo_freq_state_next : memo_freq := WRITE;
    signal state_change, state_change_next : STD_LOGIC := '0';
    
begin
    
    TRANS : transform_controller port map (
        clk => clk,
        reset => reset,
        enable_fft => enable_fft,
        start_proc_fft => start_proc_fft,
        data_in => std_logic_vector(data_in),
        data_out_for_re => data_out_re,
        data_out_for_im => data_out_im
    );
    
    MEMO0 : freq_short_memo port map (
        clka => clk,
        ena => ena0,
        wea => wea0,
        addra => add0,
        dina => dina0,
        douta => douta0
    );
    
    MEMO1 : freq_short_memo port map (
        clka => clk,
        ena => ena1,
        wea => wea1,
        addra => add1,
        dina => dina1,
        douta => douta1
    );
    
    MEMO2 : freq_short_memo port map (
        clka => clk,
        ena => ena2,
        wea => wea2,
        addra => add2,
        dina => dina2,
        douta => douta2
    );
    
    MEMO3 : freq_short_memo port map (
        clka => clk,
        ena => ena3,
        wea => wea3,
        addra => add3,
        dina => dina3,
        douta => douta3
    );
    
    reg : process(clk, reset)
        begin
            if reset = '1' then
            elsif rising_edge(clk) then
            end if;
    end process;
    

end Behavioral;
