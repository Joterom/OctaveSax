-- Description :This module calculates the phase value based on the input values and in this module
-- 				 processing will be done on pipelined method. It is used the cordic algorithm.
--------------------------------------------------------------------------------
-- Library Declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity Declaration
entity y5_atan_ch_cor is
  Port ( clk      : in  std_logic;   -- Processing Clock
        reset     : in  std_logic;   -- Reset signal
        valid_in  : in  std_logic;   -- Input data valid signal
        data_real : in  std_logic_vector(15 downto 0); -- Real part of the input data
        data_imag : in  std_logic_vector(15 downto 0); -- Imaginary part of the input data
        valid_out : out std_logic;   -- Ouput data valid signal
        phase_rad : out std_logic_vector(15 downto 0)  -- Phase value
                );
end y5_atan_ch_cor;

architecture Behavioral of y5_atan_ch_cor is

-- Signals Declaration
  signal data_i1          : std_logic_vector(15 downto 0); 
  signal data_q1          : std_logic_vector(15 downto 0);
  signal acc_phase_rads   : std_logic_vector(15 downto 0);
  signal acc_phase_rads1  : std_logic_vector(15 downto 0); 
  signal phase_rad1       : std_logic_vector(15 downto 0);
  signal acc_phase_rads_n : std_logic_vector(15 downto 0); 
  signal ph_1             : std_logic_vector(15 downto 0);
  signal I                : std_logic_vector(15 downto 0); 
  signal Q                : std_logic_vector(15 downto 0); 
  signal i_sum1           : std_logic_vector(15 downto 0); 
  signal i_sum_n          : std_logic_vector(15 downto 0); 
  signal q_sum1           : std_logic_vector(15 downto 0); 
  signal q_sum_n          : std_logic_vector(15 downto 0);
  signal sig_valid_in     : std_logic; 
  signal or_sig           : std_logic;
  signal count            : std_logic_vector(5 downto 0);

  signal count_n          : std_logic_vector(5 downto 0);

  type rom_type is array (0 to 15) of std_logic_vector (15 downto 0);

-- Constant values loaded into the ram as per cordic alogrithm
  constant cordic_tableb : rom_type := ( X"1921",    -- 12868,
                                           X"0ED6",  -- 475,
                                           X"07D6",  -- 251,      
                                           X"03FA",  -- 127,
                                           X"01FF",  -- 64,               
                                           X"00FF",  -- 32,
                                           X"007F",  -- 16,               
                                           X"003F",  -- 8,
                                           X"001F",  -- 4,                
                                           X"000F",  -- 2,
                                           X"0007",  -- 1,                
                                           X"0003",  -- 0,
                                           X"0001",  -- 0,                
                                           X"0000",  -- 0
                                           X"0000",
                                           x"0000"
                                           );

	
--**************************************************************************************************************
begin

  i_sum1 <= i_sum_n + data_q1 when q_sum_n(15) = '0' else  -- Adding the shifted values with added values
            i_sum_n - data_q1;          -- based on the sum, if it is true, negative roatation
  q_sum1 <= q_sum_n - data_i1 when q_sum_n(15) = '0' else  -- else postive roatation
            q_sum_n + data_i1;

  acc_phase_rads1 <= ph_1 + acc_phase_rads_n when q_sum_n(15) = '0' else  -- If the condition is true it is adding the cordic table 
                     acc_phase_rads_n - ph_1;  -- values with phase else subtract from phase

process(clk,reset)
begin
  if reset = '1' then
    data_i1 <= (others => '0');
    data_q1 <= (others => '0');
  elsif clk = '1' and clk'event then
    if count_n(0) = '0' then

      case count_n(5 downto 1) is       -- Shifting the i & q values based on the counter
        when "00000"         =>
          data_i1 <= i;
          data_q1 <= q;
        when "00001"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15 downto 1);
          data_q1 <= q_sum_n(15) & q_sum_n(15 downto 1);
        when "00010"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 2); data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 2);
        when "00011"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 3);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 3);
        when "00100"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 4);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 4);
        when "00101"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 5);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 5);
        when "00110"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 6);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 6);
        when "00111"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 7);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 7);
        when "01000"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 8);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 8);
        when "01001"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 9);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 9);
        when "01010"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 10);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 10);
        when "01011"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 11);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 11);
        when "01100"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 12);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 12);
        when "01101"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 13);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 13);
        when "01110"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15 downto 14);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15 downto 14);
        when "01111"         =>
          data_i1 <= i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15) & i_sum_n(15);
          data_q1 <= q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15) & q_sum_n(15);
        when others          =>
          data_i1 <= (others => '0');
          data_q1 <= (others => '0');
      end case;
    end if;
  end if;
