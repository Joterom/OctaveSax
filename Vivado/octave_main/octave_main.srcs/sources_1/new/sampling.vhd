library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.project_trunk.all;

entity sampling is
    Port (
        -- Master FPGA CLK
        clk_100MHz : in STD_LOGIC;
        -- Control signals
        frame_number : out integer;
        reset : in STD_LOGIC;
        -- CLKs
        MCLK : out STD_LOGIC;
        SCLK : out STD_LOGIC;
        LR_W_SEL : out STD_LOGIC
       );
end sampling;

architecture Behavioral of sampling is

    component clock_change port(
        clk_100MHz : in STD_LOGIC;
        clk_48MHz : out STD_LOGIC
    ); end component;
    
    signal clk_48MHz, lr, lr_next, sc, sc_next, mc, mc_next, clk_30MHz, wave : STD_LOGIC := '0';
    signal count : unsigned (9 downto 0) := (others => '0');
    signal frame_num, frame_number_next : integer := 0;
    signal init, init_next : STD_LOGIC := '1';  
        
begin

    CLK : clock_change port map (
        clk_100MHz => clk_100MHz,
        clk_48MHz => clk_48MHz
    );
        
    process (clk_48MHz, reset)
        begin
            if reset = '1' then
                count <= (others => '0');
                lr <= '0';
                sc <= '0';
                mc <= '0';                
            elsif rising_edge(clk_48MHz) then              
                count <= count + "00000001";
                lr <= not lr_next;
                sc <= not sc_next;
                mc <= not mc_next;                                      
            end if; 
    end process;
    
    init_calc : process (clk_100MHz, lr)
        begin            
            if rising_edge(clk_100MHz) and lr = '1' then
                init <= '0';
            end if;
    end process;
    
    frame_number_value : process(sc, init, reset)
              begin
                  if reset = '1' then
                    frame_num <= 0;
                  elsif init = '1' then
                    frame_num <= 0;
                  elsif rising_edge(sc) then                      
                    frame_num <= frame_number_next;                      
                  end if;
              end process;
    
    process(frame_num)
        begin
            frame_number_next <= frame_num + 1;
            if (frame_num = 31) then
                frame_number_next <= 0;
        end if;
    end process;

    frame_number <= frame_num;
    
    lr_next <= count(9);
    sc_next <= count(3);
    mc_next <= count(0);
    
    LR_W_SEL <= lr;
    SCLK <= sc;
    MCLK <= mc;
                    
end Behavioral;
