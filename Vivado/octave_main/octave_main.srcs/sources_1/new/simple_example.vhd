library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.project_trunk.all;

entity simple_example is
    Port (
       -- Master FPGA CLK
       clk_100MHz : in STD_LOGIC;
       -- Reset button
       reset : in STD_LOGIC;
       -- Enable switch
       enable : in STD_LOGIC;
       sample : in STD_LOGIC;
       -- Data provided by ADC
       DATA_IN : in STD_LOGIC;
       -- Data to be sent to DAC
       DATA_OUT : out STD_LOGIC;
       
       test_out : out STD_LOGIC;
       
       led_inforead : out STD_LOGIC;
       led_infowrite : out STD_LOGIC;
       -- Pmod configuration
       MCLK : out STD_LOGIC;
       SCLK : out STD_LOGIC;
       LR_W_SEL : out STD_LOGIC
       );
end simple_example;

architecture Behavioral of simple_example is

    component clock_change port(
        clk_100MHz : in STD_LOGIC;
        clk_22MHz : out STD_LOGIC
    ); end component;
    
    component pmod_clk_gen port(
        reset : in STD_LOGIC;
        enable : in STD_LOGIC;
        MCLK : in STD_LOGIC;
        SCLK : out STD_LOGIC;
        LR_W_SEL : out STD_LOGIC
    ); end component;
    
    component ram_memo port(
        addra : in STD_LOGIC_VECTOR (17 downto 0);
        clka : in STD_LOGIC;
        dina : in STD_LOGIC_VECTOR (11 downto 0);
        douta : out STD_LOGIC_VECTOR (11 downto 0);
        ena : in STD_LOGIC;
        wea : in STD_LOGIC_VECTOR (0 downto 0)
    ); end component;
    
    component shift_register port(
        clk : in STD_LOGIC;
               enable : in STD_LOGIC;
               reset : in STD_LOGIC;
               data_in : in STD_LOGIC;
               data_out : out STD_LOGIC_VECTOR (23 downto 0)
    ); end component;
    
    type state_type is (IDLE, READ, WRITE);
    signal state, state_next : state_type;
    signal filled, filled_next, enable_reg, enable_reg_next : STD_LOGIC;
    signal frame_number, frame_number_next : integer := 0;
    signal frame, frame_next : STD_LOGIC_VECTOR (23 downto 0):= (others => '0');
    signal enable_gen, enable_gen_next, enable_count, enable_count_next, reg_frame, reg_frame_next, enable_memo, enable_memo_next : STD_LOGIC;
    signal addra, addra_next : STD_LOGIC_VECTOR (17 downto 0) := (others => '0');
    signal dina, dina_next : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal wea, wea_next : STD_LOGIC_VECTOR (0 downto 0);
    signal douta_reg, douta_next : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    
    signal clk_22MHz, smck, data_out_next, data_out_c, reset_s : STD_LOGIC := '0';
    signal enable_data, LRCK : STD_LOGIC := '0';
        
begin

    CLK : clock_change port map (
        clk_100MHz => clk_100MHz,
        clk_22MHz => clk_22MHz
    );
    
    ram : ram_memo port map(
            addra => addra,
            clka => clk_22MHz,
            dina => dina,
            douta => douta_next,
            ena => enable_memo,
            wea => wea
        );
          
    pmod_clk : pmod_clk_gen port map (
        reset => reset_s,
        enable => enable_gen,
        MCLK => clk_22MHz,
        SCLK => smck,
        LR_W_SEL => LRCK
    );
    
    reg : shift_register port map(
        clk => smck,
        reset => reset_s,
        enable => enable_reg,
        data_in => DATA_IN,
        data_out => frame_next
    );
      
    register_logic : process (clk_22MHz, reset)
        begin
            if reset = '1' then
                state <= IDLE;
                filled <= '0';
                enable_count <= '0';
                frame <= (others => '0');
                enable_reg <= '0';
                enable_gen <= '0';
                reg_frame <= '0';
                addra <= (others => '0');
                enable_memo <= '0';
                dina <= (others => '0');
                wea <= "0";
                douta_reg <= (others => '0');
                data_out_c <= '0';
                reset_s <= '1';
            elsif rising_edge(clk_22MHz) then
                state <= state_next;
                filled <= filled_next;
                enable_count <= enable_count_next;
                frame <= frame_next;
                enable_reg <= enable_reg_next;
                enable_gen <= enable_gen_next;
                reg_frame <= reg_frame_next;
                addra <= addra_next;
                enable_memo <= enable_memo_next;
                dina <= dina_next;
                wea <= wea_next;
                douta_reg <= douta_next;
                data_out_c <= data_out_next;
                reset_s <= '0';
            end if;
    end process;
    
    next_state_logic : process(state, sample, filled)
        begin
            state_next <= IDLE;
            case state is
            
                when IDLE => 
                    if sample = '1' then
                        state_next <= READ;
                    end if;
                    
                when READ =>
                    state_next <= READ;
                    if filled = '1' then
                        state_next <= WRITE;
                    end if;
                    
                when WRITE =>
                    state_next <= WRITE;
                    if filled = '1' then
                        state_next <= IDLE;
                    end if;
                    
                when others =>
                    state_next <= IDLE;
            end case;
    end process;
    
    outputs : process(state, enable, frame_number, LRCK, addra, frame, douta_reg, data_out_c)
        begin
            -- Default output
            filled_next <= '0';            
            enable_reg_next <= '0';
            enable_gen_next <= '0';
            reg_frame_next <= '0';
            enable_memo_next <= '0';
            dina_next <= (others => '0');
            wea_next <= "0";
            filled_next <= '0';
            enable_count_next <= '0';
            data_out_next <= '0'; 
            addra_next <= (others => '0');
            
            case state is
                when IDLE =>
                    filled_next <= '0';                    
                    reg_frame <= '0';
                    enable_count_next <= '0';
                    addra_next <= (others => '0');
                when READ =>
                    reg_frame_next <= '0';
                    enable_gen_next <= '1';
                    enable_reg_next <= '0';
                    wea_next <= "1";        
                    enable_count_next <= '1';
                    addra_next <= addra;
                         
                    if enable = '1' then                
                        if LRCK = '0' then                            
                            if frame_number > 2 and frame_number < 99 then
                                enable_reg_next <= '1';                                
                            elsif frame_number = 103 then                                
                                dina_next <= frame (23 downto 12);  
                                enable_memo_next <= '1';
                            end if;
                            if frame_number = 123 then
                                reg_frame_next <= '1';
                                addra_next <= addra + 1;
                            end if;
                            if frame_number = 126 then
                                if addra = direccion_maxima then
                                    filled_next <= '1';
                                    addra_next <= (others => '0');                                                              
                                end if;      
                            end if;
                        end if;
                    end if;
                    
                when WRITE =>                    
                    reg_frame_next <= '0';
                    enable_gen_next <= '1';
                    enable_reg_next <= '0';
                    wea_next <= "0";        
                    enable_count_next <= '1';
                    addra_next <= addra;           
                    if enable = '1' then                
                        if LRCK = '0' then
                            if frame_number < 2 then
                                enable_memo_next <= '0';
                            elsif frame_number = 2 then
                                enable_memo_next <= '0';       
                            elsif frame_number >= 3 and frame_number < 99 then
                                case frame_number is
                                    when 3 =>
                                        data_out_next <= '0';
