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
                memo_freq_state <= WRITE;
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
                addra0r <= (others => '1');
                addra1r <= (others => '1');
                addra2r <= (others => '1');
                addra3r <= (others => '1');
                reading_ready <= '0';
                reading_ready_n <= '0';
                reading_ready_nn <= '0';
                state_change <= '0';
                out_memo <= (others => '0');
                req_samp_ready <= '0';
                dina0 <= (others => '0');
                dina1 <= (others => '0');
                dina2 <= (others => '0');
                dina3 <= (others => '0');
            elsif rising_edge(clk) then
                memo_freq_state <= memo_freq_state_next;
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
                addra0r <= addra0r_next;
                addra1r <= addra1r_next;
                addra2r <= addra2r_next;
                addra3r <= addra3r_next;
                reading_ready <= reading_ready_n;
                reading_ready_n <= reading_ready_nn;
                reading_ready_nn <= reading_ready_next;
                state_change <= state_change_next;
                out_memo <= out_memo_next;
                req_samp_ready <= req_sample_ready_next;
                dina0 <= dina0_next;
                dina1 <= dina1_next;
                dina2 <= dina2_next;
                dina3 <= dina3_next;
            end if;
    end process;
    
    process (memo_freq_state, cont_sample, req_sample)
        begin
            memo_freq_state_next <= memo_freq_state;
            state_change_next <= '0';
            case memo_freq_state is
                when WRITE =>
                    if req_sample = '1' then
                        memo_freq_state_next <= READ;
                        state_change_next <= '1';
                    end if;
                when others => --READ  
                    if cont_sample = '1' then
                        memo_freq_state_next <= WRITE;
                        state_change_next <= '1';
                    end if;                  
            end case;
    end process;
    
    process (req_sample, cont_sample, use_buffer, addra0, addra1, addra2, addra3, addra0r, addra1r, addra2r, addra3r
             , data_in, memo_freq_state, state_change, ena0, ena1, ena2, ena3, douta0, douta1, douta2, douta3, wea0
             , wea1, wea2, wea3, reading_ready, dina0, dina1, dina2, dina3, out_memo)        
        begin           
            wea0_next <= wea0;
            addra0_next <= addra0;
            addra0r_next <= addra0r;          
            wea1_next <= wea1;
            addra1_next <= addra1;
            addra1r_next <= addra1r;            
            wea2_next <= wea2;
            addra2_next <= addra2;
            addra2r_next <= addra2r;           
            wea3_next <= wea3;
            addra3_next <= addra3;
            addra3r_next <= addra3r;
            reading_ready_next <= '0';
            req_sample_ready_next <= '0';
            dina0_next <= dina0;
            dina1_next <= dina1;
            dina2_next <= dina2;
            dina3_next <= dina3;
            out_memo_next <= out_memo;
            case memo_freq_state is
            when WRITE =>
                add0 <= addra0;
                add1 <= addra1;
                add2 <= addra2;
                add3 <= addra3;
                ena0_next <= '0';
                ena1_next <= '0';
                ena2_next <= '0';
                ena3_next <= '0';
                if state_change = '1' then
                    case use_buffer is  
                        when "00" =>
                            ena0_next <= '1';
                            wea0_next <= "1";
                            addra0_next <= std_logic_vector(unsigned(addra0) + 1);      
                            dina0_next <= std_logic_vector(data_in);               
                        when "01" =>
                            ena1_next <= '1';
                            wea1_next <= "1";
                            addra1_next <= std_logic_vector(unsigned(addra1) + 1);      
                            dina1_next <= std_logic_vector(data_in);
                        when "10" =>
                            ena2_next <= '1';
                            wea2_next <= "1";
                            addra2_next <= std_logic_vector(unsigned(addra2) + 1);      
                            dina2_next <= std_logic_vector(data_in);
                        when others =>
                            ena3_next <= '1';
                            wea3_next <= "1";
                            addra3_next <= std_logic_vector(unsigned(addra3) + 1);      
                            dina3_next <= std_logic_vector(data_in);
                    end case;
                end if;
                
           when others => --READ
                add0 <= addra0r;
                add1 <= addra1r;
                add2 <= addra2r;
                add3 <= addra3r;
                ena0_next <= ena0;
                ena1_next <= ena1;
                ena2_next <= ena2;
                ena3_next <= ena3;
                if state_change = '1' then
                    case use_buffer is  
                        when "00" =>
                            ena0_next <= '1';
                            wea0_next <= "0";
                            addra0r_next <= std_logic_vector(unsigned(addra0r) + 1);      
                            reading_ready_next <= '1';              
                        when "01" =>
                            ena1_next <= '1';
                            wea1_next <= "0";
                            addra1r_next <= std_logic_vector(unsigned(addra1r) + 1); 
                            reading_ready_next <= '1';     
                        when "10" =>
                            ena2_next <= '1';
                            wea2_next <= "0";
                            addra2r_next <= std_logic_vector(unsigned(addra2r) + 1);
                            reading_ready_next <= '1';      
                        when others => -- 11
                            ena3_next <= '1';
                            wea3_next <= "0";
                            addra3r_next <= std_logic_vector(unsigned(addra3r) + 1);
                            reading_ready_next <= '1';      
                    end case;
                elsif reading_ready = '1' then
                    ena0_next <= '0';
                    ena1_next <= '0';
                    ena2_next <= '0';
                    ena3_next <= '0';
                    case use_buffer is
                        when "00" =>
                            out_memo_next <= signed(douta0);
                            req_sample_ready_next <= '1';
                        when "01" =>
                            out_memo_next <= signed(douta1);
                            req_sample_ready_next <= '1';
                        when "10" =>
                            out_memo_next <= signed(douta2);
                            req_sample_ready_next <= '1';
                        when others => -- 11
                            out_memo_next <= signed(douta3);
                            req_sample_ready_next <= '1';
                    end case;
                end if;
            end case;
    end process;
    
    data_out <= out_memo;
    req_sample_ready <= req_samp_ready;
end Behavioral;
