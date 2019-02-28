-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.project_trunk.all;

-- Generates clock signals used by Pmod and provides additional control signals to synchronize 
--    data easily with it. 

entity sampling is
    Port (
        -- Master FPGA CLK
        clk_100MHz : in STD_LOGIC;
        clk_50MHz : in STD_LOGIC;
        -- Control signals 
        frame_number : out STD_LOGIC_VECTOR (4 downto 0);
        reset : in STD_LOGIC;
        sample_in_ready : out STD_LOGIC;
        sample_towrite_ready : out STD_LOGIC;
        -- CLKs
        MCLK : out STD_LOGIC;
        SCLK : out STD_LOGIC;
        SC_2 : out STD_LOGIC;
        LR_W_SEL : out STD_LOGIC
       );
end sampling;
 
architecture Behavioral of sampling is
   
    signal lr, lr_next, sc, sc_next, mc, mc_next, clk_30MHz, wave : STD_LOGIC := '0';
    signal count : STD_LOGIC_VECTOR (9 downto 0) := (others => '0');
    signal frame_num, frame_number_next, counter32, counter32_next : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal init, init_next : STD_LOGIC := '1'; 
    signal sample_in_ready_next, sample_towrite_ready_next : STD_LOGIC; 
    signal half_sc, half_sc_next : STD_LOGIC := '0';
    
begin
      
    -- Register logic + count at 50 MHz  
    process (clk_50MHz, reset)
        begin
            --init <= '1';
            if reset = '1' then
                count <= (others => '0');
                lr <= '0';
                sc <= '0';
                mc <= '0';
                half_sc <= '0';
                init <= '1';                
            elsif rising_edge(clk_50MHz) then              
                count <= count + "00000001";
                lr <= not lr_next;
                sc <= sc_next;
                mc <= not mc_next;
                half_sc <= not half_sc_next;  
                init <= init_next;                                    
            end if; 
    end process;
    
    -- Frame_num divides each LRCK period so it is easier to synchronize input and output data
    frame_number_value : process(sc, init, reset)
              begin
                  if reset = '1' then
                    frame_num <= (others => '0');
                  elsif init = '1' then
                    frame_num <= (others => '0');
                  elsif falling_edge(sc) then -- At SCLK frequency                 
                    frame_num <= frame_number_next;                      
                  end if;
              end process;
    -- Counter logig
    process(frame_num)
        begin
            frame_number_next <= frame_num + 1;
            if (frame_num = 31) then
                frame_number_next <= (others => '0');
        end if;
    end process;
    
    -- 100MHz counter
    counter_32 : process(clk_100MHz, frame_num, reset)
        begin
            if reset = '1' then
                counter32 <= (others => '0');
            elsif rising_edge(clk_100MHz) then
                if lr = '1' then
                    init_next <= '0';
                end if;
                if frame_num = writing_cicle  then
                    counter32 <= counter32_next;
                elsif frame_num = reading_cicle then
                    counter32 <= counter32_next;
                end if;
            end if;
    end process;
    
    process(counter32)
            begin
                counter32_next <= counter32 + 1;
                if (counter32 = 15) then -- It counts only until 16 actually
                    counter32_next <= (others => '0');
            end if;
        end process;
    
    -- 100MHz register
    process(clk_100MHz, reset)
        begin
            if reset = '1' then
                sample_in_ready <= '0';
                sample_towrite_ready <= '0';
            elsif rising_edge(clk_100MHz) then
                sample_in_ready <= sample_in_ready_next;
                sample_towrite_ready <= sample_towrite_ready_next;
            end if;
    end process;
    -- Generates signals to control reading and writing stages  
    sync : process(counter32, frame_num)
        begin           
            sample_in_ready_next <= '0';
            sample_towrite_ready_next <= '0';            
            if counter32 = 1 then -- Arbitrary choice, any other number between 0 and 15 would work as well
                if frame_num = reading_cicle then -- Constant defined at trunk, arbitrary
                    sample_in_ready_next <= '1';                   
                elsif frame_num = writing_cicle then -- Constant defined at trunk, arbitrary
                    sample_towrite_ready_next <= '1';                    
                end if;
            end if;            
    end process;
    
    -- Frequency divider to generate ADC/DAC clocks
    lr_next <= count(9); -- /1024
    sc_next <= count(3); -- /16
    half_sc_next <= count(2);
    mc_next <= count(0); -- /2
    -- Final assingments
    LR_W_SEL <= lr;
    SCLK <= sc;
    MCLK <= mc;
    SC_2 <= half_sc;
    frame_number <= frame_num;    
                 
end Behavioral;
