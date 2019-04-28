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
    state : in STD_LOGIC_VECTOR (2 downto 0);
    add_req : in STD_LOGIC; -- Cuando requiere una direccion -> event_write
    load_even : in STD_LOGIC; -- Cuando tiene que cargar en la memoria par
    load_odd : in STD_LOGIC; -- Cuando tiene que cargar en la memoria impar
    even_mem : in STD_LOGIC; -- 0 para la memoria 0 y 1 para la 2
    odd_mem : in STD_LOGIC; -- 0 para la memoria 1 y 1 para la 3
    end_load_even : out STD_LOGIC;
    end_load_odd : out STD_LOGIC;
    load_add_even : out STD_LOGIC_VECTOR (8 downto 0);
    load_add_odd : out STD_LOGIC_VECTOR (8 downto 0)    
  );
end freq_dom_controller;

architecture Behavioral of freq_dom_controller is

--    component transform_controller port(
--        clk : in STD_LOGIC;
--        reset : in STD_LOGIC;
--        enable_fft : in STD_LOGIC;
--        start_proc_fft : in STD_LOGIC;
--        data_in : in STD_LOGIC_VECTOR (15 downto 0);
--        data_out_for_re : out STD_LOGIC_VECTOR (15 downto 0);
--        data_out_for_im : out STD_LOGIC_VECTOR (15 downto 0)
--    ); end component;
        
    signal ladd0, ladd0nn, ladd1, ladd1nn, ladd2, ladd2nn, ladd3, ladd3nn : UNSIGNED (8 downto 0) := (others => '1'); 
    signal end_load_even_next, end_load_odd_next : STD_LOGIC := '0';
    
begin
    
--    TRANS : transform_controller port map (
--        clk => clk,
--        reset => reset,
--        enable_fft => enable_fft,
--        start_proc_fft => start_proc_fft,
--        data_in => std_logic_vector(data_in),
--        data_out_for_re => data_out_re,
--        data_out_for_im => data_out_im
--    );
    

    
    reg : process(clk, reset)
        begin
            if reset = '1' then
                ladd0 <= (others => '1');
                ladd1 <= (others => '1');
                ladd2 <= (others => '1');
                ladd3 <= (others => '1');
                end_load_even <= '0';
                end_load_odd <= '0';
            elsif rising_edge(clk) then
                ladd0 <= ladd0nn;
                ladd1 <= ladd1nn;
                ladd2 <= ladd2nn;
                ladd3 <= ladd3nn;
                end_load_even <= end_load_even_next;
                end_load_odd <= end_load_odd_next;
            end if;
    end process;
    
    -- LOAD AND UNLOAD PROCESSES
    process(even_mem, load_even, add_req)
        begin
            ladd0nn <= ladd0;
            ladd2nn <= ladd2;
            end_load_even_next <= '0';
            if state = "101" then
                if load_even = '1' then
                    if add_req = '1' then
                        if even_mem = '0' then
                            ladd0nn <= ladd0 + 1; 
                            if ladd0 = "1111111110" then
                                end_load_even_next <= '1';
                            end if;
                        else
                            ladd2nn <= ladd2 + 1;
                            if ladd2 = "1111111110" then
                                end_load_even_next <= '1';
                            end if;
                       end if; 
                    end if;
                end if;
            end if;
    end process;
    
    process(odd_mem, load_odd, add_req)
        begin
            ladd1nn <= ladd1;
            ladd3nn <= ladd3;
            end_load_odd_next <= '0';
            if state = "101" then
                if load_odd = '1' then
                    if add_req = '1' then
                       if odd_mem = '0' then
                          ladd1nn <= ladd1 + 1; 
                          if ladd1 = "1111111110" then
                            end_load_odd_next <= '1';
                          end if;
                       else
                          ladd3nn <= ladd3 + 1;
                          if ladd3 = "1111111110" then
                            end_load_odd_next <= '1';
                          end if;
                       end if; 
                    end if;
                end if;
            end if;
    end process;
    
    load_add_even <= std_logic_vector(ladd0) when even_mem = '0' else
                     std_logic_vector(ladd2);
                     
    load_add_odd <= std_logic_vector(ladd1) when odd_mem = '0' else
                    std_logic_vector(ladd3);
    ----------
    
end Behavioral;
