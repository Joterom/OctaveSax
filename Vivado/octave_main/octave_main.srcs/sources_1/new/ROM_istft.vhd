library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_istft is
    Port ( address : in STD_LOGIC_VECTOR (8 downto 0);
           enable : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (15 downto 0));
end ROM_istft;

architecture Behavioral of ROM_istft is

     signal result : STD_LOGIC_VECTOR (15 downto 0);
begin
    
    with address select result <=
        "0000000000000000" when "000000000",
        "0000000000000001" when "000000001",
        "0000000000000110" when "000000010",
        "0000000000001110" when "000000011",
        "0000000000011010" when "000000100",
        "0000000000101001" when "000000101",
        "0000000000111011" when "000000110",
        "0000000001010000" when "000000111",
        "0000000001101001" when "000001000",
        "0000000010000101" when "000001001",
        "0000000010100100" when "000001010",
        "0000000011000110" when "000001011",
        "0000000011101100" when "000001100",
        "0000000100010101" when "000001101",
        "0000000101000001" when "000001110",
        "0000000101110001" when "000001111",
        "0000000110100011" when "000010000",
        "0000000111011001" when "000010001",
        "0000001000010010" when "000010010",
        "0000001001001111" when "000010011",
        "0000001010001110" when "000010100",
        "0000001011010001" when "000010101",
        "0000001100010111" when "000010110",
        "0000001101100000" when "000010111",
        "0000001110101100" when "000011000",
        "0000001111111100" when "000011001",
        "0000010001001110" when "000011010",
        "0000010010100100" when "000011011",
        "0000010011111100" when "000011100",
        "0000010101011000" when "000011101",
        "0000010110110111" when "000011110",
        "0000011000011001" when "000011111",
        "0000011001111110" when "000100000",
        "0000011011100110" when "000100001",
        "0000011101010010" when "000100010",
        "0000011111000000" when "000100011",
        "0000100000110001" when "000100100",
        "0000100010100101" when "000100101",
        "0000100100011100" when "000100110",
        "0000100110010110" when "000100111",
        "0000101000010011" when "000101000",
        "0000101010010011" when "000101001",
        "0000101100010101" when "000101010",
        "0000101110011011" when "000101011",
        "0000110000100011" when "000101100",
        "0000110010101111" when "000101101",
        "0000110100111101" when "000101110",
        "0000110111001101" when "000101111",
        "0000111001100001" when "000110000",
        "0000111011110111" when "000110001",
        "0000111110010000" when "000110010",
        "0001000000101100" when "000110011",
        "0001000011001010" when "000110100",
        "0001000101101011" when "000110101",
        "0001001000001111" when "000110110",
        "0001001010110101" when "000110111",
        "0001001101011110" when "000111000",
        "0001010000001001" when "000111001",
        "0001010010110111" when "000111010",
        "0001010101101000" when "000111011",
        "0001011000011010" when "000111100",
        "0001011011010000" when "000111101",
        "0001011110000111" when "000111110",
        "0001100001000001" when "000111111",
        "0001100011111110" when "001000000",
        "0001100110111100" when "001000001",
        "0001101001111101" when "001000010",
        "0001101101000001" when "001000011",
        "0001110000000110" when "001000100",
        "0001110011001110" when "001000101",
        "0001110110011000" when "001000110",
        "0001111001100100" when "001000111",
        "0001111100110010" when "001001000",
        "0010000000000010" when "001001001",
        "0010000011010101" when "001001010",
        "0010000110101001" when "001001011",
        "0010001001111111" when "001001100",
        "0010001101011000" when "001001101",
        "0010010000110010" when "001001110",
        "0010010100001110" when "001001111",
        "0010010111101100" when "001010000",
        "0010011011001100" when "001010001",
        "0010011110101101" when "001010010",
        "0010100010010001" when "001010011",
        "0010100101110110" when "001010100",
        "0010101001011101" when "001010101",
        "0010101101000101" when "001010110",
        "0010110000101111" when "001010111",
        "0010110100011011" when "001011000",
        "0010111000001000" when "001011001",
        "0010111011110111" when "001011010",
        "0010111111100111" when "001011011",
        "0011000011011001" when "001011100",
        "0011000111001100" when "001011101",
        "0011001011000000" when "001011110",
        "0011001110110110" when "001011111",
        "0011010010101101" when "001100000",
        "0011010110100101" when "001100001",
        "0011011010011111" when "001100010",
        "0011011110011001" when "001100011",
        "0011100010010101" when "001100100",
        "0011100110010010" when "001100101",
        "0011101010010000" when "001100110",
        "0011101110001111" when "001100111",
        "0011110010001111" when "001101000",
        "0011110110010000" when "001101001",
        "0011111010010010" when "001101010",
        "0011111110010101" when "001101011",
        "0100000010011001" when "001101100",
        "0100000110011101" when "001101101",
        "0100001010100010" when "001101110",
        "0100001110101000" when "001101111",
        "0100010010101111" when "001110000",
        "0100010110110110" when "001110001",
        "0100011010111110" when "001110010",
        "0100011111000110" when "001110011",
        "0100100011001111" when "001110100",
        "0100100111011001" when "001110101",
        "0100101011100010" when "001110110",
        "0100101111101101" when "001110111",
        "0100110011110111" when "001111000",
        "0100111000000010" when "001111001",
        "0100111100001101" when "001111010",
        "0101000000011001" when "001111011",
        "0101000100100101" when "001111100",
        "0101001000110000" when "001111101",
        "0101001100111100" when "001111110",
        "0101010001001000" when "001111111",
        "0101010101010101" when "010000000",
        "0101011001100001" when "010000001",
        "0101011101101101" when "010000010",
        "0101100001111001" when "010000011",
        "0101100110000100" when "010000100",
        "0101101010010000" when "010000101",
        "0101101110011100" when "010000110",
        "0101110010100111" when "010000111",
        "0101110110110010" when "010001000",
        "0101111010111100" when "010001001",
        "0101111111000111" when "010001010",
        "0110000011010000" when "010001011",
        "0110000111011010" when "010001100",
        "0110001011100011" when "010001101",
        "0110001111101011" when "010001110",
        "0110010011110011" when "010001111",
        "0110010111111010" when "010010000",
        "0110011100000001" when "010010001",
        "0110100000000111" when "010010010",
        "0110100100001100" when "010010011",
        "0110101000010000" when "010010100",
        "0110101100010100" when "010010101",
        "0110110000010111" when "010010110",
        "0110110100011001" when "010010111",
        "0110111000011010" when "010011000",
        "0110111100011010" when "010011001",
        "0111000000011001" when "010011010",
        "0111000100010111" when "010011011",
        "0111001000010100" when "010011100",
        "0111001100010000" when "010011101",
        "0111010000001010" when "010011110",
        "0111010100000100" when "010011111",
        "0111010111111100" when "010100000",
        "0111011011110011" when "010100001",
        "0111011111101001" when "010100010",
        "0111100011011101" when "010100011",
        "0111100111010000" when "010100100",
        "0111101011000010" when "010100101",
        "0111101110110010" when "010100110",
        "0111110010100001" when "010100111",
        "0111110110001110" when "010101000",
        "0111111001111010" when "010101001",
        "0111111101100100" when "010101010",
        "1000000001001100" when "010101011",
        "1000000100110011" when "010101100",
        "1000001000011000" when "010101101",
        "1000001011111100" when "010101110",
        "1000001111011101" when "010101111",
        "1000010010111101" when "010110000",
        "1000010110011011" when "010110001",
        "1000011001110111" when "010110010",
        "1000011101010001" when "010110011",
        "1000100000101010" when "010110100",
        "1000100100000000" when "010110101",
        "1000100111010100" when "010110110",
        "1000101010100111" when "010110111",
        "1000101101110111" when "010111000",
        "1000110001000101" when "010111001",
        "1000110100010001" when "010111010",
        "1000110111011011" when "010111011",
        "1000111010100011" when "010111100",
        "1000111101101000" when "010111101",
        "1001000000101100" when "010111110",
        "1001000011101101" when "010111111",
        "1001000110101011" when "011000000",
        "1001001001101000" when "011000001",
        "1001001100100010" when "011000010",
        "1001001111011001" when "011000011",
        "1001010010001111" when "011000100",
        "1001010101000001" when "011000101",
        "1001010111110010" when "011000110",
        "1001011010100000" when "011000111",
        "1001011101001011" when "011001000",
        "1001011111110100" when "011001001",
        "1001100010011010" when "011001010",
        "1001100100111110" when "011001011",
        "1001100111011111" when "011001100",
        "1001101001111101" when "011001101",
        "1001101100011001" when "011001110",
        "1001101110110010" when "011001111",
        "1001110001001000" when "011010000",
        "1001110011011100" when "011010001",
        "1001110101101100" when "011010010",
        "1001110111111010" when "011010011",
        "1001111010000110" when "011010100",
        "1001111100001110" when "011010101",
        "1001111110010100" when "011010110",
        "1010000000010110" when "011010111",
        "1010000010010110" when "011011000",
        "1010000100010011" when "011011001",
        "1010000110001101" when "011011010",
        "1010001000000100" when "011011011",
        "1010001001111000" when "011011100",
        "1010001011101001" when "011011101",
        "1010001101010111" when "011011110",
        "1010001111000011" when "011011111",
        "1010010000101011" when "011100000",
        "1010010010010000" when "011100001",
        "1010010011110010" when "011100010",
        "1010010101010001" when "011100011",
        "1010010110101101" when "011100100",
        "1010011000000101" when "011100101",
        "1010011001011011" when "011100110",
        "1010011010101101" when "011100111",
        "1010011011111101" when "011101000",
        "1010011101001001" when "011101001",
        "1010011110010010" when "011101010",
        "1010011111011000" when "011101011",
        "1010100000011011" when "011101100",
        "1010100001011010" when "011101101",
        "1010100010010111" when "011101110",
        "1010100011010000" when "011101111",
        "1010100100000110" when "011110000",
        "1010100100111000" when "011110001",
        "1010100101101000" when "011110010",
        "1010100110010100" when "011110011",
        "1010100110111101" when "011110100",
        "1010100111100011" when "011110101",
        "1010101000000101" when "011110110",
        "1010101000100100" when "011110111",
        "1010101001000000" when "011111000",
        "1010101001011001" when "011111001",
        "1010101001101110" when "011111010",
        "1010101010000000" when "011111011",
        "1010101010001111" when "011111100",
        "1010101010011011" when "011111101",
        "1010101010100011" when "011111110",
        "1010101010101000" when "011111111",
        "1010101010101010" when "100000000",
        "1010101010101000" when "100000001",
        "1010101010100011" when "100000010",
        "1010101010011011" when "100000011",
        "1010101010001111" when "100000100",
        "1010101010000000" when "100000101",
        "1010101001101110" when "100000110",
        "1010101001011001" when "100000111",
        "1010101001000000" when "100001000",
        "1010101000100100" when "100001001",
        "1010101000000101" when "100001010",
        "1010100111100011" when "100001011",
        "1010100110111101" when "100001100",
        "1010100110010100" when "100001101",
        "1010100101101000" when "100001110",
        "1010100100111000" when "100001111",
        "1010100100000110" when "100010000",
        "1010100011010000" when "100010001",
        "1010100010010111" when "100010010",
        "1010100001011010" when "100010011",
        "1010100000011011" when "100010100",
        "1010011111011000" when "100010101",
        "1010011110010010" when "100010110",
        "1010011101001001" when "100010111",
        "1010011011111101" when "100011000",
        "1010011010101101" when "100011001",
        "1010011001011011" when "100011010",
        "1010011000000101" when "100011011",
        "1010010110101101" when "100011100",
        "1010010101010001" when "100011101",
        "1010010011110010" when "100011110",
        "1010010010010000" when "100011111",
        "1010010000101011" when "100100000",
        "1010001111000011" when "100100001",
        "1010001101010111" when "100100010",
        "1010001011101001" when "100100011",
        "1010001001111000" when "100100100",
        "1010001000000100" when "100100101",
        "1010000110001101" when "100100110",
        "1010000100010011" when "100100111",
        "1010000010010110" when "100101000",
        "1010000000010110" when "100101001",
        "1001111110010100" when "100101010",
        "1001111100001110" when "100101011",
        "1001111010000110" when "100101100",
        "1001110111111010" when "100101101",
        "1001110101101100" when "100101110",
        "1001110011011100" when "100101111",
        "1001110001001000" when "100110000",
        "1001101110110010" when "100110001",
        "1001101100011001" when "100110010",
        "1001101001111101" when "100110011",
        "1001100111011111" when "100110100",
        "1001100100111110" when "100110101",
        "1001100010011010" when "100110110",
        "1001011111110100" when "100110111",
        "1001011101001011" when "100111000",
        "1001011010100000" when "100111001",
        "1001010111110010" when "100111010",
        "1001010101000001" when "100111011",
        "1001010010001111" when "100111100",
        "1001001111011001" when "100111101",
        "1001001100100010" when "100111110",
        "1001001001101000" when "100111111",
        "1001000110101011" when "101000000",
        "1001000011101101" when "101000001",
        "1001000000101100" when "101000010",
        "1000111101101000" when "101000011",
        "1000111010100011" when "101000100",
        "1000110111011011" when "101000101",
        "1000110100010001" when "101000110",
        "1000110001000101" when "101000111",
        "1000101101110111" when "101001000",
        "1000101010100111" when "101001001",
        "1000100111010100" when "101001010",
        "1000100100000000" when "101001011",
        "1000100000101010" when "101001100",
        "1000011101010001" when "101001101",
        "1000011001110111" when "101001110",
        "1000010110011011" when "101001111",
        "1000010010111101" when "101010000",
        "1000001111011101" when "101010001",
        "1000001011111100" when "101010010",
        "1000001000011000" when "101010011",
        "1000000100110011" when "101010100",
        "1000000001001100" when "101010101",
        "0111111101100100" when "101010110",
        "0111111001111010" when "101010111",
        "0111110110001110" when "101011000",
        "0111110010100001" when "101011001",
        "0111101110110010" when "101011010",
        "0111101011000010" when "101011011",
        "0111100111010000" when "101011100",
        "0111100011011101" when "101011101",
        "0111011111101001" when "101011110",
        "0111011011110011" when "101011111",
        "0111010111111100" when "101100000",
        "0111010100000100" when "101100001",
        "0111010000001010" when "101100010",
        "0111001100010000" when "101100011",
        "0111001000010100" when "101100100",
        "0111000100010111" when "101100101",
        "0111000000011001" when "101100110",
        "0110111100011010" when "101100111",
        "0110111000011010" when "101101000",
        "0110110100011001" when "101101001",
        "0110110000010111" when "101101010",
        "0110101100010100" when "101101011",
        "0110101000010000" when "101101100",
        "0110100100001100" when "101101101",
        "0110100000000111" when "101101110",
        "0110011100000001" when "101101111",
        "0110010111111010" when "101110000",
        "0110010011110011" when "101110001",
        "0110001111101011" when "101110010",
        "0110001011100011" when "101110011",
        "0110000111011010" when "101110100",
        "0110000011010000" when "101110101",
        "0101111111000111" when "101110110",
        "0101111010111100" when "101110111",
        "0101110110110010" when "101111000",
        "0101110010100111" when "101111001",
        "0101101110011100" when "101111010",
        "0101101010010000" when "101111011",
        "0101100110000100" when "101111100",
        "0101100001111001" when "101111101",
        "0101011101101101" when "101111110",
        "0101011001100001" when "101111111",
        "0101010101010101" when "110000000",
        "0101010001001000" when "110000001",
        "0101001100111100" when "110000010",
        "0101001000110000" when "110000011",
        "0101000100100101" when "110000100",
        "0101000000011001" when "110000101",
        "0100111100001101" when "110000110",
        "0100111000000010" when "110000111",
        "0100110011110111" when "110001000",
        "0100101111101101" when "110001001",
        "0100101011100010" when "110001010",
        "0100100111011001" when "110001011",
        "0100100011001111" when "110001100",
        "0100011111000110" when "110001101",
        "0100011010111110" when "110001110",
        "0100010110110110" when "110001111",
        "0100010010101111" when "110010000",
        "0100001110101000" when "110010001",
        "0100001010100010" when "110010010",
        "0100000110011101" when "110010011",
        "0100000010011001" when "110010100",
        "0011111110010101" when "110010101",
        "0011111010010010" when "110010110",
        "0011110110010000" when "110010111",
        "0011110010001111" when "110011000",
        "0011101110001111" when "110011001",
        "0011101010010000" when "110011010",
        "0011100110010010" when "110011011",
        "0011100010010101" when "110011100",
        "0011011110011001" when "110011101",
        "0011011010011111" when "110011110",
        "0011010110100101" when "110011111",
        "0011010010101101" when "110100000",
        "0011001110110110" when "110100001",
        "0011001011000000" when "110100010",
        "0011000111001100" when "110100011",
        "0011000011011001" when "110100100",
        "0010111111100111" when "110100101",
        "0010111011110111" when "110100110",
        "0010111000001000" when "110100111",
        "0010110100011011" when "110101000",
        "0010110000101111" when "110101001",
        "0010101101000101" when "110101010",
        "0010101001011101" when "110101011",
        "0010100101110110" when "110101100",
        "0010100010010001" when "110101101",
        "0010011110101101" when "110101110",
        "0010011011001100" when "110101111",
        "0010010111101100" when "110110000",
        "0010010100001110" when "110110001",
        "0010010000110010" when "110110010",
        "0010001101011000" when "110110011",
        "0010001001111111" when "110110100",
        "0010000110101001" when "110110101",
        "0010000011010101" when "110110110",
        "0010000000000010" when "110110111",
        "0001111100110010" when "110111000",
        "0001111001100100" when "110111001",
        "0001110110011000" when "110111010",
        "0001110011001110" when "110111011",
        "0001110000000110" when "110111100",
        "0001101101000001" when "110111101",
        "0001101001111101" when "110111110",
        "0001100110111100" when "110111111",
        "0001100011111110" when "111000000",
        "0001100001000001" when "111000001",
        "0001011110000111" when "111000010",
        "0001011011010000" when "111000011",
        "0001011000011010" when "111000100",
        "0001010101101000" when "111000101",
        "0001010010110111" when "111000110",
        "0001010000001001" when "111000111",
        "0001001101011110" when "111001000",
        "0001001010110101" when "111001001",
        "0001001000001111" when "111001010",
        "0001000101101011" when "111001011",
        "0001000011001010" when "111001100",
        "0001000000101100" when "111001101",
        "0000111110010000" when "111001110",
        "0000111011110111" when "111001111",
        "0000111001100001" when "111010000",
        "0000110111001101" when "111010001",
        "0000110100111101" when "111010010",
        "0000110010101111" when "111010011",
        "0000110000100011" when "111010100",
        "0000101110011011" when "111010101",
        "0000101100010101" when "111010110",
        "0000101010010011" when "111010111",
        "0000101000010011" when "111011000",
        "0000100110010110" when "111011001",
        "0000100100011100" when "111011010",
        "0000100010100101" when "111011011",
        "0000100000110001" when "111011100",
        "0000011111000000" when "111011101",
        "0000011101010010" when "111011110",
        "0000011011100110" when "111011111",
        "0000011001111110" when "111100000",
        "0000011000011001" when "111100001",
        "0000010110110111" when "111100010",
        "0000010101011000" when "111100011",
        "0000010011111100" when "111100100",
        "0000010010100100" when "111100101",
        "0000010001001110" when "111100110",
        "0000001111111100" when "111100111",
        "0000001110101100" when "111101000",
        "0000001101100000" when "111101001",
        "0000001100010111" when "111101010",
        "0000001011010001" when "111101011",
        "0000001010001110" when "111101100",
        "0000001001001111" when "111101101",
        "0000001000010010" when "111101110",
        "0000000111011001" when "111101111",
        "0000000110100011" when "111110000",
        "0000000101110001" when "111110001",
        "0000000101000001" when "111110010",
        "0000000100010101" when "111110011",
        "0000000011101100" when "111110100",
        "0000000011000110" when "111110101",
        "0000000010100100" when "111110110",
        "0000000010000101" when "111110111",
        "0000000001101001" when "111111000",
        "0000000001010000" when "111111001",
        "0000000000111011" when "111111010",
        "0000000000101001" when "111111011",
        "0000000000011010" when "111111100",
        "0000000000001110" when "111111101",
        "0000000000000110" when "111111110",
        "0000000000000001" when "111111111";
    
    data <= result when enable = '1' else 
           (others=>'0');

end Behavioral;