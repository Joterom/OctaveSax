library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package project_trunk is
--    constant MCLK_freq : integer := 44;
--    constant sample_size : integer := 12;
--    constant cero : STD_LOGIC_VECTOR (sample_size - 1 downto 0) := (others => '0');
    
--    -- constant LLENADO_MEMORIA : integer := 2; -- Para el TB
--    constant LLENADO_MEMORIA : integer := 262100; -- Para probar en placa
--    constant direccion_maxima : STD_LOGIC_VECTOR (17 downto 0) := std_logic_vector(to_unsigned(LLENADO_MEMORIA, 18));
    
    constant sample_size : integer := 12;
    constant writing_cicle : integer := 27;
    constant reading_cicle : integer := 25;
    
end project_trunk;
