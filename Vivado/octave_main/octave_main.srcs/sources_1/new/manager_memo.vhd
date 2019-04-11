-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;

entity manager_memo is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    start_proc : in STD_LOGIC;
    sample_in : in SIGNED (sample_size - 1 downto 0);
    memo_address : in STD_LOGIC_VECTOR (9 downto 0);
    rw : in STD_LOGIC;
    end_proc : out STD_LOGIC;
    memo_event : out STD_LOGIC;
    out_rdy : out STD_LOGIC;
    use_mem : out UNSIGNED (1 downto 0);
    samp_out : out SIGNED (sample_size - 1 downto 0)
  );
end manager_memo;

architecture Behavioral of manager_memo is
    
    component freq_short_memo port(
        clka : in STD_LOGIC;
        ena : in STD_LOGIC;
        wea : in STD_LOGIC_VECTOR ( 0 to 0 );
        addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
        dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
        douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
    ); end component;

    -- Memo init
    signal ena0, ena0_next, ena1, ena1_next, ena2, ena2_next, ena3, ena3_next : STD_LOGIC := '0';
    signal wea0, wea0_next, wea1, wea1_next, wea2, wea2_next, wea3, wea3_next : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal add0, add0_next, add1, add1_next, add2, add2_next, add3, add3_next : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
    signal dina0, dina0_next, dina1, dina1_next, dina2, dina2_next, dina3, dina3_next : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');   
    signal douta0, douta1, douta2, douta3 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal sample_out, sample_out_next : SIGNED (sample_size - 1 downto 0) := (others => '0');
    -- Counter
    signal contador, contador_next : UNSIGNED (4 downto 0) := (others => '0');
    signal proc, proc_next : STD_LOGIC := '0';
    -- Control
    signal use_memo, use_memo_next : UNSIGNED (1 downto 0) := "00";
    -- Out
    signal memo_event_next, end_proc_next, out_rdy_next : STD_LOGIC := '0';
    
