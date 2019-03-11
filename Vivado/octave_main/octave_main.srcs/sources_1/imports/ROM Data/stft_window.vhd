-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stft_window_rom is Port (
	in_frame : in STD_LOGIC_VECTOR(8 downto 0);
	out_win : out STD_LOGIC_VECTOR(15 downto 0)
	);
end stft_window_rom;

architecture Behavioral of stft_window_rom is

	begin

	with in_frame select out_win <=
		"0000000000000001" when "000000001",
		"0000000000000100" when "000000010",
		"0000000000001011" when "000000011",
		"0000000000010011" when "000000100",
		"0000000000011110" when "000000101",
		"0000000000101100" when "000000110",
		"0000000000111100" when "000000111",
		"0000000001001110" when "000001000",
		"0000000001100011" when "000001001",
		"0000000001111011" when "000001010",
		"0000000010010101" when "000001011",
		"0000000010110001" when "000001100",
		"0000000011010000" when "000001101",
		"0000000011110001" when "000001110",
		"0000000100010100" when "000001111",
		"0000000100111010" when "000010000",
		"0000000101100011" when "000010001",
		"0000000110001110" when "000010010",
		"0000000110111011" when "000010011",
		"0000000111101011" when "000010100",
		"0000001000011101" when "000010101",
		"0000001001010001" when "000010110",
		"0000001010001000" when "000010111",
		"0000001011000001" when "000011000",
		"0000001011111101" when "000011001",
		"0000001100111010" when "000011010",
		"0000001101111011" when "000011011",
		"0000001110111101" when "000011100",
		"0000010000000010" when "000011101",
		"0000010001001001" when "000011110",
		"0000010010010011" when "000011111",
		"0000010011011111" when "000100000",
		"0000010100101101" when "000100001",
		"0000010101111101" when "000100010",
		"0000010111010000" when "000100011",
		"0000011000100101" when "000100100",
		"0000011001111100" when "000100101",
		"0000011011010101" when "000100110",
		"0000011100110000" when "000100111",
		"0000011110001110" when "000101000",
		"0000011111101110" when "000101001",
		"0000100001010000" when "000101010",
		"0000100010110100" when "000101011",
		"0000100100011010" when "000101100",
		"0000100110000011" when "000101101",
		"0000100111101101" when "000101110",
		"0000101001011010" when "000101111",
		"0000101011001001" when "000110000",
		"0000101100111001" when "000110001",
		"0000101110101100" when "000110010",
		"0000110000100001" when "000110011",
		"0000110010011000" when "000110100",
		"0000110100010001" when "000110101",
		"0000110110001011" when "000110110",
		"0000111000001000" when "000110111",
		"0000111010000110" when "000111000",
		"0000111100000111" when "000111001",
		"0000111110001001" when "000111010",
		"0001000000001110" when "000111011",
		"0001000010010100" when "000111100",
		"0001000100011100" when "000111101",
		"0001000110100101" when "000111110",
		"0001001000110001" when "000111111",
		"0001001010111110" when "001000000",
		"0001001101001101" when "001000001",
		"0001001111011110" when "001000010",
		"0001010001110001" when "001000011",
		"0001010100000101" when "001000100",
		"0001010110011010" when "001000101",
		"0001011000110010" when "001000110",
		"0001011011001011" when "001000111",
		"0001011101100110" when "001001000",
		"0001100000000010" when "001001001",
		"0001100010100000" when "001001010",
		"0001100100111111" when "001001011",
		"0001100111100000" when "001001100",
		"0001101010000010" when "001001101",
		"0001101100100101" when "001001110",
		"0001101111001011" when "001001111",
		"0001110001110001" when "001010000",
		"0001110100011001" when "001010001",
		"0001110111000010" when "001010010",
		"0001111001101101" when "001010011",
		"0001111100011000" when "001010100",
		"0001111111000110" when "001010101",
		"0010000001110100" when "001010110",
		"0010000100100011" when "001010111",
		"0010000111010100" when "001011000",
		"0010001010000110" when "001011001",
		"0010001100111001" when "001011010",
		"0010001111101101" when "001011011",
		"0010010010100010" when "001011100",
		"0010010101011001" when "001011101",
		"0010011000010000" when "001011110",
		"0010011011001000" when "001011111",
		"0010011110000010" when "001100000",
		"0010100000111100" when "001100001",
		"0010100011110111" when "001100010",
		"0010100110110011" when "001100011",
		"0010101001110000" when "001100100",
		"0010101100101110" when "001100101",
		"0010101111101100" when "001100110",
		"0010110010101011" when "001100111",
		"0010110101101011" when "001101000",
		"0010111000101100" when "001101001",
		"0010111011101110" when "001101010",
		"0010111110110000" when "001101011",
		"0011000001110011" when "001101100",
		"0011000100110110" when "001101101",
		"0011000111111010" when "001101110",
		"0011001010111110" when "001101111",
		"0011001110000011" when "001110000",
		"0011010001001001" when "001110001",
		"0011010100001110" when "001110010",
		"0011010111010101" when "001110011",
		"0011011010011011" when "001110100",
		"0011011101100011" when "001110101",
		"0011100000101010" when "001110110",
		"0011100011110010" when "001110111",
		"0011100110111010" when "001111000",
		"0011101010000010" when "001111001",
		"0011101101001010" when "001111010",
		"0011110000010011" when "001111011",
		"0011110011011100" when "001111100",
		"0011110110100100" when "001111101",
		"0011111001101101" when "001111110",
		"0011111100110110" when "001111111",
		"0100000000000000" when "010000000",
		"0100000011001001" when "010000001",
		"0100000110010010" when "010000010",
		"0100001001011011" when "010000011",
		"0100001100100011" when "010000100",
		"0100001111101100" when "010000101",
		"0100010010110101" when "010000110",
		"0100010101111101" when "010000111",
		"0100011001000101" when "010001000",
		"0100011100001101" when "010001001",
		"0100011111010101" when "010001010",
		"0100100010011100" when "010001011",
		"0100100101100100" when "010001100",
		"0100101000101010" when "010001101",
		"0100101011110001" when "010001110",
		"0100101110110110" when "010001111",
		"0100110001111100" when "010010000",
		"0100110101000001" when "010010001",
		"0100111000000101" when "010010010",
		"0100111011001001" when "010010011",
		"0100111110001100" when "010010100",
		"0101000001001111" when "010010101",
		"0101000100010001" when "010010110",
		"0101000111010011" when "010010111",
		"0101001010010100" when "010011000",
		"0101001101010100" when "010011001",
		"0101010000010011" when "010011010",
		"0101010011010001" when "010011011",
		"0101010110001111" when "010011100",
		"0101011001001100" when "010011101",
		"0101011100001000" when "010011110",
		"0101011111000011" when "010011111",
		"0101100001111101" when "010100000",
		"0101100100110111" when "010100001",
		"0101100111101111" when "010100010",
		"0101101010100110" when "010100011",
		"0101101101011101" when "010100100",
		"0101110000010010" when "010100101",
		"0101110011000110" when "010100110",
		"0101110101111001" when "010100111",
		"0101111000101011" when "010101000",
		"0101111011011100" when "010101001",
		"0101111110001011" when "010101010",
		"0110000000111001" when "010101011",
		"0110000011100111" when "010101100",
		"0110000110010010" when "010101101",
		"0110001000111101" when "010101110",
		"0110001011100110" when "010101111",
		"0110001110001110" when "010110000",
		"0110010000110100" when "010110001",
		"0110010011011010" when "010110010",
		"0110010101111101" when "010110011",
		"0110011000011111" when "010110100",
		"0110011011000000" when "010110101",
		"0110011101011111" when "010110110",
		"0110011111111101" when "010110111",
		"0110100010011001" when "010111000",
		"0110100100110100" when "010111001",
		"0110100111001101" when "010111010",
		"0110101001100101" when "010111011",
		"0110101011111010" when "010111100",
		"0110101110001110" when "010111101",
		"0110110000100001" when "010111110",
		"0110110010110010" when "010111111",
		"0110110101000001" when "011000000",
		"0110110111001110" when "011000001",
		"0110111001011010" when "011000010",
		"0110111011100011" when "011000011",
		"0110111101101011" when "011000100",
		"0110111111110001" when "011000101",
		"0111000001110110" when "011000110",
		"0111000011111000" when "011000111",
		"0111000101111001" when "011001000",
		"0111000111110111" when "011001001",
		"0111001001110100" when "011001010",
		"0111001011101110" when "011001011",
		"0111001101100111" when "011001100",
		"0111001111011110" when "011001101",
		"0111010001010011" when "011001110",
		"0111010011000110" when "011001111",
		"0111010100110110" when "011010000",
		"0111010110100101" when "011010001",
		"0111011000010010" when "011010010",
		"0111011001111100" when "011010011",
		"0111011011100101" when "011010100",
		"0111011101001011" when "011010101",
		"0111011110101111" when "011010110",
		"0111100000010001" when "011010111",
		"0111100001110001" when "011011000",
		"0111100011001111" when "011011001",
		"0111100100101010" when "011011010",
		"0111100110000011" when "011011011",
		"0111100111011010" when "011011100",
		"0111101000101111" when "011011101",
		"0111101010000010" when "011011110",
		"0111101011010010" when "011011111",
		"0111101100100000" when "011100000",
		"0111101101101100" when "011100001",
		"0111101110110110" when "011100010",
		"0111101111111101" when "011100011",
		"0111110001000010" when "011100100",
		"0111110010000100" when "011100101",
		"0111110011000101" when "011100110",
		"0111110100000010" when "011100111",
		"0111110100111110" when "011101000",
		"0111110101110111" when "011101001",
		"0111110110101110" when "011101010",
		"0111110111100010" when "011101011",
		"0111111000010100" when "011101100",
		"0111111001000100" when "011101101",
		"0111111001110001" when "011101110",
		"0111111010011100" when "011101111",
		"0111111011000101" when "011110000",
		"0111111011101011" when "011110001",
		"0111111100001110" when "011110010",
		"0111111100101111" when "011110011",
		"0111111101001110" when "011110100",
		"0111111101101010" when "011110101",
		"0111111110000100" when "011110110",
		"0111111110011100" when "011110111",
		"0111111110110001" when "011111000",
		"0111111111000011" when "011111001",
		"0111111111010011" when "011111010",
		"0111111111100001" when "011111011",
		"0111111111101100" when "011111100",
		"0111111111110100" when "011111101",
		"0111111111111011" when "011111110",
		"0111111111111110" when "011111111",
		"0111111111111111" when "100000000",
		"0111111111111110" when "100000001",
		"0111111111111011" when "100000010",
		"0111111111110100" when "100000011",
		"0111111111101100" when "100000100",
		"0111111111100001" when "100000101",
		"0111111111010011" when "100000110",
		"0111111111000011" when "100000111",
		"0111111110110001" when "100001000",
		"0111111110011100" when "100001001",
		"0111111110000100" when "100001010",
		"0111111101101010" when "100001011",
		"0111111101001110" when "100001100",
		"0111111100101111" when "100001101",
		"0111111100001110" when "100001110",
		"0111111011101011" when "100001111",
		"0111111011000101" when "100010000",
		"0111111010011100" when "100010001",
		"0111111001110001" when "100010010",
		"0111111001000100" when "100010011",
		"0111111000010100" when "100010100",
		"0111110111100010" when "100010101",
		"0111110110101110" when "100010110",
		"0111110101110111" when "100010111",
		"0111110100111110" when "100011000",
		"0111110100000010" when "100011001",
		"0111110011000101" when "100011010",
		"0111110010000100" when "100011011",
		"0111110001000010" when "100011100",
		"0111101111111101" when "100011101",
		"0111101110110110" when "100011110",
		"0111101101101100" when "100011111",
		"0111101100100000" when "100100000",
		"0111101011010010" when "100100001",
		"0111101010000010" when "100100010",
		"0111101000101111" when "100100011",
		"0111100111011010" when "100100100",
		"0111100110000011" when "100100101",
		"0111100100101010" when "100100110",
		"0111100011001111" when "100100111",
		"0111100001110001" when "100101000",
		"0111100000010001" when "100101001",
		"0111011110101111" when "100101010",
		"0111011101001011" when "100101011",
		"0111011011100101" when "100101100",
		"0111011001111100" when "100101101",
		"0111011000010010" when "100101110",
		"0111010110100101" when "100101111",
		"0111010100110110" when "100110000",
		"0111010011000110" when "100110001",
		"0111010001010011" when "100110010",
		"0111001111011110" when "100110011",
		"0111001101100111" when "100110100",
		"0111001011101110" when "100110101",
		"0111001001110100" when "100110110",
		"0111000111110111" when "100110111",
		"0111000101111001" when "100111000",
		"0111000011111000" when "100111001",
		"0111000001110110" when "100111010",
		"0110111111110001" when "100111011",
		"0110111101101011" when "100111100",
		"0110111011100011" when "100111101",
		"0110111001011010" when "100111110",
		"0110110111001110" when "100111111",
		"0110110101000001" when "101000000",
		"0110110010110010" when "101000001",
		"0110110000100001" when "101000010",
		"0110101110001110" when "101000011",
		"0110101011111010" when "101000100",
		"0110101001100101" when "101000101",
		"0110100111001101" when "101000110",
		"0110100100110100" when "101000111",
		"0110100010011001" when "101001000",
		"0110011111111101" when "101001001",
		"0110011101011111" when "101001010",
		"0110011011000000" when "101001011",
		"0110011000011111" when "101001100",
		"0110010101111101" when "101001101",
		"0110010011011010" when "101001110",
		"0110010000110100" when "101001111",
		"0110001110001110" when "101010000",
		"0110001011100110" when "101010001",
		"0110001000111101" when "101010010",
		"0110000110010010" when "101010011",
		"0110000011100111" when "101010100",
		"0110000000111001" when "101010101",
		"0101111110001011" when "101010110",
		"0101111011011100" when "101010111",
		"0101111000101011" when "101011000",
		"0101110101111001" when "101011001",
		"0101110011000110" when "101011010",
		"0101110000010010" when "101011011",
		"0101101101011101" when "101011100",
		"0101101010100110" when "101011101",
		"0101100111101111" when "101011110",
		"0101100100110111" when "101011111",
		"0101100001111101" when "101100000",
		"0101011111000011" when "101100001",
		"0101011100001000" when "101100010",
		"0101011001001100" when "101100011",
		"0101010110001111" when "101100100",
		"0101010011010001" when "101100101",
		"0101010000010011" when "101100110",
		"0101001101010100" when "101100111",
		"0101001010010100" when "101101000",
		"0101000111010011" when "101101001",
		"0101000100010001" when "101101010",
		"0101000001001111" when "101101011",
		"0100111110001100" when "101101100",
		"0100111011001001" when "101101101",
		"0100111000000101" when "101101110",
		"0100110101000001" when "101101111",
		"0100110001111100" when "101110000",
		"0100101110110110" when "101110001",
		"0100101011110001" when "101110010",
		"0100101000101010" when "101110011",
		"0100100101100100" when "101110100",
		"0100100010011100" when "101110101",
		"0100011111010101" when "101110110",
		"0100011100001101" when "101110111",
		"0100011001000101" when "101111000",
		"0100010101111101" when "101111001",
		"0100010010110101" when "101111010",
		"0100001111101100" when "101111011",
		"0100001100100011" when "101111100",
		"0100001001011011" when "101111101",
		"0100000110010010" when "101111110",
		"0100000011001001" when "101111111",
		"0100000000000000" when "110000000",
		"0011111100110110" when "110000001",
		"0011111001101101" when "110000010",
		"0011110110100100" when "110000011",
		"0011110011011100" when "110000100",
		"0011110000010011" when "110000101",
		"0011101101001010" when "110000110",
		"0011101010000010" when "110000111",
		"0011100110111010" when "110001000",
		"0011100011110010" when "110001001",
		"0011100000101010" when "110001010",
		"0011011101100011" when "110001011",
		"0011011010011011" when "110001100",
		"0011010111010101" when "110001101",
		"0011010100001110" when "110001110",
		"0011010001001001" when "110001111",
		"0011001110000011" when "110010000",
		"0011001010111110" when "110010001",
		"0011000111111010" when "110010010",
		"0011000100110110" when "110010011",
		"0011000001110011" when "110010100",
		"0010111110110000" when "110010101",
		"0010111011101110" when "110010110",
		"0010111000101100" when "110010111",
		"0010110101101011" when "110011000",
		"0010110010101011" when "110011001",
		"0010101111101100" when "110011010",
		"0010101100101110" when "110011011",
		"0010101001110000" when "110011100",
		"0010100110110011" when "110011101",
		"0010100011110111" when "110011110",
		"0010100000111100" when "110011111",
		"0010011110000010" when "110100000",
		"0010011011001000" when "110100001",
		"0010011000010000" when "110100010",
		"0010010101011001" when "110100011",
		"0010010010100010" when "110100100",
		"0010001111101101" when "110100101",
		"0010001100111001" when "110100110",
		"0010001010000110" when "110100111",
		"0010000111010100" when "110101000",
		"0010000100100011" when "110101001",
		"0010000001110100" when "110101010",
		"0001111111000110" when "110101011",
		"0001111100011000" when "110101100",
		"0001111001101101" when "110101101",
		"0001110111000010" when "110101110",
		"0001110100011001" when "110101111",
		"0001110001110001" when "110110000",
		"0001101111001011" when "110110001",
		"0001101100100101" when "110110010",
		"0001101010000010" when "110110011",
		"0001100111100000" when "110110100",
		"0001100100111111" when "110110101",
		"0001100010100000" when "110110110",
		"0001100000000010" when "110110111",
		"0001011101100110" when "110111000",
		"0001011011001011" when "110111001",
		"0001011000110010" when "110111010",
		"0001010110011010" when "110111011",
		"0001010100000101" when "110111100",
		"0001010001110001" when "110111101",
		"0001001111011110" when "110111110",
		"0001001101001101" when "110111111",
		"0001001010111110" when "111000000",
		"0001001000110001" when "111000001",
		"0001000110100101" when "111000010",
		"0001000100011100" when "111000011",
		"0001000010010100" when "111000100",
		"0001000000001110" when "111000101",
		"0000111110001001" when "111000110",
		"0000111100000111" when "111000111",
		"0000111010000110" when "111001000",
		"0000111000001000" when "111001001",
		"0000110110001011" when "111001010",
		"0000110100010001" when "111001011",
		"0000110010011000" when "111001100",
		"0000110000100001" when "111001101",
		"0000101110101100" when "111001110",
		"0000101100111001" when "111001111",
		"0000101011001001" when "111010000",
		"0000101001011010" when "111010001",
		"0000100111101101" when "111010010",
		"0000100110000011" when "111010011",
		"0000100100011010" when "111010100",
		"0000100010110100" when "111010101",
		"0000100001010000" when "111010110",
		"0000011111101110" when "111010111",
		"0000011110001110" when "111011000",
		"0000011100110000" when "111011001",
		"0000011011010101" when "111011010",
		"0000011001111100" when "111011011",
		"0000011000100101" when "111011100",
		"0000010111010000" when "111011101",
		"0000010101111101" when "111011110",
		"0000010100101101" when "111011111",
		"0000010011011111" when "111100000",
		"0000010010010011" when "111100001",
		"0000010001001001" when "111100010",
		"0000010000000010" when "111100011",
		"0000001110111101" when "111100100",
		"0000001101111011" when "111100101",
		"0000001100111010" when "111100110",
		"0000001011111101" when "111100111",
		"0000001011000001" when "111101000",
		"0000001010001000" when "111101001",
		"0000001001010001" when "111101010",
		"0000001000011101" when "111101011",
		"0000000111101011" when "111101100",
		"0000000110111011" when "111101101",
		"0000000110001110" when "111101110",
		"0000000101100011" when "111101111",
		"0000000100111010" when "111110000",
		"0000000100010100" when "111110001",
		"0000000011110001" when "111110010",
		"0000000011010000" when "111110011",
		"0000000010110001" when "111110100",
		"0000000010010101" when "111110101",
		"0000000001111011" when "111110110",
		"0000000001100011" when "111110111",
		"0000000001001110" when "111111000",
		"0000000000111100" when "111111001",
		"0000000000101100" when "111111010",
		"0000000000011110" when "111111011",
		"0000000000010011" when "111111100",
		"0000000000001011" when "111111101",
		"0000000000000100" when "111111110",
		"0000000000000001" when "111111111",
		"0000000000000000" when others;
end Behavioral;