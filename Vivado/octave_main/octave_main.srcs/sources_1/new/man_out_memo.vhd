-- Javier Otero Martinez
-- OctaveSax project -- TFG 
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;

entity man_out_memo is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    start_proc_w : in STD_LOGIC;
    start_proc_r : in STD_LOGIC;
    sample_in : in SIGNED (sample_size - 1 downto 0);
    write_address : in STD_LOGIC_VECTOR (10 downto 0);
    read_address : in STD_LOGIC_VECTOR (10 downto 0);
    event_write : out STD_LOGIC;
    event_read : out STD_LOGIC;
    out_rdy : out STD_LOGIC;
    memw : out UNSIGNED (1 downto 0);
    memr : out UNSIGNED (1 downto 0);
    samp_out : out SIGNED (sample_size - 1 downto 0)
  );
end man_out_memo;

architecture Behavioral of man_out_memo is
    
    component out_long_memo port(
        douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
        doutb : out STD_LOGIC_VECTOR ( 15 downto 0 );
        clka : in STD_LOGIC;
        clkb : in STD_LOGIC;
        ena : in STD_LOGIC;
        enb : in STD_LOGIC;
        addra : in STD_LOGIC_VECTOR ( 10 downto 0 );
        addrb : in STD_LOGIC_VECTOR ( 10 downto 0 );
        dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
        dinb : in STD_LOGIC_VECTOR ( 15 downto 0 );
        wea : in STD_LOGIC_VECTOR ( 0 to 0 );
        web : in STD_LOGIC_VECTOR ( 0 to 0 )
    ); end component;

    -- Memo init
    signal ena0, ena0_next, ena1, ena1_next, ena2, ena2_next, ena3, ena3_next, enb0, enb0_next, enb1, enb1_next, enb2, enb2_next, enb3
           , enb3_next : STD_LOGIC := '0';
    --signal wea0, wea0_next, wea1, wea1_next, wea2, wea2_next, wea3, wea3_next : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal adw0, adw0_next, adw1, adw1_next, adw2, adw2_next, adw3, adw3_next, adr0, adr0_next, adr1, adr1_next, adr2, adr2_next, adr3
           , adr3_next : STD_LOGIC_VECTOR (10 downto 0) := (others => '0');
    signal dina0, dina0_next, dina1, dina1_next, dina2, dina2_next, dina3, dina3_next : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');   
    signal douta0, douta1, douta2, douta3 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal sample_out, sample_out_next : SIGNED (sample_size - 1 downto 0) := (others => '0');
    -- Counter
    signal cont_w, cont_w_next, cont_r, cont_r_next : UNSIGNED (3 downto 0) := (others => '0');
    signal procw, procw_next, procr, procr_next : STD_LOGIC := '0';
    -- Control
    signal memwo, memwo_next, memro, memro_next : UNSIGNED (1 downto 0) := "00";
    -- Out
    signal event_write_next, event_read_next, out_rdy_next : STD_LOGIC := '0';
    