begin

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
                contador <= (others => '0');
                proc <= '0';
                memo_event <= '0';
                end_proc <= '0';
                ena0 <= '0';
                ena1 <= '0';
                ena2 <= '0';
                ena3 <= '0';
                wea0 <= "0";
                wea1 <= "0";
                wea2 <= "0";
                wea3 <= "0";
                add0 <= (others => '0');
                add1 <= (others => '0');
                add2 <= (others => '0');
                add3 <= (others => '0');
                dina0 <= (others => '0');
                dina1 <= (others => '0');
                dina2 <= (others => '0');
                dina3 <= (others => '0');
                use_memo <= "00";
                sample_out <= (others => '0');
                out_rdy <= '0';
            elsif rising_edge(clk) then
                contador <= contador_next;
                proc <= proc_next;
                memo_event <= memo_event_next;
                end_proc <= end_proc_next;
                ena0 <= ena0_next;
                ena1 <= ena1_next;
                ena2 <= ena2_next;
                ena3 <= ena3_next;
                wea0 <= wea0_next;
                wea1 <= wea1_next;
                wea2 <= wea2_next;
                wea3 <= wea3_next;
                add0 <= add0_next;
                add1 <= add1_next;
                add2 <= add2_next;
                add3 <= add3_next;
                dina0 <= dina0_next;
                dina1 <= dina1_next;
                dina2 <= dina2_next;
                dina3 <= dina3_next;
                use_memo <= use_memo_next;
                sample_out <= sample_out_next;
                out_rdy <= out_rdy_next;
            end if;
    end process;
    
    counter16 : process(start_proc, contador, proc)
        begin
            contador_next <= contador;
            proc_next <= proc;
            if start_proc = '1' then
                proc_next <= '1';
            elsif proc = '1' then
                if contador = "1111" then
                    contador_next <= "0000";
                    proc_next <= '0';
                else
                    contador_next <= contador + 1;
                end if;
            end if;
    end process;
    
    state_logic : process(contador, douta0, douta1, douta2, douta3, use_memo, ena0, ena1, ena2, ena3, wea0, wea1, wea2, wea3, add0, add1
                          , add2, add3, dina0, dina1, dina2, dina3, sample_out, rw)
        begin
            end_proc_next <= '0';
            use_memo_next <= use_memo;
            out_rdy_next <= '0';
            memo_event_next <= '0';
            ena0_next <= ena0;
            ena1_next <= ena1;
            ena2_next <= ena2;
            ena3_next <= ena3;
            wea0_next <= wea0;
            wea1_next <= wea1;
            wea2_next <= wea2;
            wea3_next <= wea3;
            add0_next <= add0;
            add1_next <= add1;
            add2_next <= add2;
            add3_next <= add3;
            dina0_next <= dina0;
            dina1_next <= dina1;
            dina2_next <= dina2;
            dina3_next <= dina3;
            sample_out_next <= sample_out;
            if rw = '0' then -- reading
                case contador is
                when "0000" => --0
                    memo_event_next <= '1';
                    use_memo_next <= "00";
                when "0010" => --2
                    add0_next <= memo_address;
                    ena0_next <= '1';
                    wea0_next <= "0";
                when "0011" => --3
                    memo_event_next <= '1';
                    use_memo_next <= "01";
                when "0100" => --4
                    ena0_next <= '0';
                when "0101" => --5 
                    out_rdy_next <= '1';
                    sample_out_next <= signed(douta0);
                    add1_next <= memo_address;
                    ena1_next <= '1';
                    wea1_next <= "0";
                when "0110" => --6
                    memo_event_next <= '1';
                    use_memo_next <= "10";
                when "0111" => --7
                    ena1_next <= '0';
                when "1000" => --8
                    out_rdy_next <= '1';
                    sample_out_next <= signed(douta1);
                    add2_next <= memo_address;
                    ena2_next <= '1';
                    wea2_next <= "0";
                when "1001" => --9
                    memo_event_next <= '1';
                    use_memo_next <= "11";
                when "1010" => --10
                    ena2_next <= '0';
                when "1011" => --11
                    out_rdy_next <= '1';
                    sample_out_next <= signed(douta2);
                    add3_next <= memo_address;
                    ena3_next <= '1';
                    wea3_next <= "0";
                when "1101" => --13
                    ena3_next <= '0';
                when "1110" => --14
                    out_rdy_next <= '1';
                    sample_out_next <= signed(douta3);
                    end_proc_next <= '1';                
                when others =>
                end case;
            else -- writing
                case contador is
                when "0000" =>
                    memo_event_next <= '1';
                    use_memo_next <= "00";
                when "0010" =>
                    add0_next <= memo_address;
                    ena0_next <= '1';
                    wea0_next <= "1";
                    dina0_next <= std_logic_vector(sample_in);
                    use_memo_next <= "01";
                    memo_event_next <= '1';
                when "0011" =>
                    ena0_next <= '0';                    
                when "0100" =>
                    add1_next <= memo_address;
                    ena1_next <= '1';
                    wea1_next <= "1";
                    dina1_next <= std_logic_vector(sample_in);
                    memo_event_next <= '1';
                when "0101" =>
                    ena1_next <= '0'; 
                when "0110" =>
                    add2_next <= memo_address;
                    ena2_next <= '1';
                    wea2_next <= "1";
                    dina2_next <= std_logic_vector(sample_in);
                    use_memo_next <= "10";
                    memo_event_next <= '1';
                when "0111" =>
                    ena2_next <= '0';
                when "1000" =>
                    add3_next <= memo_address;
                    ena3_next <= '1';
                    wea3_next <= "1";
                    dina3_next <= std_logic_vector(sample_in);
                    use_memo_next <= "11";
                    memo_event_next <= '1';
                when "1001" =>  
                    ena3_next <= '0';
                    end_proc_next <= '1';
                    use_memo_next <= "00";
                when others =>
                end case;
            end if;
    end process;
    samp_out <= sample_out;
    use_mem <= use_memo;
end Behavioral;
