-- Javier Otero Martinez
-- OctaveSax project -- TFG
-- June 2019 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package project_trunk is
    
    -- Number of bits per sample, it changes everything automatically except ram memory ip which should be
    --    set manually
    constant sample_size : integer := 16;
    -- Cicle in which data is read from memory and transferred to output buffer
    constant writing_cicle : integer := 27;
    -- Cicle in which data is read from input and written into memory
    constant reading_cicle : integer := 25;
    -- Number of samples per frame
    constant fft_width : integer := 512; 
    
-- Every available display letters
    constant off : STD_LOGIC_VECTOR (6 downto 0) := "1111111"; 
    constant a : STD_LOGIC_VECTOR (6 downto 0) := "0001000";
    --constant b : STD_LOGIC_VECTOR (6 downto 0) := "0000011";
    --constant c : STD_LOGIC_VECTOR (6 downto 0) := "1000110";
    --constant d : STD_LOGIC_VECTOR (6 downto 0) := "0100001";
    constant e : STD_LOGIC_VECTOR (6 downto 0) := "0000110";
    --constant f : STD_LOGIC_VECTOR (6 downto 0) := "0001110";
    --constant h : STD_LOGIC_VECTOR (6 downto 0) := "0001001";
    --constant i : STD_LOGIC_VECTOR (6 downto 0) := "1111011";
    constant l : STD_LOGIC_VECTOR (6 downto 0) := "1000111";
    --constant n : STD_LOGIC_VECTOR (6 downto 0) := "0101011";
    constant o : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant p : STD_LOGIC_VECTOR (6 downto 0) := "0001100";
    constant r : STD_LOGIC_VECTOR (6 downto 0) := "0101111";
    constant s : STD_LOGIC_VECTOR (6 downto 0) := "0010010";
    constant u : STD_LOGIC_VECTOR (6 downto 0) := "1000001";
    constant y : STD_LOGIC_VECTOR (6 downto 0) := "0010001"; 
    
end project_trunk;