begin

    MEMO0 : out_long_memo port map (
        clka => clk,
        clkb => clk,
        ena => ena0,
        enb => enb0,
        wea => "1",
        web => "0",
        addra => adw0,
        addrb => adr0,
        dina => dina0,
        dinb => "0000000000000000",
        doutb => douta0
    );
    
    MEMO1 : out_long_memo port map (
        clka => clk,
        clkb => clk,
        ena => ena1,
        enb => enb1,
        wea => "1",
        web => "0",
        addra => adw1,
        addrb => adr1,
        dina => dina1,
        dinb => "0000000000000000",
        doutb => douta1
    );
    
    MEMO2 : out_long_memo port map (
        clka => clk,
        clkb => clk,
        ena => ena2,
        enb => enb2,
        wea => "1",
        web => "0",
        addra => adw2,
        addrb => adr2,
        dina => dina2,
        dinb => "0000000000000000",
        doutb => douta2
    );
    
    MEMO3 : out_long_memo port map (
        clka => clk,
        clkb => clk,
        ena => ena3,
        enb => enb3,
        wea => "1",
        web => "0",
        addra => adw3,
        addrb => adr3,
        dina => dina3,
        dinb => "0000000000000000",
        doutb => douta3
    );
    
    reg : process(clk, reset)
        begin
            if reset = '1' then
                cont_w <= (others => '0');
                cont_r <= (others => '0');
                procw <= '0';
                procr <= '0';
                event_write <= '0';
                event_read <= '0';
                ena0 <= '0';
                ena1 <= '0';
                ena2 <= '0';
                ena3 <= '0';
                enb0 <= '0';
                enb1 <= '0';
                enb2 <= '0';
                enb3 <= '0';
                adw0 <= (others => '0');
                adw1 <= (others => '0');
                adw2 <= (others => '0');
                adw3 <= (others => '0');
                adr0 <= (others => '0');
                adr1 <= (others => '0');
                adr2 <= (others => '0');
                adr3 <= (others => '0');
                dina0 <= (others => '0');
                dina1 <= (others => '0');
                dina2 <= (others => '0');
                dina3 <= (others => '0');
                memwo <= "00";
                memro <= "00";
                sample_out <= (others => '0');
                out_rdy <= '0';
            elsif rising_edge(clk) then
                cont_w <= cont_w_next;
                cont_r <= cont_r_next;
                procw <= procw_next;
                procr <= procr_next;
                event_write <= event_write_next;
                event_read <= event_read_next;
                ena0 <= ena0_next;
                ena1 <= ena1_next;
                ena2 <= ena2_next;
                ena3 <= ena3_next;
                enb0 <= enb0_next;
                enb1 <= enb1_next;
                enb2 <= enb2_next;
                enb3 <= enb3_next;
                adw0 <= adw0_next;
                adw1 <= adw1_next;
                adw2 <= adw2_next;
                adw3 <= adw3_next;
                adr0 <= adr0_next;
                adr1 <= adr1_next;
                adr2 <= adr2_next;
                adr3 <= adr3_next;
                dina0 <= dina0_next;
                dina1 <= dina1_next;
                dina2 <= dina2_next;
                dina3 <= dina3_next;
                memwo <= memwo_next;
                memro <= memro_next;
                sample_out <= sample_out_next;
                out_rdy <= out_rdy_next;
            end if;
    end process;
    
    counter16_w : process(start_proc_w, cont_w, procw)
        begin
            cont_w_next <= cont_w;
            procw_next <= procw;
            if start_proc_w = '1' then
                procw_next <= '1';
            elsif procw = '1' then
                if cont_w = "1111" then
                    cont_w_next <= "0000";
                    procw_next <= '0';
                else
                    cont_w_next <= cont_w + 1;
                end if;
            end if;
    end process;
    
     counter16_r : process(start_proc_r, cont_r, procr)
           begin
               cont_r_next <= cont_r;
               procr_next <= procr;
               if start_proc_r = '1' then
                   procr_next <= '1';
               elsif procr = '1' then
                   if cont_r = "1111" then
                       cont_r_next <= "0000";
                       procr_next <= '0';
                   else
                       cont_r_next <= cont_r + 1;
                   end if;
               end if;
       end process;
    
    read_logic : process (sample_out, memro, read_address, enb0, enb1, enb2, enb3, adr0, adr1, adr2, adr3, cont_r)
        begin
            adr0_next <= adr0;
            adr1_next <= adr1;
            adr2_next <= adr2;
            adr3_next <= adr3;
            enb0_next <= enb0;
            enb1_next <= enb1;
            enb2_next <= enb2;
            enb3_next <= enb3;
            memro_next <= memro;
            event_read_next <= '0';
            out_rdy_next <= '0';
            sample_out_next <= sample_out; 
            case cont_r is
            when "0001" => --1
                event_read_next <= '1';
                memro_next <= "00";
            when "0011" => --3
                adr0_next <= read_address;
                enb0_next <= '1';
                memro_next <= "01";
            when "0100" => --4
                event_read_next <= '1';                  
            when "0101" => --5
                enb0_next <= '0';
            when "0110" => --6 
                out_rdy_next <= '1';
                sample_out_next <= signed(douta0);
                adr1_next <= read_address;
                enb1_next <= '1';
                memro_next <= "10";
            when "0111" => --7
                event_read_next <= '1';                   
            when "1000" => --8
                enb1_next <= '0';
            when "1001" => --9
                out_rdy_next <= '1';
                sample_out_next <= signed(douta1);
                adr2_next <= read_address;
                enb2_next <= '1';
                memro_next <= "11";
            when "1010" => --10
                event_read_next <= '1';                    
            when "1011" => --11
                enb2_next <= '0';
            when "1100" => --12
                out_rdy_next <= '1';
                sample_out_next <= signed(douta2);
                adr3_next <= read_address;
                enb3_next <= '1';
                memro_next <= "00";
            when "1110" => --14
                enb3_next <= '0';
            when "1111" => --15
                out_rdy_next <= '1';
                sample_out_next <= signed(douta3);   
                event_write_next <= '0';            
            when others =>
            end case;                  
    end process;
    
    
    write_logic : process(cont_w, douta0, douta1, douta2, douta3, memwo, memro, ena0, ena1, ena2, ena3, adw0, adw1
                          , adw2, adw3, dina0, dina1, dina2, dina3, write_address
                          , sample_in)
        begin
            memwo_next <= memwo;         
            event_write_next <= '0';           
            ena0_next <= ena0;
            ena1_next <= ena1;
            ena2_next <= ena2;
            ena3_next <= ena3;          
            adw0_next <= adw0;
            adw1_next <= adw1;
            adw2_next <= adw2;
            adw3_next <= adw3;           
            dina0_next <= dina0;
            dina1_next <= dina1;
            dina2_next <= dina2;
            dina3_next <= dina3;                    
            case cont_w is
            when "0001" =>
                event_write_next <= '1';
                memwo_next <= "00";
            when "0010" =>
                memwo_next <= "01";
            when "0011" =>
                adw0_next <= write_address;
                ena0_next <= '1';
                dina0_next <= std_logic_vector(sample_in);                    
                event_write_next <= '1';
            when "0100" =>
                ena0_next <= '0';
                memwo_next <= "10";                    
            when "0101" =>
                adw1_next <= write_address;
                ena1_next <= '1';
                dina1_next <= std_logic_vector(sample_in);
                event_write_next <= '1';
            when "0110" =>
                ena1_next <= '0'; 
                memwo_next <= "11";
            when "0111" =>
                adw2_next <= write_address;
                ena2_next <= '1';
                dina2_next <= std_logic_vector(sample_in);
                event_write_next <= '1';
            when "1000" =>
                ena2_next <= '0';
            when "1001" =>
                adw3_next <= write_address;
                ena3_next <= '1';
                dina3_next <= std_logic_vector(sample_in);
                memwo_next <= "00";
            when "1010" =>  
                ena3_next <= '0';
                event_write_next <= '0';
            when others =>
            end case;
    end process;
    
    samp_out <= sample_out;
    memw <= memwo;
    memr <= memro;
end Behavioral;
