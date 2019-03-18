-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;

-- Top architecture module
entity fsm_global is
  Port ( 
    -- Master FPGA CLK
    clk_fpga : in STD_LOGIC;
    reset : in STD_LOGIC;
    -- Displays
    seg : out STD_LOGIC_VECTOR (6 downto 0);
    an : out STD_LOGIC_VECTOR (7 downto 0);
    -- CLKs
    MCLK_ADC : out STD_LOGIC;
    SCLK_ADC : out STD_LOGIC;
    LR_W_SEL_ADC : out STD_LOGIC;
    MCLK_DAC : out STD_LOGIC;
    SCLK_DAC : out STD_LOGIC;
    LR_W_SEL_DAC : out STD_LOGIC;
    -- INput/OUTput 
    play_enable : in STD_LOGIC;       
    DATA_IN : in STD_LOGIC;
    DATA_OUT : out STD_LOGIC
  );
end fsm_global;

architecture Behavioral of fsm_global is

    component master_controller port(
        -- Master FPGA CLK
        clk_100MHz : in STD_LOGIC;
        clk_50MHz : in STD_LOGIC;
        reset : in STD_LOGIC;
        -- CLKs
        MCLK_ADC : out STD_LOGIC;
        SCLK_ADC : out STD_LOGIC;
        LR_W_SEL_ADC : out STD_LOGIC;
        MCLK_DAC : out STD_LOGIC;
        SCLK_DAC : out STD_LOGIC;
        LR_W_SEL_DAC : out STD_LOGIC;
        -- INput/OUTput
        global_state : in STD_LOGIC_VECTOR (1 downto 0);
        DATA_IN : in STD_LOGIC;
        DATA_OUT : out STD_LOGIC
    ); end component;
    
    
    component clk_generator port(
        clk_fpga : in STD_LOGIC;
        clk_100MHz : out STD_LOGIC;
        clk_50MHz : out STD_LOGIC
    ); end component; 
        
    component display_interface port(
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        state : in STD_LOGIC_VECTOR (1 downto 0);
        seg : out STD_LOGIC_VECTOR (6 downto 0);
        an : out STD_LOGIC_VECTOR (7 downto 0)
    ); end component;
    
    signal clk_100MHZ, clk_50MHz : STD_LOGIC := '0';
    
    type global_state_var is (PLAY, PAUSE, STOP);
    signal state, state_next : global_state_var := STOP;        
     
    signal global_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    
begin

    CONT : master_controller port map(
        clk_100MHz => clk_100MHz,
        clk_50MHz => clk_50MHz,
        reset => reset,
        -- CLKs
        MCLK_ADC => MCLK_ADC,
        SCLK_ADC => SCLK_ADC,
        LR_W_SEL_ADC => LR_W_SEL_ADC,
        MCLK_DAC => MCLK_DAC,
        SCLK_DAC => SCLK_DAC,
        LR_W_SEL_DAC => LR_W_SEL_DAC,
        -- INput/OUTput
        global_state => global_state,
        DATA_IN => DATA_IN,
        DATA_OUT => DATA_OUT
    );
    
    displays : display_interface port map (
        clk => clk_100MHz,
        reset => reset,
        state => global_state,
        seg => seg,
        an => an
    );
    
    clk_gen : clk_generator port map (
        clk_fpga => clk_fpga,
        clk_100MHz => clk_100MHz,
        clk_50MHz => clk_50MHz
    );

    change_state_logic : process(state, play_enable)
        begin
            state_next <= state;
            case state is
                when STOP => 
                    if play_enable = '1' then
                        state_next <= PLAY;
                    else
                        state_next <= PAUSE;
                    end if;
                when PLAY =>
                    if play_enable = '0' then
                        state_next <= PAUSE;
                    end if;
                when PAUSE =>
                    if play_enable = '1' then
                        state_next <= PLAY;
                    end if;
                when others =>
            end case;
    end process;
    
    reg_logic : process(clk_100MHz, reset)
        begin
            if reset = '1' then 
                state <= STOP;
            elsif rising_edge(clk_100MHz) then
                state <= state_next;
            end if;
    end process;
    
    output_logic : process(state)
        begin
            global_state <= "00";           
            case state is
                when STOP => 
                    global_state <= "00";
                    
                when PLAY =>
                    global_state <= "11";
                    
                when PAUSE =>
                    global_state <= "01";
                    
                when others =>
                    global_state <= "00";
            end case;
    end process;
    
    
end Behavioral;
