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
    frame_number : in STD_LOGIC_VECTOR (4 downto 0);
    control_signals : in STD_LOGIC_VECTOR (2 downto 0);
    counter_buf1 : in UNSIGNED (8 downto 0);
    counter_buf2 : in UNSIGNED (8 downto 0);
    counter_buf1_r : in UNSIGNED (8 downto 0);
    counter_buf2_r : in UNSIGNED (8 downto 0);
    buffer1_fsm : out STD_LOGIC_VECTOR (2 downto 0);
    buffer2_fsm : out STD_LOGIC_VECTOR (2 downto 0);
    memo_fsm : out STD_LOGIC_VECTOR (2 downto 0)
  );
end fsm_control;

architecture Behavioral of fsm_control is

    type buffer_fsm_t is (BUFFER1, BUFFER2, SOLAPA_INI, SOLAPA_FIN, REST);   
    signal buf_fsm_w_state, buf_fsm_w_state_next : buffer_fsm_t := BUFFER1;  
    signal buf_fsm_r_state, buf_fsm_r_state_next : buffer_fsm_t := REST;
    type memo_fsm_t is (IDLE, WRITE1, WRITE2, READ1, READ2, READ_SUM);   
    signal memo_fsm_state, memo_fsm_state_next : memo_fsm_t := IDLE;
    --Control
    signal LR_W_SEL, event_new_frame, start_reading : STD_LOGIC := '0';
    
begin
    -- Register logic
    reg_logic : process(clk, reset)
        begin
            if reset = '1' then
                buf_fsm_w_state <= BUFFER1;
                buf_fsm_r_state <= REST;
                memo_fsm_state <= IDLE;
            elsif rising_edge(clk) then
                buf_fsm_w_state <= buf_fsm_w_state_next;
                buf_fsm_r_state <= buf_fsm_r_state_next;
                memo_fsm_state <= memo_fsm_state_next;
            end if;
    end process;
    -- Writing buffer fsm state logic declaration
    w_b_state : process(buf_fsm_w_state, counter_buf1, counter_buf2)
        begin
            buf_fsm_w_state_next <= buf_fsm_w_state;
            case buf_fsm_w_state is    
                when BUFFER1 =>
                    if counter_buf1 = "110000000" then
                        buf_fsm_w_state_next <= SOLAPA_FIN;
                    end if;
                    
                when BUFFER2 =>
                    if counter_buf2 = "110000000" then
                        buf_fsm_w_state_next <= SOLAPA_INI;
                    end if;
                    
                when SOLAPA_INI =>
                    if counter_buf1 = "010000000" then
                        buf_fsm_w_state_next <= BUFFER1;
                    end if;
                                    
                when SOLAPA_FIN =>
                    if counter_buf2 = "010000000" then
                        buf_fsm_w_state_next <= BUFFER2;
                    end if;
                    
                when others =>
            end case;
    end process;
    -- Reading buffer fsm state logic declaration
    r_b_state : process(buf_fsm_r_state, counter_buf1_r, counter_buf2_r, event_new_frame, start_reading)
            begin
                buf_fsm_r_state_next <= buf_fsm_r_state;
                case buf_fsm_r_state is    
                    when BUFFER1 =>
                        if counter_buf1_r = "110000000" then
                            buf_fsm_r_state_next <= SOLAPA_FIN;
                        end if;
                        
                    when BUFFER2 =>
                        if counter_buf2_r = "110000000" then
                            buf_fsm_r_state_next <= SOLAPA_INI;
                        end if;
                        
                    when SOLAPA_INI =>
                        if counter_buf1_r = "010000000" then
                            buf_fsm_r_state_next <= BUFFER1;
                        end if;
                                        
                    when SOLAPA_FIN =>
                        if counter_buf2_r = "010000000" then
                            buf_fsm_r_state_next <= BUFFER2;
                        end if;
                        
                    when others =>
                        if event_new_frame = '1' then
                            if start_reading = '1' then
                                buf_fsm_r_state_next <= BUFFER1;    
                            end if;
                        end if;
                end case;
        end process;
    -- Memory fsm state logic declaration
    memo_state_change : process(memo_fsm_state, frame_number, buf_fsm_w_state, buf_fsm_r_state, LR_W_SEL, start_reading)
            begin
                memo_fsm_state_next <= memo_fsm_state;
                case memo_fsm_state is    
                    when WRITE1 =>
                        if frame_number = write_cicle2 then
                            if buf_fsm_w_state = BUFFER1 then
                                memo_fsm_state_next <= IDLE;
                            else
                                memo_fsm_state_next <= WRITE2;
                            end if;
                        end if;
                        
                    when WRITE2 =>
                        if frame_number = wait_cicle then
                            memo_fsm_state_next <= IDLE;
                        end if;
                        
                    when READ1 => 
                        if frame_number = read_cicle2 then
                            if buf_fsm_r_state = BUFFER1 then
                                memo_fsm_state_next <= IDLE;
                            else
                                memo_fsm_state_next <= READ2;
                            end if;
                        end if;
                                        
                    when READ2 =>
                        if frame_number = read_sum_cicle then
                            if buf_fsm_r_state = SOLAPA_FIN or buf_fsm_r_state = SOLAPA_INI then
                                memo_fsm_state_next <= READ_SUM;
                            else
                                memo_fsm_state_next <= IDLE;
                            end if;
                        end if;
                    
                    when READ_SUM =>
                        if frame_number = "00000" then
                            memo_fsm_state_next <= IDLE;
                        end if;
                    
                    when others => -- IDLE
                        if LR_W_SEL = '0' then
                            if frame_number = write_cicle1 then
                                if buf_fsm_w_state /= BUFFER2 then
                                    memo_fsm_state_next <= WRITE1;
                                end if;
                            elsif frame_number = write_cicle2 then
                                if buf_fsm_w_state = BUFFER2 then
                                    memo_fsm_state_next <= WRITE2;
                                end if;
                            end if;
                            if buf_fsm_r_state /= REST then
                                if frame_number = read_cicle1 then
                                    if buf_fsm_r_state /= BUFFER2 then
                                        memo_fsm_state_next <= READ1;
                                    end if;
                                elsif frame_number = read_cicle2 then
                                    if buf_fsm_r_state = BUFFER2 then
                                        memo_fsm_state_next <= READ2;
                                    end if;
                                end if;
                            end if;
                        end if;
                        
                end case;
        end process;
    -- Generates control bus
    event_new_frame <= control_signals(2);
    LR_W_SEL <= control_signals(1);
    start_reading <= control_signals(0);
    -- Generates state std_logic outputs based on current states
    with buf_fsm_w_state select buffer1_fsm <=
        "000" when REST,
        "001" when BUFFER1,
        "010" when BUFFER2,
        "011" when SOLAPA_INI,
        "100" when SOLAPA_FIN,
        "111" when others;   
    with buf_fsm_r_state select buffer2_fsm <=
        "000" when REST,
        "001" when BUFFER1,
        "010" when BUFFER2,
        "011" when SOLAPA_INI,
        "100" when SOLAPA_FIN,
        "111" when others;        
    with memo_fsm_state select memo_fsm <=
        "000" when IDLE,
        "001" when WRITE1,
        "010" when WRITE2,
        "011" when READ1,
        "100" when READ2,
        "101" when READ_SUM,
        "111" when others;
    
end Behavioral;