--                                        when 7 =>
--                                            data_out_next <= douta_next(11);
--                                        when 11 =>
--                                            data_out_next <= douta_reg(10);
--                                        when 15 =>
--                                            data_out_next <= douta_next(9);
--                                        when 19 =>
--                                            data_out_next <= douta_reg(8);
--                                        when 23 =>
--                                            data_out_next <= douta_next(7);
--                                        when 27 =>
--                                            data_out_next <= douta_reg(6);
--                                        when 31 =>
--                                            data_out_next <= douta_next(5);
--                                        when 35 =>
--                                            data_out_next <= douta_reg(4);
--                                        when 39 =>
--                                            data_out_next <= douta_next(3);
--                                        when 43 =>
--                                            data_out_next <= douta_reg(2);
--                                        when 47 =>
--                                            data_out_next <= douta_next(1);                                        
                                    when 51 =>
                                        data_out_next <= douta_reg(11);
                                    when 55 =>
                                        data_out_next <= douta_reg(10);
                                    when 59 =>
                                        data_out_next <= douta_reg(9);
                                    when 63 =>
                                        data_out_next <= douta_reg(8);
                                    when 67 =>
                                        data_out_next <= douta_reg(7);
                                    when 71 =>
                                        data_out_next <= douta_reg(6);
                                    when 75 =>
                                        data_out_next <= douta_reg(5);
                                    when 79 =>
                                        data_out_next <= douta_reg(4);
                                    when 83 =>
                                        data_out_next <= douta_reg(3);
                                    when 87 =>
                                        data_out_next <= douta_reg(2);
                                    when 91 =>
                                        data_out_next <= douta_reg(1);
                                    when 95 =>
                                        data_out_next <= douta_reg(0);
                                    when others =>
                                       data_out_next <= data_out_c; 
                                end case;
                            elsif frame_number = 123 then                              
                                addra_next <= addra + 1;
                            elsif frame_number = 126 then
                                if addra = direccion_maxima then
                                    filled_next <= '1';
                                    addra_next <= (others => '0');                                                              
                                end if;
                            end if;
                        else
                            enable_memo_next <= '1';
                        end if;
                    end if;
                when others =>
            end case;
    end process;
    
    frame_number_value : process(clk_22MHz, reset, LRCK)
          begin
              if reset = '1' then
                  frame_number <= 0;
              elsif rising_edge(clk_22MHz) and LRCK = '0' then                  
                  if enable_count = '1' then                  
                    frame_number <= frame_number_next;
                  end if;                  
              end if;             
          end process;
        
    process(frame_number) 
        begin            
            frame_number_next <= frame_number + 1;
            if (frame_number = 127) then
                frame_number_next <= 0;               
        end if;
    end process;
  
  
    data_out <= data_out_c;  
    test_out <= smck;
    
    with state select 
        led_inforead <= '0' and enable when WRITE,
                        '1' and enable when others;
    with state select 
        led_infowrite <= '0' and enable when READ,
                        '1' and enable when others;
    MCLK <= clk_22MHz and enable;
    LR_W_SEL <= LRCK;
    SCLK <= smck;
    
--    enable_data <= enable;
--    led_info <= enable and led_info_p;
    
end Behavioral;
