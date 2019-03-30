library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stft_window_rom is Port (
	in_frame : in STD_LOGIC_VECTOR(8 downto 0);
	out_win : out STD_LOGIC_VECTOR(15 downto 0));
end stft_window_rom;

architecture Behavioral of stft_window_rom is

	begin

	with in_frame select out_win <=
		"0111111111111111" when "000000000",
		"0111111111111111" when "000000001",
		"0111111111111111" when "000000010",
		"0111111111111111" when "000000011",
		"0111111111111111" when "000000100",
		"0111111111111111" when "000000101",
		"0111111111111111" when "000000110",
		"0111111111111111" when "000000111",
		"0111111111111111" when "000001000",
		"0111111111111111" when "000001001",
		"0111111111111111" when "000001010",
		"0111111111111111" when "000001011",
		"0111111111111111" when "000001100",
		"0111111111111111" when "000001101",
		"0111111111111111" when "000001110",
		"0111111111111111" when "000001111",
		"0111111111111111" when "000010000",
		"0111111111111111" when "000010001",
		"0111111111111111" when "000010010",
		"0111111111111111" when "000010011",
		"0111111111111111" when "000010100",
		"0111111111111111" when "000010101",
		"0111111111111111" when "000010110",
		"0111111111111111" when "000010111",
		"0111111111111111" when "000011000",
		"0111111111111111" when "000011001",
		"0111111111111111" when "000011010",
		"0111111111111111" when "000011011",
		"0111111111111111" when "000011100",
		"0111111111111111" when "000011101",
		"0111111111111111" when "000011110",
		"0111111111111111" when "000011111",
		"0111111111111111" when "000100000",
		"0111111111111111" when "000100001",
		"0111111111111111" when "000100010",
		"0111111111111111" when "000100011",
		"0111111111111111" when "000100100",
		"0111111111111111" when "000100101",
		"0111111111111111" when "000100110",
		"0111111111111111" when "000100111",
		"0111111111111111" when "000101000",
		"0111111111111111" when "000101001",
		"0111111111111111" when "000101010",
		"0111111111111111" when "000101011",
		"0111111111111111" when "000101100",
		"0111111111111111" when "000101101",
		"0111111111111111" when "000101110",
		"0111111111111111" when "000101111",
		"0111111111111111" when "000110000",
		"0111111111111111" when "000110001",
		"0111111111111111" when "000110010",
		"0111111111111111" when "000110011",
		"0111111111111111" when "000110100",
		"0111111111111111" when "000110101",
		"0111111111111111" when "000110110",
		"0111111111111111" when "000110111",
		"0111111111111111" when "000111000",
		"0111111111111111" when "000111001",
		"0111111111111111" when "000111010",
		"0111111111111111" when "000111011",
		"0111111111111111" when "000111100",
		"0111111111111111" when "000111101",
		"0111111111111111" when "000111110",
		"0111111111111111" when "000111111",
		"0111111111111111" when "001000000",
		"0111111111111111" when "001000001",
		"0111111111111111" when "001000010",
		"0111111111111111" when "001000011",
		"0111111111111111" when "001000100",
		"0111111111111111" when "001000101",
		"0111111111111111" when "001000110",
		"0111111111111111" when "001000111",
		"0111111111111111" when "001001000",
		"0111111111111111" when "001001001",
		"0111111111111111" when "001001010",
		"0111111111111111" when "001001011",
		"0111111111111111" when "001001100",
		"0111111111111111" when "001001101",
		"0111111111111111" when "001001110",
		"0111111111111111" when "001001111",
		"0111111111111111" when "001010000",
		"0111111111111111" when "001010001",
		"0111111111111111" when "001010010",
		"0111111111111111" when "001010011",
		"0111111111111111" when "001010100",
		"0111111111111111" when "001010101",
		"0111111111111111" when "001010110",
		"0111111111111111" when "001010111",
		"0111111111111111" when "001011000",
		"0111111111111111" when "001011001",
		"0111111111111111" when "001011010",
		"0111111111111111" when "001011011",
		"0111111111111111" when "001011100",
		"0111111111111111" when "001011101",
		"0111111111111111" when "001011110",
		"0111111111111111" when "001011111",
		"0111111111111111" when "001100000",
		"0111111111111111" when "001100001",
		"0111111111111111" when "001100010",
		"0111111111111111" when "001100011",
		"0111111111111111" when "001100100",
		"0111111111111111" when "001100101",
		"0111111111111111" when "001100110",
		"0111111111111111" when "001100111",
		"0111111111111111" when "001101000",
		"0111111111111111" when "001101001",
		"0111111111111111" when "001101010",
		"0111111111111111" when "001101011",
		"0111111111111111" when "001101100",
		"0111111111111111" when "001101101",
		"0111111111111111" when "001101110",
		"0111111111111111" when "001101111",
		"0111111111111111" when "001110000",
		"0111111111111111" when "001110001",
		"0111111111111111" when "001110010",
		"0111111111111111" when "001110011",
		"0111111111111111" when "001110100",
		"0111111111111111" when "001110101",
		"0111111111111111" when "001110110",
		"0111111111111111" when "001110111",
		"0111111111111111" when "001111000",
		"0111111111111111" when "001111001",
		"0111111111111111" when "001111010",
		"0111111111111111" when "001111011",
		"0111111111111111" when "001111100",
		"0111111111111111" when "001111101",
		"0111111111111111" when "001111110",
		"0111111111111111" when "001111111",
		"0111111111111111" when "010000000",
		"0111111111111111" when "010000001",
		"0111111111111111" when "010000010",
		"0111111111111111" when "010000011",
		"0111111111111111" when "010000100",
		"0111111111111111" when "010000101",
		"0111111111111111" when "010000110",
		"0111111111111111" when "010000111",
		"0111111111111111" when "010001000",
		"0111111111111111" when "010001001",
		"0111111111111111" when "010001010",
		"0111111111111111" when "010001011",
		"0111111111111111" when "010001100",
		"0111111111111111" when "010001101",
		"0111111111111111" when "010001110",
		"0111111111111111" when "010001111",
		"0111111111111111" when "010010000",
		"0111111111111111" when "010010001",
		"0111111111111111" when "010010010",
		"0111111111111111" when "010010011",
		"0111111111111111" when "010010100",
		"0111111111111111" when "010010101",
		"0111111111111111" when "010010110",
		"0111111111111111" when "010010111",
		"0111111111111111" when "010011000",
		"0111111111111111" when "010011001",
		"0111111111111111" when "010011010",
		"0111111111111111" when "010011011",
		"0111111111111111" when "010011100",
		"0111111111111111" when "010011101",
		"0111111111111111" when "010011110",
		"0111111111111111" when "010011111",
		"0111111111111111" when "010100000",
		"0111111111111111" when "010100001",
		"0111111111111111" when "010100010",
		"0111111111111111" when "010100011",
		"0111111111111111" when "010100100",
		"0111111111111111" when "010100101",
		"0111111111111111" when "010100110",
		"0111111111111111" when "010100111",
		"0111111111111111" when "010101000",
		"0111111111111111" when "010101001",
		"0111111111111111" when "010101010",
		"0111111111111111" when "010101011",
		"0111111111111111" when "010101100",
		"0111111111111111" when "010101101",
		"0111111111111111" when "010101110",
		"0111111111111111" when "010101111",
		"0111111111111111" when "010110000",
		"0111111111111111" when "010110001",
		"0111111111111111" when "010110010",
		"0111111111111111" when "010110011",
		"0111111111111111" when "010110100",
		"0111111111111111" when "010110101",
		"0111111111111111" when "010110110",
		"0111111111111111" when "010110111",
		"0111111111111111" when "010111000",
		"0111111111111111" when "010111001",
		"0111111111111111" when "010111010",
		"0111111111111111" when "010111011",
		"0111111111111111" when "010111100",
		"0111111111111111" when "010111101",
		"0111111111111111" when "010111110",
		"0111111111111111" when "010111111",
		"0111111111111111" when "011000000",
		"0111111111111111" when "011000001",
		"0111111111111111" when "011000010",
		"0111111111111111" when "011000011",
		"0111111111111111" when "011000100",
		"0111111111111111" when "011000101",
		"0111111111111111" when "011000110",
		"0111111111111111" when "011000111",
		"0111111111111111" when "011001000",
		"0111111111111111" when "011001001",
		"0111111111111111" when "011001010",
		"0111111111111111" when "011001011",
		"0111111111111111" when "011001100",
		"0111111111111111" when "011001101",
		"0111111111111111" when "011001110",
		"0111111111111111" when "011001111",
		"0111111111111111" when "011010000",
		"0111111111111111" when "011010001",
		"0111111111111111" when "011010010",
		"0111111111111111" when "011010011",
		"0111111111111111" when "011010100",
		"0111111111111111" when "011010101",
		"0111111111111111" when "011010110",
		"0111111111111111" when "011010111",
		"0111111111111111" when "011011000",
		"0111111111111111" when "011011001",
		"0111111111111111" when "011011010",
		"0111111111111111" when "011011011",
		"0111111111111111" when "011011100",
		"0111111111111111" when "011011101",
		"0111111111111111" when "011011110",
		"0111111111111111" when "011011111",
		"0111111111111111" when "011100000",
		"0111111111111111" when "011100001",
		"0111111111111111" when "011100010",
		"0111111111111111" when "011100011",
		"0111111111111111" when "011100100",
		"0111111111111111" when "011100101",
		"0111111111111111" when "011100110",
		"0111111111111111" when "011100111",
		"0111111111111111" when "011101000",
		"0111111111111111" when "011101001",
		"0111111111111111" when "011101010",
		"0111111111111111" when "011101011",
		"0111111111111111" when "011101100",
		"0111111111111111" when "011101101",
		"0111111111111111" when "011101110",
		"0111111111111111" when "011101111",
		"0111111111111111" when "011110000",
		"0111111111111111" when "011110001",
		"0111111111111111" when "011110010",
		"0111111111111111" when "011110011",
		"0111111111111111" when "011110100",
		"0111111111111111" when "011110101",
		"0111111111111111" when "011110110",
		"0111111111111111" when "011110111",
		"0111111111111111" when "011111000",
		"0111111111111111" when "011111001",
		"0111111111111111" when "011111010",
		"0111111111111111" when "011111011",
		"0111111111111111" when "011111100",
		"0111111111111111" when "011111101",
		"0111111111111111" when "011111110",
		"0111111111111111" when "011111111",
		"0111111111111111" when "100000000",
		"0111111111111111" when "100000001",
		"0111111111111111" when "100000010",
		"0111111111111111" when "100000011",
		"0111111111111111" when "100000100",
		"0111111111111111" when "100000101",
		"0111111111111111" when "100000110",
		"0111111111111111" when "100000111",
		"0111111111111111" when "100001000",
		"0111111111111111" when "100001001",
		"0111111111111111" when "100001010",
		"0111111111111111" when "100001011",
		"0111111111111111" when "100001100",
		"0111111111111111" when "100001101",
		"0111111111111111" when "100001110",
		"0111111111111111" when "100001111",
		"0111111111111111" when "100010000",
		"0111111111111111" when "100010001",
		"0111111111111111" when "100010010",
		"0111111111111111" when "100010011",
		"0111111111111111" when "100010100",
		"0111111111111111" when "100010101",
		"0111111111111111" when "100010110",
		"0111111111111111" when "100010111",
		"0111111111111111" when "100011000",
		"0111111111111111" when "100011001",
		"0111111111111111" when "100011010",
		"0111111111111111" when "100011011",
		"0111111111111111" when "100011100",
		"0111111111111111" when "100011101",
		"0111111111111111" when "100011110",
		"0111111111111111" when "100011111",
		"0111111111111111" when "100100000",
		"0111111111111111" when "100100001",
		"0111111111111111" when "100100010",
		"0111111111111111" when "100100011",
		"0111111111111111" when "100100100",
		"0111111111111111" when "100100101",
		"0111111111111111" when "100100110",
		"0111111111111111" when "100100111",
		"0111111111111111" when "100101000",
		"0111111111111111" when "100101001",
		"0111111111111111" when "100101010",
		"0111111111111111" when "100101011",
		"0111111111111111" when "100101100",
		"0111111111111111" when "100101101",
		"0111111111111111" when "100101110",
		"0111111111111111" when "100101111",
		"0111111111111111" when "100110000",
		"0111111111111111" when "100110001",
		"0111111111111111" when "100110010",
		"0111111111111111" when "100110011",
		"0111111111111111" when "100110100",
		"0111111111111111" when "100110101",
		"0111111111111111" when "100110110",
		"0111111111111111" when "100110111",
		"0111111111111111" when "100111000",
		"0111111111111111" when "100111001",
		"0111111111111111" when "100111010",
		"0111111111111111" when "100111011",
		"0111111111111111" when "100111100",
		"0111111111111111" when "100111101",
		"0111111111111111" when "100111110",
		"0111111111111111" when "100111111",
		"0111111111111111" when "101000000",
		"0111111111111111" when "101000001",
		"0111111111111111" when "101000010",
		"0111111111111111" when "101000011",
		"0111111111111111" when "101000100",
		"0111111111111111" when "101000101",
		"0111111111111111" when "101000110",
		"0111111111111111" when "101000111",
		"0111111111111111" when "101001000",
		"0111111111111111" when "101001001",
		"0111111111111111" when "101001010",
		"0111111111111111" when "101001011",
		"0111111111111111" when "101001100",
		"0111111111111111" when "101001101",
		"0111111111111111" when "101001110",
		"0111111111111111" when "101001111",
		"0111111111111111" when "101010000",
		"0111111111111111" when "101010001",
		"0111111111111111" when "101010010",
		"0111111111111111" when "101010011",
		"0111111111111111" when "101010100",
		"0111111111111111" when "101010101",
		"0111111111111111" when "101010110",
		"0111111111111111" when "101010111",
		"0111111111111111" when "101011000",
		"0111111111111111" when "101011001",
		"0111111111111111" when "101011010",
		"0111111111111111" when "101011011",
		"0111111111111111" when "101011100",
		"0111111111111111" when "101011101",
		"0111111111111111" when "101011110",
		"0111111111111111" when "101011111",
		"0111111111111111" when "101100000",
		"0111111111111111" when "101100001",
		"0111111111111111" when "101100010",
		"0111111111111111" when "101100011",
		"0111111111111111" when "101100100",
		"0111111111111111" when "101100101",
		"0111111111111111" when "101100110",
		"0111111111111111" when "101100111",
		"0111111111111111" when "101101000",
		"0111111111111111" when "101101001",
		"0111111111111111" when "101101010",
		"0111111111111111" when "101101011",
		"0111111111111111" when "101101100",
		"0111111111111111" when "101101101",
		"0111111111111111" when "101101110",
		"0111111111111111" when "101101111",
		"0111111111111111" when "101110000",
		"0111111111111111" when "101110001",
		"0111111111111111" when "101110010",
		"0111111111111111" when "101110011",
		"0111111111111111" when "101110100",
		"0111111111111111" when "101110101",
		"0111111111111111" when "101110110",
		"0111111111111111" when "101110111",
		"0111111111111111" when "101111000",
		"0111111111111111" when "101111001",
		"0111111111111111" when "101111010",
		"0111111111111111" when "101111011",
		"0111111111111111" when "101111100",
		"0111111111111111" when "101111101",
		"0111111111111111" when "101111110",
		"0111111111111111" when "101111111",
		"0111111111111111" when "110000000",
		"0111111111111111" when "110000001",
		"0111111111111111" when "110000010",
		"0111111111111111" when "110000011",
		"0111111111111111" when "110000100",
		"0111111111111111" when "110000101",
		"0111111111111111" when "110000110",
		"0111111111111111" when "110000111",
		"0111111111111111" when "110001000",
		"0111111111111111" when "110001001",
		"0111111111111111" when "110001010",
		"0111111111111111" when "110001011",
		"0111111111111111" when "110001100",
		"0111111111111111" when "110001101",
		"0111111111111111" when "110001110",
		"0111111111111111" when "110001111",
		"0111111111111111" when "110010000",
		"0111111111111111" when "110010001",
		"0111111111111111" when "110010010",
		"0111111111111111" when "110010011",
		"0111111111111111" when "110010100",
		"0111111111111111" when "110010101",
		"0111111111111111" when "110010110",
		"0111111111111111" when "110010111",
		"0111111111111111" when "110011000",
		"0111111111111111" when "110011001",
		"0111111111111111" when "110011010",
		"0111111111111111" when "110011011",
		"0111111111111111" when "110011100",
		"0111111111111111" when "110011101",
		"0111111111111111" when "110011110",
		"0111111111111111" when "110011111",
		"0111111111111111" when "110100000",
		"0111111111111111" when "110100001",
		"0111111111111111" when "110100010",
		"0111111111111111" when "110100011",
		"0111111111111111" when "110100100",
		"0111111111111111" when "110100101",
		"0111111111111111" when "110100110",
		"0111111111111111" when "110100111",
		"0111111111111111" when "110101000",
		"0111111111111111" when "110101001",
		"0111111111111111" when "110101010",
		"0111111111111111" when "110101011",
		"0111111111111111" when "110101100",
		"0111111111111111" when "110101101",
		"0111111111111111" when "110101110",
		"0111111111111111" when "110101111",
		"0111111111111111" when "110110000",
		"0111111111111111" when "110110001",
		"0111111111111111" when "110110010",
		"0111111111111111" when "110110011",
		"0111111111111111" when "110110100",
		"0111111111111111" when "110110101",
		"0111111111111111" when "110110110",
		"0111111111111111" when "110110111",
		"0111111111111111" when "110111000",
		"0111111111111111" when "110111001",
		"0111111111111111" when "110111010",
		"0111111111111111" when "110111011",
		"0111111111111111" when "110111100",
		"0111111111111111" when "110111101",
		"0111111111111111" when "110111110",
		"0111111111111111" when "110111111",
		"0111111111111111" when "111000000",
		"0111111111111111" when "111000001",
		"0111111111111111" when "111000010",
		"0111111111111111" when "111000011",
		"0111111111111111" when "111000100",
		"0111111111111111" when "111000101",
		"0111111111111111" when "111000110",
		"0111111111111111" when "111000111",
		"0111111111111111" when "111001000",
		"0111111111111111" when "111001001",
		"0111111111111111" when "111001010",
		"0111111111111111" when "111001011",
		"0111111111111111" when "111001100",
		"0111111111111111" when "111001101",
		"0111111111111111" when "111001110",
		"0111111111111111" when "111001111",
		"0111111111111111" when "111010000",
		"0111111111111111" when "111010001",
		"0111111111111111" when "111010010",
		"0111111111111111" when "111010011",
		"0111111111111111" when "111010100",
		"0111111111111111" when "111010101",
		"0111111111111111" when "111010110",
		"0111111111111111" when "111010111",
		"0111111111111111" when "111011000",
		"0111111111111111" when "111011001",
		"0111111111111111" when "111011010",
		"0111111111111111" when "111011011",
		"0111111111111111" when "111011100",
		"0111111111111111" when "111011101",
		"0111111111111111" when "111011110",
		"0111111111111111" when "111011111",
		"0111111111111111" when "111100000",
		"0111111111111111" when "111100001",
		"0111111111111111" when "111100010",
		"0111111111111111" when "111100011",
		"0111111111111111" when "111100100",
		"0111111111111111" when "111100101",
		"0111111111111111" when "111100110",
		"0111111111111111" when "111100111",
		"0111111111111111" when "111101000",
		"0111111111111111" when "111101001",
		"0111111111111111" when "111101010",
		"0111111111111111" when "111101011",
		"0111111111111111" when "111101100",
		"0111111111111111" when "111101101",
		"0111111111111111" when "111101110",
		"0111111111111111" when "111101111",
		"0111111111111111" when "111110000",
		"0111111111111111" when "111110001",
		"0111111111111111" when "111110010",
		"0111111111111111" when "111110011",
		"0111111111111111" when "111110100",
		"0111111111111111" when "111110101",
		"0111111111111111" when "111110110",
		"0111111111111111" when "111110111",
		"0111111111111111" when "111111000",
		"0111111111111111" when "111111001",
		"0111111111111111" when "111111010",
		"0111111111111111" when "111111011",
		"0111111111111111" when "111111100",
		"0111111111111111" when "111111101",
		"0111111111111111" when "111111110",
		"0111111111111111" when "111111111",
		"0111111111111111" when others;

end Behavioral;