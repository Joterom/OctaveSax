-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all; 
use work.project_trunk.all;


-- Multiplicates input sample by its correspondant factor previously calculated by Matlab. Each sample has a position
--     among the frame used to know by which factor should be scaled.
entity window_controller is
  Port ( 
    clk : in STD_LOGIC;
    start_proc_win : in STD_LOGIC;
    end_proc_win : out STD_LOGIC;
    for_inv : in STD_LOGIC; -- 1 = STFT, 0 = iSTFT
    multiplicand : in STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    factor_buf1 : in STD_LOGIC_VECTOR (8 downto 0);
    factor_buf2 : in STD_LOGIC_VECTOR (8 downto 0);
    result1 : out STD_LOGIC_VECTOR (sample_size - 1 downto 0);
    buf1_2 : out STD_LOGIC;
    result2 : out STD_LOGIC_VECTOR (sample_size - 1 downto 0)
  );
end window_controller;

architecture Behavioral of window_controller is

    component stft_window_rom port(
        in_frame : in STD_LOGIC_VECTOR (8 downto 0);
        out_win : out STD_LOGIC_VECTOR (15 downto 0)
    ); end component;
    
    component istft_window_rom port(
        in_frame : in STD_LOGIC_VECTOR (8 downto 0);
        out_win : out STD_LOGIC_VECTOR (15 downto 0)
    ); end component;
    
    signal multiplicatorSTFT, multiplicatoriSTFT : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal pre_resultSTFT_next, pre_resultiSTFT_next, pre_resultSTFT, pre_resultiSTFT : signed (31 downto 0) := (others => '0');
    signal factor, factor_next : STD_LOGIC_VECTOR (8 downto 0) := (others => '0');
    signal result1_next, result2_next, mult_reg, mult_reg_next, result1buf, result2buf : STD_LOGIC_VECTOR (sample_size - 1 downto 0) := (others => '0');
    signal ended_next, count, count_next, working, working_next, buf1_2next : STD_LOGIC := '0';
    signal value, value_next, proc : STD_LOGIC_VECTOR (2 downto 0) := "000";
    
begin
    -- Instantiate STFT ROM values
    STFT : stft_window_rom port map(
        in_frame => factor,
        out_win => multiplicatorSTFT
    );
    -- Instantiate iSTFT ROM values
    iSTFT : istft_window_rom port map(
        in_frame => factor,
        out_win => multiplicatoriSTFT
    );
    -- Operation
   
    reg : process(clk)
        begin
            if rising_edge(clk) then
          
                factor <= factor_next;
                mult_reg <= mult_reg_next;
                pre_resultSTFT <= pre_resultSTFT_next;
                pre_resultiSTFT <= pre_resultiSTFT_next;
                result1buf <= result1_next;
                result2buf <= result2_next;
                end_proc_win <= ended_next;
                value <= value_next;
                working <= working_next;
                buf1_2 <= buf1_2next;
            end if;
    end process;
    
      
    -- Depending on value, performs a different operation
    op : process(value)
        begin
            ended_next <= '0';
            case value is
            when "001" =>
                result1_next <= (others => '0');
                result2_next <= (others => '0');
                -- Ciclo 1 -> Carga el factor del bufer 1 e incializa el registro del operando
                factor_next <= factor_buf1;
                mult_reg_next <= multiplicand;                       
            when "011" =>    -- Ciclo 3 -> Realiza la multiplicacion para el buffer 1
                pre_resultSTFT_next <= signed(mult_reg)*signed(multiplicatorSTFT);
                pre_resultiSTFT_next <= signed(mult_reg)*signed(multiplicatoriSTFT);
            when "100" =>    -- Ciclo 4                
                if for_inv = '1' then
                    result1_next <= std_logic_vector(pre_resultSTFT(30 downto 15));
                else
                    result1_next <= std_logic_vector(pre_resultiSTFT(30 downto 15));
                end if;
                factor_next <= factor_buf2;
                ended_next <= '1';
                buf1_2next <= '1';
            when "110" =>    -- Ciclo 5
                pre_resultSTFT_next <= signed(mult_reg)*signed(multiplicatorSTFT);
                pre_resultiSTFT_next <= signed(mult_reg)*signed(multiplicatoriSTFT);
            when "111" =>    -- Ciclo 7 -> Trunca y almacena la operacion en el bufer 2 de salida
                if for_inv = '1' then
                    result2_next <= std_logic_vector(pre_resultSTFT(30 downto 15));
                else
                    result2_next <= std_logic_vector(pre_resultiSTFT(30 downto 15));
                end if;          
                ended_next <= '1';
                buf1_2next <= '0';
            when others =>
                result1_next <= result1buf;
                result2_next <= result2buf;
            end case;
    end process;
      
    -- Up to 7 counter         
    count_logic : process(value, start_proc_win)
        begin
            if start_proc_win = '1' or working = '1' then
                value_next <= value + 1;
                working_next <= '1';
                if value = "111" then
                    value_next <= "000";
                    working_next <= '0';
                end if;
            else
                value_next <= "000";
            end if;    
    end process;
            
    result1 <= result1buf;
    result2 <= result2buf;
    
--    proc <= value when start_proc_win = '1' else
--            "000";
    
end Behavioral;
