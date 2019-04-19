-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.project_trunk.all;

-- Contains fsm declaration and state logic from writing and reading procces
entity fsm_control is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    start_output : in STD_LOGIC;
    frame_number : in STD_LOGIC_VECTOR (4 downto 0);
    control_signals : in STD_LOGIC_VECTOR (0 downto 0);
    input_fsm : out STD_LOGIC_VECTOR (2 downto 0)
  );
end fsm_control;

architecture Behavioral of fsm_control is

    --type buffer_fsm_t is (BUFFER1, BUFFER2, SOLAPA_INI, SOLAPA_FIN, REST);   
    --signal buf_fsm_w_state, buf_fsm_w_state_next : buffer_fsm_t := BUFFER1;  
    --signal buf_fsm_r_state, buf_fsm_r_state_next : buffer_fsm_t := REST;
    type memo_fsm_t is (IDLE, WRITE_INPUT, READ_OUTPUT, READ_SUM);   
    signal input_fsm_state, input_fsm_state_next : memo_fsm_t := IDLE;
    --Control
    signal LR_W_SEL, event_new_frame, start_reading : STD_LOGIC := '0';
    
begin
    -- Register logic
    reg_logic : process(clk, reset)
        begin
            if reset = '1' then
                input_fsm_state <= IDLE;
            elsif rising_edge(clk) then
                input_fsm_state <= input_fsm_state_next;
            end if;
    end process;
    
    -- Memory fsm state logic declaration
    input_state_change : process(input_fsm_state, frame_number, LR_W_SEL, start_output)
            begin
                input_fsm_state_next <= input_fsm_state;
                case input_fsm_state is    
                    when WRITE_INPUT =>
                        if frame_number = std_logic_vector(unsigned(write_input_cicle) + 1) then
                            input_fsm_state_next <= IDLE;
                        end if;
                                                
                    when READ_OUTPUT =>           
                        if frame_number = std_logic_vector(unsigned(read_output_cicle) + 1) then
                            input_fsm_state_next <= READ_SUM;
                        end if;
                    
                    when READ_SUM =>
                        if frame_number = "00000" then
                            input_fsm_state_next <= IDLE;
                        end if;
                        
                    when others => -- IDLE
                        if LR_W_SEL = '0' then
                            if frame_number = write_input_cicle then
                                input_fsm_state_next <= WRITE_INPUT;
                            elsif frame_number = read_output_cicle then
                                if start_output = '1' then
                                    input_fsm_state_next <= READ_OUTPUT;
                                end if;
                            elsif frame_number = read_sum_cicle then
                                if start_output = '1' then
                                    input_fsm_state_next <= READ_SUM;
                                end if;
                            end if;
                        end if;
                end case;
        end process;
    -- Generates control bus
    LR_W_SEL <= control_signals(0);
    -- Generates state std_logic outputs based on current states      
    with input_fsm_state select input_fsm <=
        "001" when WRITE_INPUT,
        "010" when READ_OUTPUT,
        "011" when READ_SUM,
        "000" when others;
    
end Behavioral;