end process;

process(clk , reset)
begin
  if reset = '1' then
    i_sum_n          <= (others => '0');
    q_sum_n          <= (others => '0');
    acc_phase_rads_n <= (others => '0');
    count_n          <= (others => '0');
    ph_1             <= (others => '0');
    phase_rad1       <= (others =>'0');
  elsif clk = '1' and clk'event then
    ph_1 <= phase_rad1;
    count_n <= count;
    if count(5 downto 1) < "10000" then
      phase_rad1 <= cordic_tableb(conv_integer(count(5 downto 1)));
    else
      phase_rad1 <= (others => '0');
    end if; 	 
    
    if count(0) = '0' then
      if count(5 downto 1) = "00000" then
        i_sum_n          <= i;
        q_sum_n          <= q;          -- Caculating the I, Q and phase values based on the counter
        acc_phase_rads_n <= acc_phase_rads;
      else
        i_sum_n          <= i_sum1;
        q_sum_n          <= q_sum1;
        acc_phase_rads_n <= acc_phase_rads1;
      end if;
    end if;		
  end if;
end process;

-- Calculating the sign of the input data
or_sig <= data_imag(15) or data_imag(14) or data_imag(13) or data_imag(12) or data_imag(11) or data_imag(10) or
          data_imag(9) or data_imag(8) or data_imag(7) or data_imag(6) or data_imag(5) or data_imag(4) or data_imag(3)
          or data_imag(2) or data_imag(1) or data_imag(0);



process(clk, reset)
begin
  if(reset = '1') then
    I              <= (others => '0');
    Q              <= (others => '0');
    acc_phase_rads <= (others => '0');
    sig_valid_in   <= '0';
  elsif(clk'event and clk = '1') then
    if( valid_in = '1') then
      sig_valid_in       <= '1';
      if( data_real(15) = '1') then
        if (data_imag(15) = '0' and or_sig = '1') then  -- Calculationg the I, Q and Phase values based on the 
          I              <= data_imag;      -- sign bit of the real and imaginary inputs
          Q              <= not(data_real) + 1;  -- Based on the condition it adds or subtracts the 
          acc_phase_rads <= "0011001001000100";  -- 90 degress from the phase
        else
          I              <= not(data_imag) + 1;  -- add 90 degrees 
          Q              <= data_real;
          acc_phase_rads <= "1100110110111100";
        end if;
      else
        I                <= data_real;
        Q                <= data_imag;  -- If the condition is false, the I and Q values unchanged and 
        acc_phase_rads   <= (others => '0');  -- phase should be 0.
      end if;
    else
      sig_valid_in <= '0';
    end if;
  end if;
end process;

process(clk, reset)
begin
  if reset = '1' then
    valid_out <= '0';
    phase_rad <= (others => '0');       -- If counter reaches to 33 then phase value
  elsif clk = '1' and clk'event then    -- will be sent to port
    if count = "100001" then
      valid_out <= '1';
      phase_rad <= acc_phase_rads1;
    else
      valid_out <= '0';
    end if;
  end if;
end process;



process(clk, reset)
begin
  if (reset = '1') then
    count <= "100100";
  elsif(rising_edge(clk)) then
    if valid_in = '1' then
      count <= (others => '0');
    elsif(count = "100100") then        -- Counter increments whenever valid input is high and if counter 
      count <= count;                   -- value is 36, it will be reset
    else
      count <= count +'1';
    end if;
  end if;
end process;

end Behavioral;	 

