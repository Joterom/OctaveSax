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
    signal addra0, addra1, addra2, addra3, addra0_next, addra1_next, addra2_next, addra3_next : STD_LOGIC_VECTOR (9 downto 0) := (others => '1');
    signal dina0, douta0, dina1, douta1, dina2, douta2, dina3, douta3 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
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
        addra => addra0,
        dina => dina0,
        douta => douta0
    );
    
    MEMO1 : freq_short_memo port map (
        clka => clk,
        ena => ena1,
        wea => wea1,
        addra => addra1,
        dina => dina1,
        douta => douta1
    );
    
    MEMO2 : freq_short_memo port map (
        clka => clk,
        ena => ena2,
        wea => wea2,
        addra => addra2,
        dina => dina2,
        douta => douta2
    );
    
    MEMO3 : freq_short_memo port map (
        clka => clk,
        ena => ena3,
        wea => wea3,
        addra => addra3,
        dina => dina3,
        douta => douta3
    );
    
    reg : process(clk, reset)
        begin
            if reset = '1' then
                ena0 <= '0';
                ena1 <= '0';
                ena2 <= '0';
                ena3 <= '0';
                wea0 <= "0";
                wea1 <= "0";
                wea2 <= "0";
                wea3 <= "0";
                addra0 <= (others => '1');
                addra1 <= (others => '1');
                addra2 <= (others => '1');
                addra3 <= (others => '1');
            elsif rising_edge(clk) then
                ena0 <= ena0_next;
                ena1 <= ena1_next;
                ena2 <= ena2_next;
                ena3 <= ena3_next;
                wea0 <= wea0_next;
                wea1 <= wea1_next;
                wea2 <= wea2_next;
                wea3 <= wea3_next;
                addra0 <= addra0_next;
                addra1 <= addra1_next;
                addra2 <= addra2_next;
                addra3 <= addra3_next;
            end if;
    end process;
    
    process (cont_sample)
        begin
            if cont_sample = '1' then
                case use_buffer is  
                    when "00" =>
                        ena0_next <= '1';
                        wea0_next <= "1";
                        addra0_next <= std_logic_vector(unsigned(addra0) + 1);      
                        dina0 <= std_logic_vector(data_in);               
                    when "01" =>
                        ena1_next <= '1';
                        wea1_next <= "1";
                        addra1_next <= std_logic_vector(unsigned(addra1) + 1);      
                        dina1 <= std_logic_vector(data_in);
                    when "10" =>
                        ena2_next <= '1';
                        wea2_next <= "1";
                        addra2_next <= std_logic_vector(unsigned(addra2) + 1);      
                        dina2 <= std_logic_vector(data_in);
                    when others =>
                        ena3_next <= '1';
                        wea3_next <= "1";
                        addra3_next <= std_logic_vector(unsigned(addra3) + 1);      
                        dina3 <= std_logic_vector(data_in);
                end case;
            end if;
    end process;


end Behavioral;
