-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
-- Date        : Wed Mar 20 16:16:22 2019
-- Host        : vhdl-2018 running 64-bit Ubuntu 18.04.1 LTS
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/joterom/workspace/OctaveSax/Vivado/octave_main/octave_main.sim/sim_1/synth/func/xsim/main_tb_func_synth.vhd
-- Design      : fsm_global
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_generator_clk_generator_clk_wiz is
  port (
    clk_100MHz : out STD_LOGIC;
    clk_50MHz : out STD_LOGIC;
    clk_fpga : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of clk_generator_clk_generator_clk_wiz : entity is "clk_generator_clk_wiz";
end clk_generator_clk_generator_clk_wiz;

architecture STRUCTURE of clk_generator_clk_generator_clk_wiz is
  signal clk_100MHz_clk_generator : STD_LOGIC;
  signal clk_50MHz_clk_generator : STD_LOGIC;
  signal clk_fpga_clk_generator : STD_LOGIC;
  signal clkfbout_buf_clk_generator : STD_LOGIC;
  signal clkfbout_clk_generator : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_LOCKED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_ibufg : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufg : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufg : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufg : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_clk_generator,
      O => clkfbout_buf_clk_generator
    );
clkin1_ibufg: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_fpga,
      O => clk_fpga_clk_generator
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_100MHz_clk_generator,
      O => clk_100MHz
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_50MHz_clk_generator,
      O => clk_50MHz
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 10.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 10.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 10.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 10,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_clk_generator,
      CLKFBOUT => clkfbout_clk_generator,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_fpga_clk_generator,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_100MHz_clk_generator,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => clk_50MHz_clk_generator,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => NLW_mmcm_adv_inst_LOCKED_UNCONNECTED,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_counter is
  port (
    ref_rate : out STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    reset_IBUF : in STD_LOGIC
  );
end display_counter;

architecture STRUCTURE of display_counter is
  signal \counter[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter[12]_i_2_n_0\ : STD_LOGIC;
  signal \counter[12]_i_3_n_0\ : STD_LOGIC;
  signal \counter[12]_i_4_n_0\ : STD_LOGIC;
  signal \counter[16]_i_2_n_0\ : STD_LOGIC;
  signal \counter[16]_i_3_n_0\ : STD_LOGIC;
  signal \counter[4]_i_2_n_0\ : STD_LOGIC;
  signal \counter[4]_i_3_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \counter_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \curr_display[2]_i_3_n_0\ : STD_LOGIC;
  signal \curr_display[2]_i_4_n_0\ : STD_LOGIC;
  signal \curr_display[2]_i_5_n_0\ : STD_LOGIC;
  signal \^ref_rate\ : STD_LOGIC;
  signal \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
begin
  ref_rate <= \^ref_rate\;
\counter[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => counter_reg(0),
      I1 => \^ref_rate\,
      O => \counter[0]_i_2_n_0\
    );
\counter[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(15),
      I1 => \^ref_rate\,
      O => \counter[12]_i_2_n_0\
    );
\counter[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(14),
      I1 => \^ref_rate\,
      O => \counter[12]_i_3_n_0\
    );
\counter[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(12),
      I1 => \^ref_rate\,
      O => \counter[12]_i_4_n_0\
    );
\counter[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(17),
      I1 => \^ref_rate\,
      O => \counter[16]_i_2_n_0\
    );
\counter[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(16),
      I1 => \^ref_rate\,
      O => \counter[16]_i_3_n_0\
    );
\counter[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(7),
      I1 => \^ref_rate\,
      O => \counter[4]_i_2_n_0\
    );
\counter[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_reg(4),
      I1 => \^ref_rate\,
      O => \counter[4]_i_3_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[0]_i_1_n_7\,
      Q => counter_reg(0)
    );
\counter_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_1_n_0\,
      CO(2) => \counter_reg[0]_i_1_n_1\,
      CO(1) => \counter_reg[0]_i_1_n_2\,
      CO(0) => \counter_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => counter_reg(0),
      O(3) => \counter_reg[0]_i_1_n_4\,
      O(2) => \counter_reg[0]_i_1_n_5\,
      O(1) => \counter_reg[0]_i_1_n_6\,
      O(0) => \counter_reg[0]_i_1_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_2_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10)
    );
\counter_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11)
    );
\counter_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12)
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3) => \counter[12]_i_2_n_0\,
      S(2) => \counter[12]_i_3_n_0\,
      S(1) => counter_reg(13),
      S(0) => \counter[12]_i_4_n_0\
    );
\counter_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13)
    );
\counter_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14)
    );
\counter_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15)
    );
\counter_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16)
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3 downto 1) => \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counter_reg[16]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \counter[16]_i_2_n_0\,
      S(0) => \counter[16]_i_3_n_0\
    );
\counter_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17)
    );
\counter_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[0]_i_1_n_6\,
      Q => counter_reg(1)
    );
\counter_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[0]_i_1_n_5\,
      Q => counter_reg(2)
    );
\counter_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[0]_i_1_n_4\,
      Q => counter_reg(3)
    );
\counter_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4)
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_1_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3) => \counter[4]_i_2_n_0\,
      S(2 downto 1) => counter_reg(6 downto 5),
      S(0) => \counter[4]_i_3_n_0\
    );
\counter_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5)
    );
\counter_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6)
    );
\counter_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7)
    );
\counter_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8)
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9)
    );
\curr_display[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => \curr_display[2]_i_3_n_0\,
      I1 => \curr_display[2]_i_4_n_0\,
      I2 => counter_reg(2),
      I3 => counter_reg(10),
      I4 => counter_reg(14),
      I5 => counter_reg(15),
      O => \^ref_rate\
    );
\curr_display[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
        port map (
      I0 => counter_reg(1),
      I1 => counter_reg(16),
      I2 => counter_reg(3),
      I3 => counter_reg(17),
      I4 => counter_reg(8),
      I5 => counter_reg(0),
      O => \curr_display[2]_i_3_n_0\
    );
\curr_display[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(12),
      I2 => counter_reg(6),
      I3 => counter_reg(5),
      I4 => \curr_display[2]_i_5_n_0\,
      O => \curr_display[2]_i_4_n_0\
    );
\curr_display[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(11),
      I2 => counter_reg(4),
      I3 => counter_reg(13),
      O => \curr_display[2]_i_5_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sampling is
  port (
    init_next_reg_0 : out STD_LOGIC;
    \frame_num_reg[4]_0\ : out STD_LOGIC;
    sample_in_ready : out STD_LOGIC;
    mc_reg_0 : out STD_LOGIC;
    start_proc_win_next : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    memo_state0 : out STD_LOGIC;
    DATA_OUT_n0_out : out STD_LOGIC;
    enable_shift_next : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    CLK : in STD_LOGIC;
    reset_IBUF : in STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    memo_state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    buf1_2 : in STD_LOGIC;
    state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    start_reading : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \read_address2_reg[11]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \read_address1_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \buffer2_out_reg[5]\ : in STD_LOGIC;
    \buffer2_out_reg[4]\ : in STD_LOGIC;
    \buffer2_out_reg[3]\ : in STD_LOGIC;
    \buffer2_out_reg[2]\ : in STD_LOGIC;
    \buffer2_out_reg[1]\ : in STD_LOGIC;
    \buffer2_out_reg[0]\ : in STD_LOGIC
  );
end sampling;

architecture STRUCTURE of sampling is
  signal DATA_OUTr_i_10_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_2_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_3_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_4_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_5_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_6_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_7_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_8_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_9_n_0 : STD_LOGIC;
  signal \count[9]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_reg_n_0_[7]\ : STD_LOGIC;
  signal \count_reg_n_0_[8]\ : STD_LOGIC;
  signal \count_reg_n_0_[9]\ : STD_LOGIC;
  signal counter32 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \counter32[3]_i_1_n_0\ : STD_LOGIC;
  signal counter32_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \frame_num[2]_i_1_n_0\ : STD_LOGIC;
  signal \frame_num[4]_i_2_n_0\ : STD_LOGIC;
  signal \^frame_num_reg[4]_0\ : STD_LOGIC;
  signal frame_number : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal frame_number_next : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal init : STD_LOGIC;
  signal init_next : STD_LOGIC;
  signal init_next_i_1_n_0 : STD_LOGIC;
  signal \^init_next_reg_0\ : STD_LOGIC;
  signal lr_i_1_n_0 : STD_LOGIC;
  signal mc_i_1_n_0 : STD_LOGIC;
  signal \^mc_reg_0\ : STD_LOGIC;
  signal \memo_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \memo_state[1]_i_4_n_0\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal \^sample_in_ready\ : STD_LOGIC;
  signal sample_in_ready_i_2_n_0 : STD_LOGIC;
  signal sample_in_ready_i_3_n_0 : STD_LOGIC;
  signal sample_in_ready_next : STD_LOGIC;
  signal sample_towrite_ready : STD_LOGIC;
  signal sample_towrite_ready_next : STD_LOGIC;
  signal sc_next : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of DATA_OUTr_i_10 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of DATA_OUTr_i_3 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of DATA_OUTr_i_8 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of DATA_OUTr_i_9 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \count[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count[7]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \count[8]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \count[9]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter32[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \counter32[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter32[3]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \frame_num[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \frame_num[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \frame_num[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \frame_num[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \frame_num[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of mc_i_1 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \memo_state[1]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \read_address[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \read_address[10]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \read_address[11]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \read_address[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \read_address[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \read_address[3]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \read_address[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \read_address[5]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \read_address[6]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \read_address[7]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \read_address[8]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \read_address[9]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of read_samplenn_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of sample_in_ready_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of sample_in_ready_i_2 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of sample_towrite_ready_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of start_proc_win_i_1 : label is "soft_lutpair8";
begin
  \frame_num_reg[4]_0\ <= \^frame_num_reg[4]_0\;
  init_next_reg_0 <= \^init_next_reg_0\;
  mc_reg_0 <= \^mc_reg_0\;
  sample_in_ready <= \^sample_in_ready\;
DATA_OUTr_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000AE00000000"
    )
        port map (
      I0 => DATA_OUTr_i_2_n_0,
      I1 => DATA_OUTr_i_3_n_0,
      I2 => DATA_OUTr_i_4_n_0,
      I3 => state(1),
      I4 => state(0),
      I5 => start_reading,
      O => DATA_OUT_n0_out
    );
DATA_OUTr_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => frame_number(1),
      I1 => frame_number(0),
      O => DATA_OUTr_i_10_n_0
    );
DATA_OUTr_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAABAAAB"
    )
        port map (
      I0 => DATA_OUTr_i_5_n_0,
      I1 => frame_number(4),
      I2 => frame_number(3),
      I3 => DATA_OUTr_i_6_n_0,
      I4 => DATA_OUTr_i_7_n_0,
      I5 => frame_number(2),
      O => DATA_OUTr_i_2_n_0
    );
DATA_OUTr_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFF80"
    )
        port map (
      I0 => Q(5),
      I1 => frame_number(0),
      I2 => frame_number(1),
      I3 => frame_number(2),
      I4 => DATA_OUTr_i_8_n_0,
      O => DATA_OUTr_i_3_n_0
    );
DATA_OUTr_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFDDDDDDDFDDDFDD"
    )
        port map (
      I0 => frame_number(3),
      I1 => frame_number(4),
      I2 => DATA_OUTr_i_9_n_0,
      I3 => frame_number(2),
      I4 => DATA_OUTr_i_10_n_0,
      I5 => Q(3),
      O => DATA_OUTr_i_4_n_0
    );
DATA_OUTr_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => frame_number(1),
      I1 => frame_number(2),
      I2 => frame_number(0),
      I3 => frame_number(4),
      I4 => Q(0),
      I5 => frame_number(3),
      O => DATA_OUTr_i_5_n_0
    );
DATA_OUTr_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0011033333110333"
    )
        port map (
      I0 => Q(15),
      I1 => frame_number(2),
      I2 => Q(14),
      I3 => frame_number(1),
      I4 => frame_number(0),
      I5 => Q(13),
      O => DATA_OUTr_i_6_n_0
    );
DATA_OUTr_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFFCCF0AA00CCF0"
    )
        port map (
      I0 => Q(9),
      I1 => Q(11),
      I2 => Q(12),
      I3 => frame_number(0),
      I4 => frame_number(1),
      I5 => Q(10),
      O => DATA_OUTr_i_7_n_0
    );
DATA_OUTr_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FCA00CA"
    )
        port map (
      I0 => Q(8),
      I1 => Q(7),
      I2 => frame_number(0),
      I3 => frame_number(1),
      I4 => Q(6),
      O => DATA_OUTr_i_8_n_0
    );
DATA_OUTr_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CA0FCA00"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => frame_number(0),
      I3 => frame_number(1),
      I4 => Q(4),
      O => DATA_OUTr_i_9_n_0
    );
\count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \^mc_reg_0\,
      O => plusOp(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \^mc_reg_0\,
      O => plusOp(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => sc_next,
      I1 => \^mc_reg_0\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[2]\,
      O => plusOp(3)
    );
\count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \^mc_reg_0\,
      I3 => sc_next,
      I4 => \count_reg_n_0_[4]\,
      O => plusOp(4)
    );
\count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \count_reg_n_0_[5]\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \^mc_reg_0\,
      I4 => sc_next,
      I5 => \count_reg_n_0_[4]\,
      O => plusOp(5)
    );
\count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \count_reg_n_0_[6]\,
      I1 => \count[9]_i_2_n_0\,
      I2 => \count_reg_n_0_[5]\,
      O => plusOp(6)
    );
\count[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \count_reg_n_0_[7]\,
      I1 => \count_reg_n_0_[5]\,
      I2 => \count[9]_i_2_n_0\,
      I3 => \count_reg_n_0_[6]\,
      O => plusOp(7)
    );
\count[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \count_reg_n_0_[8]\,
      I1 => \count_reg_n_0_[6]\,
      I2 => \count[9]_i_2_n_0\,
      I3 => \count_reg_n_0_[5]\,
      I4 => \count_reg_n_0_[7]\,
      O => plusOp(8)
    );
\count[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \count_reg_n_0_[9]\,
      I1 => \count_reg_n_0_[7]\,
      I2 => \count_reg_n_0_[5]\,
      I3 => \count[9]_i_2_n_0\,
      I4 => \count_reg_n_0_[6]\,
      I5 => \count_reg_n_0_[8]\,
      O => plusOp(9)
    );
\count[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => sc_next,
      I2 => \^mc_reg_0\,
      I3 => \count_reg_n_0_[1]\,
      I4 => \count_reg_n_0_[2]\,
      O => \count[9]_i_2_n_0\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => plusOp(1),
      Q => \count_reg_n_0_[1]\
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => plusOp(2),
      Q => \count_reg_n_0_[2]\
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => plusOp(3),
      Q => sc_next
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => plusOp(4),
      Q => \count_reg_n_0_[4]\
    );
\count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => plusOp(5),
      Q => \count_reg_n_0_[5]\
    );
\count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => plusOp(6),
      Q => \count_reg_n_0_[6]\
    );
\count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => plusOp(7),
      Q => \count_reg_n_0_[7]\
    );
\count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => plusOp(8),
      Q => \count_reg_n_0_[8]\
    );
\count_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => plusOp(9),
      Q => \count_reg_n_0_[9]\
    );
\counter32[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter32(0),
      O => counter32_next(0)
    );
\counter32[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => counter32(0),
      I1 => counter32(1),
      O => counter32_next(1)
    );
\counter32[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => counter32(2),
      I1 => counter32(1),
      I2 => counter32(0),
      O => counter32_next(2)
    );
\counter32[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => frame_number(4),
      I1 => frame_number(0),
      I2 => frame_number(3),
      I3 => frame_number(2),
      O => \counter32[3]_i_1_n_0\
    );
\counter32[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => counter32(3),
      I1 => counter32(0),
      I2 => counter32(1),
      I3 => counter32(2),
      O => counter32_next(3)
    );
\counter32_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \counter32[3]_i_1_n_0\,
      CLR => reset_IBUF,
      D => counter32_next(0),
      Q => counter32(0)
    );
\counter32_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \counter32[3]_i_1_n_0\,
      CLR => reset_IBUF,
      D => counter32_next(1),
      Q => counter32(1)
    );
\counter32_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \counter32[3]_i_1_n_0\,
      CLR => reset_IBUF,
      D => counter32_next(2),
      Q => counter32(2)
    );
\counter32_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \counter32[3]_i_1_n_0\,
      CLR => reset_IBUF,
      D => counter32_next(3),
      Q => counter32(3)
    );
enable_shift_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000033333336"
    )
        port map (
      I0 => frame_number(3),
      I1 => frame_number(4),
      I2 => frame_number(1),
      I3 => frame_number(2),
      I4 => frame_number(0),
      I5 => \^init_next_reg_0\,
      O => enable_shift_next
    );
\frame_num[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => frame_number(0),
      O => frame_number_next(0)
    );
\frame_num[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => frame_number(1),
      I1 => frame_number(0),
      O => frame_number_next(1)
    );
\frame_num[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => frame_number(2),
      I1 => frame_number(0),
      I2 => frame_number(1),
      O => \frame_num[2]_i_1_n_0\
    );
\frame_num[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => frame_number(3),
      I1 => frame_number(1),
      I2 => frame_number(0),
      I3 => frame_number(2),
      O => frame_number_next(3)
    );
\frame_num[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => frame_number(4),
      I1 => frame_number(3),
      I2 => frame_number(2),
      I3 => frame_number(1),
      I4 => frame_number(0),
      O => frame_number_next(4)
    );
\frame_num[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => reset_IBUF,
      I1 => init,
      O => \frame_num[4]_i_2_n_0\
    );
\frame_num_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => \^frame_num_reg[4]_0\,
      CE => '1',
      CLR => \frame_num[4]_i_2_n_0\,
      D => frame_number_next(0),
      Q => frame_number(0)
    );
\frame_num_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => \^frame_num_reg[4]_0\,
      CE => '1',
      CLR => \frame_num[4]_i_2_n_0\,
      D => frame_number_next(1),
      Q => frame_number(1)
    );
\frame_num_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => \^frame_num_reg[4]_0\,
      CE => '1',
      CLR => \frame_num[4]_i_2_n_0\,
      D => \frame_num[2]_i_1_n_0\,
      Q => frame_number(2)
    );
\frame_num_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => \^frame_num_reg[4]_0\,
      CE => '1',
      CLR => \frame_num[4]_i_2_n_0\,
      D => frame_number_next(3),
      Q => frame_number(3)
    );
\frame_num_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => \^frame_num_reg[4]_0\,
      CE => '1',
      CLR => \frame_num[4]_i_2_n_0\,
      D => frame_number_next(4),
      Q => frame_number(4)
    );
init_next_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => init_next,
      I1 => reset_IBUF,
      I2 => \^init_next_reg_0\,
      O => init_next_i_1_n_0
    );
init_next_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      D => init_next_i_1_n_0,
      Q => init_next,
      R => '0'
    );
init_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => init_next,
      PRE => reset_IBUF,
      Q => init
    );
lr_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg_n_0_[9]\,
      O => lr_i_1_n_0
    );
lr_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => lr_i_1_n_0,
      Q => \^init_next_reg_0\
    );
mc_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^mc_reg_0\,
      O => mc_i_1_n_0
    );
mc_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => mc_i_1_n_0,
      Q => \^mc_reg_0\
    );
\memo_state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4040"
    )
        port map (
      I0 => \memo_state[1]_i_3_n_0\,
      I1 => frame_number(0),
      I2 => frame_number(4),
      I3 => memo_state(0),
      I4 => \memo_state[1]_i_4_n_0\,
      O => memo_state0
    );
\memo_state[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFEFFFFF"
    )
        port map (
      I0 => frame_number(1),
      I1 => frame_number(2),
      I2 => frame_number(3),
      I3 => memo_state(1),
      I4 => memo_state(0),
      O => \memo_state[1]_i_3_n_0\
    );
\memo_state[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800100000000"
    )
        port map (
      I0 => memo_state(1),
      I1 => frame_number(3),
      I2 => frame_number(4),
      I3 => frame_number(1),
      I4 => frame_number(2),
      I5 => frame_number(0),
      O => \memo_state[1]_i_4_n_0\
    );
\read_address[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_out_reg[0]\,
      I1 => sample_towrite_ready,
      I2 => \read_address1_reg[8]\(0),
      O => D(0)
    );
\read_address[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sample_towrite_ready,
      I1 => \read_address2_reg[11]\(4),
      O => D(10)
    );
\read_address[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sample_towrite_ready,
      I1 => \read_address2_reg[11]\(5),
      O => D(11)
    );
\read_address[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_out_reg[1]\,
      I1 => sample_towrite_ready,
      I2 => \read_address1_reg[8]\(1),
      O => D(1)
    );
\read_address[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_out_reg[2]\,
      I1 => sample_towrite_ready,
      I2 => \read_address1_reg[8]\(2),
      O => D(2)
    );
\read_address[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_out_reg[3]\,
      I1 => sample_towrite_ready,
      I2 => \read_address1_reg[8]\(3),
      O => D(3)
    );
\read_address[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_out_reg[4]\,
      I1 => sample_towrite_ready,
      I2 => \read_address1_reg[8]\(4),
      O => D(4)
    );
\read_address[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_out_reg[5]\,
      I1 => sample_towrite_ready,
      I2 => \read_address1_reg[8]\(5),
      O => D(5)
    );
\read_address[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_address2_reg[11]\(0),
      I1 => sample_towrite_ready,
      I2 => \read_address1_reg[8]\(6),
      O => D(6)
    );
\read_address[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_address2_reg[11]\(1),
      I1 => sample_towrite_ready,
      I2 => \read_address1_reg[8]\(7),
      O => D(7)
    );
\read_address[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \read_address2_reg[11]\(2),
      I1 => sample_towrite_ready,
      I2 => \read_address1_reg[8]\(8),
      O => D(8)
    );
\read_address[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sample_towrite_ready,
      I1 => \read_address2_reg[11]\(3),
      O => D(9)
    );
read_samplenn_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C080"
    )
        port map (
      I0 => sample_towrite_ready,
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => buf1_2,
      O => E(0)
    );
sample_in_ready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => sample_in_ready_i_2_n_0,
      I1 => frame_number(2),
      I2 => frame_number(3),
      I3 => frame_number(1),
      O => sample_in_ready_next
    );
sample_in_ready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => counter32(2),
      I1 => counter32(0),
      I2 => \^init_next_reg_0\,
      I3 => sample_in_ready_i_3_n_0,
      O => sample_in_ready_i_2_n_0
    );
sample_in_ready_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF7"
    )
        port map (
      I0 => frame_number(4),
      I1 => frame_number(0),
      I2 => counter32(1),
      I3 => \^frame_num_reg[4]_0\,
      I4 => counter32(3),
      O => sample_in_ready_i_3_n_0
    );
sample_in_ready_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => sample_in_ready_next,
      Q => \^sample_in_ready\
    );
sample_towrite_ready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => sample_in_ready_i_2_n_0,
      I1 => frame_number(1),
      I2 => frame_number(2),
      I3 => frame_number(3),
      O => sample_towrite_ready_next
    );
sample_towrite_ready_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => sample_towrite_ready_next,
      Q => sample_towrite_ready
    );
sc_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => reset_IBUF,
      D => sc_next,
      Q => \^frame_num_reg[4]_0\
    );
start_proc_win_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8C80"
    )
        port map (
      I0 => sample_towrite_ready,
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => \^sample_in_ready\,
      O => start_proc_win_next
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity shift_register is
  port (
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    sc_reg : in STD_LOGIC;
    reset_IBUF : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end shift_register;

architecture STRUCTURE of shift_register is
  signal \^q\ : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  Q(15 downto 0) <= \^q\(15 downto 0);
\r_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => D(0),
      Q => \^q\(0)
    );
\r_reg_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(9),
      Q => \^q\(10)
    );
\r_reg_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(10),
      Q => \^q\(11)
    );
\r_reg_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(11),
      Q => \^q\(12)
    );
\r_reg_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(12),
      Q => \^q\(13)
    );
\r_reg_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(13),
      Q => \^q\(14)
    );
\r_reg_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(14),
      Q => \^q\(15)
    );
\r_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(0),
      Q => \^q\(1)
    );
\r_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(1),
      Q => \^q\(2)
    );
\r_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(2),
      Q => \^q\(3)
    );
\r_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(3),
      Q => \^q\(4)
    );
\r_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(4),
      Q => \^q\(5)
    );
\r_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(5),
      Q => \^q\(6)
    );
\r_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(6),
      Q => \^q\(7)
    );
\r_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(7),
      Q => \^q\(8)
    );
\r_reg_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => sc_reg,
      CE => E(0),
      CLR => reset_IBUF,
      D => \^q\(8),
      Q => \^q\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity window_controller is
  port (
    buf1_2 : out STD_LOGIC;
    addra : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \write_address_reg[0]\ : out STD_LOGIC;
    change_memo_next : out STD_LOGIC;
    pre_resultiSTFT0 : out STD_LOGIC;
    \output_sample_reg[15]\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    B : out STD_LOGIC_VECTOR ( 15 downto 0 );
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : out STD_LOGIC_VECTOR ( 15 downto 0 );
    for_inv_reg : out STD_LOGIC;
    ena : out STD_LOGIC;
    wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    \result1buf_reg[15]_i_2\ : out STD_LOGIC;
    \result1buf_reg[15]_i_3\ : out STD_LOGIC;
    A : out STD_LOGIC_VECTOR ( 14 downto 0 );
    clk_100MHz : in STD_LOGIC;
    reset_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \read_address_reg[11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    read_samplen : in STD_LOGIC;
    read_samplenn : in STD_LOGIC;
    memo_state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    for_inv : in STD_LOGIC;
    \result1buf_reg[15]_i_2_0\ : in STD_LOGIC;
    \result1buf_reg[15]_i_3_0\ : in STD_LOGIC;
    P : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \write_address2_reg[11]\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \write_address1_reg[10]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \buffer1_reg[8]\ : in STD_LOGIC;
    \buffer1_reg[7]\ : in STD_LOGIC;
    \buffer1_reg[6]\ : in STD_LOGIC;
    \buffer2_reg[5]\ : in STD_LOGIC;
    \buffer1_reg[5]\ : in STD_LOGIC;
    \buffer2_reg[4]\ : in STD_LOGIC;
    \buffer1_reg[4]\ : in STD_LOGIC;
    \buffer2_reg[3]\ : in STD_LOGIC;
    \buffer1_reg[3]\ : in STD_LOGIC;
    \buffer2_reg[2]\ : in STD_LOGIC;
    \buffer1_reg[2]\ : in STD_LOGIC;
    \buffer2_reg[1]\ : in STD_LOGIC;
    \buffer1_reg[1]\ : in STD_LOGIC;
    \buffer1_reg[0]\ : in STD_LOGIC;
    \read_address1_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    start_proc_win : in STD_LOGIC;
    sample_in_ready : in STD_LOGIC;
    \buffer2_reg[8]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \buffer2_out_reg[8]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \buffer2_out_reg[5]\ : in STD_LOGIC;
    \buffer2_out_reg[4]\ : in STD_LOGIC;
    \buffer2_out_reg[3]\ : in STD_LOGIC;
    \buffer2_out_reg[2]\ : in STD_LOGIC;
    \buffer2_out_reg[1]\ : in STD_LOGIC;
    \buffer2_out_reg[0]\ : in STD_LOGIC;
    \memo_state_reg[1]\ : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end window_controller;

architecture STRUCTURE of window_controller is
  signal \^buf1_2\ : STD_LOGIC;
  signal buf1_2reg_i_1_n_0 : STD_LOGIC;
  signal end_proc_win : STD_LOGIC;
  signal ended_next : STD_LOGIC;
  signal factor : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal factor_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \factor_reg_rep_n_0_[0]\ : STD_LOGIC;
  signal \factor_reg_rep_n_0_[1]\ : STD_LOGIC;
  signal \factor_reg_rep_n_0_[2]\ : STD_LOGIC;
  signal \factor_reg_rep_n_0_[3]\ : STD_LOGIC;
  signal \factor_reg_rep_n_0_[4]\ : STD_LOGIC;
  signal \factor_reg_rep_n_0_[5]\ : STD_LOGIC;
  signal \factor_reg_rep_n_0_[6]\ : STD_LOGIC;
  signal \factor_reg_rep_n_0_[7]\ : STD_LOGIC;
  signal \factor_reg_rep_n_0_[8]\ : STD_LOGIC;
  signal \factor_rep[0]_i_2_n_0\ : STD_LOGIC;
  signal \factor_rep[1]_i_2_n_0\ : STD_LOGIC;
  signal \factor_rep[2]_i_2_n_0\ : STD_LOGIC;
  signal \factor_rep[3]_i_2_n_0\ : STD_LOGIC;
  signal \factor_rep[4]_i_2_n_0\ : STD_LOGIC;
  signal \factor_rep[5]_i_2_n_0\ : STD_LOGIC;
  signal \factor_rep[6]_i_2_n_0\ : STD_LOGIC;
  signal \factor_rep[7]_i_2_n_0\ : STD_LOGIC;
  signal \factor_rep[8]_i_1_n_0\ : STD_LOGIC;
  signal \factor_rep[8]_i_3_n_0\ : STD_LOGIC;
  signal \factor_rep[8]_i_4_n_0\ : STD_LOGIC;
  signal \g0_b0__0_n_0\ : STD_LOGIC;
  signal g0_b0_n_0 : STD_LOGIC;
  signal \g0_b10__0_n_0\ : STD_LOGIC;
  signal g0_b10_n_0 : STD_LOGIC;
  signal \g0_b11__0_n_0\ : STD_LOGIC;
  signal g0_b11_n_0 : STD_LOGIC;
  signal g0_b12_n_0 : STD_LOGIC;
  signal \g0_b1__0_n_0\ : STD_LOGIC;
  signal g0_b1_n_0 : STD_LOGIC;
  signal \g0_b2__0_n_0\ : STD_LOGIC;
  signal g0_b2_n_0 : STD_LOGIC;
  signal \g0_b3__0_n_0\ : STD_LOGIC;
  signal g0_b3_n_0 : STD_LOGIC;
  signal \g0_b4__0_n_0\ : STD_LOGIC;
  signal g0_b4_n_0 : STD_LOGIC;
  signal \g0_b5__0_n_0\ : STD_LOGIC;
  signal g0_b5_n_0 : STD_LOGIC;
  signal \g0_b6__0_n_0\ : STD_LOGIC;
  signal g0_b6_n_0 : STD_LOGIC;
  signal \g0_b7__0_n_0\ : STD_LOGIC;
  signal g0_b7_n_0 : STD_LOGIC;
  signal \g0_b8__0_n_0\ : STD_LOGIC;
  signal g0_b8_n_0 : STD_LOGIC;
  signal \g0_b9__0_n_0\ : STD_LOGIC;
  signal g0_b9_n_0 : STD_LOGIC;
  signal \g1_b0__0_n_0\ : STD_LOGIC;
  signal g1_b0_n_0 : STD_LOGIC;
  signal \g1_b10__0_n_0\ : STD_LOGIC;
  signal g1_b10_n_0 : STD_LOGIC;
  signal \g1_b11__0_n_0\ : STD_LOGIC;
  signal g1_b11_n_0 : STD_LOGIC;
  signal \g1_b12__0_n_0\ : STD_LOGIC;
  signal g1_b12_n_0 : STD_LOGIC;
  signal \g1_b13__0_n_0\ : STD_LOGIC;
  signal g1_b13_n_0 : STD_LOGIC;
  signal \g1_b1__0_n_0\ : STD_LOGIC;
  signal g1_b1_n_0 : STD_LOGIC;
  signal \g1_b2__0_n_0\ : STD_LOGIC;
  signal g1_b2_n_0 : STD_LOGIC;
  signal \g1_b3__0_n_0\ : STD_LOGIC;
  signal g1_b3_n_0 : STD_LOGIC;
  signal \g1_b4__0_n_0\ : STD_LOGIC;
  signal g1_b4_n_0 : STD_LOGIC;
  signal \g1_b5__0_n_0\ : STD_LOGIC;
  signal g1_b5_n_0 : STD_LOGIC;
  signal \g1_b6__0_n_0\ : STD_LOGIC;
  signal g1_b6_n_0 : STD_LOGIC;
  signal \g1_b7__0_n_0\ : STD_LOGIC;
  signal g1_b7_n_0 : STD_LOGIC;
  signal \g1_b8__0_n_0\ : STD_LOGIC;
  signal g1_b8_n_0 : STD_LOGIC;
  signal \g1_b9__0_n_0\ : STD_LOGIC;
  signal g1_b9_n_0 : STD_LOGIC;
  signal \g2_b0__0_n_0\ : STD_LOGIC;
  signal g2_b0_n_0 : STD_LOGIC;
  signal \g2_b10__0_n_0\ : STD_LOGIC;
  signal g2_b10_n_0 : STD_LOGIC;
  signal \g2_b11__0_n_0\ : STD_LOGIC;
  signal g2_b11_n_0 : STD_LOGIC;
  signal \g2_b12__0_n_0\ : STD_LOGIC;
  signal g2_b12_n_0 : STD_LOGIC;
  signal \g2_b13__0_n_0\ : STD_LOGIC;
  signal g2_b13_n_0 : STD_LOGIC;
  signal g2_b14_n_0 : STD_LOGIC;
  signal \g2_b1__0_n_0\ : STD_LOGIC;
  signal g2_b1_n_0 : STD_LOGIC;
  signal \g2_b2__0_n_0\ : STD_LOGIC;
  signal g2_b2_n_0 : STD_LOGIC;
  signal \g2_b3__0_n_0\ : STD_LOGIC;
  signal g2_b3_n_0 : STD_LOGIC;
  signal \g2_b4__0_n_0\ : STD_LOGIC;
  signal g2_b4_n_0 : STD_LOGIC;
  signal \g2_b5__0_n_0\ : STD_LOGIC;
  signal g2_b5_n_0 : STD_LOGIC;
  signal \g2_b6__0_n_0\ : STD_LOGIC;
  signal g2_b6_n_0 : STD_LOGIC;
  signal \g2_b7__0_n_0\ : STD_LOGIC;
  signal g2_b7_n_0 : STD_LOGIC;
  signal \g2_b8__0_n_0\ : STD_LOGIC;
  signal g2_b8_n_0 : STD_LOGIC;
  signal \g2_b9__0_n_0\ : STD_LOGIC;
  signal g2_b9_n_0 : STD_LOGIC;
  signal \g3_b0__0_n_0\ : STD_LOGIC;
  signal g3_b0_n_0 : STD_LOGIC;
  signal \g3_b10__0_n_0\ : STD_LOGIC;
  signal g3_b10_n_0 : STD_LOGIC;
  signal \g3_b11__0_n_0\ : STD_LOGIC;
  signal g3_b11_n_0 : STD_LOGIC;
  signal \g3_b12__0_n_0\ : STD_LOGIC;
  signal g3_b12_n_0 : STD_LOGIC;
  signal \g3_b1__0_n_0\ : STD_LOGIC;
  signal g3_b1_n_0 : STD_LOGIC;
  signal \g3_b2__0_n_0\ : STD_LOGIC;
  signal g3_b2_n_0 : STD_LOGIC;
  signal \g3_b3__0_n_0\ : STD_LOGIC;
  signal g3_b3_n_0 : STD_LOGIC;
  signal \g3_b4__0_n_0\ : STD_LOGIC;
  signal g3_b4_n_0 : STD_LOGIC;
  signal \g3_b5__0_n_0\ : STD_LOGIC;
  signal g3_b5_n_0 : STD_LOGIC;
  signal \g3_b6__0_n_0\ : STD_LOGIC;
  signal g3_b6_n_0 : STD_LOGIC;
  signal \g3_b7__0_n_0\ : STD_LOGIC;
  signal g3_b7_n_0 : STD_LOGIC;
  signal \g3_b8__0_n_0\ : STD_LOGIC;
  signal g3_b8_n_0 : STD_LOGIC;
  signal \g3_b9__0_n_0\ : STD_LOGIC;
  signal g3_b9_n_0 : STD_LOGIC;
  signal \g4_b0__0_n_0\ : STD_LOGIC;
  signal g4_b0_n_0 : STD_LOGIC;
  signal \g4_b10__0_n_0\ : STD_LOGIC;
  signal g4_b10_n_0 : STD_LOGIC;
  signal \g4_b11__0_n_0\ : STD_LOGIC;
  signal g4_b11_n_0 : STD_LOGIC;
  signal \g4_b12__0_n_0\ : STD_LOGIC;
  signal g4_b12_n_0 : STD_LOGIC;
  signal \g4_b1__0_n_0\ : STD_LOGIC;
  signal g4_b1_n_0 : STD_LOGIC;
  signal \g4_b2__0_n_0\ : STD_LOGIC;
  signal g4_b2_n_0 : STD_LOGIC;
  signal \g4_b3__0_n_0\ : STD_LOGIC;
  signal g4_b3_n_0 : STD_LOGIC;
  signal \g4_b4__0_n_0\ : STD_LOGIC;
  signal g4_b4_n_0 : STD_LOGIC;
  signal \g4_b5__0_n_0\ : STD_LOGIC;
  signal g4_b5_n_0 : STD_LOGIC;
  signal \g4_b6__0_n_0\ : STD_LOGIC;
  signal g4_b6_n_0 : STD_LOGIC;
  signal \g4_b7__0_n_0\ : STD_LOGIC;
  signal g4_b7_n_0 : STD_LOGIC;
  signal \g4_b8__0_n_0\ : STD_LOGIC;
  signal g4_b8_n_0 : STD_LOGIC;
  signal \g4_b9__0_n_0\ : STD_LOGIC;
  signal g4_b9_n_0 : STD_LOGIC;
  signal \g5_b0__0_n_0\ : STD_LOGIC;
  signal g5_b0_n_0 : STD_LOGIC;
  signal \g5_b10__0_n_0\ : STD_LOGIC;
  signal g5_b10_n_0 : STD_LOGIC;
  signal \g5_b11__0_n_0\ : STD_LOGIC;
  signal g5_b11_n_0 : STD_LOGIC;
  signal \g5_b12__0_n_0\ : STD_LOGIC;
  signal g5_b12_n_0 : STD_LOGIC;
  signal \g5_b13__0_n_0\ : STD_LOGIC;
  signal g5_b13_n_0 : STD_LOGIC;
  signal g5_b14_n_0 : STD_LOGIC;
  signal \g5_b1__0_n_0\ : STD_LOGIC;
  signal g5_b1_n_0 : STD_LOGIC;
  signal \g5_b2__0_n_0\ : STD_LOGIC;
  signal g5_b2_n_0 : STD_LOGIC;
  signal \g5_b3__0_n_0\ : STD_LOGIC;
  signal g5_b3_n_0 : STD_LOGIC;
  signal \g5_b4__0_n_0\ : STD_LOGIC;
  signal g5_b4_n_0 : STD_LOGIC;
  signal \g5_b5__0_n_0\ : STD_LOGIC;
  signal g5_b5_n_0 : STD_LOGIC;
  signal \g5_b6__0_n_0\ : STD_LOGIC;
  signal g5_b6_n_0 : STD_LOGIC;
  signal \g5_b7__0_n_0\ : STD_LOGIC;
  signal g5_b7_n_0 : STD_LOGIC;
  signal \g5_b8__0_n_0\ : STD_LOGIC;
  signal g5_b8_n_0 : STD_LOGIC;
  signal \g5_b9__0_n_0\ : STD_LOGIC;
  signal g5_b9_n_0 : STD_LOGIC;
  signal \g6_b0__0_n_0\ : STD_LOGIC;
  signal g6_b0_n_0 : STD_LOGIC;
  signal \g6_b10__0_n_0\ : STD_LOGIC;
  signal g6_b10_n_0 : STD_LOGIC;
  signal \g6_b11__0_n_0\ : STD_LOGIC;
  signal g6_b11_n_0 : STD_LOGIC;
  signal \g6_b12__0_n_0\ : STD_LOGIC;
  signal g6_b12_n_0 : STD_LOGIC;
  signal \g6_b13__0_n_0\ : STD_LOGIC;
  signal g6_b13_n_0 : STD_LOGIC;
  signal g6_b14_n_0 : STD_LOGIC;
  signal \g6_b1__0_n_0\ : STD_LOGIC;
  signal g6_b1_n_0 : STD_LOGIC;
  signal \g6_b2__0_n_0\ : STD_LOGIC;
  signal g6_b2_n_0 : STD_LOGIC;
  signal \g6_b3__0_n_0\ : STD_LOGIC;
  signal g6_b3_n_0 : STD_LOGIC;
  signal \g6_b4__0_n_0\ : STD_LOGIC;
  signal g6_b4_n_0 : STD_LOGIC;
  signal \g6_b5__0_n_0\ : STD_LOGIC;
  signal g6_b5_n_0 : STD_LOGIC;
  signal \g6_b6__0_n_0\ : STD_LOGIC;
  signal g6_b6_n_0 : STD_LOGIC;
  signal \g6_b7__0_n_0\ : STD_LOGIC;
  signal g6_b7_n_0 : STD_LOGIC;
  signal \g6_b8__0_n_0\ : STD_LOGIC;
  signal g6_b8_n_0 : STD_LOGIC;
  signal \g6_b9__0_n_0\ : STD_LOGIC;
  signal g6_b9_n_0 : STD_LOGIC;
  signal \g7_b0__0_n_0\ : STD_LOGIC;
  signal g7_b0_n_0 : STD_LOGIC;
  signal \g7_b10__0_n_0\ : STD_LOGIC;
  signal g7_b10_n_0 : STD_LOGIC;
  signal \g7_b11__0_n_0\ : STD_LOGIC;
  signal g7_b11_n_0 : STD_LOGIC;
  signal g7_b12_n_0 : STD_LOGIC;
  signal \g7_b1__0_n_0\ : STD_LOGIC;
  signal g7_b1_n_0 : STD_LOGIC;
  signal \g7_b2__0_n_0\ : STD_LOGIC;
  signal g7_b2_n_0 : STD_LOGIC;
  signal \g7_b3__0_n_0\ : STD_LOGIC;
  signal g7_b3_n_0 : STD_LOGIC;
  signal \g7_b4__0_n_0\ : STD_LOGIC;
  signal g7_b4_n_0 : STD_LOGIC;
  signal \g7_b5__0_n_0\ : STD_LOGIC;
  signal g7_b5_n_0 : STD_LOGIC;
  signal \g7_b6__0_n_0\ : STD_LOGIC;
  signal g7_b6_n_0 : STD_LOGIC;
  signal \g7_b7__0_n_0\ : STD_LOGIC;
  signal g7_b7_n_0 : STD_LOGIC;
  signal \g7_b8__0_n_0\ : STD_LOGIC;
  signal g7_b8_n_0 : STD_LOGIC;
  signal \g7_b9__0_n_0\ : STD_LOGIC;
  signal g7_b9_n_0 : STD_LOGIC;
  signal mult_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal mult_reg2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal mult_reg2_next : STD_LOGIC;
  signal \mult_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \^output_sample_reg[15]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal pre_resultSTFT_next0_i_10_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_11_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_12_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_13_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_14_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_15_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_16_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_17_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_18_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_19_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_1_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_20_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_21_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_22_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_23_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_24_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_25_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_26_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_27_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_28_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_29_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_2_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_30_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_31_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_32_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_33_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_34_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_35_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_36_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_37_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_38_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_39_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_3_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_40_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_41_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_42_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_43_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_44_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_45_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_46_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_47_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_48_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_49_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_4_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_50_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_51_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_52_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_53_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_54_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_55_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_56_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_57_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_58_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_59_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_5_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_60_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_61_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_62_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_63_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_64_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_65_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_66_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_67_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_68_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_69_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_6_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_7_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_8_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_i_9_n_0 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_100 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_101 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_102 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_103 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_104 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_105 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_74 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_75 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_76 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_77 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_78 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_79 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_80 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_81 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_82 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_83 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_84 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_85 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_86 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_87 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_88 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_89 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_90 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_91 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_92 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_93 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_94 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_95 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_96 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_97 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_98 : STD_LOGIC;
  signal pre_resultSTFT_next0_n_99 : STD_LOGIC;
  signal pre_resultiSTFT0_i_33_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_34_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_35_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_36_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_37_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_38_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_39_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_40_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_41_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_42_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_43_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_44_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_45_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_46_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_47_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_48_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_49_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_50_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_51_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_52_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_53_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_54_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_55_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_56_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_57_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_58_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_59_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_60_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_61_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_62_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_63_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_64_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_65_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_66_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_67_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_68_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_69_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_70_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_71_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_72_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_73_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_74_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_75_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_76_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_77_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_78_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_79_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_80_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_81_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_82_n_0 : STD_LOGIC;
  signal pre_resultiSTFT0_i_83_n_0 : STD_LOGIC;
  signal result1_next : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal result1buf : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal result2_next : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal result2_next0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \result2_next0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__0_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__0_n_1\ : STD_LOGIC;
  signal \result2_next0_carry__0_n_2\ : STD_LOGIC;
  signal \result2_next0_carry__0_n_3\ : STD_LOGIC;
  signal \result2_next0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__1_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__1_n_1\ : STD_LOGIC;
  signal \result2_next0_carry__1_n_2\ : STD_LOGIC;
  signal \result2_next0_carry__1_n_3\ : STD_LOGIC;
  signal \result2_next0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \result2_next0_carry__2_n_1\ : STD_LOGIC;
  signal \result2_next0_carry__2_n_2\ : STD_LOGIC;
  signal \result2_next0_carry__2_n_3\ : STD_LOGIC;
  signal result2_next0_carry_i_1_n_0 : STD_LOGIC;
  signal result2_next0_carry_i_2_n_0 : STD_LOGIC;
  signal result2_next0_carry_i_3_n_0 : STD_LOGIC;
  signal result2_next0_carry_i_4_n_0 : STD_LOGIC;
  signal result2_next0_carry_n_0 : STD_LOGIC;
  signal result2_next0_carry_n_1 : STD_LOGIC;
  signal result2_next0_carry_n_2 : STD_LOGIC;
  signal result2_next0_carry_n_3 : STD_LOGIC;
  signal \result2buf[0]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[10]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[11]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[12]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[13]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[14]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[15]_i_1_n_0\ : STD_LOGIC;
  signal \result2buf[15]_i_3_n_0\ : STD_LOGIC;
  signal \result2buf[1]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[2]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[3]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[4]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[5]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[6]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[7]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[8]_i_2_n_0\ : STD_LOGIC;
  signal \result2buf[9]_i_2_n_0\ : STD_LOGIC;
  signal value : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \value[0]_i_1_n_0\ : STD_LOGIC;
  signal \value[1]_i_1_n_0\ : STD_LOGIC;
  signal \value[2]_i_1_n_0\ : STD_LOGIC;
  signal \value[3]_i_1_n_0\ : STD_LOGIC;
  signal working : STD_LOGIC;
  signal working_i_1_n_0 : STD_LOGIC;
  signal \^write_address_reg[0]\ : STD_LOGIC;
  signal NLW_pre_resultSTFT_next0_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultSTFT_next0_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultSTFT_next0_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultSTFT_next0_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultSTFT_next0_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultSTFT_next0_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultSTFT_next0_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_pre_resultSTFT_next0_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_pre_resultSTFT_next0_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_pre_resultSTFT_next0_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal NLW_pre_resultSTFT_next0_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_result2_next0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of change_memo_i_1 : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of end_proc_win_i_1 : label is "soft_lutpair22";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \factor_reg_rep[0]\ : label is "no";
  attribute equivalent_register_removal of \factor_reg_rep[1]\ : label is "no";
  attribute equivalent_register_removal of \factor_reg_rep[2]\ : label is "no";
  attribute equivalent_register_removal of \factor_reg_rep[3]\ : label is "no";
  attribute equivalent_register_removal of \factor_reg_rep[4]\ : label is "no";
  attribute equivalent_register_removal of \factor_reg_rep[5]\ : label is "no";
  attribute equivalent_register_removal of \factor_reg_rep[6]\ : label is "no";
  attribute equivalent_register_removal of \factor_reg_rep[7]\ : label is "no";
  attribute equivalent_register_removal of \factor_reg_rep[8]\ : label is "no";
  attribute SOFT_HLUTNM of \factor_rep[8]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \g1_b13__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of g4_b12 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of g5_b12 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of g5_b13 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \g5_b13__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of g5_b14 : label is "soft_lutpair20";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of pre_resultSTFT_next0 : label is "{SYNTH-12 {cell *THIS*}}";
  attribute SOFT_HLUTNM of ram_i_15 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of ram_i_16 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of ram_i_17 : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of ram_i_18 : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of ram_i_19 : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of ram_i_20 : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of ram_i_21 : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of ram_i_22 : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of ram_i_23 : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of ram_i_24 : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of ram_i_25 : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of ram_i_26 : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of ram_i_27 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of ram_i_28 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of ram_i_29 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of ram_i_30 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \value[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \value[2]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \write_address[0]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \write_address[10]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \write_address[11]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \write_address[11]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \write_address[1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \write_address[2]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \write_address[3]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \write_address[4]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \write_address[5]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \write_address[6]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \write_address[7]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \write_address[8]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \write_address[9]_i_1\ : label is "soft_lutpair31";
begin
  buf1_2 <= \^buf1_2\;
  \output_sample_reg[15]\(15 downto 0) <= \^output_sample_reg[15]\(15 downto 0);
  \write_address_reg[0]\ <= \^write_address_reg[0]\;
buf1_2reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7FFFFF00020004"
    )
        port map (
      I0 => for_inv,
      I1 => value(0),
      I2 => value(1),
      I3 => value(3),
      I4 => value(2),
      I5 => \^buf1_2\,
      O => buf1_2reg_i_1_n_0
    );
buf1_2reg_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buf1_2reg_i_1_n_0,
      Q => \^buf1_2\
    );
change_memo_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => memo_state(0),
      I1 => memo_state(1),
      I2 => end_proc_win,
      I3 => \^buf1_2\,
      O => change_memo_next
    );
end_proc_win_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000042"
    )
        port map (
      I0 => value(3),
      I1 => value(2),
      I2 => for_inv,
      I3 => value(0),
      I4 => value(1),
      O => ended_next
    );
end_proc_win_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => ended_next,
      Q => end_proc_win
    );
\factor_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(0),
      Q => factor(0)
    );
\factor_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(1),
      Q => factor(1)
    );
\factor_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(2),
      Q => factor(2)
    );
\factor_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(3),
      Q => factor(3)
    );
\factor_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(4),
      Q => factor(4)
    );
\factor_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(5),
      Q => factor(5)
    );
\factor_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(6),
      Q => factor(6)
    );
\factor_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(7),
      Q => factor(7)
    );
\factor_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(8),
      Q => factor(8)
    );
\factor_reg_rep[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(0),
      Q => \factor_reg_rep_n_0_[0]\
    );
\factor_reg_rep[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(1),
      Q => \factor_reg_rep_n_0_[1]\
    );
\factor_reg_rep[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(2),
      Q => \factor_reg_rep_n_0_[2]\
    );
\factor_reg_rep[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(3),
      Q => \factor_reg_rep_n_0_[3]\
    );
\factor_reg_rep[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(4),
      Q => \factor_reg_rep_n_0_[4]\
    );
\factor_reg_rep[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(5),
      Q => \factor_reg_rep_n_0_[5]\
    );
\factor_reg_rep[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(6),
      Q => \factor_reg_rep_n_0_[6]\
    );
\factor_reg_rep[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(7),
      Q => \factor_reg_rep_n_0_[7]\
    );
\factor_reg_rep[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => factor_next(8),
      Q => \factor_reg_rep_n_0_[8]\
    );
\factor_rep[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200FFFFE2000000"
    )
        port map (
      I0 => \buffer1_reg[0]\,
      I1 => memo_state(0),
      I2 => \read_address1_reg[8]\(0),
      I3 => memo_state(1),
      I4 => \factor_rep[8]_i_3_n_0\,
      I5 => \factor_rep[0]_i_2_n_0\,
      O => factor_next(0)
    );
\factor_rep[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \buffer2_reg[8]\(0),
      I1 => memo_state(0),
      I2 => \buffer2_out_reg[0]\,
      I3 => memo_state(1),
      O => \factor_rep[0]_i_2_n_0\
    );
\factor_rep[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200FFFFE2000000"
    )
        port map (
      I0 => \buffer1_reg[1]\,
      I1 => memo_state(0),
      I2 => \read_address1_reg[8]\(1),
      I3 => memo_state(1),
      I4 => \factor_rep[8]_i_3_n_0\,
      I5 => \factor_rep[1]_i_2_n_0\,
      O => factor_next(1)
    );
\factor_rep[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \buffer2_reg[1]\,
      I1 => memo_state(0),
      I2 => \buffer2_out_reg[1]\,
      I3 => memo_state(1),
      O => \factor_rep[1]_i_2_n_0\
    );
\factor_rep[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200FFFFE2000000"
    )
        port map (
      I0 => \buffer1_reg[2]\,
      I1 => memo_state(0),
      I2 => \read_address1_reg[8]\(2),
      I3 => memo_state(1),
      I4 => \factor_rep[8]_i_3_n_0\,
      I5 => \factor_rep[2]_i_2_n_0\,
      O => factor_next(2)
    );
\factor_rep[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \buffer2_reg[2]\,
      I1 => memo_state(0),
      I2 => \buffer2_out_reg[2]\,
      I3 => memo_state(1),
      O => \factor_rep[2]_i_2_n_0\
    );
\factor_rep[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200FFFFE2000000"
    )
        port map (
      I0 => \buffer1_reg[3]\,
      I1 => memo_state(0),
      I2 => \read_address1_reg[8]\(3),
      I3 => memo_state(1),
      I4 => \factor_rep[8]_i_3_n_0\,
      I5 => \factor_rep[3]_i_2_n_0\,
      O => factor_next(3)
    );
\factor_rep[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \buffer2_reg[3]\,
      I1 => memo_state(0),
      I2 => \buffer2_out_reg[3]\,
      I3 => memo_state(1),
      O => \factor_rep[3]_i_2_n_0\
    );
\factor_rep[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200FFFFE2000000"
    )
        port map (
      I0 => \buffer1_reg[4]\,
      I1 => memo_state(0),
      I2 => \read_address1_reg[8]\(4),
      I3 => memo_state(1),
      I4 => \factor_rep[8]_i_3_n_0\,
      I5 => \factor_rep[4]_i_2_n_0\,
      O => factor_next(4)
    );
\factor_rep[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \buffer2_reg[4]\,
      I1 => memo_state(0),
      I2 => \buffer2_out_reg[4]\,
      I3 => memo_state(1),
      O => \factor_rep[4]_i_2_n_0\
    );
\factor_rep[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200FFFFE2000000"
    )
        port map (
      I0 => \buffer1_reg[5]\,
      I1 => memo_state(0),
      I2 => \read_address1_reg[8]\(5),
      I3 => memo_state(1),
      I4 => \factor_rep[8]_i_3_n_0\,
      I5 => \factor_rep[5]_i_2_n_0\,
      O => factor_next(5)
    );
\factor_rep[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \buffer2_reg[5]\,
      I1 => memo_state(0),
      I2 => \buffer2_out_reg[5]\,
      I3 => memo_state(1),
      O => \factor_rep[5]_i_2_n_0\
    );
\factor_rep[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200FFFFE2000000"
    )
        port map (
      I0 => \buffer1_reg[6]\,
      I1 => memo_state(0),
      I2 => \read_address1_reg[8]\(6),
      I3 => memo_state(1),
      I4 => \factor_rep[8]_i_3_n_0\,
      I5 => \factor_rep[6]_i_2_n_0\,
      O => factor_next(6)
    );
\factor_rep[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \buffer2_reg[8]\(1),
      I1 => memo_state(0),
      I2 => \buffer2_out_reg[8]\(0),
      I3 => memo_state(1),
      O => \factor_rep[6]_i_2_n_0\
    );
\factor_rep[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200FFFFE2000000"
    )
        port map (
      I0 => \buffer1_reg[7]\,
      I1 => memo_state(0),
      I2 => \read_address1_reg[8]\(7),
      I3 => memo_state(1),
      I4 => \factor_rep[8]_i_3_n_0\,
      I5 => \factor_rep[7]_i_2_n_0\,
      O => factor_next(7)
    );
\factor_rep[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \buffer2_reg[8]\(2),
      I1 => memo_state(0),
      I2 => \buffer2_out_reg[8]\(1),
      I3 => memo_state(1),
      O => \factor_rep[7]_i_2_n_0\
    );
\factor_rep[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01111000"
    )
        port map (
      I0 => value(1),
      I1 => value(3),
      I2 => for_inv,
      I3 => value(2),
      I4 => value(0),
      O => \factor_rep[8]_i_1_n_0\
    );
\factor_rep[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200FFFFE2000000"
    )
        port map (
      I0 => \buffer1_reg[8]\,
      I1 => memo_state(0),
      I2 => \read_address1_reg[8]\(8),
      I3 => memo_state(1),
      I4 => \factor_rep[8]_i_3_n_0\,
      I5 => \factor_rep[8]_i_4_n_0\,
      O => factor_next(8)
    );
\factor_rep[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => value(0),
      I1 => for_inv,
      I2 => value(2),
      O => \factor_rep[8]_i_3_n_0\
    );
\factor_rep[8]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \buffer2_reg[8]\(3),
      I1 => memo_state(0),
      I2 => \buffer2_out_reg[8]\(2),
      I3 => memo_state(1),
      O => \factor_rep[8]_i_4_n_0\
    );
for_inv_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0FA3AF0F0"
    )
        port map (
      I0 => sample_in_ready,
      I1 => end_proc_win,
      I2 => for_inv,
      I3 => \^buf1_2\,
      I4 => memo_state(1),
      I5 => memo_state(0),
      O => for_inv_reg
    );
g0_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5552BB87445D085C"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b0_n_0
    );
\g0_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C66B6057DB7A5E1A"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b0__0_n_0\
    );
g0_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"45EAE4E35F583E0C"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b1_n_0
    );
g0_b10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8007FFF000000000"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b10_n_0
    );
\g0_b10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07F803FFE0000000"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b10__0_n_0\
    );
g0_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF8000000000000"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b11_n_0
    );
\g0_b11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07FFFC0000000000"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b11__0_n_0\
    );
g0_b12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F800000000000000"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => g0_b12_n_0
    );
\g0_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0B40B301AC1F0738"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b1__0_n_0\
    );
g0_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1B78E841B71A1178"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b2_n_0
    );
\g0_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7B044B77122489E4"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b2__0_n_0\
    );
g0_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"35864FD5F266A0D0"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b3_n_0
    );
\g0_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2CD7D3275EBD05E8"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b3__0_n_0\
    );
g0_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0CAB70335B819560"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b4_n_0
    );
\g0_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B0329CED9E69FCB0"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b4__0_n_0\
    );
g0_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A933800F36AAD980"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b5_n_0
    );
\g0_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C00E4AB61E1B56C0"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b5__0_n_0\
    );
g0_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6496AAAA5B331E00"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b6_n_0
    );
\g0_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001C66D4B526700"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b6__0_n_0\
    );
g0_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4924CCCC63C3E000"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b7_n_0
    );
\g0_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55556B49939C7800"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b7__0_n_0\
    );
g0_b8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"71C70F0F83FC0000"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b8_n_0
    );
\g0_b8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666738E1C1F8000"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b8__0_n_0\
    );
g0_b9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7E07F00FFC000000"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g0_b9_n_0
    );
\g0_b9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"878783F01FE00000"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g0_b9__0_n_0\
    );
g1_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"065F45AC8D94C335"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b0_n_0
    );
\g1_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"483B118C2C8BC89A"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b0__0_n_0\
    );
g1_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"549F2997ACF784B7"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b1_n_0
    );
g1_b10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07F00FF00FF801FF"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b10_n_0
    );
\g1_b10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F83E0F81F03F01F8"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b10__0_n_0\
    );
g1_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8000FFFF00001FF"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b11_n_0
    );
\g1_b11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFC00FFE003FFE00"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b11__0_n_0\
    );
g1_b12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000FFFFFFFFE00"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b12_n_0
    );
\g1_b12__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFC007FF"
    )
        port map (
      I0 => factor(1),
      I1 => factor(2),
      I2 => factor(3),
      I3 => factor(4),
      I4 => factor(5),
      O => \g1_b12__0_n_0\
    );
g1_b13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F800"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[2]\,
      I1 => \factor_reg_rep_n_0_[3]\,
      I2 => \factor_reg_rep_n_0_[4]\,
      I3 => \factor_reg_rep_n_0_[5]\,
      O => g1_b13_n_0
    );
\g1_b13__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF800"
    )
        port map (
      I0 => factor(1),
      I1 => factor(2),
      I2 => factor(3),
      I3 => factor(4),
      I4 => factor(5),
      O => \g1_b13__0_n_0\
    );
\g1_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8FF5F5AD12A4ABE5"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b1__0_n_0\
    );
g1_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CDB5B18D33A7A867"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b2_n_0
    );
\g1_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00CA6660B684917"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b2__0_n_0\
    );
g1_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69263E7C95386547"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b3_n_0
    );
\g1_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5556C7E2AC1A88A7"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b3__0_n_0\
    );
g1_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"71C7C0038C954987"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b4_n_0
    );
\g1_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9998F81E6553086D"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b4__0_n_0\
    );
g1_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"81F800007C7324AD"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b5_n_0
    );
\g1_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E1E0FFFE1CC95D49"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b5__0_n_0\
    );
g1_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01FFFFFFFC0F1C63"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b6_n_0
    );
\g1_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"54AA5554A96D918E"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b6__0_n_0\
    );
g1_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"54AAAAAAA955A94A"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b7_n_0
    );
\g1_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3399CCCD9B24B4A5"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b7__0_n_0\
    );
g1_b8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66CCCCCCCE66318C"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b8_n_0
    );
\g1_b8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A52D69692DB6D936"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b8__0_n_0\
    );
g1_b9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"870F0F0F0F87C1F0"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g1_b9_n_0
    );
\g1_b9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C6318E71CE38E1C7"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g1_b9__0_n_0\
    );
g2_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"179A83684B45B580"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b0_n_0
    );
\g2_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4DD85D979CEE47DA"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b0__0_n_0\
    );
g2_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CBC1DD0B986C46D5"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b1_n_0
    );
g2_b10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3FF007F803FC07F8"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b10_n_0
    );
\g2_b10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0FE07E0FC1F07C0"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b10__0_n_0\
    );
g2_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C00007FFFC0007FF"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b11_n_0
    );
\g2_b11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0007FF001FF800"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b11__0_n_0\
    );
g2_b12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000007FFFFFFF800"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b12_n_0
    );
\g2_b12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000007FFFFE00000"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b12__0_n_0\
    );
g2_b13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000007FFFFFFFFFF"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b13_n_0
    );
\g2_b13__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF80000000000"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b13__0_n_0\
    );
g2_b14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF80000000000"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b14_n_0
    );
\g2_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B055B56E94A0A01C"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b1__0_n_0\
    );
g2_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E817EB0D4789524C"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b2_n_0
    );
\g2_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2EDBD25F33359FE0"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b2__0_n_0\
    );
g2_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0D4FF25B3FF19B69"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b3_n_0
    );
\g2_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"35DD4F9570392AAA"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b3__0_n_0\
    );
g2_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F19556C70001E38E"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b4_n_0
    );
\g2_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"93DE6AB30FC1CCCC"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b4__0_n_0\
    );
g2_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AB4CCE3F0001FC0F"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b5_n_0
    );
\g2_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DA8AD98F0001F0F0"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b5__0_n_0\
    );
g2_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"98C3C1FF0001FFF0"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b6_n_0
    );
\g2_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1CEC92D5AAAB55AA"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b6__0_n_0\
    );
g2_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2D6A9555AAAB5555"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b7_n_0
    );
\g2_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B5A5B64C9998CC66"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b7__0_n_0\
    );
g2_b8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"318CE66633326666"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b8_n_0
    );
\g2_b8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"26C92496D2D296B4"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b8__0_n_0\
    );
g2_b9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3E0F0787C3C38787"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g2_b9_n_0
    );
\g2_b9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"38F1C718E31CE738"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g2_b9__0_n_0\
    );
g3_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"267177A5A5B8BC7C"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b0_n_0
    );
\g3_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F0B42482BF25339"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b0__0_n_0\
    );
g3_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44D941F00FF63B11"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b1_n_0
    );
g3_b10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF000007FFC00"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b10_n_0
    );
\g3_b10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF0007FC03F"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b10__0_n_0\
    );
g3_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000007FFFFF"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b11_n_0
    );
\g3_b11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFF80003F"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b11__0_n_0\
    );
g3_b12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFF800000"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b12_n_0
    );
\g3_b12__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF8"
    )
        port map (
      I0 => factor(1),
      I1 => factor(2),
      I2 => factor(3),
      I3 => factor(4),
      I4 => factor(5),
      O => \g3_b12__0_n_0\
    );
\g3_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C63E0F94FE65FA5E"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b1__0_n_0\
    );
g3_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6163BD1742F7D1B"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b2_n_0
    );
\g3_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B0DDB76E225BBE42"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b2__0_n_0\
    );
g3_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"321AFD4E53CAFE48"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b3_n_0
    );
\g3_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0BE850A36682996"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b3__0_n_0\
    );
g3_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C4B60195300CAAC7"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b4_n_0
    );
\g3_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E580D30C918D67E4"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b4__0_n_0\
    );
g3_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0724AB4CF00F336A"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b5_n_0
    );
\g3_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F92A4F0F255B1FF8"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b5__0_n_0\
    );
g3_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F838CD96A55A96D9"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b6_n_0
    );
\g3_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE336A5A9338FFFF"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b6__0_n_0\
    );
g3_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"003F0E18C66CDB6D"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b7_n_0
    );
\g3_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFC38C6CDA52AAAA"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b7__0_n_0\
    );
g3_b8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFC00FE0F870E38E"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b8_n_0
    );
\g3_b8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFC0F8F1C633333"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b8__0_n_0\
    );
g3_b9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000FFF007F03F0"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g3_b9_n_0
    );
\g3_b9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF00FE07C3C3C"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g3_b9__0_n_0\
    );
g4_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7C7A3B4B4BDD1CC9"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b0_n_0
    );
\g4_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"39949FA82485A1E5"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b0__0_n_0\
    );
g4_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"11B8DFE01F053644"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b1_n_0
    );
g4_b10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"007FFC00001FFFFF"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b10_n_0
    );
\g4_b10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F807FC001FFFFFFF"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b10__0_n_0\
    );
g4_b11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE00000"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[1]\,
      I1 => \factor_reg_rep_n_0_[2]\,
      I2 => \factor_reg_rep_n_0_[3]\,
      I3 => \factor_reg_rep_n_0_[4]\,
      I4 => \factor_reg_rep_n_0_[5]\,
      O => g4_b11_n_0
    );
\g4_b11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F80003FFFFFFFFFF"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b11__0_n_0\
    );
g4_b12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"001FFFFF"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[1]\,
      I1 => \factor_reg_rep_n_0_[2]\,
      I2 => \factor_reg_rep_n_0_[3]\,
      I3 => \factor_reg_rep_n_0_[4]\,
      I4 => \factor_reg_rep_n_0_[5]\,
      O => g4_b12_n_0
    );
\g4_b12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07FFFFFFFFFFFFFF"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b12__0_n_0\
    );
\g4_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4BF4CFE53E0F8C7"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b1__0_n_0\
    );
g4_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B17DE85D17B8D0CB"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b2_n_0
    );
\g4_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"84FBB488EDDB761B"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b2__0_n_0\
    );
g4_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"24FEA794E57EB098"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b3_n_0
    );
\g4_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D3282CD8A142FA17"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b3__0_n_0\
    );
g4_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C6AA60195300DA47"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b4_n_0
    );
\g4_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4FCD63126196034F"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b4__0_n_0\
    );
g4_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AD99E01E65AA49C0"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b5_n_0
    );
\g4_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3FF1B549E1E4A93F"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b5__0_n_0\
    );
g4_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"36D2B54AD366383F"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b6_n_0
    );
\g4_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE3992B4AD98FF"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b6__0_n_0\
    );
g4_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6DB66CC630E1F800"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b7_n_0
    );
\g4_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA94B66C6387FF"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b7__0_n_0\
    );
g4_b8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E38E1C3E0FE007FF"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b8_n_0
    );
\g4_b8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"99998C71E3E07FFF"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b8__0_n_0\
    );
g4_b9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1F81FC01FFE00000"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g4_b9_n_0
    );
\g4_b9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"78787C0FE01FFFFF"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g4_b9__0_n_0\
    );
g5_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"035B45A42D82B3D0"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b0_n_0
    );
\g5_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B7C4EE73D3743765"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b0__0_n_0\
    );
g5_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"56C46C33A17707A7"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b1_n_0
    );
g5_b10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3FC07F803FC01FF8"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b10_n_0
    );
\g5_b10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07C1F07E0FC0FE07"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b10__0_n_0\
    );
g5_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFC0007FFFC00007"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b11_n_0
    );
\g5_b11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"003FF001FFC001FF"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b11__0_n_0\
    );
g5_b12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07FFF800"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[1]\,
      I1 => \factor_reg_rep_n_0_[2]\,
      I2 => \factor_reg_rep_n_0_[3]\,
      I3 => \factor_reg_rep_n_0_[4]\,
      I4 => \factor_reg_rep_n_0_[5]\,
      O => g5_b12_n_0
    );
\g5_b12__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"003FF800"
    )
        port map (
      I0 => factor(1),
      I1 => factor(2),
      I2 => factor(3),
      I3 => factor(4),
      I4 => factor(5),
      O => \g5_b12__0_n_0\
    );
g5_b13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF800"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[1]\,
      I1 => \factor_reg_rep_n_0_[2]\,
      I2 => \factor_reg_rep_n_0_[3]\,
      I3 => \factor_reg_rep_n_0_[4]\,
      I4 => \factor_reg_rep_n_0_[5]\,
      O => g5_b13_n_0
    );
\g5_b13__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000007FF"
    )
        port map (
      I0 => factor(1),
      I1 => factor(2),
      I2 => factor(3),
      I3 => factor(4),
      I4 => factor(5),
      O => \g5_b13__0_n_0\
    );
g5_b14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000007FF"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[1]\,
      I1 => \factor_reg_rep_n_0_[2]\,
      I2 => \factor_reg_rep_n_0_[3]\,
      I3 => \factor_reg_rep_n_0_[4]\,
      I4 => \factor_reg_rep_n_0_[5]\,
      O => g5_b14_n_0
    );
\g5_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"700A0A52ED5B541A"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b1__0_n_0\
    );
g5_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"649523C561AFD02F"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b2_n_0
    );
\g5_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FF35999F497B6E8"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b2__0_n_0\
    );
g5_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2DB31FF9B49FE560"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b3_n_0
    );
\g5_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA9381D53E57758"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b3__0_n_0\
    );
g5_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E38F0001C6D5531F"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b4_n_0
    );
\g5_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"666707E19AACF792"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b4__0_n_0\
    );
g5_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E07F0001F8E665AA"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b5_n_0
    );
\g5_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1E1F0001E336A2B6"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b5__0_n_0\
    );
g5_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1FFF0001FF078633"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b6_n_0
    );
\g5_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AB55AAAB56926E71"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b6__0_n_0\
    );
g5_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555AAAB5552AD69"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b7_n_0
    );
\g5_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CC66333264DB4B5A"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b7__0_n_0\
    );
g5_b8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC9998CCCE6318"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b8_n_0
    );
\g5_b8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5AD29696D24926C9"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b8__0_n_0\
    );
g5_b9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3C38787C3C1E0F8"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g5_b9_n_0
    );
\g5_b9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"39CE718E31C71E38"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g5_b9__0_n_0\
    );
g6_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"598653626B45F4C0"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b0_n_0
    );
\g6_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B227A2686311B824"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b0__0_n_0\
    );
g6_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DA43DE6BD329F255"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b1_n_0
    );
g6_b10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF003FE01FE01FC0"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b10_n_0
    );
\g6_b10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F01F81F03E0F83E"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b10__0_n_0\
    );
g6_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00001FFFE0003F"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b11_n_0
    );
\g6_b11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFF800FFE007FE"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b11__0_n_0\
    );
g6_b12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFFFFFFE00000"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b12_n_0
    );
\g6_b12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF800001FFFFE"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b12__0_n_0\
    );
g6_b13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000001FFFFF"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b13_n_0
    );
\g6_b13__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000007FFFFFFFFFE"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b13__0_n_0\
    );
g6_b14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => g6_b14_n_0
    );
\g6_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4FAA4A916B5F5FE2"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b1__0_n_0\
    );
g6_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CC2BCB99631B5B66"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b2_n_0
    );
\g6_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D1242DA0CCCA601E"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b2__0_n_0\
    );
g6_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C54C39527CF8C92D"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b3_n_0
    );
\g6_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CA22B06A8FC6D554"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b3__0_n_0\
    );
g6_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C32552638007C71C"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b4_n_0
    );
\g6_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6C21954CF03E3332"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b4__0_n_0\
    );
g6_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A499C7C00003F03"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b5_n_0
    );
\g6_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"25752670FFFE0F0E"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b5__0_n_0\
    );
g6_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8C71E07FFFFFFF00"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b6_n_0
    );
\g6_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E3136D2A5554AA54"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b6__0_n_0\
    );
g6_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A52B552AAAAAAA55"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b7_n_0
    );
\g6_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4A5A49B366673398"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b7__0_n_0\
    );
g6_b8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6318CCE6666666CC"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b8_n_0
    );
\g6_b8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D936DB692D2D694A"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b8__0_n_0\
    );
g6_b9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1F07C3E1E1E1E1C3"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g6_b9_n_0
    );
\g6_b9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C70E38E71CE318C6"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g6_b9__0_n_0\
    );
g7_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"74217445C3BA9555"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b0_n_0
    );
\g7_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B0F4BDB7D40DACC6"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b0__0_n_0\
    );
g7_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"60F835F58E4EAF45"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b1_n_0
    );
g7_b10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000001FFFC003"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b10_n_0
    );
\g7_b10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000FFF803FC0"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b10__0_n_0\
    );
g7_b11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000007F"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[1]\,
      I1 => \factor_reg_rep_n_0_[2]\,
      I2 => \factor_reg_rep_n_0_[3]\,
      I3 => \factor_reg_rep_n_0_[4]\,
      I4 => \factor_reg_rep_n_0_[5]\,
      O => g7_b11_n_0
    );
\g7_b11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000007FFFC0"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b11__0_n_0\
    );
g7_b12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000007"
    )
        port map (
      I0 => factor(1),
      I1 => factor(2),
      I2 => factor(3),
      I3 => factor(4),
      I4 => factor(5),
      O => g7_b12_n_0
    );
\g7_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"39C1F06B019A05A1"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b1__0_n_0\
    );
g7_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3D10B1DB042E3DB1"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b2_n_0
    );
\g7_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F224891DDA441BD"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b2__0_n_0\
    );
g7_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"160ACC9F57E4C359"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b3_n_0
    );
\g7_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F417AF5C997D669"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b3__0_n_0\
    );
g7_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0D5303B5981DAA61"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b4_n_0
    );
\g7_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1A7F2CF36E72981B"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b4__0_n_0\
    );
g7_b5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0336AAD9E003992B"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b5_n_0
    );
\g7_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"06D5B0F0DAA4E007"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b5__0_n_0\
    );
g7_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F199B4AAAAD24D"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b6_n_0
    );
\g7_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01CC95A56CC70000"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b6__0_n_0\
    );
g7_b7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F878C66664924"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b7_n_0
    );
\g7_b7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"003C739325AD5555"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b7__0_n_0\
    );
g7_b8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00007F83E1E1C71C"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b8_n_0
    );
\g7_b8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0003F070E39CCCCC"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b8__0_n_0\
    );
g7_b9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000007FE01FC0FC"
    )
        port map (
      I0 => \factor_reg_rep_n_0_[0]\,
      I1 => \factor_reg_rep_n_0_[1]\,
      I2 => \factor_reg_rep_n_0_[2]\,
      I3 => \factor_reg_rep_n_0_[3]\,
      I4 => \factor_reg_rep_n_0_[4]\,
      I5 => \factor_reg_rep_n_0_[5]\,
      O => g7_b9_n_0
    );
\g7_b9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000FF01F83C3C3"
    )
        port map (
      I0 => factor(0),
      I1 => factor(1),
      I2 => factor(2),
      I3 => factor(3),
      I4 => factor(4),
      I5 => factor(5),
      O => \g7_b9__0_n_0\
    );
\mult_reg2[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => value(2),
      I1 => value(0),
      I2 => value(3),
      I3 => value(1),
      I4 => for_inv,
      O => mult_reg2_next
    );
\mult_reg2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(0),
      Q => mult_reg2(0)
    );
\mult_reg2_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(10),
      Q => mult_reg2(10)
    );
\mult_reg2_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(11),
      Q => mult_reg2(11)
    );
\mult_reg2_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(12),
      Q => mult_reg2(12)
    );
\mult_reg2_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(13),
      Q => mult_reg2(13)
    );
\mult_reg2_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(14),
      Q => mult_reg2(14)
    );
\mult_reg2_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(15),
      Q => mult_reg2(15)
    );
\mult_reg2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(1),
      Q => mult_reg2(1)
    );
\mult_reg2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(2),
      Q => mult_reg2(2)
    );
\mult_reg2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(3),
      Q => mult_reg2(3)
    );
\mult_reg2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(4),
      Q => mult_reg2(4)
    );
\mult_reg2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(5),
      Q => mult_reg2(5)
    );
\mult_reg2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(6),
      Q => mult_reg2(6)
    );
\mult_reg2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(7),
      Q => mult_reg2(7)
    );
\mult_reg2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(8),
      Q => mult_reg2(8)
    );
\mult_reg2_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => mult_reg2_next,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(9),
      Q => mult_reg2(9)
    );
\mult_reg[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000010"
    )
        port map (
      I0 => value(2),
      I1 => value(3),
      I2 => value(1),
      I3 => for_inv,
      I4 => value(0),
      O => \mult_reg[15]_i_1_n_0\
    );
\mult_reg_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(0),
      Q => mult_reg(0)
    );
\mult_reg_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(10),
      Q => mult_reg(10)
    );
\mult_reg_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(11),
      Q => mult_reg(11)
    );
\mult_reg_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(12),
      Q => mult_reg(12)
    );
\mult_reg_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(13),
      Q => mult_reg(13)
    );
\mult_reg_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(14),
      Q => mult_reg(14)
    );
\mult_reg_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(15),
      Q => mult_reg(15)
    );
\mult_reg_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(1),
      Q => mult_reg(1)
    );
\mult_reg_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(2),
      Q => mult_reg(2)
    );
\mult_reg_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(3),
      Q => mult_reg(3)
    );
\mult_reg_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(4),
      Q => mult_reg(4)
    );
\mult_reg_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(5),
      Q => mult_reg(5)
    );
\mult_reg_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(6),
      Q => mult_reg(6)
    );
\mult_reg_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(7),
      Q => mult_reg(7)
    );
\mult_reg_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(8),
      Q => mult_reg(8)
    );
\mult_reg_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \mult_reg[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => \memo_state_reg[1]\(9),
      Q => mult_reg(9)
    );
pre_resultSTFT_next0: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => mult_reg(15),
      A(28) => mult_reg(15),
      A(27) => mult_reg(15),
      A(26) => mult_reg(15),
      A(25) => mult_reg(15),
      A(24) => mult_reg(15),
      A(23) => mult_reg(15),
      A(22) => mult_reg(15),
      A(21) => mult_reg(15),
      A(20) => mult_reg(15),
      A(19) => mult_reg(15),
      A(18) => mult_reg(15),
      A(17) => mult_reg(15),
      A(16) => mult_reg(15),
      A(15 downto 0) => mult_reg(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_pre_resultSTFT_next0_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 15) => B"000",
      B(14) => pre_resultSTFT_next0_i_2_n_0,
      B(13) => pre_resultSTFT_next0_i_3_n_0,
      B(12) => pre_resultSTFT_next0_i_4_n_0,
      B(11) => pre_resultSTFT_next0_i_5_n_0,
      B(10) => pre_resultSTFT_next0_i_6_n_0,
      B(9) => pre_resultSTFT_next0_i_7_n_0,
      B(8) => pre_resultSTFT_next0_i_8_n_0,
      B(7) => pre_resultSTFT_next0_i_9_n_0,
      B(6) => pre_resultSTFT_next0_i_10_n_0,
      B(5) => pre_resultSTFT_next0_i_11_n_0,
      B(4) => pre_resultSTFT_next0_i_12_n_0,
      B(3) => pre_resultSTFT_next0_i_13_n_0,
      B(2) => pre_resultSTFT_next0_i_14_n_0,
      B(1) => pre_resultSTFT_next0_i_15_n_0,
      B(0) => pre_resultSTFT_next0_i_16_n_0,
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_pre_resultSTFT_next0_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_pre_resultSTFT_next0_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_pre_resultSTFT_next0_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => pre_resultSTFT_next0_i_1_n_0,
      CLK => clk_100MHz,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_pre_resultSTFT_next0_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_pre_resultSTFT_next0_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_pre_resultSTFT_next0_P_UNCONNECTED(47 downto 32),
      P(31) => pre_resultSTFT_next0_n_74,
      P(30) => pre_resultSTFT_next0_n_75,
      P(29) => pre_resultSTFT_next0_n_76,
      P(28) => pre_resultSTFT_next0_n_77,
      P(27) => pre_resultSTFT_next0_n_78,
      P(26) => pre_resultSTFT_next0_n_79,
      P(25) => pre_resultSTFT_next0_n_80,
      P(24) => pre_resultSTFT_next0_n_81,
      P(23) => pre_resultSTFT_next0_n_82,
      P(22) => pre_resultSTFT_next0_n_83,
      P(21) => pre_resultSTFT_next0_n_84,
      P(20) => pre_resultSTFT_next0_n_85,
      P(19) => pre_resultSTFT_next0_n_86,
      P(18) => pre_resultSTFT_next0_n_87,
      P(17) => pre_resultSTFT_next0_n_88,
      P(16) => pre_resultSTFT_next0_n_89,
      P(15) => pre_resultSTFT_next0_n_90,
      P(14) => pre_resultSTFT_next0_n_91,
      P(13) => pre_resultSTFT_next0_n_92,
      P(12) => pre_resultSTFT_next0_n_93,
      P(11) => pre_resultSTFT_next0_n_94,
      P(10) => pre_resultSTFT_next0_n_95,
      P(9) => pre_resultSTFT_next0_n_96,
      P(8) => pre_resultSTFT_next0_n_97,
      P(7) => pre_resultSTFT_next0_n_98,
      P(6) => pre_resultSTFT_next0_n_99,
      P(5) => pre_resultSTFT_next0_n_100,
      P(4) => pre_resultSTFT_next0_n_101,
      P(3) => pre_resultSTFT_next0_n_102,
      P(2) => pre_resultSTFT_next0_n_103,
      P(1) => pre_resultSTFT_next0_n_104,
      P(0) => pre_resultSTFT_next0_n_105,
      PATTERNBDETECT => NLW_pre_resultSTFT_next0_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_pre_resultSTFT_next0_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_pre_resultSTFT_next0_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_pre_resultSTFT_next0_UNDERFLOW_UNCONNECTED
    );
pre_resultSTFT_next0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000880"
    )
        port map (
      I0 => for_inv,
      I1 => value(1),
      I2 => value(2),
      I3 => value(0),
      I4 => value(3),
      O => pre_resultSTFT_next0_i_1_n_0
    );
pre_resultSTFT_next0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_42_n_0,
      I1 => pre_resultSTFT_next0_i_43_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_44_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_45_n_0,
      O => pre_resultSTFT_next0_i_10_n_0
    );
pre_resultSTFT_next0_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_46_n_0,
      I1 => pre_resultSTFT_next0_i_47_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_48_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_49_n_0,
      O => pre_resultSTFT_next0_i_11_n_0
    );
pre_resultSTFT_next0_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_50_n_0,
      I1 => pre_resultSTFT_next0_i_51_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_52_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_53_n_0,
      O => pre_resultSTFT_next0_i_12_n_0
    );
pre_resultSTFT_next0_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_54_n_0,
      I1 => pre_resultSTFT_next0_i_55_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_56_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_57_n_0,
      O => pre_resultSTFT_next0_i_13_n_0
    );
pre_resultSTFT_next0_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_58_n_0,
      I1 => pre_resultSTFT_next0_i_59_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_60_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_61_n_0,
      O => pre_resultSTFT_next0_i_14_n_0
    );
pre_resultSTFT_next0_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_62_n_0,
      I1 => pre_resultSTFT_next0_i_63_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_64_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_65_n_0,
      O => pre_resultSTFT_next0_i_15_n_0
    );
pre_resultSTFT_next0_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_66_n_0,
      I1 => pre_resultSTFT_next0_i_67_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_68_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_69_n_0,
      O => pre_resultSTFT_next0_i_16_n_0
    );
pre_resultSTFT_next0_i_17: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F8C8"
    )
        port map (
      I0 => \g2_b13__0_n_0\,
      I1 => factor(7),
      I2 => factor(6),
      I3 => \g1_b13__0_n_0\,
      O => pre_resultSTFT_next0_i_17_n_0
    );
pre_resultSTFT_next0_i_18: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b12__0_n_0\,
      I1 => g7_b12_n_0,
      O => pre_resultSTFT_next0_i_18_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_19: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b12__0_n_0\,
      I1 => \g5_b12__0_n_0\,
      O => pre_resultSTFT_next0_i_19_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4FF0"
    )
        port map (
      I0 => factor(6),
      I1 => g6_b14_n_0,
      I2 => factor(8),
      I3 => factor(7),
      O => pre_resultSTFT_next0_i_2_n_0
    );
pre_resultSTFT_next0_i_20: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b12__0_n_0\,
      I1 => \g3_b12__0_n_0\,
      O => pre_resultSTFT_next0_i_20_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_21: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b12_n_0,
      I1 => \g1_b12__0_n_0\,
      O => pre_resultSTFT_next0_i_21_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_22: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b11__0_n_0\,
      I1 => \g7_b11__0_n_0\,
      O => pre_resultSTFT_next0_i_22_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_23: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b11__0_n_0\,
      I1 => \g5_b11__0_n_0\,
      O => pre_resultSTFT_next0_i_23_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_24: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b11__0_n_0\,
      I1 => \g3_b11__0_n_0\,
      O => pre_resultSTFT_next0_i_24_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_25: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b11__0_n_0\,
      I1 => \g1_b11__0_n_0\,
      O => pre_resultSTFT_next0_i_25_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_26: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b10__0_n_0\,
      I1 => \g7_b10__0_n_0\,
      O => pre_resultSTFT_next0_i_26_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_27: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b10__0_n_0\,
      I1 => \g5_b10__0_n_0\,
      O => pre_resultSTFT_next0_i_27_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_28: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b10__0_n_0\,
      I1 => \g3_b10__0_n_0\,
      O => pre_resultSTFT_next0_i_28_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_29: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b10__0_n_0\,
      I1 => \g1_b10__0_n_0\,
      O => pre_resultSTFT_next0_i_29_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"30BBFFFF30BB0000"
    )
        port map (
      I0 => \g6_b13__0_n_0\,
      I1 => factor(7),
      I2 => \g5_b13__0_n_0\,
      I3 => factor(6),
      I4 => factor(8),
      I5 => pre_resultSTFT_next0_i_17_n_0,
      O => pre_resultSTFT_next0_i_3_n_0
    );
pre_resultSTFT_next0_i_30: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b9__0_n_0\,
      I1 => \g7_b9__0_n_0\,
      O => pre_resultSTFT_next0_i_30_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_31: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b9__0_n_0\,
      I1 => \g5_b9__0_n_0\,
      O => pre_resultSTFT_next0_i_31_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_32: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b9__0_n_0\,
      I1 => \g3_b9__0_n_0\,
      O => pre_resultSTFT_next0_i_32_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_33: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b9__0_n_0\,
      I1 => \g1_b9__0_n_0\,
      O => pre_resultSTFT_next0_i_33_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_34: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b8__0_n_0\,
      I1 => \g7_b8__0_n_0\,
      O => pre_resultSTFT_next0_i_34_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_35: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b8__0_n_0\,
      I1 => \g5_b8__0_n_0\,
      O => pre_resultSTFT_next0_i_35_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_36: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b8__0_n_0\,
      I1 => \g3_b8__0_n_0\,
      O => pre_resultSTFT_next0_i_36_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_37: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b8__0_n_0\,
      I1 => \g1_b8__0_n_0\,
      O => pre_resultSTFT_next0_i_37_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_38: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b7__0_n_0\,
      I1 => \g7_b7__0_n_0\,
      O => pre_resultSTFT_next0_i_38_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_39: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b7__0_n_0\,
      I1 => \g5_b7__0_n_0\,
      O => pre_resultSTFT_next0_i_39_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_18_n_0,
      I1 => pre_resultSTFT_next0_i_19_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_20_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_21_n_0,
      O => pre_resultSTFT_next0_i_4_n_0
    );
pre_resultSTFT_next0_i_40: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b7__0_n_0\,
      I1 => \g3_b7__0_n_0\,
      O => pre_resultSTFT_next0_i_40_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_41: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b7__0_n_0\,
      I1 => \g1_b7__0_n_0\,
      O => pre_resultSTFT_next0_i_41_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_42: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b6__0_n_0\,
      I1 => \g7_b6__0_n_0\,
      O => pre_resultSTFT_next0_i_42_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_43: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b6__0_n_0\,
      I1 => \g5_b6__0_n_0\,
      O => pre_resultSTFT_next0_i_43_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_44: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b6__0_n_0\,
      I1 => \g3_b6__0_n_0\,
      O => pre_resultSTFT_next0_i_44_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_45: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b6__0_n_0\,
      I1 => \g1_b6__0_n_0\,
      O => pre_resultSTFT_next0_i_45_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_46: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b5__0_n_0\,
      I1 => \g7_b5__0_n_0\,
      O => pre_resultSTFT_next0_i_46_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_47: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b5__0_n_0\,
      I1 => \g5_b5__0_n_0\,
      O => pre_resultSTFT_next0_i_47_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_48: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b5__0_n_0\,
      I1 => \g3_b5__0_n_0\,
      O => pre_resultSTFT_next0_i_48_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_49: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b5__0_n_0\,
      I1 => \g1_b5__0_n_0\,
      O => pre_resultSTFT_next0_i_49_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_22_n_0,
      I1 => pre_resultSTFT_next0_i_23_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_24_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_25_n_0,
      O => pre_resultSTFT_next0_i_5_n_0
    );
pre_resultSTFT_next0_i_50: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b4__0_n_0\,
      I1 => \g7_b4__0_n_0\,
      O => pre_resultSTFT_next0_i_50_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_51: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b4__0_n_0\,
      I1 => \g5_b4__0_n_0\,
      O => pre_resultSTFT_next0_i_51_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_52: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b4__0_n_0\,
      I1 => \g3_b4__0_n_0\,
      O => pre_resultSTFT_next0_i_52_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_53: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b4__0_n_0\,
      I1 => \g1_b4__0_n_0\,
      O => pre_resultSTFT_next0_i_53_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_54: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b3__0_n_0\,
      I1 => \g7_b3__0_n_0\,
      O => pre_resultSTFT_next0_i_54_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_55: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b3__0_n_0\,
      I1 => \g5_b3__0_n_0\,
      O => pre_resultSTFT_next0_i_55_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_56: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b3__0_n_0\,
      I1 => \g3_b3__0_n_0\,
      O => pre_resultSTFT_next0_i_56_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_57: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b3__0_n_0\,
      I1 => \g1_b3__0_n_0\,
      O => pre_resultSTFT_next0_i_57_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_58: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b2__0_n_0\,
      I1 => \g7_b2__0_n_0\,
      O => pre_resultSTFT_next0_i_58_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_59: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b2__0_n_0\,
      I1 => \g5_b2__0_n_0\,
      O => pre_resultSTFT_next0_i_59_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_26_n_0,
      I1 => pre_resultSTFT_next0_i_27_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_28_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_29_n_0,
      O => pre_resultSTFT_next0_i_6_n_0
    );
pre_resultSTFT_next0_i_60: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b2__0_n_0\,
      I1 => \g3_b2__0_n_0\,
      O => pre_resultSTFT_next0_i_60_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_61: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b2__0_n_0\,
      I1 => \g1_b2__0_n_0\,
      O => pre_resultSTFT_next0_i_61_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_62: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b1__0_n_0\,
      I1 => \g7_b1__0_n_0\,
      O => pre_resultSTFT_next0_i_62_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_63: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b1__0_n_0\,
      I1 => \g5_b1__0_n_0\,
      O => pre_resultSTFT_next0_i_63_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_64: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b1__0_n_0\,
      I1 => \g3_b1__0_n_0\,
      O => pre_resultSTFT_next0_i_64_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_65: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b1__0_n_0\,
      I1 => \g1_b1__0_n_0\,
      O => pre_resultSTFT_next0_i_65_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_66: unisim.vcomponents.MUXF7
     port map (
      I0 => \g6_b0__0_n_0\,
      I1 => \g7_b0__0_n_0\,
      O => pre_resultSTFT_next0_i_66_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_67: unisim.vcomponents.MUXF7
     port map (
      I0 => \g4_b0__0_n_0\,
      I1 => \g5_b0__0_n_0\,
      O => pre_resultSTFT_next0_i_67_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_68: unisim.vcomponents.MUXF7
     port map (
      I0 => \g2_b0__0_n_0\,
      I1 => \g3_b0__0_n_0\,
      O => pre_resultSTFT_next0_i_68_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_69: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b0__0_n_0\,
      I1 => \g1_b0__0_n_0\,
      O => pre_resultSTFT_next0_i_69_n_0,
      S => factor(6)
    );
pre_resultSTFT_next0_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_30_n_0,
      I1 => pre_resultSTFT_next0_i_31_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_32_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_33_n_0,
      O => pre_resultSTFT_next0_i_7_n_0
    );
pre_resultSTFT_next0_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_34_n_0,
      I1 => pre_resultSTFT_next0_i_35_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_36_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_37_n_0,
      O => pre_resultSTFT_next0_i_8_n_0
    );
pre_resultSTFT_next0_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultSTFT_next0_i_38_n_0,
      I1 => pre_resultSTFT_next0_i_39_n_0,
      I2 => factor(8),
      I3 => pre_resultSTFT_next0_i_40_n_0,
      I4 => factor(7),
      I5 => pre_resultSTFT_next0_i_41_n_0,
      O => pre_resultSTFT_next0_i_9_n_0
    );
pre_resultiSTFT0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000440"
    )
        port map (
      I0 => for_inv,
      I1 => value(1),
      I2 => value(2),
      I3 => value(0),
      I4 => value(3),
      O => pre_resultiSTFT0
    );
pre_resultiSTFT0_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(7),
      I1 => value(0),
      I2 => mult_reg2(7),
      O => B(7)
    );
pre_resultiSTFT0_i_11: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(6),
      I1 => value(0),
      I2 => mult_reg2(6),
      O => B(6)
    );
pre_resultiSTFT0_i_12: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(5),
      I1 => value(0),
      I2 => mult_reg2(5),
      O => B(5)
    );
pre_resultiSTFT0_i_13: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(4),
      I1 => value(0),
      I2 => mult_reg2(4),
      O => B(4)
    );
pre_resultiSTFT0_i_14: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(3),
      I1 => value(0),
      I2 => mult_reg2(3),
      O => B(3)
    );
pre_resultiSTFT0_i_15: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(2),
      I1 => value(0),
      I2 => mult_reg2(2),
      O => B(2)
    );
pre_resultiSTFT0_i_16: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(1),
      I1 => value(0),
      I2 => mult_reg2(1),
      O => B(1)
    );
pre_resultiSTFT0_i_17: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(0),
      I1 => value(0),
      I2 => mult_reg2(0),
      O => B(0)
    );
pre_resultiSTFT0_i_18: unisim.vcomponents.LUT5
    generic map(
      INIT => X"38383C0C"
    )
        port map (
      I0 => g5_b14_n_0,
      I1 => \factor_reg_rep_n_0_[8]\,
      I2 => \factor_reg_rep_n_0_[7]\,
      I3 => g2_b14_n_0,
      I4 => \factor_reg_rep_n_0_[6]\,
      O => A(14)
    );
pre_resultiSTFT0_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3808FFFF38080000"
    )
        port map (
      I0 => g6_b13_n_0,
      I1 => \factor_reg_rep_n_0_[7]\,
      I2 => \factor_reg_rep_n_0_[6]\,
      I3 => g5_b13_n_0,
      I4 => \factor_reg_rep_n_0_[8]\,
      I5 => pre_resultiSTFT0_i_33_n_0,
      O => A(13)
    );
pre_resultiSTFT0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(15),
      I1 => value(0),
      I2 => mult_reg2(15),
      O => B(15)
    );
pre_resultiSTFT0_i_20: unisim.vcomponents.MUXF7
     port map (
      I0 => pre_resultiSTFT0_i_34_n_0,
      I1 => pre_resultiSTFT0_i_35_n_0,
      O => A(12),
      S => \factor_reg_rep_n_0_[8]\
    );
pre_resultiSTFT0_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_36_n_0,
      I1 => pre_resultiSTFT0_i_37_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_38_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_39_n_0,
      O => A(11)
    );
pre_resultiSTFT0_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_40_n_0,
      I1 => pre_resultiSTFT0_i_41_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_42_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_43_n_0,
      O => A(10)
    );
pre_resultiSTFT0_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_44_n_0,
      I1 => pre_resultiSTFT0_i_45_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_46_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_47_n_0,
      O => A(9)
    );
pre_resultiSTFT0_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_48_n_0,
      I1 => pre_resultiSTFT0_i_49_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_50_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_51_n_0,
      O => A(8)
    );
pre_resultiSTFT0_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_52_n_0,
      I1 => pre_resultiSTFT0_i_53_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_54_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_55_n_0,
      O => A(7)
    );
pre_resultiSTFT0_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_56_n_0,
      I1 => pre_resultiSTFT0_i_57_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_58_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_59_n_0,
      O => A(6)
    );
pre_resultiSTFT0_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_60_n_0,
      I1 => pre_resultiSTFT0_i_61_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_62_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_63_n_0,
      O => A(5)
    );
pre_resultiSTFT0_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_64_n_0,
      I1 => pre_resultiSTFT0_i_65_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_66_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_67_n_0,
      O => A(4)
    );
pre_resultiSTFT0_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_68_n_0,
      I1 => pre_resultiSTFT0_i_69_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_70_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_71_n_0,
      O => A(3)
    );
pre_resultiSTFT0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(14),
      I1 => value(0),
      I2 => mult_reg2(14),
      O => B(14)
    );
pre_resultiSTFT0_i_30: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_72_n_0,
      I1 => pre_resultiSTFT0_i_73_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_74_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_75_n_0,
      O => A(2)
    );
pre_resultiSTFT0_i_31: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_76_n_0,
      I1 => pre_resultiSTFT0_i_77_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_78_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_79_n_0,
      O => A(1)
    );
pre_resultiSTFT0_i_32: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => pre_resultiSTFT0_i_80_n_0,
      I1 => pre_resultiSTFT0_i_81_n_0,
      I2 => \factor_reg_rep_n_0_[8]\,
      I3 => pre_resultiSTFT0_i_82_n_0,
      I4 => \factor_reg_rep_n_0_[7]\,
      I5 => pre_resultiSTFT0_i_83_n_0,
      O => A(0)
    );
pre_resultiSTFT0_i_33: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => g2_b13_n_0,
      I1 => \factor_reg_rep_n_0_[7]\,
      I2 => \factor_reg_rep_n_0_[6]\,
      I3 => g1_b13_n_0,
      O => pre_resultiSTFT0_i_33_n_0
    );
pre_resultiSTFT0_i_34: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => g3_b12_n_0,
      I1 => g2_b12_n_0,
      I2 => \factor_reg_rep_n_0_[7]\,
      I3 => \factor_reg_rep_n_0_[6]\,
      I4 => g1_b12_n_0,
      O => pre_resultiSTFT0_i_34_n_0
    );
pre_resultiSTFT0_i_35: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => g6_b12_n_0,
      I1 => \factor_reg_rep_n_0_[7]\,
      I2 => g5_b12_n_0,
      I3 => \factor_reg_rep_n_0_[6]\,
      I4 => g4_b12_n_0,
      O => pre_resultiSTFT0_i_35_n_0
    );
pre_resultiSTFT0_i_36: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b11_n_0,
      I1 => g7_b11_n_0,
      O => pre_resultiSTFT0_i_36_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_37: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b11_n_0,
      I1 => g5_b11_n_0,
      O => pre_resultiSTFT0_i_37_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_38: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b11_n_0,
      I1 => g3_b11_n_0,
      O => pre_resultiSTFT0_i_38_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_39: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b11_n_0,
      I1 => g1_b11_n_0,
      O => pre_resultiSTFT0_i_39_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(13),
      I1 => value(0),
      I2 => mult_reg2(13),
      O => B(13)
    );
pre_resultiSTFT0_i_40: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b10_n_0,
      I1 => g7_b10_n_0,
      O => pre_resultiSTFT0_i_40_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_41: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b10_n_0,
      I1 => g5_b10_n_0,
      O => pre_resultiSTFT0_i_41_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_42: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b10_n_0,
      I1 => g3_b10_n_0,
      O => pre_resultiSTFT0_i_42_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_43: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b10_n_0,
      I1 => g1_b10_n_0,
      O => pre_resultiSTFT0_i_43_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_44: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b9_n_0,
      I1 => g7_b9_n_0,
      O => pre_resultiSTFT0_i_44_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_45: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b9_n_0,
      I1 => g5_b9_n_0,
      O => pre_resultiSTFT0_i_45_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_46: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b9_n_0,
      I1 => g3_b9_n_0,
      O => pre_resultiSTFT0_i_46_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_47: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b9_n_0,
      I1 => g1_b9_n_0,
      O => pre_resultiSTFT0_i_47_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_48: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b8_n_0,
      I1 => g7_b8_n_0,
      O => pre_resultiSTFT0_i_48_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_49: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b8_n_0,
      I1 => g5_b8_n_0,
      O => pre_resultiSTFT0_i_49_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(12),
      I1 => value(0),
      I2 => mult_reg2(12),
      O => B(12)
    );
pre_resultiSTFT0_i_50: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b8_n_0,
      I1 => g3_b8_n_0,
      O => pre_resultiSTFT0_i_50_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_51: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b8_n_0,
      I1 => g1_b8_n_0,
      O => pre_resultiSTFT0_i_51_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_52: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b7_n_0,
      I1 => g7_b7_n_0,
      O => pre_resultiSTFT0_i_52_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_53: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b7_n_0,
      I1 => g5_b7_n_0,
      O => pre_resultiSTFT0_i_53_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_54: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b7_n_0,
      I1 => g3_b7_n_0,
      O => pre_resultiSTFT0_i_54_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_55: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b7_n_0,
      I1 => g1_b7_n_0,
      O => pre_resultiSTFT0_i_55_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_56: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b6_n_0,
      I1 => g7_b6_n_0,
      O => pre_resultiSTFT0_i_56_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_57: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b6_n_0,
      I1 => g5_b6_n_0,
      O => pre_resultiSTFT0_i_57_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_58: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b6_n_0,
      I1 => g3_b6_n_0,
      O => pre_resultiSTFT0_i_58_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_59: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b6_n_0,
      I1 => g1_b6_n_0,
      O => pre_resultiSTFT0_i_59_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(11),
      I1 => value(0),
      I2 => mult_reg2(11),
      O => B(11)
    );
pre_resultiSTFT0_i_60: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b5_n_0,
      I1 => g7_b5_n_0,
      O => pre_resultiSTFT0_i_60_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_61: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b5_n_0,
      I1 => g5_b5_n_0,
      O => pre_resultiSTFT0_i_61_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_62: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b5_n_0,
      I1 => g3_b5_n_0,
      O => pre_resultiSTFT0_i_62_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_63: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b5_n_0,
      I1 => g1_b5_n_0,
      O => pre_resultiSTFT0_i_63_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_64: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b4_n_0,
      I1 => g7_b4_n_0,
      O => pre_resultiSTFT0_i_64_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_65: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b4_n_0,
      I1 => g5_b4_n_0,
      O => pre_resultiSTFT0_i_65_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_66: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b4_n_0,
      I1 => g3_b4_n_0,
      O => pre_resultiSTFT0_i_66_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_67: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b4_n_0,
      I1 => g1_b4_n_0,
      O => pre_resultiSTFT0_i_67_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_68: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b3_n_0,
      I1 => g7_b3_n_0,
      O => pre_resultiSTFT0_i_68_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_69: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b3_n_0,
      I1 => g5_b3_n_0,
      O => pre_resultiSTFT0_i_69_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(10),
      I1 => value(0),
      I2 => mult_reg2(10),
      O => B(10)
    );
pre_resultiSTFT0_i_70: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b3_n_0,
      I1 => g3_b3_n_0,
      O => pre_resultiSTFT0_i_70_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_71: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b3_n_0,
      I1 => g1_b3_n_0,
      O => pre_resultiSTFT0_i_71_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_72: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b2_n_0,
      I1 => g7_b2_n_0,
      O => pre_resultiSTFT0_i_72_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_73: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b2_n_0,
      I1 => g5_b2_n_0,
      O => pre_resultiSTFT0_i_73_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_74: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b2_n_0,
      I1 => g3_b2_n_0,
      O => pre_resultiSTFT0_i_74_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_75: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b2_n_0,
      I1 => g1_b2_n_0,
      O => pre_resultiSTFT0_i_75_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_76: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b1_n_0,
      I1 => g7_b1_n_0,
      O => pre_resultiSTFT0_i_76_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_77: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b1_n_0,
      I1 => g5_b1_n_0,
      O => pre_resultiSTFT0_i_77_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_78: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b1_n_0,
      I1 => g3_b1_n_0,
      O => pre_resultiSTFT0_i_78_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_79: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b1_n_0,
      I1 => g1_b1_n_0,
      O => pre_resultiSTFT0_i_79_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(9),
      I1 => value(0),
      I2 => mult_reg2(9),
      O => B(9)
    );
pre_resultiSTFT0_i_80: unisim.vcomponents.MUXF7
     port map (
      I0 => g6_b0_n_0,
      I1 => g7_b0_n_0,
      O => pre_resultiSTFT0_i_80_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_81: unisim.vcomponents.MUXF7
     port map (
      I0 => g4_b0_n_0,
      I1 => g5_b0_n_0,
      O => pre_resultiSTFT0_i_81_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_82: unisim.vcomponents.MUXF7
     port map (
      I0 => g2_b0_n_0,
      I1 => g3_b0_n_0,
      O => pre_resultiSTFT0_i_82_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_83: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b0_n_0,
      I1 => g1_b0_n_0,
      O => pre_resultiSTFT0_i_83_n_0,
      S => \factor_reg_rep_n_0_[6]\
    );
pre_resultiSTFT0_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mult_reg(8),
      I1 => value(0),
      I2 => mult_reg2(8),
      O => B(8)
    );
ram_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2000"
    )
        port map (
      I0 => memo_state(1),
      I1 => memo_state(0),
      I2 => for_inv,
      I3 => end_proc_win,
      I4 => read_samplen,
      I5 => read_samplenn,
      O => ena
    );
ram_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(4),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(4),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(4)
    );
ram_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(3),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(3),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(3)
    );
ram_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(2),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(2),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(2)
    );
ram_i_13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(1),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(1),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(1)
    );
ram_i_14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(0),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(0),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(0)
    );
ram_i_15: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(15),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(15),
      O => dina(15)
    );
ram_i_16: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(14),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(14),
      O => dina(14)
    );
ram_i_17: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(13),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(13),
      O => dina(13)
    );
ram_i_18: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(12),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(12),
      O => dina(12)
    );
ram_i_19: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(11),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(11),
      O => dina(11)
    );
ram_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002000"
    )
        port map (
      I0 => memo_state(1),
      I1 => memo_state(0),
      I2 => for_inv,
      I3 => end_proc_win,
      I4 => read_samplen,
      I5 => read_samplenn,
      O => wea(0)
    );
ram_i_20: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(10),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(10),
      O => dina(10)
    );
ram_i_21: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(9),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(9),
      O => dina(9)
    );
ram_i_22: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(8),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(8),
      O => dina(8)
    );
ram_i_23: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(7),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(7),
      O => dina(7)
    );
ram_i_24: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(6),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(6),
      O => dina(6)
    );
ram_i_25: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(5),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(5),
      O => dina(5)
    );
ram_i_26: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(4),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(4),
      O => dina(4)
    );
ram_i_27: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(3),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(3),
      O => dina(3)
    );
ram_i_28: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(2),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(2),
      O => dina(2)
    );
ram_i_29: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(1),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(1),
      O => dina(1)
    );
ram_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(11),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(11),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(11)
    );
ram_i_30: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => result1buf(0),
      I1 => \^buf1_2\,
      I2 => \^output_sample_reg[15]\(0),
      O => dina(0)
    );
ram_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(10),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(10),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(10)
    );
ram_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(9),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(9),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(9)
    );
ram_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(8),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(8),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(8)
    );
ram_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(7),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(7),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(7)
    );
ram_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(6),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(6),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(6)
    );
ram_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8BB"
    )
        port map (
      I0 => Q(5),
      I1 => \^write_address_reg[0]\,
      I2 => \read_address_reg[11]\(5),
      I3 => read_samplen,
      I4 => read_samplenn,
      O => addra(5)
    );
\result1buf[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_90,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(0),
      O => result1_next(0)
    );
\result1buf[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_80,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(10),
      O => result1_next(10)
    );
\result1buf[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_79,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(11),
      O => result1_next(11)
    );
\result1buf[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_78,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(12),
      O => result1_next(12)
    );
\result1buf[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => \result1buf_reg[15]_i_2_0\,
      I1 => pre_resultSTFT_next0_n_77,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(13),
      O => result1_next(13)
    );
\result1buf[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_76,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(14),
      O => result1_next(14)
    );
\result1buf[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F80808000000000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_75,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => \result1buf_reg[15]_i_3_0\,
      I4 => P(15),
      I5 => value(2),
      O => result1_next(15)
    );
\result1buf[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF14000000"
    )
        port map (
      I0 => value(3),
      I1 => value(0),
      I2 => value(2),
      I3 => value(1),
      I4 => for_inv,
      I5 => \result1buf_reg[15]_i_2_0\,
      O => \result1buf_reg[15]_i_2\
    );
\result1buf[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00001400"
    )
        port map (
      I0 => value(3),
      I1 => value(0),
      I2 => value(2),
      I3 => value(1),
      I4 => for_inv,
      I5 => \result1buf_reg[15]_i_3_0\,
      O => \result1buf_reg[15]_i_3\
    );
\result1buf[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_89,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(1),
      O => result1_next(1)
    );
\result1buf[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => \result1buf_reg[15]_i_2_0\,
      I1 => pre_resultSTFT_next0_n_88,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(2),
      O => result1_next(2)
    );
\result1buf[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_87,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(3),
      O => result1_next(3)
    );
\result1buf[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_86,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(4),
      O => result1_next(4)
    );
\result1buf[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_85,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(5),
      O => result1_next(5)
    );
\result1buf[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_84,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(6),
      O => result1_next(6)
    );
\result1buf[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_83,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(7),
      O => result1_next(7)
    );
\result1buf[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => pre_resultSTFT_next0_n_82,
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(8),
      O => result1_next(8)
    );
\result1buf[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F00800080008000"
    )
        port map (
      I0 => \result1buf_reg[15]_i_2_0\,
      I1 => pre_resultSTFT_next0_n_81,
      I2 => for_inv,
      I3 => value(2),
      I4 => \result1buf_reg[15]_i_3_0\,
      I5 => P(9),
      O => result1_next(9)
    );
\result1buf_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(0),
      Q => result1buf(0)
    );
\result1buf_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(10),
      Q => result1buf(10)
    );
\result1buf_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(11),
      Q => result1buf(11)
    );
\result1buf_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(12),
      Q => result1buf(12)
    );
\result1buf_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(13),
      Q => result1buf(13)
    );
\result1buf_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(14),
      Q => result1buf(14)
    );
\result1buf_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(15),
      Q => result1buf(15)
    );
\result1buf_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(1),
      Q => result1buf(1)
    );
\result1buf_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(2),
      Q => result1buf(2)
    );
\result1buf_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(3),
      Q => result1buf(3)
    );
\result1buf_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(4),
      Q => result1buf(4)
    );
\result1buf_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(5),
      Q => result1buf(5)
    );
\result1buf_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(6),
      Q => result1buf(6)
    );
\result1buf_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(7),
      Q => result1buf(7)
    );
\result1buf_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(8),
      Q => result1buf(8)
    );
\result1buf_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \factor_rep[8]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result1_next(9),
      Q => result1buf(9)
    );
result2_next0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => result2_next0_carry_n_0,
      CO(2) => result2_next0_carry_n_1,
      CO(1) => result2_next0_carry_n_2,
      CO(0) => result2_next0_carry_n_3,
      CYINIT => '0',
      DI(3 downto 0) => result1buf(3 downto 0),
      O(3 downto 0) => result2_next0(3 downto 0),
      S(3) => result2_next0_carry_i_1_n_0,
      S(2) => result2_next0_carry_i_2_n_0,
      S(1) => result2_next0_carry_i_3_n_0,
      S(0) => result2_next0_carry_i_4_n_0
    );
\result2_next0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => result2_next0_carry_n_0,
      CO(3) => \result2_next0_carry__0_n_0\,
      CO(2) => \result2_next0_carry__0_n_1\,
      CO(1) => \result2_next0_carry__0_n_2\,
      CO(0) => \result2_next0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => result1buf(7 downto 4),
      O(3 downto 0) => result2_next0(7 downto 4),
      S(3) => \result2_next0_carry__0_i_1_n_0\,
      S(2) => \result2_next0_carry__0_i_2_n_0\,
      S(1) => \result2_next0_carry__0_i_3_n_0\,
      S(0) => \result2_next0_carry__0_i_4_n_0\
    );
\result2_next0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(7),
      I1 => \^output_sample_reg[15]\(7),
      O => \result2_next0_carry__0_i_1_n_0\
    );
\result2_next0_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(6),
      I1 => \^output_sample_reg[15]\(6),
      O => \result2_next0_carry__0_i_2_n_0\
    );
\result2_next0_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(5),
      I1 => \^output_sample_reg[15]\(5),
      O => \result2_next0_carry__0_i_3_n_0\
    );
\result2_next0_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(4),
      I1 => \^output_sample_reg[15]\(4),
      O => \result2_next0_carry__0_i_4_n_0\
    );
\result2_next0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \result2_next0_carry__0_n_0\,
      CO(3) => \result2_next0_carry__1_n_0\,
      CO(2) => \result2_next0_carry__1_n_1\,
      CO(1) => \result2_next0_carry__1_n_2\,
      CO(0) => \result2_next0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => result1buf(11 downto 8),
      O(3 downto 0) => result2_next0(11 downto 8),
      S(3) => \result2_next0_carry__1_i_1_n_0\,
      S(2) => \result2_next0_carry__1_i_2_n_0\,
      S(1) => \result2_next0_carry__1_i_3_n_0\,
      S(0) => \result2_next0_carry__1_i_4_n_0\
    );
\result2_next0_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(11),
      I1 => \^output_sample_reg[15]\(11),
      O => \result2_next0_carry__1_i_1_n_0\
    );
\result2_next0_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(10),
      I1 => \^output_sample_reg[15]\(10),
      O => \result2_next0_carry__1_i_2_n_0\
    );
\result2_next0_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(9),
      I1 => \^output_sample_reg[15]\(9),
      O => \result2_next0_carry__1_i_3_n_0\
    );
\result2_next0_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(8),
      I1 => \^output_sample_reg[15]\(8),
      O => \result2_next0_carry__1_i_4_n_0\
    );
\result2_next0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \result2_next0_carry__1_n_0\,
      CO(3) => \NLW_result2_next0_carry__2_CO_UNCONNECTED\(3),
      CO(2) => \result2_next0_carry__2_n_1\,
      CO(1) => \result2_next0_carry__2_n_2\,
      CO(0) => \result2_next0_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => result1buf(14 downto 12),
      O(3 downto 0) => result2_next0(15 downto 12),
      S(3) => \result2_next0_carry__2_i_1_n_0\,
      S(2) => \result2_next0_carry__2_i_2_n_0\,
      S(1) => \result2_next0_carry__2_i_3_n_0\,
      S(0) => \result2_next0_carry__2_i_4_n_0\
    );
\result2_next0_carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^output_sample_reg[15]\(15),
      I1 => result1buf(15),
      O => \result2_next0_carry__2_i_1_n_0\
    );
\result2_next0_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(14),
      I1 => \^output_sample_reg[15]\(14),
      O => \result2_next0_carry__2_i_2_n_0\
    );
\result2_next0_carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(13),
      I1 => \^output_sample_reg[15]\(13),
      O => \result2_next0_carry__2_i_3_n_0\
    );
\result2_next0_carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(12),
      I1 => \^output_sample_reg[15]\(12),
      O => \result2_next0_carry__2_i_4_n_0\
    );
result2_next0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(3),
      I1 => \^output_sample_reg[15]\(3),
      O => result2_next0_carry_i_1_n_0
    );
result2_next0_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(2),
      I1 => \^output_sample_reg[15]\(2),
      O => result2_next0_carry_i_2_n_0
    );
result2_next0_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(1),
      I1 => \^output_sample_reg[15]\(1),
      O => result2_next0_carry_i_3_n_0
    );
result2_next0_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => result1buf(0),
      I1 => \^output_sample_reg[15]\(0),
      O => result2_next0_carry_i_4_n_0
    );
\result2buf[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_90,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[0]_i_2_n_0\,
      O => result2_next(0)
    );
\result2buf[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(0),
      I3 => value(0),
      I4 => result2_next0(0),
      I5 => for_inv,
      O => \result2buf[0]_i_2_n_0\
    );
\result2buf[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_80,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[10]_i_2_n_0\,
      O => result2_next(10)
    );
\result2buf[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(10),
      I3 => value(0),
      I4 => result2_next0(10),
      I5 => for_inv,
      O => \result2buf[10]_i_2_n_0\
    );
\result2buf[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_79,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[11]_i_2_n_0\,
      O => result2_next(11)
    );
\result2buf[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(11),
      I3 => value(0),
      I4 => result2_next0(11),
      I5 => for_inv,
      O => \result2buf[11]_i_2_n_0\
    );
\result2buf[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_78,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[12]_i_2_n_0\,
      O => result2_next(12)
    );
\result2buf[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(12),
      I3 => value(0),
      I4 => result2_next0(12),
      I5 => for_inv,
      O => \result2buf[12]_i_2_n_0\
    );
\result2buf[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => pre_resultSTFT_next0_n_77,
      I3 => for_inv,
      I4 => \result2buf[13]_i_2_n_0\,
      O => result2_next(13)
    );
\result2buf[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(13),
      I3 => value(0),
      I4 => result2_next0(13),
      O => \result2buf[13]_i_2_n_0\
    );
\result2buf[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_76,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[14]_i_2_n_0\,
      O => result2_next(14)
    );
\result2buf[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(14),
      I3 => value(0),
      I4 => result2_next0(14),
      I5 => for_inv,
      O => \result2buf[14]_i_2_n_0\
    );
\result2buf[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001C300"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => value(1),
      I3 => value(0),
      I4 => value(3),
      O => \result2buf[15]_i_1_n_0\
    );
\result2buf[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_75,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[15]_i_3_n_0\,
      O => result2_next(15)
    );
\result2buf[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => \result1buf_reg[15]_i_3_0\,
      I1 => P(15),
      I2 => value(2),
      I3 => value(0),
      I4 => result2_next0(15),
      I5 => for_inv,
      O => \result2buf[15]_i_3_n_0\
    );
\result2buf[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_89,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[1]_i_2_n_0\,
      O => result2_next(1)
    );
\result2buf[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(1),
      I3 => value(0),
      I4 => result2_next0(1),
      I5 => for_inv,
      O => \result2buf[1]_i_2_n_0\
    );
\result2buf[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => pre_resultSTFT_next0_n_88,
      I3 => for_inv,
      I4 => \result2buf[2]_i_2_n_0\,
      O => result2_next(2)
    );
\result2buf[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(2),
      I3 => value(0),
      I4 => result2_next0(2),
      O => \result2buf[2]_i_2_n_0\
    );
\result2buf[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_87,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[3]_i_2_n_0\,
      O => result2_next(3)
    );
\result2buf[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(3),
      I3 => value(0),
      I4 => result2_next0(3),
      I5 => for_inv,
      O => \result2buf[3]_i_2_n_0\
    );
\result2buf[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_86,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[4]_i_2_n_0\,
      O => result2_next(4)
    );
\result2buf[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(4),
      I3 => value(0),
      I4 => result2_next0(4),
      I5 => for_inv,
      O => \result2buf[4]_i_2_n_0\
    );
\result2buf[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_85,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[5]_i_2_n_0\,
      O => result2_next(5)
    );
\result2buf[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(5),
      I3 => value(0),
      I4 => result2_next0(5),
      I5 => for_inv,
      O => \result2buf[5]_i_2_n_0\
    );
\result2buf[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_84,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[6]_i_2_n_0\,
      O => result2_next(6)
    );
\result2buf[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(6),
      I3 => value(0),
      I4 => result2_next0(6),
      I5 => for_inv,
      O => \result2buf[6]_i_2_n_0\
    );
\result2buf[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_83,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[7]_i_2_n_0\,
      O => result2_next(7)
    );
\result2buf[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(7),
      I3 => value(0),
      I4 => result2_next0(7),
      I5 => for_inv,
      O => \result2buf[7]_i_2_n_0\
    );
\result2buf[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => for_inv,
      I1 => value(2),
      I2 => pre_resultSTFT_next0_n_82,
      I3 => \result1buf_reg[15]_i_2_0\,
      I4 => \result2buf[8]_i_2_n_0\,
      O => result2_next(8)
    );
\result2buf[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(8),
      I3 => value(0),
      I4 => result2_next0(8),
      I5 => for_inv,
      O => \result2buf[8]_i_2_n_0\
    );
\result2buf[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_2_0\,
      I2 => pre_resultSTFT_next0_n_81,
      I3 => for_inv,
      I4 => \result2buf[9]_i_2_n_0\,
      O => result2_next(9)
    );
\result2buf[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FF8000"
    )
        port map (
      I0 => value(2),
      I1 => \result1buf_reg[15]_i_3_0\,
      I2 => P(9),
      I3 => value(0),
      I4 => result2_next0(9),
      O => \result2buf[9]_i_2_n_0\
    );
\result2buf_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(0),
      Q => \^output_sample_reg[15]\(0)
    );
\result2buf_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(10),
      Q => \^output_sample_reg[15]\(10)
    );
\result2buf_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(11),
      Q => \^output_sample_reg[15]\(11)
    );
\result2buf_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(12),
      Q => \^output_sample_reg[15]\(12)
    );
\result2buf_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(13),
      Q => \^output_sample_reg[15]\(13)
    );
\result2buf_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(14),
      Q => \^output_sample_reg[15]\(14)
    );
\result2buf_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(15),
      Q => \^output_sample_reg[15]\(15)
    );
\result2buf_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(1),
      Q => \^output_sample_reg[15]\(1)
    );
\result2buf_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(2),
      Q => \^output_sample_reg[15]\(2)
    );
\result2buf_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(3),
      Q => \^output_sample_reg[15]\(3)
    );
\result2buf_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(4),
      Q => \^output_sample_reg[15]\(4)
    );
\result2buf_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(5),
      Q => \^output_sample_reg[15]\(5)
    );
\result2buf_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(6),
      Q => \^output_sample_reg[15]\(6)
    );
\result2buf_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(7),
      Q => \^output_sample_reg[15]\(7)
    );
\result2buf_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(8),
      Q => \^output_sample_reg[15]\(8)
    );
\result2buf_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \result2buf[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2_next(9),
      Q => \^output_sample_reg[15]\(9)
    );
\value[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => value(0),
      I1 => start_proc_win,
      I2 => working,
      O => \value[0]_i_1_n_0\
    );
\value[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0EE0"
    )
        port map (
      I0 => start_proc_win,
      I1 => working,
      I2 => value(1),
      I3 => value(0),
      O => \value[1]_i_1_n_0\
    );
\value[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0EEEE000"
    )
        port map (
      I0 => start_proc_win,
      I1 => working,
      I2 => value(0),
      I3 => value(1),
      I4 => value(2),
      O => \value[2]_i_1_n_0\
    );
\value[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0EEEEEEEE0000000"
    )
        port map (
      I0 => start_proc_win,
      I1 => working,
      I2 => value(1),
      I3 => value(0),
      I4 => value(2),
      I5 => value(3),
      O => \value[3]_i_1_n_0\
    );
\value_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \value[0]_i_1_n_0\,
      Q => value(0)
    );
\value_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \value[1]_i_1_n_0\,
      Q => value(1)
    );
\value_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \value[2]_i_1_n_0\,
      Q => value(2)
    );
\value_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \value[3]_i_1_n_0\,
      Q => value(3)
    );
working_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0EEEEEEEEEEEEEEE"
    )
        port map (
      I0 => working,
      I1 => start_proc_win,
      I2 => value(3),
      I3 => value(2),
      I4 => value(0),
      I5 => value(1),
      O => working_i_1_n_0
    );
working_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => working_i_1_n_0,
      Q => working
    );
\write_address[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \write_address2_reg[11]\(0),
      I1 => \^buf1_2\,
      I2 => \write_address1_reg[10]\(0),
      O => D(0)
    );
\write_address[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \write_address2_reg[11]\(5),
      I1 => \^buf1_2\,
      I2 => \write_address1_reg[10]\(1),
      O => D(10)
    );
\write_address[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => end_proc_win,
      I1 => for_inv,
      I2 => memo_state(0),
      I3 => memo_state(1),
      O => \^write_address_reg[0]\
    );
\write_address[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^buf1_2\,
      I1 => \write_address2_reg[11]\(6),
      O => D(11)
    );
\write_address[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_reg[1]\,
      I1 => \^buf1_2\,
      I2 => \buffer1_reg[1]\,
      O => D(1)
    );
\write_address[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_reg[2]\,
      I1 => \^buf1_2\,
      I2 => \buffer1_reg[2]\,
      O => D(2)
    );
\write_address[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_reg[3]\,
      I1 => \^buf1_2\,
      I2 => \buffer1_reg[3]\,
      O => D(3)
    );
\write_address[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_reg[4]\,
      I1 => \^buf1_2\,
      I2 => \buffer1_reg[4]\,
      O => D(4)
    );
\write_address[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \buffer2_reg[5]\,
      I1 => \^buf1_2\,
      I2 => \buffer1_reg[5]\,
      O => D(5)
    );
\write_address[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \write_address2_reg[11]\(1),
      I1 => \^buf1_2\,
      I2 => \buffer1_reg[6]\,
      O => D(6)
    );
\write_address[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \write_address2_reg[11]\(2),
      I1 => \^buf1_2\,
      I2 => \buffer1_reg[7]\,
      O => D(7)
    );
\write_address[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \write_address2_reg[11]\(3),
      I1 => \^buf1_2\,
      I2 => \buffer1_reg[8]\,
      O => D(8)
    );
\write_address[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^buf1_2\,
      I1 => \write_address2_reg[11]\(4),
      O => D(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ram_memory_blk_mem_gen_prim_wrapper is
  port (
    douta : out STD_LOGIC_VECTOR ( 8 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 8 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ram_memory_blk_mem_gen_prim_wrapper : entity is "blk_mem_gen_prim_wrapper";
end ram_memory_blk_mem_gen_prim_wrapper;

architecture STRUCTURE of ram_memory_blk_mem_gen_prim_wrapper is
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 1,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "NO_CHANGE",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"111",
      ADDRBWRADDR(15 downto 0) => B"0000000000000000",
      CASCADEINA => '0',
      CASCADEINB => '0',
      CASCADEOUTA => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\,
      DIADI(31 downto 8) => B"000000000000000000000000",
      DIADI(7 downto 0) => dina(7 downto 0),
      DIBDI(31 downto 0) => B"00000000000000000000000000000000",
      DIPADIP(3 downto 1) => B"000",
      DIPADIP(0) => dina(8),
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 8) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED\(31 downto 8),
      DOADO(7 downto 0) => douta(7 downto 0),
      DOBDO(31 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED\(31 downto 0),
      DOPADOP(3 downto 1) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED\(3 downto 1),
      DOPADOP(0) => douta(8),
      DOPBDOP(3 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => ena,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => ena,
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\,
      WEA(3) => wea(0),
      WEA(2) => wea(0),
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(7 downto 0) => B"00000000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \ram_memory_blk_mem_gen_prim_wrapper__parameterized0\ is
  port (
    douta : out STD_LOGIC_VECTOR ( 6 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 6 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memory_blk_mem_gen_prim_wrapper__parameterized0\ : entity is "blk_mem_gen_prim_wrapper";
end \ram_memory_blk_mem_gen_prim_wrapper__parameterized0\;

architecture STRUCTURE of \ram_memory_blk_mem_gen_prim_wrapper__parameterized0\ is
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_45\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 1,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "NO_CHANGE",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"111",
      ADDRBWRADDR(15 downto 0) => B"0000000000000000",
      CASCADEINA => '0',
      CASCADEINB => '0',
      CASCADEOUTA => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\,
      DIADI(31 downto 7) => B"0000000000000000000000000",
      DIADI(6 downto 0) => dina(6 downto 0),
      DIBDI(31 downto 0) => B"00000000000000000000000000000000",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 8) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED\(31 downto 8),
      DOADO(7) => \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_45\,
      DOADO(6 downto 0) => douta(6 downto 0),
      DOBDO(31 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED\(31 downto 0),
      DOPADOP(3 downto 1) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED\(3 downto 1),
      DOPADOP(0) => \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88\,
      DOPBDOP(3 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => ena,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => ena,
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\,
      WEA(3) => wea(0),
      WEA(2) => wea(0),
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(7 downto 0) => B"00000000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_generator is
  port (
    clk_100MHz : out STD_LOGIC;
    clk_50MHz : out STD_LOGIC;
    clk_fpga : in STD_LOGIC
  );
end clk_generator;

architecture STRUCTURE of clk_generator is
begin
inst: entity work.clk_generator_clk_generator_clk_wiz
     port map (
      clk_100MHz => clk_100MHz,
      clk_50MHz => clk_50MHz,
      clk_fpga => clk_fpga
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_interface is
  port (
    seg_OBUF : out STD_LOGIC_VECTOR ( 6 downto 0 );
    an_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk_100MHz : in STD_LOGIC;
    reset_IBUF : in STD_LOGIC;
    state : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end display_interface;

architecture STRUCTURE of display_interface is
  signal curr_display : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \curr_display[0]_i_1_n_0\ : STD_LOGIC;
  signal \curr_display[1]_i_1_n_0\ : STD_LOGIC;
  signal \curr_display[2]_i_1_n_0\ : STD_LOGIC;
  signal ref_rate : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \an_OBUF[0]_inst_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \an_OBUF[1]_inst_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \an_OBUF[2]_inst_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \an_OBUF[3]_inst_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \an_OBUF[4]_inst_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \an_OBUF[5]_inst_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \an_OBUF[6]_inst_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \an_OBUF[7]_inst_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \curr_display[1]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \curr_display[2]_i_1\ : label is "soft_lutpair63";
begin
\an_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => curr_display(2),
      I1 => curr_display(1),
      I2 => curr_display(0),
      O => an_OBUF(0)
    );
\an_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => curr_display(2),
      I1 => curr_display(0),
      I2 => curr_display(1),
      O => an_OBUF(1)
    );
\an_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => curr_display(2),
      I1 => curr_display(1),
      I2 => curr_display(0),
      O => an_OBUF(2)
    );
\an_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => curr_display(1),
      I1 => curr_display(2),
      I2 => curr_display(0),
      O => an_OBUF(3)
    );
\an_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => curr_display(2),
      I1 => curr_display(1),
      I2 => curr_display(0),
      O => an_OBUF(4)
    );
\an_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => curr_display(0),
      I1 => curr_display(1),
      I2 => curr_display(2),
      O => an_OBUF(5)
    );
\an_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => curr_display(2),
      I1 => curr_display(1),
      I2 => curr_display(0),
      O => an_OBUF(6)
    );
\an_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => curr_display(1),
      I1 => curr_display(2),
      I2 => curr_display(0),
      O => an_OBUF(7)
    );
counter_assig: entity work.display_counter
     port map (
      clk_100MHz => clk_100MHz,
      ref_rate => ref_rate,
      reset_IBUF => reset_IBUF
    );
\curr_display[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => ref_rate,
      I1 => curr_display(0),
      O => \curr_display[0]_i_1_n_0\
    );
\curr_display[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => curr_display(0),
      I1 => ref_rate,
      I2 => curr_display(1),
      O => \curr_display[1]_i_1_n_0\
    );
\curr_display[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => curr_display(1),
      I1 => curr_display(0),
      I2 => ref_rate,
      I3 => curr_display(2),
      O => \curr_display[2]_i_1_n_0\
    );
\curr_display_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      D => \curr_display[0]_i_1_n_0\,
      Q => curr_display(0),
      R => '0'
    );
\curr_display_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      D => \curr_display[1]_i_1_n_0\,
      Q => curr_display(1),
      R => '0'
    );
\curr_display_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      D => \curr_display[2]_i_1_n_0\,
      Q => curr_display(2),
      R => '0'
    );
\seg_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBDBDFFFFA99F"
    )
        port map (
      I0 => curr_display(1),
      I1 => curr_display(2),
      I2 => curr_display(0),
      I3 => state(0),
      I4 => reset_IBUF,
      I5 => state(1),
      O => seg_OBUF(0)
    );
\seg_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFCFCFFFFF2FDFF"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => reset_IBUF,
      I3 => curr_display(2),
      I4 => curr_display(1),
      I5 => curr_display(0),
      O => seg_OBUF(1)
    );
\seg_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEECCFFEFFFFF"
    )
        port map (
      I0 => state(1),
      I1 => reset_IBUF,
      I2 => state(0),
      I3 => curr_display(0),
      I4 => curr_display(2),
      I5 => curr_display(1),
      O => seg_OBUF(2)
    );
\seg_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBEFEEEFFBEFFFEB"
    )
        port map (
      I0 => reset_IBUF,
      I1 => curr_display(2),
      I2 => curr_display(1),
      I3 => curr_display(0),
      I4 => state(1),
      I5 => state(0),
      O => seg_OBUF(3)
    );
\seg_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAF0FBF5FAF1FBF5"
    )
        port map (
      I0 => curr_display(2),
      I1 => state(1),
      I2 => reset_IBUF,
      I3 => curr_display(1),
      I4 => curr_display(0),
      I5 => state(0),
      O => seg_OBUF(4)
    );
\seg_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCFFFF3FFC1FFC3"
    )
        port map (
      I0 => state(0),
      I1 => curr_display(1),
      I2 => curr_display(2),
      I3 => reset_IBUF,
      I4 => curr_display(0),
      I5 => state(1),
      O => seg_OBUF(5)
    );
\seg_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF8D8DC99B"
    )
        port map (
      I0 => curr_display(2),
      I1 => curr_display(1),
      I2 => curr_display(0),
      I3 => state(0),
      I4 => state(1),
      I5 => reset_IBUF,
      O => seg_OBUF(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ram_memory_blk_mem_gen_prim_width is
  port (
    douta : out STD_LOGIC_VECTOR ( 8 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 8 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ram_memory_blk_mem_gen_prim_width : entity is "blk_mem_gen_prim_width";
end ram_memory_blk_mem_gen_prim_width;

architecture STRUCTURE of ram_memory_blk_mem_gen_prim_width is
begin
\prim_noinit.ram\: entity work.ram_memory_blk_mem_gen_prim_wrapper
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      dina(8 downto 0) => dina(8 downto 0),
      douta(8 downto 0) => douta(8 downto 0),
      ena => ena,
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \ram_memory_blk_mem_gen_prim_width__parameterized0\ is
  port (
    douta : out STD_LOGIC_VECTOR ( 6 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 6 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memory_blk_mem_gen_prim_width__parameterized0\ : entity is "blk_mem_gen_prim_width";
end \ram_memory_blk_mem_gen_prim_width__parameterized0\;

architecture STRUCTURE of \ram_memory_blk_mem_gen_prim_width__parameterized0\ is
begin
\prim_noinit.ram\: entity work.\ram_memory_blk_mem_gen_prim_wrapper__parameterized0\
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      dina(6 downto 0) => dina(6 downto 0),
      douta(6 downto 0) => douta(6 downto 0),
      ena => ena,
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ram_memory_blk_mem_gen_generic_cstr is
  port (
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ram_memory_blk_mem_gen_generic_cstr : entity is "blk_mem_gen_generic_cstr";
end ram_memory_blk_mem_gen_generic_cstr;

architecture STRUCTURE of ram_memory_blk_mem_gen_generic_cstr is
begin
\ramloop[0].ram.r\: entity work.ram_memory_blk_mem_gen_prim_width
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      dina(8 downto 0) => dina(8 downto 0),
      douta(8 downto 0) => douta(8 downto 0),
      ena => ena,
      wea(0) => wea(0)
    );
\ramloop[1].ram.r\: entity work.\ram_memory_blk_mem_gen_prim_width__parameterized0\
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      dina(6 downto 0) => dina(15 downto 9),
      douta(6 downto 0) => douta(15 downto 9),
      ena => ena,
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ram_memory_blk_mem_gen_top is
  port (
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ram_memory_blk_mem_gen_top : entity is "blk_mem_gen_top";
end ram_memory_blk_mem_gen_top;

architecture STRUCTURE of ram_memory_blk_mem_gen_top is
begin
\valid.cstr\: entity work.ram_memory_blk_mem_gen_generic_cstr
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      dina(15 downto 0) => dina(15 downto 0),
      douta(15 downto 0) => douta(15 downto 0),
      ena => ena,
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ram_memory_blk_mem_gen_v8_4_1_synth is
  port (
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ram_memory_blk_mem_gen_v8_4_1_synth : entity is "blk_mem_gen_v8_4_1_synth";
end ram_memory_blk_mem_gen_v8_4_1_synth;

architecture STRUCTURE of ram_memory_blk_mem_gen_v8_4_1_synth is
begin
\gnbram.gnativebmg.native_blk_mem_gen\: entity work.ram_memory_blk_mem_gen_top
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      dina(15 downto 0) => dina(15 downto 0),
      douta(15 downto 0) => douta(15 downto 0),
      ena => ena,
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ram_memory_blk_mem_gen_v8_4_1 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    eccpipece : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    rdaddrecc : out STD_LOGIC_VECTOR ( 11 downto 0 );
    sleep : in STD_LOGIC;
    deepsleep : in STD_LOGIC;
    shutdown : in STD_LOGIC;
    rsta_busy : out STD_LOGIC;
    rstb_busy : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_injectsbiterr : in STD_LOGIC;
    s_axi_injectdbiterr : in STD_LOGIC;
    s_axi_sbiterr : out STD_LOGIC;
    s_axi_dbiterr : out STD_LOGIC;
    s_axi_rdaddrecc : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of ram_memory_blk_mem_gen_v8_4_1 : entity is 12;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of ram_memory_blk_mem_gen_v8_4_1 : entity is 12;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of ram_memory_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of ram_memory_blk_mem_gen_v8_4_1 : entity is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of ram_memory_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of ram_memory_blk_mem_gen_v8_4_1 : entity is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of ram_memory_blk_mem_gen_v8_4_1 : entity is "0";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of ram_memory_blk_mem_gen_v8_4_1 : entity is "2";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of ram_memory_blk_mem_gen_v8_4_1 : entity is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of ram_memory_blk_mem_gen_v8_4_1 : entity is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of ram_memory_blk_mem_gen_v8_4_1 : entity is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of ram_memory_blk_mem_gen_v8_4_1 : entity is "Estimated Power for IP     :     4.4167 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of ram_memory_blk_mem_gen_v8_4_1 : entity is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of ram_memory_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of ram_memory_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of ram_memory_blk_mem_gen_v8_4_1 : entity is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of ram_memory_blk_mem_gen_v8_4_1 : entity is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of ram_memory_blk_mem_gen_v8_4_1 : entity is "ram_memory.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of ram_memory_blk_mem_gen_v8_4_1 : entity is "no_coe_file_loaded";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of ram_memory_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of ram_memory_blk_mem_gen_v8_4_1 : entity is 4096;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of ram_memory_blk_mem_gen_v8_4_1 : entity is 4096;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of ram_memory_blk_mem_gen_v8_4_1 : entity is 16;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of ram_memory_blk_mem_gen_v8_4_1 : entity is 16;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of ram_memory_blk_mem_gen_v8_4_1 : entity is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of ram_memory_blk_mem_gen_v8_4_1 : entity is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of ram_memory_blk_mem_gen_v8_4_1 : entity is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of ram_memory_blk_mem_gen_v8_4_1 : entity is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of ram_memory_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of ram_memory_blk_mem_gen_v8_4_1 : entity is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of ram_memory_blk_mem_gen_v8_4_1 : entity is 4096;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of ram_memory_blk_mem_gen_v8_4_1 : entity is 4096;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of ram_memory_blk_mem_gen_v8_4_1 : entity is "NO_CHANGE";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of ram_memory_blk_mem_gen_v8_4_1 : entity is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of ram_memory_blk_mem_gen_v8_4_1 : entity is 16;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of ram_memory_blk_mem_gen_v8_4_1 : entity is 16;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of ram_memory_blk_mem_gen_v8_4_1 : entity is "artix7";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ram_memory_blk_mem_gen_v8_4_1 : entity is "blk_mem_gen_v8_4_1";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of ram_memory_blk_mem_gen_v8_4_1 : entity is "yes";
end ram_memory_blk_mem_gen_v8_4_1;

architecture STRUCTURE of ram_memory_blk_mem_gen_v8_4_1 is
  signal \<const0>\ : STD_LOGIC;
begin
  dbiterr <= \<const0>\;
  doutb(15) <= \<const0>\;
  doutb(14) <= \<const0>\;
  doutb(13) <= \<const0>\;
  doutb(12) <= \<const0>\;
  doutb(11) <= \<const0>\;
  doutb(10) <= \<const0>\;
  doutb(9) <= \<const0>\;
  doutb(8) <= \<const0>\;
  doutb(7) <= \<const0>\;
  doutb(6) <= \<const0>\;
  doutb(5) <= \<const0>\;
  doutb(4) <= \<const0>\;
  doutb(3) <= \<const0>\;
  doutb(2) <= \<const0>\;
  doutb(1) <= \<const0>\;
  doutb(0) <= \<const0>\;
  rdaddrecc(11) <= \<const0>\;
  rdaddrecc(10) <= \<const0>\;
  rdaddrecc(9) <= \<const0>\;
  rdaddrecc(8) <= \<const0>\;
  rdaddrecc(7) <= \<const0>\;
  rdaddrecc(6) <= \<const0>\;
  rdaddrecc(5) <= \<const0>\;
  rdaddrecc(4) <= \<const0>\;
  rdaddrecc(3) <= \<const0>\;
  rdaddrecc(2) <= \<const0>\;
  rdaddrecc(1) <= \<const0>\;
  rdaddrecc(0) <= \<const0>\;
  rsta_busy <= \<const0>\;
  rstb_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(3) <= \<const0>\;
  s_axi_bid(2) <= \<const0>\;
  s_axi_bid(1) <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_dbiterr <= \<const0>\;
  s_axi_rdaddrecc(11) <= \<const0>\;
  s_axi_rdaddrecc(10) <= \<const0>\;
  s_axi_rdaddrecc(9) <= \<const0>\;
  s_axi_rdaddrecc(8) <= \<const0>\;
  s_axi_rdaddrecc(7) <= \<const0>\;
  s_axi_rdaddrecc(6) <= \<const0>\;
  s_axi_rdaddrecc(5) <= \<const0>\;
  s_axi_rdaddrecc(4) <= \<const0>\;
  s_axi_rdaddrecc(3) <= \<const0>\;
  s_axi_rdaddrecc(2) <= \<const0>\;
  s_axi_rdaddrecc(1) <= \<const0>\;
  s_axi_rdaddrecc(0) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(3) <= \<const0>\;
  s_axi_rid(2) <= \<const0>\;
  s_axi_rid(1) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_sbiterr <= \<const0>\;
  s_axi_wready <= \<const0>\;
  sbiterr <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst_blk_mem_gen: entity work.ram_memory_blk_mem_gen_v8_4_1_synth
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      dina(15 downto 0) => dina(15 downto 0),
      douta(15 downto 0) => douta(15 downto 0),
      ena => ena,
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ram_memory is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ram_memory : entity is "ram_memory,blk_mem_gen_v8_4_1,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of ram_memory : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of ram_memory : entity is "blk_mem_gen_v8_4_1,Vivado 2017.4";
end ram_memory;

architecture STRUCTURE of ram_memory is
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rstb_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_doutb_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of U0 : label is 12;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of U0 : label is 12;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of U0 : label is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of U0 : label is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of U0 : label is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of U0 : label is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of U0 : label is "0";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of U0 : label is "2";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of U0 : label is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of U0 : label is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of U0 : label is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of U0 : label is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of U0 : label is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of U0 : label is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of U0 : label is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of U0 : label is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of U0 : label is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of U0 : label is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of U0 : label is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of U0 : label is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of U0 : label is "Estimated Power for IP     :     4.4167 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of U0 : label is 1;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of U0 : label is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of U0 : label is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of U0 : label is 1;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of U0 : label is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of U0 : label is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of U0 : label is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of U0 : label is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of U0 : label is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of U0 : label is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of U0 : label is "ram_memory.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of U0 : label is "no_coe_file_loaded";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of U0 : label is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 0;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of U0 : label is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of U0 : label is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of U0 : label is 4096;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of U0 : label is 4096;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of U0 : label is 16;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of U0 : label is 16;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of U0 : label is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of U0 : label is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of U0 : label is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of U0 : label is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of U0 : label is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of U0 : label is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of U0 : label is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of U0 : label is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of U0 : label is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of U0 : label is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of U0 : label is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of U0 : label is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of U0 : label is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of U0 : label is 4096;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of U0 : label is 4096;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of U0 : label is "NO_CHANGE";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of U0 : label is 16;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of U0 : label is 16;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of U0 : label is "artix7";
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
  attribute x_interface_info : string;
  attribute x_interface_info of clka : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clka : signal is "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_WRITE";
  attribute x_interface_info of ena : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA EN";
  attribute x_interface_info of addra : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR";
  attribute x_interface_info of dina : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN";
  attribute x_interface_info of douta : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT";
  attribute x_interface_info of wea : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA WE";
begin
U0: entity work.ram_memory_blk_mem_gen_v8_4_1
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      addrb(11 downto 0) => B"000000000000",
      clka => clka,
      clkb => '0',
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      deepsleep => '0',
      dina(15 downto 0) => dina(15 downto 0),
      dinb(15 downto 0) => B"0000000000000000",
      douta(15 downto 0) => douta(15 downto 0),
      doutb(15 downto 0) => NLW_U0_doutb_UNCONNECTED(15 downto 0),
      eccpipece => '0',
      ena => ena,
      enb => '0',
      injectdbiterr => '0',
      injectsbiterr => '0',
      rdaddrecc(11 downto 0) => NLW_U0_rdaddrecc_UNCONNECTED(11 downto 0),
      regcea => '0',
      regceb => '0',
      rsta => '0',
      rsta_busy => NLW_U0_rsta_busy_UNCONNECTED,
      rstb => '0',
      rstb_busy => NLW_U0_rstb_busy_UNCONNECTED,
      s_aclk => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arid(3 downto 0) => B"0000",
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awid(3 downto 0) => B"0000",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awvalid => '0',
      s_axi_bid(3 downto 0) => NLW_U0_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_dbiterr => NLW_U0_s_axi_dbiterr_UNCONNECTED,
      s_axi_injectdbiterr => '0',
      s_axi_injectsbiterr => '0',
      s_axi_rdaddrecc(11 downto 0) => NLW_U0_s_axi_rdaddrecc_UNCONNECTED(11 downto 0),
      s_axi_rdata(15 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(15 downto 0),
      s_axi_rid(3 downto 0) => NLW_U0_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_sbiterr => NLW_U0_s_axi_sbiterr_UNCONNECTED,
      s_axi_wdata(15 downto 0) => B"0000000000000000",
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(0) => '0',
      s_axi_wvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      shutdown => '0',
      sleep => '0',
      wea(0) => wea(0),
      web(0) => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity memo_controller is
  port (
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clk_100MHz : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    memo_state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end memo_controller;

architecture STRUCTURE of memo_controller is
  signal storaged_sample : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute syn_black_box : string;
  attribute syn_black_box of ram : label is "TRUE";
  attribute x_core_info : string;
  attribute x_core_info of ram : label is "blk_mem_gen_v8_4_1,Vivado 2017.4";
begin
\mult_reg2[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(0),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(0),
      O => D(0)
    );
\mult_reg2[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(10),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(10),
      O => D(10)
    );
\mult_reg2[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(11),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(11),
      O => D(11)
    );
\mult_reg2[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(12),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(12),
      O => D(12)
    );
\mult_reg2[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(13),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(13),
      O => D(13)
    );
\mult_reg2[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(14),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(14),
      O => D(14)
    );
\mult_reg2[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(15),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(15),
      O => D(15)
    );
\mult_reg2[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(1),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(1),
      O => D(1)
    );
\mult_reg2[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(2),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(2),
      O => D(2)
    );
\mult_reg2[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(3),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(3),
      O => D(3)
    );
\mult_reg2[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(4),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(4),
      O => D(4)
    );
\mult_reg2[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(5),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(5),
      O => D(5)
    );
\mult_reg2[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(6),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(6),
      O => D(6)
    );
\mult_reg2[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(7),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(7),
      O => D(7)
    );
\mult_reg2[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(8),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(8),
      O => D(8)
    );
\mult_reg2[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => storaged_sample(9),
      I1 => memo_state(1),
      I2 => memo_state(0),
      I3 => Q(9),
      O => D(9)
    );
ram: entity work.ram_memory
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clk_100MHz,
      dina(15 downto 0) => dina(15 downto 0),
      douta(15 downto 0) => storaged_sample(15 downto 0),
      ena => ena,
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity master_controller is
  port (
    LR_W_SEL_DAC_OBUF : out STD_LOGIC;
    SCLK_DAC_OBUF : out STD_LOGIC;
    MCLK_DAC_OBUF : out STD_LOGIC;
    DATA_OUT_OBUF : out STD_LOGIC;
    pre_resultiSTFT0 : out STD_LOGIC;
    B : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \result1buf_reg[15]_i_2\ : out STD_LOGIC;
    \result1buf_reg[15]_i_3\ : out STD_LOGIC;
    A : out STD_LOGIC_VECTOR ( 14 downto 0 );
    clk_100MHz : in STD_LOGIC;
    CLK : in STD_LOGIC;
    reset_IBUF : in STD_LOGIC;
    state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \result1buf_reg[15]_i_2_0\ : in STD_LOGIC;
    \result1buf_reg[15]_i_3_0\ : in STD_LOGIC;
    P : in STD_LOGIC_VECTOR ( 15 downto 0 );
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end master_controller;

architecture STRUCTURE of master_controller is
  signal DATA_OUT_n0_out : STD_LOGIC;
  signal \^sclk_dac_obuf\ : STD_LOGIC;
  signal WIN_n_13 : STD_LOGIC;
  signal WIN_n_76 : STD_LOGIC;
  signal WIN_n_77 : STD_LOGIC;
  signal WIN_n_78 : STD_LOGIC;
  signal address : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \address_in_ref[11]_i_2_n_0\ : STD_LOGIC;
  signal \address_in_ref[11]_i_4_n_0\ : STD_LOGIC;
  signal \address_in_ref[11]_i_5_n_0\ : STD_LOGIC;
  signal address_in_ref_next : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \address_in_ref_reg[11]_i_3_n_2\ : STD_LOGIC;
  signal \address_in_ref_reg[11]_i_3_n_3\ : STD_LOGIC;
  signal \address_in_ref_reg[11]_i_3_n_5\ : STD_LOGIC;
  signal \address_in_ref_reg[11]_i_3_n_6\ : STD_LOGIC;
  signal \address_in_ref_reg[11]_i_3_n_7\ : STD_LOGIC;
  signal \address_in_ref_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \address_in_ref_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \address_in_ref_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \address_in_ref_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \address_in_ref_reg[4]_i_2_n_4\ : STD_LOGIC;
  signal \address_in_ref_reg[4]_i_2_n_5\ : STD_LOGIC;
  signal \address_in_ref_reg[4]_i_2_n_6\ : STD_LOGIC;
  signal \address_in_ref_reg[4]_i_2_n_7\ : STD_LOGIC;
  signal \address_in_ref_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \address_in_ref_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \address_in_ref_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \address_in_ref_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \address_in_ref_reg[8]_i_2_n_4\ : STD_LOGIC;
  signal \address_in_ref_reg[8]_i_2_n_5\ : STD_LOGIC;
  signal \address_in_ref_reg[8]_i_2_n_6\ : STD_LOGIC;
  signal \address_in_ref_reg[8]_i_2_n_7\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[0]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[10]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[11]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[1]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[2]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[3]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[4]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[5]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[6]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[7]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[8]\ : STD_LOGIC;
  signal \address_in_ref_reg_n_0_[9]\ : STD_LOGIC;
  signal \address_out_ref[11]_i_1_n_0\ : STD_LOGIC;
  signal \address_out_ref[11]_i_3_n_0\ : STD_LOGIC;
  signal \address_out_ref[11]_i_5_n_0\ : STD_LOGIC;
  signal \address_out_ref[11]_i_6_n_0\ : STD_LOGIC;
  signal address_out_ref_next : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \address_out_ref_reg[11]_i_4_n_2\ : STD_LOGIC;
  signal \address_out_ref_reg[11]_i_4_n_3\ : STD_LOGIC;
  signal \address_out_ref_reg[11]_i_4_n_5\ : STD_LOGIC;
  signal \address_out_ref_reg[11]_i_4_n_6\ : STD_LOGIC;
  signal \address_out_ref_reg[11]_i_4_n_7\ : STD_LOGIC;
  signal \address_out_ref_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \address_out_ref_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \address_out_ref_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \address_out_ref_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \address_out_ref_reg[4]_i_2_n_4\ : STD_LOGIC;
  signal \address_out_ref_reg[4]_i_2_n_5\ : STD_LOGIC;
  signal \address_out_ref_reg[4]_i_2_n_6\ : STD_LOGIC;
  signal \address_out_ref_reg[4]_i_2_n_7\ : STD_LOGIC;
  signal \address_out_ref_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \address_out_ref_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \address_out_ref_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \address_out_ref_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \address_out_ref_reg[8]_i_2_n_4\ : STD_LOGIC;
  signal \address_out_ref_reg[8]_i_2_n_5\ : STD_LOGIC;
  signal \address_out_ref_reg[8]_i_2_n_6\ : STD_LOGIC;
  signal \address_out_ref_reg[8]_i_2_n_7\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[0]\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[10]\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[11]\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[1]\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[2]\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[3]\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[4]\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[5]\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[7]\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[8]\ : STD_LOGIC;
  signal \address_out_ref_reg_n_0_[9]\ : STD_LOGIC;
  signal buf1_2 : STD_LOGIC;
  signal buffer1_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal buffer1_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \buffer1_reg_n_0_[0]\ : STD_LOGIC;
  signal \buffer1_reg_n_0_[1]\ : STD_LOGIC;
  signal \buffer1_reg_n_0_[2]\ : STD_LOGIC;
  signal \buffer1_reg_n_0_[3]\ : STD_LOGIC;
  signal \buffer1_reg_n_0_[4]\ : STD_LOGIC;
  signal \buffer1_reg_n_0_[5]\ : STD_LOGIC;
  signal \buffer1_reg_n_0_[6]\ : STD_LOGIC;
  signal \buffer1_reg_n_0_[7]\ : STD_LOGIC;
  signal \buffer1_reg_n_0_[8]\ : STD_LOGIC;
  signal \buffer2[8]_i_3_n_0\ : STD_LOGIC;
  signal buffer2_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \buffer2_out[8]_i_3_n_0\ : STD_LOGIC;
  signal buffer2_out_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \buffer2_out_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \buffer2_out_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \buffer2_out_reg[8]_i_2_n_7\ : STD_LOGIC;
  signal \buffer2_out_reg_n_0_[0]\ : STD_LOGIC;
  signal \buffer2_out_reg_n_0_[1]\ : STD_LOGIC;
  signal \buffer2_out_reg_n_0_[2]\ : STD_LOGIC;
  signal \buffer2_out_reg_n_0_[3]\ : STD_LOGIC;
  signal \buffer2_out_reg_n_0_[4]\ : STD_LOGIC;
  signal \buffer2_out_reg_n_0_[5]\ : STD_LOGIC;
  signal \buffer2_out_reg_n_0_[6]\ : STD_LOGIC;
  signal \buffer2_out_reg_n_0_[7]\ : STD_LOGIC;
  signal \buffer2_out_reg_n_0_[8]\ : STD_LOGIC;
  signal \buffer2_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \buffer2_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \buffer2_reg[8]_i_2_n_5\ : STD_LOGIC;
  signal \buffer2_reg[8]_i_2_n_6\ : STD_LOGIC;
  signal \buffer2_reg[8]_i_2_n_7\ : STD_LOGIC;
  signal \buffer2_reg_n_0_[0]\ : STD_LOGIC;
  signal \buffer2_reg_n_0_[1]\ : STD_LOGIC;
  signal \buffer2_reg_n_0_[2]\ : STD_LOGIC;
  signal \buffer2_reg_n_0_[3]\ : STD_LOGIC;
  signal \buffer2_reg_n_0_[4]\ : STD_LOGIC;
  signal \buffer2_reg_n_0_[5]\ : STD_LOGIC;
  signal \buffer2_reg_n_0_[6]\ : STD_LOGIC;
  signal \buffer2_reg_n_0_[7]\ : STD_LOGIC;
  signal \buffer2_reg_n_0_[8]\ : STD_LOGIC;
  signal change_memo : STD_LOGIC;
  signal change_memo_next : STD_LOGIC;
  signal enable : STD_LOGIC;
  signal enable_shift_next : STD_LOGIC;
  signal for_inv : STD_LOGIC;
  signal framed_sample : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal memo_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal memo_state0 : STD_LOGIC;
  signal \memo_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \memo_state[1]_i_1_n_0\ : STD_LOGIC;
  signal minusOp : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal multiplicand : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal output_sample : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \output_sample[15]_i_1_n_0\ : STD_LOGIC;
  signal r_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal read_address : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal read_address1_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal read_address2 : STD_LOGIC_VECTOR ( 11 downto 6 );
  signal \read_address2[6]_i_2_n_0\ : STD_LOGIC;
  signal \read_address2[9]_i_3_n_0\ : STD_LOGIC;
  signal read_address2_next : STD_LOGIC_VECTOR ( 11 downto 6 );
  signal \read_address2_reg[11]_i_2_n_3\ : STD_LOGIC;
  signal \read_address2_reg[11]_i_2_n_6\ : STD_LOGIC;
  signal \read_address2_reg[11]_i_2_n_7\ : STD_LOGIC;
  signal \read_address2_reg[9]_i_2_n_0\ : STD_LOGIC;
  signal \read_address2_reg[9]_i_2_n_1\ : STD_LOGIC;
  signal \read_address2_reg[9]_i_2_n_2\ : STD_LOGIC;
  signal \read_address2_reg[9]_i_2_n_3\ : STD_LOGIC;
  signal \read_address2_reg[9]_i_2_n_4\ : STD_LOGIC;
  signal \read_address2_reg[9]_i_2_n_5\ : STD_LOGIC;
  signal \read_address2_reg[9]_i_2_n_6\ : STD_LOGIC;
  signal read_address_next : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal read_samplen : STD_LOGIC;
  signal read_samplenn : STD_LOGIC;
  signal read_samplenn_next : STD_LOGIC;
  signal result2buf : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sample_in_ready : STD_LOGIC;
  signal start_proc_win : STD_LOGIC;
  signal start_proc_win_next : STD_LOGIC;
  signal start_reading : STD_LOGIC;
  signal start_reading_i_1_n_0 : STD_LOGIC;
  signal write_address : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal write_address1 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal write_address1_next : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal write_address2 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \write_address2[9]_i_3_n_0\ : STD_LOGIC;
  signal write_address2_next : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \write_address2_reg[11]_i_2_n_3\ : STD_LOGIC;
  signal \write_address2_reg[11]_i_2_n_6\ : STD_LOGIC;
  signal \write_address2_reg[11]_i_2_n_7\ : STD_LOGIC;
  signal \write_address2_reg[9]_i_2_n_0\ : STD_LOGIC;
  signal \write_address2_reg[9]_i_2_n_1\ : STD_LOGIC;
  signal \write_address2_reg[9]_i_2_n_2\ : STD_LOGIC;
  signal \write_address2_reg[9]_i_2_n_3\ : STD_LOGIC;
  signal \write_address2_reg[9]_i_2_n_4\ : STD_LOGIC;
  signal \write_address2_reg[9]_i_2_n_5\ : STD_LOGIC;
  signal \write_address2_reg[9]_i_2_n_6\ : STD_LOGIC;
  signal write_address_next : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \NLW_address_in_ref_reg[11]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_address_in_ref_reg[11]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_address_out_ref_reg[11]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_address_out_ref_reg[11]_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_buffer2_out_reg[8]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_buffer2_out_reg[8]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_buffer2_reg[8]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_buffer2_reg[8]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_read_address2_reg[11]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_read_address2_reg[11]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_read_address2_reg[9]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_write_address2_reg[11]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_write_address2_reg[11]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_write_address2_reg[9]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \address_in_ref[0]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \address_in_ref[10]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \address_in_ref[11]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \address_in_ref[11]_i_4\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \address_in_ref[11]_i_5\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \address_in_ref[2]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \address_in_ref[3]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \address_in_ref[4]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \address_in_ref[5]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \address_in_ref[6]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \address_in_ref[7]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \address_in_ref[8]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \address_in_ref[9]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \address_out_ref[0]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \address_out_ref[10]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \address_out_ref[11]_i_2\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \address_out_ref[11]_i_5\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \address_out_ref[11]_i_6\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \address_out_ref[1]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \address_out_ref[3]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \address_out_ref[4]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \address_out_ref[5]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \address_out_ref[6]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \address_out_ref[7]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \address_out_ref[8]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \address_out_ref[9]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \buffer1[0]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \buffer1[1]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \buffer1[2]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \buffer1[3]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \buffer1[4]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \buffer1[5]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \buffer1[6]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \buffer1[7]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \buffer1[8]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \memo_state[0]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \memo_state[1]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \read_address1[0]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \read_address1[1]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \read_address1[2]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \read_address1[3]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \read_address1[4]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \read_address1[5]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \read_address1[6]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \read_address1[7]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \read_address2[6]_i_2\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \write_address1[0]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \write_address1[10]_i_1\ : label is "soft_lutpair39";
begin
  SCLK_DAC_OBUF <= \^sclk_dac_obuf\;
DATA_OUTr_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => DATA_OUT_n0_out,
      Q => DATA_OUT_OBUF
    );
RAM: entity work.memo_controller
     port map (
      D(15 downto 0) => multiplicand(15 downto 0),
      Q(15 downto 0) => r_reg(15 downto 0),
      addra(11 downto 0) => address(11 downto 0),
      clk_100MHz => clk_100MHz,
      dina(15 downto 0) => framed_sample(15 downto 0),
      ena => WIN_n_77,
      memo_state(1 downto 0) => memo_state(1 downto 0),
      wea(0) => WIN_n_78
    );
SAMP: entity work.sampling
     port map (
      CLK => CLK,
      D(11 downto 0) => read_address_next(11 downto 0),
      DATA_OUT_n0_out => DATA_OUT_n0_out,
      E(0) => read_samplenn_next,
      Q(15 downto 0) => output_sample(15 downto 0),
      buf1_2 => buf1_2,
      \buffer2_out_reg[0]\ => \buffer2_out_reg_n_0_[0]\,
      \buffer2_out_reg[1]\ => \buffer2_out_reg_n_0_[1]\,
      \buffer2_out_reg[2]\ => \buffer2_out_reg_n_0_[2]\,
      \buffer2_out_reg[3]\ => \buffer2_out_reg_n_0_[3]\,
      \buffer2_out_reg[4]\ => \buffer2_out_reg_n_0_[4]\,
      \buffer2_out_reg[5]\ => \buffer2_out_reg_n_0_[5]\,
      clk_100MHz => clk_100MHz,
      enable_shift_next => enable_shift_next,
      \frame_num_reg[4]_0\ => \^sclk_dac_obuf\,
      init_next_reg_0 => LR_W_SEL_DAC_OBUF,
      mc_reg_0 => MCLK_DAC_OBUF,
      memo_state(1 downto 0) => memo_state(1 downto 0),
      memo_state0 => memo_state0,
      \read_address1_reg[8]\(8 downto 0) => buffer1_out(8 downto 0),
      \read_address2_reg[11]\(5 downto 0) => read_address2(11 downto 6),
      reset_IBUF => reset_IBUF,
      sample_in_ready => sample_in_ready,
      start_proc_win_next => start_proc_win_next,
      start_reading => start_reading,
      state(1 downto 0) => state(1 downto 0)
    );
SHFT: entity work.shift_register
     port map (
      D(0) => D(0),
      E(0) => enable,
      Q(15 downto 0) => r_reg(15 downto 0),
      reset_IBUF => reset_IBUF,
      sc_reg => \^sclk_dac_obuf\
    );
WIN: entity work.window_controller
     port map (
      A(14 downto 0) => A(14 downto 0),
      B(15 downto 0) => B(15 downto 0),
      D(11 downto 0) => write_address_next(11 downto 0),
      P(15 downto 0) => P(15 downto 0),
      Q(11 downto 0) => write_address(11 downto 0),
      addra(11 downto 0) => address(11 downto 0),
      buf1_2 => buf1_2,
      \buffer1_reg[0]\ => \buffer1_reg_n_0_[0]\,
      \buffer1_reg[1]\ => \buffer1_reg_n_0_[1]\,
      \buffer1_reg[2]\ => \buffer1_reg_n_0_[2]\,
      \buffer1_reg[3]\ => \buffer1_reg_n_0_[3]\,
      \buffer1_reg[4]\ => \buffer1_reg_n_0_[4]\,
      \buffer1_reg[5]\ => \buffer1_reg_n_0_[5]\,
      \buffer1_reg[6]\ => \buffer1_reg_n_0_[6]\,
      \buffer1_reg[7]\ => \buffer1_reg_n_0_[7]\,
      \buffer1_reg[8]\ => \buffer1_reg_n_0_[8]\,
      \buffer2_out_reg[0]\ => \buffer2_out_reg_n_0_[0]\,
      \buffer2_out_reg[1]\ => \buffer2_out_reg_n_0_[1]\,
      \buffer2_out_reg[2]\ => \buffer2_out_reg_n_0_[2]\,
      \buffer2_out_reg[3]\ => \buffer2_out_reg_n_0_[3]\,
      \buffer2_out_reg[4]\ => \buffer2_out_reg_n_0_[4]\,
      \buffer2_out_reg[5]\ => \buffer2_out_reg_n_0_[5]\,
      \buffer2_out_reg[8]\(2) => \buffer2_out_reg_n_0_[8]\,
      \buffer2_out_reg[8]\(1) => \buffer2_out_reg_n_0_[7]\,
      \buffer2_out_reg[8]\(0) => \buffer2_out_reg_n_0_[6]\,
      \buffer2_reg[1]\ => \buffer2_reg_n_0_[1]\,
      \buffer2_reg[2]\ => \buffer2_reg_n_0_[2]\,
      \buffer2_reg[3]\ => \buffer2_reg_n_0_[3]\,
      \buffer2_reg[4]\ => \buffer2_reg_n_0_[4]\,
      \buffer2_reg[5]\ => \buffer2_reg_n_0_[5]\,
      \buffer2_reg[8]\(3) => \buffer2_reg_n_0_[8]\,
      \buffer2_reg[8]\(2) => \buffer2_reg_n_0_[7]\,
      \buffer2_reg[8]\(1) => \buffer2_reg_n_0_[6]\,
      \buffer2_reg[8]\(0) => \buffer2_reg_n_0_[0]\,
      change_memo_next => change_memo_next,
      clk_100MHz => clk_100MHz,
      dina(15 downto 0) => framed_sample(15 downto 0),
      ena => WIN_n_77,
      for_inv => for_inv,
      for_inv_reg => WIN_n_76,
      memo_state(1 downto 0) => memo_state(1 downto 0),
      \memo_state_reg[1]\(15 downto 0) => multiplicand(15 downto 0),
      \output_sample_reg[15]\(15 downto 0) => result2buf(15 downto 0),
      pre_resultiSTFT0 => pre_resultiSTFT0,
      \read_address1_reg[8]\(8 downto 0) => buffer1_out(8 downto 0),
      \read_address_reg[11]\(11 downto 0) => read_address(11 downto 0),
      read_samplen => read_samplen,
      read_samplenn => read_samplenn,
      reset_IBUF => reset_IBUF,
      \result1buf_reg[15]_i_2\ => \result1buf_reg[15]_i_2\,
      \result1buf_reg[15]_i_2_0\ => \result1buf_reg[15]_i_2_0\,
      \result1buf_reg[15]_i_3\ => \result1buf_reg[15]_i_3\,
      \result1buf_reg[15]_i_3_0\ => \result1buf_reg[15]_i_3_0\,
      sample_in_ready => sample_in_ready,
      start_proc_win => start_proc_win,
      wea(0) => WIN_n_78,
      \write_address1_reg[10]\(1) => write_address1(10),
      \write_address1_reg[10]\(0) => write_address1(0),
      \write_address2_reg[11]\(6 downto 1) => write_address2(11 downto 6),
      \write_address2_reg[11]\(0) => write_address2(0),
      \write_address_reg[0]\ => WIN_n_13
    );
\address_in_ref[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[0]\,
      O => address_in_ref_next(0)
    );
\address_in_ref[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[11]_i_3_n_6\,
      O => address_in_ref_next(10)
    );
\address_in_ref[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[11]_i_3_n_5\,
      O => address_in_ref_next(11)
    );
\address_in_ref[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBFFFFFFF"
    )
        port map (
      I0 => \address_in_ref[11]_i_4_n_0\,
      I1 => \address_in_ref_reg_n_0_[5]\,
      I2 => \address_in_ref_reg_n_0_[4]\,
      I3 => \address_in_ref_reg_n_0_[9]\,
      I4 => \address_in_ref_reg_n_0_[6]\,
      I5 => \address_in_ref[11]_i_5_n_0\,
      O => \address_in_ref[11]_i_2_n_0\
    );
\address_in_ref[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[7]\,
      I1 => \address_in_ref_reg_n_0_[8]\,
      I2 => \address_in_ref_reg_n_0_[11]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      O => \address_in_ref[11]_i_4_n_0\
    );
\address_in_ref[11]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[1]\,
      I1 => \address_in_ref_reg_n_0_[0]\,
      I2 => \address_in_ref_reg_n_0_[3]\,
      I3 => \address_in_ref_reg_n_0_[2]\,
      O => \address_in_ref[11]_i_5_n_0\
    );
\address_in_ref[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[4]_i_2_n_7\,
      O => address_in_ref_next(1)
    );
\address_in_ref[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[4]_i_2_n_6\,
      O => address_in_ref_next(2)
    );
\address_in_ref[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[4]_i_2_n_5\,
      O => address_in_ref_next(3)
    );
\address_in_ref[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[4]_i_2_n_4\,
      O => address_in_ref_next(4)
    );
\address_in_ref[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[8]_i_2_n_7\,
      O => address_in_ref_next(5)
    );
\address_in_ref[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[8]_i_2_n_6\,
      O => address_in_ref_next(6)
    );
\address_in_ref[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[8]_i_2_n_5\,
      O => address_in_ref_next(7)
    );
\address_in_ref[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[8]_i_2_n_4\,
      O => address_in_ref_next(8)
    );
\address_in_ref[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_in_ref[11]_i_2_n_0\,
      I1 => \address_in_ref_reg[11]_i_3_n_7\,
      O => address_in_ref_next(9)
    );
\address_in_ref_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(0),
      Q => \address_in_ref_reg_n_0_[0]\
    );
\address_in_ref_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(10),
      Q => \address_in_ref_reg_n_0_[10]\
    );
\address_in_ref_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(11),
      Q => \address_in_ref_reg_n_0_[11]\
    );
\address_in_ref_reg[11]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \address_in_ref_reg[8]_i_2_n_0\,
      CO(3 downto 2) => \NLW_address_in_ref_reg[11]_i_3_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \address_in_ref_reg[11]_i_3_n_2\,
      CO(0) => \address_in_ref_reg[11]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_address_in_ref_reg[11]_i_3_O_UNCONNECTED\(3),
      O(2) => \address_in_ref_reg[11]_i_3_n_5\,
      O(1) => \address_in_ref_reg[11]_i_3_n_6\,
      O(0) => \address_in_ref_reg[11]_i_3_n_7\,
      S(3) => '0',
      S(2) => \address_in_ref_reg_n_0_[11]\,
      S(1) => \address_in_ref_reg_n_0_[10]\,
      S(0) => \address_in_ref_reg_n_0_[9]\
    );
\address_in_ref_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(1),
      Q => \address_in_ref_reg_n_0_[1]\
    );
\address_in_ref_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(2),
      Q => \address_in_ref_reg_n_0_[2]\
    );
\address_in_ref_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(3),
      Q => \address_in_ref_reg_n_0_[3]\
    );
\address_in_ref_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(4),
      Q => \address_in_ref_reg_n_0_[4]\
    );
\address_in_ref_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \address_in_ref_reg[4]_i_2_n_0\,
      CO(2) => \address_in_ref_reg[4]_i_2_n_1\,
      CO(1) => \address_in_ref_reg[4]_i_2_n_2\,
      CO(0) => \address_in_ref_reg[4]_i_2_n_3\,
      CYINIT => \address_in_ref_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3) => \address_in_ref_reg[4]_i_2_n_4\,
      O(2) => \address_in_ref_reg[4]_i_2_n_5\,
      O(1) => \address_in_ref_reg[4]_i_2_n_6\,
      O(0) => \address_in_ref_reg[4]_i_2_n_7\,
      S(3) => \address_in_ref_reg_n_0_[4]\,
      S(2) => \address_in_ref_reg_n_0_[3]\,
      S(1) => \address_in_ref_reg_n_0_[2]\,
      S(0) => \address_in_ref_reg_n_0_[1]\
    );
\address_in_ref_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(5),
      Q => \address_in_ref_reg_n_0_[5]\
    );
\address_in_ref_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(6),
      Q => \address_in_ref_reg_n_0_[6]\
    );
\address_in_ref_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(7),
      Q => \address_in_ref_reg_n_0_[7]\
    );
\address_in_ref_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(8),
      Q => \address_in_ref_reg_n_0_[8]\
    );
\address_in_ref_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \address_in_ref_reg[4]_i_2_n_0\,
      CO(3) => \address_in_ref_reg[8]_i_2_n_0\,
      CO(2) => \address_in_ref_reg[8]_i_2_n_1\,
      CO(1) => \address_in_ref_reg[8]_i_2_n_2\,
      CO(0) => \address_in_ref_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \address_in_ref_reg[8]_i_2_n_4\,
      O(2) => \address_in_ref_reg[8]_i_2_n_5\,
      O(1) => \address_in_ref_reg[8]_i_2_n_6\,
      O(0) => \address_in_ref_reg[8]_i_2_n_7\,
      S(3) => \address_in_ref_reg_n_0_[8]\,
      S(2) => \address_in_ref_reg_n_0_[7]\,
      S(1) => \address_in_ref_reg_n_0_[6]\,
      S(0) => \address_in_ref_reg_n_0_[5]\
    );
\address_in_ref_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => change_memo,
      CLR => reset_IBUF,
      D => address_in_ref_next(9),
      Q => \address_in_ref_reg_n_0_[9]\
    );
\address_out_ref[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[0]\,
      O => address_out_ref_next(0)
    );
\address_out_ref[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[11]_i_4_n_6\,
      O => address_out_ref_next(10)
    );
\address_out_ref[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_reading,
      I1 => change_memo,
      O => \address_out_ref[11]_i_1_n_0\
    );
\address_out_ref[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[11]_i_4_n_5\,
      O => address_out_ref_next(11)
    );
\address_out_ref[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBFFFFFFF"
    )
        port map (
      I0 => \address_out_ref[11]_i_5_n_0\,
      I1 => \address_out_ref_reg_n_0_[5]\,
      I2 => \address_out_ref_reg_n_0_[4]\,
      I3 => \address_out_ref_reg_n_0_[9]\,
      I4 => \address_out_ref_reg_n_0_[7]\,
      I5 => \address_out_ref[11]_i_6_n_0\,
      O => \address_out_ref[11]_i_3_n_0\
    );
\address_out_ref[11]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => minusOp(6),
      I1 => \address_out_ref_reg_n_0_[8]\,
      I2 => \address_out_ref_reg_n_0_[11]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      O => \address_out_ref[11]_i_5_n_0\
    );
\address_out_ref[11]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[1]\,
      I1 => \address_out_ref_reg_n_0_[0]\,
      I2 => \address_out_ref_reg_n_0_[3]\,
      I3 => \address_out_ref_reg_n_0_[2]\,
      O => \address_out_ref[11]_i_6_n_0\
    );
\address_out_ref[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[4]_i_2_n_7\,
      O => address_out_ref_next(1)
    );
\address_out_ref[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[4]_i_2_n_6\,
      O => address_out_ref_next(2)
    );
\address_out_ref[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[4]_i_2_n_5\,
      O => address_out_ref_next(3)
    );
\address_out_ref[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[4]_i_2_n_4\,
      O => address_out_ref_next(4)
    );
\address_out_ref[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[8]_i_2_n_7\,
      O => address_out_ref_next(5)
    );
\address_out_ref[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[8]_i_2_n_6\,
      O => address_out_ref_next(6)
    );
\address_out_ref[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[8]_i_2_n_5\,
      O => address_out_ref_next(7)
    );
\address_out_ref[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[8]_i_2_n_4\,
      O => address_out_ref_next(8)
    );
\address_out_ref[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \address_out_ref[11]_i_3_n_0\,
      I1 => \address_out_ref_reg[11]_i_4_n_7\,
      O => address_out_ref_next(9)
    );
\address_out_ref_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(0),
      Q => \address_out_ref_reg_n_0_[0]\
    );
\address_out_ref_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(10),
      Q => \address_out_ref_reg_n_0_[10]\
    );
\address_out_ref_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(11),
      Q => \address_out_ref_reg_n_0_[11]\
    );
\address_out_ref_reg[11]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \address_out_ref_reg[8]_i_2_n_0\,
      CO(3 downto 2) => \NLW_address_out_ref_reg[11]_i_4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \address_out_ref_reg[11]_i_4_n_2\,
      CO(0) => \address_out_ref_reg[11]_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_address_out_ref_reg[11]_i_4_O_UNCONNECTED\(3),
      O(2) => \address_out_ref_reg[11]_i_4_n_5\,
      O(1) => \address_out_ref_reg[11]_i_4_n_6\,
      O(0) => \address_out_ref_reg[11]_i_4_n_7\,
      S(3) => '0',
      S(2) => \address_out_ref_reg_n_0_[11]\,
      S(1) => \address_out_ref_reg_n_0_[10]\,
      S(0) => \address_out_ref_reg_n_0_[9]\
    );
\address_out_ref_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(1),
      Q => \address_out_ref_reg_n_0_[1]\
    );
\address_out_ref_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(2),
      Q => \address_out_ref_reg_n_0_[2]\
    );
\address_out_ref_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(3),
      Q => \address_out_ref_reg_n_0_[3]\
    );
\address_out_ref_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(4),
      Q => \address_out_ref_reg_n_0_[4]\
    );
\address_out_ref_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \address_out_ref_reg[4]_i_2_n_0\,
      CO(2) => \address_out_ref_reg[4]_i_2_n_1\,
      CO(1) => \address_out_ref_reg[4]_i_2_n_2\,
      CO(0) => \address_out_ref_reg[4]_i_2_n_3\,
      CYINIT => \address_out_ref_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3) => \address_out_ref_reg[4]_i_2_n_4\,
      O(2) => \address_out_ref_reg[4]_i_2_n_5\,
      O(1) => \address_out_ref_reg[4]_i_2_n_6\,
      O(0) => \address_out_ref_reg[4]_i_2_n_7\,
      S(3) => \address_out_ref_reg_n_0_[4]\,
      S(2) => \address_out_ref_reg_n_0_[3]\,
      S(1) => \address_out_ref_reg_n_0_[2]\,
      S(0) => \address_out_ref_reg_n_0_[1]\
    );
\address_out_ref_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(5),
      Q => \address_out_ref_reg_n_0_[5]\
    );
\address_out_ref_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(6),
      Q => minusOp(6)
    );
\address_out_ref_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(7),
      Q => \address_out_ref_reg_n_0_[7]\
    );
\address_out_ref_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(8),
      Q => \address_out_ref_reg_n_0_[8]\
    );
\address_out_ref_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \address_out_ref_reg[4]_i_2_n_0\,
      CO(3) => \address_out_ref_reg[8]_i_2_n_0\,
      CO(2) => \address_out_ref_reg[8]_i_2_n_1\,
      CO(1) => \address_out_ref_reg[8]_i_2_n_2\,
      CO(0) => \address_out_ref_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \address_out_ref_reg[8]_i_2_n_4\,
      O(2) => \address_out_ref_reg[8]_i_2_n_5\,
      O(1) => \address_out_ref_reg[8]_i_2_n_6\,
      O(0) => \address_out_ref_reg[8]_i_2_n_7\,
      S(3) => \address_out_ref_reg_n_0_[8]\,
      S(2) => \address_out_ref_reg_n_0_[7]\,
      S(1) => minusOp(6),
      S(0) => \address_out_ref_reg_n_0_[5]\
    );
\address_out_ref_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \address_out_ref[11]_i_1_n_0\,
      CLR => reset_IBUF,
      D => address_out_ref_next(9),
      Q => \address_out_ref_reg_n_0_[9]\
    );
\buffer1[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[0]\,
      I1 => \address_in_ref_reg_n_0_[9]\,
      I2 => \address_in_ref_reg_n_0_[10]\,
      I3 => \address_in_ref_reg_n_0_[11]\,
      O => buffer1_next(0)
    );
\buffer1[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[1]\,
      I1 => \address_in_ref_reg_n_0_[9]\,
      I2 => \address_in_ref_reg_n_0_[10]\,
      I3 => \address_in_ref_reg_n_0_[11]\,
      O => buffer1_next(1)
    );
\buffer1[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[2]\,
      I1 => \address_in_ref_reg_n_0_[9]\,
      I2 => \address_in_ref_reg_n_0_[10]\,
      I3 => \address_in_ref_reg_n_0_[11]\,
      O => buffer1_next(2)
    );
\buffer1[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[3]\,
      I1 => \address_in_ref_reg_n_0_[9]\,
      I2 => \address_in_ref_reg_n_0_[10]\,
      I3 => \address_in_ref_reg_n_0_[11]\,
      O => buffer1_next(3)
    );
\buffer1[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[4]\,
      I1 => \address_in_ref_reg_n_0_[9]\,
      I2 => \address_in_ref_reg_n_0_[10]\,
      I3 => \address_in_ref_reg_n_0_[11]\,
      O => buffer1_next(4)
    );
\buffer1[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[5]\,
      I1 => \address_in_ref_reg_n_0_[9]\,
      I2 => \address_in_ref_reg_n_0_[10]\,
      I3 => \address_in_ref_reg_n_0_[11]\,
      O => buffer1_next(5)
    );
\buffer1[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[6]\,
      I1 => \address_in_ref_reg_n_0_[9]\,
      I2 => \address_in_ref_reg_n_0_[10]\,
      I3 => \address_in_ref_reg_n_0_[11]\,
      O => buffer1_next(6)
    );
\buffer1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[7]\,
      I1 => \address_in_ref_reg_n_0_[9]\,
      I2 => \address_in_ref_reg_n_0_[10]\,
      I3 => \address_in_ref_reg_n_0_[11]\,
      O => buffer1_next(7)
    );
\buffer1[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[8]\,
      I1 => \address_in_ref_reg_n_0_[9]\,
      I2 => \address_in_ref_reg_n_0_[10]\,
      I3 => \address_in_ref_reg_n_0_[11]\,
      O => buffer1_next(8)
    );
\buffer1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer1_next(0),
      Q => \buffer1_reg_n_0_[0]\
    );
\buffer1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer1_next(1),
      Q => \buffer1_reg_n_0_[1]\
    );
\buffer1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer1_next(2),
      Q => \buffer1_reg_n_0_[2]\
    );
\buffer1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer1_next(3),
      Q => \buffer1_reg_n_0_[3]\
    );
\buffer1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer1_next(4),
      Q => \buffer1_reg_n_0_[4]\
    );
\buffer1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer1_next(5),
      Q => \buffer1_reg_n_0_[5]\
    );
\buffer1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer1_next(6),
      Q => \buffer1_reg_n_0_[6]\
    );
\buffer1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer1_next(7),
      Q => \buffer1_reg_n_0_[7]\
    );
\buffer1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer1_next(8),
      Q => \buffer1_reg_n_0_[8]\
    );
\buffer2[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[8]\,
      I1 => \address_in_ref_reg_n_0_[7]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[0]\,
      O => buffer2_next(0)
    );
\buffer2[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[8]\,
      I1 => \address_in_ref_reg_n_0_[7]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[1]\,
      O => buffer2_next(1)
    );
\buffer2[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[8]\,
      I1 => \address_in_ref_reg_n_0_[7]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[2]\,
      O => buffer2_next(2)
    );
\buffer2[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[8]\,
      I1 => \address_in_ref_reg_n_0_[7]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[3]\,
      O => buffer2_next(3)
    );
\buffer2[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[8]\,
      I1 => \address_in_ref_reg_n_0_[7]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[4]\,
      O => buffer2_next(4)
    );
\buffer2[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[8]\,
      I1 => \address_in_ref_reg_n_0_[7]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[5]\,
      O => buffer2_next(5)
    );
\buffer2[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA2"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[6]\,
      I1 => \address_in_ref_reg_n_0_[7]\,
      I2 => \address_in_ref_reg_n_0_[11]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[9]\,
      I5 => \address_in_ref_reg_n_0_[8]\,
      O => buffer2_next(6)
    );
\buffer2[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA3"
    )
        port map (
      I0 => \buffer2_reg[8]_i_2_n_6\,
      I1 => \address_in_ref_reg_n_0_[8]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[7]\,
      O => buffer2_next(7)
    );
\buffer2[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA3"
    )
        port map (
      I0 => \buffer2_reg[8]_i_2_n_5\,
      I1 => \address_in_ref_reg_n_0_[8]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[7]\,
      O => buffer2_next(8)
    );
\buffer2[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[7]\,
      O => \buffer2[8]_i_3_n_0\
    );
\buffer2_out[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[8]\,
      I1 => \address_out_ref_reg_n_0_[7]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[0]\,
      O => buffer2_out_next(0)
    );
\buffer2_out[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[8]\,
      I1 => \address_out_ref_reg_n_0_[7]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[1]\,
      O => buffer2_out_next(1)
    );
\buffer2_out[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[8]\,
      I1 => \address_out_ref_reg_n_0_[7]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[2]\,
      O => buffer2_out_next(2)
    );
\buffer2_out[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[8]\,
      I1 => \address_out_ref_reg_n_0_[7]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[3]\,
      O => buffer2_out_next(3)
    );
\buffer2_out[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[8]\,
      I1 => \address_out_ref_reg_n_0_[7]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[4]\,
      O => buffer2_out_next(4)
    );
\buffer2_out[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF900000000"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[8]\,
      I1 => \address_out_ref_reg_n_0_[7]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[5]\,
      O => buffer2_out_next(5)
    );
\buffer2_out[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCC8CCCCCCC4"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[8]\,
      I1 => minusOp(6),
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[7]\,
      O => buffer2_out_next(6)
    );
\buffer2_out[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA3"
    )
        port map (
      I0 => minusOp(7),
      I1 => \address_out_ref_reg_n_0_[8]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[7]\,
      O => buffer2_out_next(7)
    );
\buffer2_out[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA3"
    )
        port map (
      I0 => minusOp(8),
      I1 => \address_out_ref_reg_n_0_[8]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[7]\,
      O => buffer2_out_next(8)
    );
\buffer2_out[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[7]\,
      O => \buffer2_out[8]_i_3_n_0\
    );
\buffer2_out_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_out_next(0),
      Q => \buffer2_out_reg_n_0_[0]\
    );
\buffer2_out_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_out_next(1),
      Q => \buffer2_out_reg_n_0_[1]\
    );
\buffer2_out_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_out_next(2),
      Q => \buffer2_out_reg_n_0_[2]\
    );
\buffer2_out_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_out_next(3),
      Q => \buffer2_out_reg_n_0_[3]\
    );
\buffer2_out_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_out_next(4),
      Q => \buffer2_out_reg_n_0_[4]\
    );
\buffer2_out_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_out_next(5),
      Q => \buffer2_out_reg_n_0_[5]\
    );
\buffer2_out_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_out_next(6),
      Q => \buffer2_out_reg_n_0_[6]\
    );
\buffer2_out_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_out_next(7),
      Q => \buffer2_out_reg_n_0_[7]\
    );
\buffer2_out_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_out_next(8),
      Q => \buffer2_out_reg_n_0_[8]\
    );
\buffer2_out_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 2) => \NLW_buffer2_out_reg[8]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \buffer2_out_reg[8]_i_2_n_2\,
      CO(0) => \buffer2_out_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \address_out_ref_reg_n_0_[7]\,
      DI(0) => '0',
      O(3) => \NLW_buffer2_out_reg[8]_i_2_O_UNCONNECTED\(3),
      O(2 downto 1) => minusOp(8 downto 7),
      O(0) => \buffer2_out_reg[8]_i_2_n_7\,
      S(3) => '0',
      S(2) => \address_out_ref_reg_n_0_[8]\,
      S(1) => \buffer2_out[8]_i_3_n_0\,
      S(0) => minusOp(6)
    );
\buffer2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_next(0),
      Q => \buffer2_reg_n_0_[0]\
    );
\buffer2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_next(1),
      Q => \buffer2_reg_n_0_[1]\
    );
\buffer2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_next(2),
      Q => \buffer2_reg_n_0_[2]\
    );
\buffer2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_next(3),
      Q => \buffer2_reg_n_0_[3]\
    );
\buffer2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_next(4),
      Q => \buffer2_reg_n_0_[4]\
    );
\buffer2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_next(5),
      Q => \buffer2_reg_n_0_[5]\
    );
\buffer2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_next(6),
      Q => \buffer2_reg_n_0_[6]\
    );
\buffer2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_next(7),
      Q => \buffer2_reg_n_0_[7]\
    );
\buffer2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => buffer2_next(8),
      Q => \buffer2_reg_n_0_[8]\
    );
\buffer2_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 2) => \NLW_buffer2_reg[8]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \buffer2_reg[8]_i_2_n_2\,
      CO(0) => \buffer2_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \address_in_ref_reg_n_0_[7]\,
      DI(0) => '0',
      O(3) => \NLW_buffer2_reg[8]_i_2_O_UNCONNECTED\(3),
      O(2) => \buffer2_reg[8]_i_2_n_5\,
      O(1) => \buffer2_reg[8]_i_2_n_6\,
      O(0) => \buffer2_reg[8]_i_2_n_7\,
      S(3) => '0',
      S(2) => \address_in_ref_reg_n_0_[8]\,
      S(1) => \buffer2[8]_i_3_n_0\,
      S(0) => \address_in_ref_reg_n_0_[6]\
    );
change_memo_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => change_memo_next,
      Q => change_memo
    );
enable_shift_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => enable_shift_next,
      Q => enable
    );
for_inv_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      D => WIN_n_76,
      PRE => reset_IBUF,
      Q => for_inv
    );
\memo_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BC"
    )
        port map (
      I0 => memo_state(1),
      I1 => memo_state0,
      I2 => memo_state(0),
      O => \memo_state[0]_i_1_n_0\
    );
\memo_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2FC0"
    )
        port map (
      I0 => start_reading,
      I1 => memo_state(0),
      I2 => memo_state0,
      I3 => memo_state(1),
      O => \memo_state[1]_i_1_n_0\
    );
\memo_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \memo_state[0]_i_1_n_0\,
      Q => memo_state(0)
    );
\memo_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \memo_state[1]_i_1_n_0\,
      Q => memo_state(1)
    );
\output_sample[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => memo_state(1),
      I1 => memo_state(0),
      O => \output_sample[15]_i_1_n_0\
    );
\output_sample_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(0),
      Q => output_sample(0)
    );
\output_sample_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(10),
      Q => output_sample(10)
    );
\output_sample_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(11),
      Q => output_sample(11)
    );
\output_sample_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(12),
      Q => output_sample(12)
    );
\output_sample_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(13),
      Q => output_sample(13)
    );
\output_sample_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(14),
      Q => output_sample(14)
    );
\output_sample_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(15),
      Q => output_sample(15)
    );
\output_sample_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(1),
      Q => output_sample(1)
    );
\output_sample_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(2),
      Q => output_sample(2)
    );
\output_sample_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(3),
      Q => output_sample(3)
    );
\output_sample_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(4),
      Q => output_sample(4)
    );
\output_sample_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(5),
      Q => output_sample(5)
    );
\output_sample_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(6),
      Q => output_sample(6)
    );
\output_sample_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(7),
      Q => output_sample(7)
    );
\output_sample_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(8),
      Q => output_sample(8)
    );
\output_sample_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => \output_sample[15]_i_1_n_0\,
      CLR => reset_IBUF,
      D => result2buf(9),
      Q => output_sample(9)
    );
\read_address1[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[0]\,
      I1 => \address_out_ref_reg_n_0_[9]\,
      I2 => \address_out_ref_reg_n_0_[10]\,
      I3 => \address_out_ref_reg_n_0_[11]\,
      O => read_address1_next(0)
    );
\read_address1[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[1]\,
      I1 => \address_out_ref_reg_n_0_[9]\,
      I2 => \address_out_ref_reg_n_0_[10]\,
      I3 => \address_out_ref_reg_n_0_[11]\,
      O => read_address1_next(1)
    );
\read_address1[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[2]\,
      I1 => \address_out_ref_reg_n_0_[9]\,
      I2 => \address_out_ref_reg_n_0_[10]\,
      I3 => \address_out_ref_reg_n_0_[11]\,
      O => read_address1_next(2)
    );
\read_address1[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[3]\,
      I1 => \address_out_ref_reg_n_0_[9]\,
      I2 => \address_out_ref_reg_n_0_[10]\,
      I3 => \address_out_ref_reg_n_0_[11]\,
      O => read_address1_next(3)
    );
\read_address1[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[4]\,
      I1 => \address_out_ref_reg_n_0_[9]\,
      I2 => \address_out_ref_reg_n_0_[10]\,
      I3 => \address_out_ref_reg_n_0_[11]\,
      O => read_address1_next(4)
    );
\read_address1[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[5]\,
      I1 => \address_out_ref_reg_n_0_[9]\,
      I2 => \address_out_ref_reg_n_0_[10]\,
      I3 => \address_out_ref_reg_n_0_[11]\,
      O => read_address1_next(5)
    );
\read_address1[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => minusOp(6),
      I1 => \address_out_ref_reg_n_0_[9]\,
      I2 => \address_out_ref_reg_n_0_[10]\,
      I3 => \address_out_ref_reg_n_0_[11]\,
      O => read_address1_next(6)
    );
\read_address1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[7]\,
      I1 => \address_out_ref_reg_n_0_[9]\,
      I2 => \address_out_ref_reg_n_0_[10]\,
      I3 => \address_out_ref_reg_n_0_[11]\,
      O => read_address1_next(7)
    );
\read_address1[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[8]\,
      I1 => \address_out_ref_reg_n_0_[9]\,
      I2 => \address_out_ref_reg_n_0_[10]\,
      I3 => \address_out_ref_reg_n_0_[11]\,
      O => read_address1_next(8)
    );
\read_address1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address1_next(0),
      Q => buffer1_out(0)
    );
\read_address1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address1_next(1),
      Q => buffer1_out(1)
    );
\read_address1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address1_next(2),
      Q => buffer1_out(2)
    );
\read_address1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address1_next(3),
      Q => buffer1_out(3)
    );
\read_address1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address1_next(4),
      Q => buffer1_out(4)
    );
\read_address1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address1_next(5),
      Q => buffer1_out(5)
    );
\read_address1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address1_next(6),
      Q => buffer1_out(6)
    );
\read_address1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address1_next(7),
      Q => buffer1_out(7)
    );
\read_address1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address1_next(8),
      Q => buffer1_out(8)
    );
\read_address2[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFE00000000"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[11]\,
      I1 => \address_out_ref_reg_n_0_[10]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[7]\,
      I4 => \address_out_ref_reg_n_0_[8]\,
      I5 => \read_address2_reg[11]_i_2_n_7\,
      O => read_address2_next(10)
    );
\read_address2[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFE00000000"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[11]\,
      I1 => \address_out_ref_reg_n_0_[10]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[7]\,
      I4 => \address_out_ref_reg_n_0_[8]\,
      I5 => \read_address2_reg[11]_i_2_n_6\,
      O => read_address2_next(11)
    );
\read_address2[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA88AA30"
    )
        port map (
      I0 => \buffer2_out_reg[8]_i_2_n_7\,
      I1 => \address_out_ref_reg_n_0_[8]\,
      I2 => minusOp(6),
      I3 => \read_address2[6]_i_2_n_0\,
      I4 => \address_out_ref_reg_n_0_[7]\,
      O => read_address2_next(6)
    );
\read_address2[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[11]\,
      I1 => \address_out_ref_reg_n_0_[10]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      O => \read_address2[6]_i_2_n_0\
    );
\read_address2[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA3"
    )
        port map (
      I0 => \read_address2_reg[9]_i_2_n_6\,
      I1 => \address_out_ref_reg_n_0_[8]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[7]\,
      O => read_address2_next(7)
    );
\read_address2[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA3"
    )
        port map (
      I0 => \read_address2_reg[9]_i_2_n_5\,
      I1 => \address_out_ref_reg_n_0_[8]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[7]\,
      O => read_address2_next(8)
    );
\read_address2[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA3"
    )
        port map (
      I0 => \read_address2_reg[9]_i_2_n_4\,
      I1 => \address_out_ref_reg_n_0_[8]\,
      I2 => \address_out_ref_reg_n_0_[9]\,
      I3 => \address_out_ref_reg_n_0_[10]\,
      I4 => \address_out_ref_reg_n_0_[11]\,
      I5 => \address_out_ref_reg_n_0_[7]\,
      O => read_address2_next(9)
    );
\read_address2[9]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \address_out_ref_reg_n_0_[7]\,
      O => \read_address2[9]_i_3_n_0\
    );
\read_address2_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address2_next(10),
      Q => read_address2(10)
    );
\read_address2_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address2_next(11),
      Q => read_address2(11)
    );
\read_address2_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \read_address2_reg[9]_i_2_n_0\,
      CO(3 downto 1) => \NLW_read_address2_reg[11]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \read_address2_reg[11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_read_address2_reg[11]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1) => \read_address2_reg[11]_i_2_n_6\,
      O(0) => \read_address2_reg[11]_i_2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \address_out_ref_reg_n_0_[11]\,
      S(0) => \address_out_ref_reg_n_0_[10]\
    );
\read_address2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address2_next(6),
      Q => read_address2(6)
    );
\read_address2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address2_next(7),
      Q => read_address2(7)
    );
\read_address2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address2_next(8),
      Q => read_address2(8)
    );
\read_address2_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_address2_next(9),
      Q => read_address2(9)
    );
\read_address2_reg[9]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \read_address2_reg[9]_i_2_n_0\,
      CO(2) => \read_address2_reg[9]_i_2_n_1\,
      CO(1) => \read_address2_reg[9]_i_2_n_2\,
      CO(0) => \read_address2_reg[9]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \address_out_ref_reg_n_0_[7]\,
      DI(0) => '0',
      O(3) => \read_address2_reg[9]_i_2_n_4\,
      O(2) => \read_address2_reg[9]_i_2_n_5\,
      O(1) => \read_address2_reg[9]_i_2_n_6\,
      O(0) => \NLW_read_address2_reg[9]_i_2_O_UNCONNECTED\(0),
      S(3) => \address_out_ref_reg_n_0_[9]\,
      S(2) => \address_out_ref_reg_n_0_[8]\,
      S(1) => \read_address2[9]_i_3_n_0\,
      S(0) => minusOp(6)
    );
\read_address_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(0),
      Q => read_address(0)
    );
\read_address_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(10),
      Q => read_address(10)
    );
\read_address_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(11),
      Q => read_address(11)
    );
\read_address_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(1),
      Q => read_address(1)
    );
\read_address_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(2),
      Q => read_address(2)
    );
\read_address_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(3),
      Q => read_address(3)
    );
\read_address_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(4),
      Q => read_address(4)
    );
\read_address_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(5),
      Q => read_address(5)
    );
\read_address_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(6),
      Q => read_address(6)
    );
\read_address_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(7),
      Q => read_address(7)
    );
\read_address_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(8),
      Q => read_address(8)
    );
\read_address_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => read_samplenn_next,
      CLR => reset_IBUF,
      D => read_address_next(9),
      Q => read_address(9)
    );
read_samplen_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_samplenn,
      Q => read_samplen
    );
read_samplenn_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => read_samplenn_next,
      Q => read_samplenn
    );
start_proc_win_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => start_proc_win_next,
      Q => start_proc_win
    );
start_reading_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010100"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[9]\,
      I1 => \address_in_ref_reg_n_0_[10]\,
      I2 => \address_in_ref_reg_n_0_[11]\,
      I3 => \address_in_ref_reg_n_0_[7]\,
      I4 => \address_in_ref_reg_n_0_[8]\,
      I5 => start_reading,
      O => start_reading_i_1_n_0
    );
start_reading_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => start_reading_i_1_n_0,
      Q => start_reading
    );
\write_address1[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[9]\,
      I1 => \address_in_ref_reg_n_0_[10]\,
      I2 => \address_in_ref_reg_n_0_[11]\,
      I3 => \address_in_ref_reg_n_0_[0]\,
      O => write_address1_next(0)
    );
\write_address1[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[11]\,
      I1 => \address_in_ref_reg_n_0_[10]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      O => write_address1_next(10)
    );
\write_address1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => write_address1_next(0),
      Q => write_address1(0)
    );
\write_address1_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => write_address1_next(10),
      Q => write_address1(10)
    );
\write_address2[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000006"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[8]\,
      I1 => \address_in_ref_reg_n_0_[7]\,
      I2 => \address_in_ref_reg_n_0_[11]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[9]\,
      I5 => \address_in_ref_reg_n_0_[0]\,
      O => write_address2_next(0)
    );
\write_address2[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAABC"
    )
        port map (
      I0 => \write_address2_reg[11]_i_2_n_7\,
      I1 => \address_in_ref_reg_n_0_[8]\,
      I2 => \address_in_ref_reg_n_0_[7]\,
      I3 => \address_in_ref_reg_n_0_[11]\,
      I4 => \address_in_ref_reg_n_0_[10]\,
      I5 => \address_in_ref_reg_n_0_[9]\,
      O => write_address2_next(10)
    );
\write_address2[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFE00000000"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[11]\,
      I1 => \address_in_ref_reg_n_0_[10]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[7]\,
      I4 => \address_in_ref_reg_n_0_[8]\,
      I5 => \write_address2_reg[11]_i_2_n_6\,
      O => write_address2_next(11)
    );
\write_address2[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA0AA0C"
    )
        port map (
      I0 => \buffer2_reg[8]_i_2_n_7\,
      I1 => \address_in_ref_reg_n_0_[6]\,
      I2 => \address_in_ref_reg_n_0_[7]\,
      I3 => write_address1_next(10),
      I4 => \address_in_ref_reg_n_0_[8]\,
      O => write_address2_next(6)
    );
\write_address2[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA3"
    )
        port map (
      I0 => \write_address2_reg[9]_i_2_n_6\,
      I1 => \address_in_ref_reg_n_0_[8]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[7]\,
      O => write_address2_next(7)
    );
\write_address2[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA3"
    )
        port map (
      I0 => \write_address2_reg[9]_i_2_n_5\,
      I1 => \address_in_ref_reg_n_0_[8]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[7]\,
      O => write_address2_next(8)
    );
\write_address2[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA8AAAAAAA3"
    )
        port map (
      I0 => \write_address2_reg[9]_i_2_n_4\,
      I1 => \address_in_ref_reg_n_0_[8]\,
      I2 => \address_in_ref_reg_n_0_[9]\,
      I3 => \address_in_ref_reg_n_0_[10]\,
      I4 => \address_in_ref_reg_n_0_[11]\,
      I5 => \address_in_ref_reg_n_0_[7]\,
      O => write_address2_next(9)
    );
\write_address2[9]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \address_in_ref_reg_n_0_[7]\,
      O => \write_address2[9]_i_3_n_0\
    );
\write_address2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => write_address2_next(0),
      Q => write_address2(0)
    );
\write_address2_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => write_address2_next(10),
      Q => write_address2(10)
    );
\write_address2_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => write_address2_next(11),
      Q => write_address2(11)
    );
\write_address2_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \write_address2_reg[9]_i_2_n_0\,
      CO(3 downto 1) => \NLW_write_address2_reg[11]_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \write_address2_reg[11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_write_address2_reg[11]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1) => \write_address2_reg[11]_i_2_n_6\,
      O(0) => \write_address2_reg[11]_i_2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \address_in_ref_reg_n_0_[11]\,
      S(0) => \address_in_ref_reg_n_0_[10]\
    );
\write_address2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => write_address2_next(6),
      Q => write_address2(6)
    );
\write_address2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => write_address2_next(7),
      Q => write_address2(7)
    );
\write_address2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => write_address2_next(8),
      Q => write_address2(8)
    );
\write_address2_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => write_address2_next(9),
      Q => write_address2(9)
    );
\write_address2_reg[9]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \write_address2_reg[9]_i_2_n_0\,
      CO(2) => \write_address2_reg[9]_i_2_n_1\,
      CO(1) => \write_address2_reg[9]_i_2_n_2\,
      CO(0) => \write_address2_reg[9]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \address_in_ref_reg_n_0_[7]\,
      DI(0) => '0',
      O(3) => \write_address2_reg[9]_i_2_n_4\,
      O(2) => \write_address2_reg[9]_i_2_n_5\,
      O(1) => \write_address2_reg[9]_i_2_n_6\,
      O(0) => \NLW_write_address2_reg[9]_i_2_O_UNCONNECTED\(0),
      S(3) => \address_in_ref_reg_n_0_[9]\,
      S(2) => \address_in_ref_reg_n_0_[8]\,
      S(1) => \write_address2[9]_i_3_n_0\,
      S(0) => \address_in_ref_reg_n_0_[6]\
    );
\write_address_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(0),
      Q => write_address(0)
    );
\write_address_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(10),
      Q => write_address(10)
    );
\write_address_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(11),
      Q => write_address(11)
    );
\write_address_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(1),
      Q => write_address(1)
    );
\write_address_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(2),
      Q => write_address(2)
    );
\write_address_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(3),
      Q => write_address(3)
    );
\write_address_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(4),
      Q => write_address(4)
    );
\write_address_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(5),
      Q => write_address(5)
    );
\write_address_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(6),
      Q => write_address(6)
    );
\write_address_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(7),
      Q => write_address(7)
    );
\write_address_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(8),
      Q => write_address(8)
    );
\write_address_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => WIN_n_13,
      CLR => reset_IBUF,
      D => write_address_next(9),
      Q => write_address(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fsm_global is
  port (
    clk_fpga : in STD_LOGIC;
    reset : in STD_LOGIC;
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    MCLK_ADC : out STD_LOGIC;
    SCLK_ADC : out STD_LOGIC;
    LR_W_SEL_ADC : out STD_LOGIC;
    MCLK_DAC : out STD_LOGIC;
    SCLK_DAC : out STD_LOGIC;
    LR_W_SEL_DAC : out STD_LOGIC;
    play_enable : in STD_LOGIC;
    DATA_IN : in STD_LOGIC;
    DATA_OUT : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of fsm_global : entity is true;
end fsm_global;

architecture STRUCTURE of fsm_global is
  signal B : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CONT_n_21 : STD_LOGIC;
  signal CONT_n_22 : STD_LOGIC;
  signal CONT_n_23 : STD_LOGIC;
  signal CONT_n_24 : STD_LOGIC;
  signal CONT_n_25 : STD_LOGIC;
  signal CONT_n_26 : STD_LOGIC;
  signal CONT_n_27 : STD_LOGIC;
  signal CONT_n_28 : STD_LOGIC;
  signal CONT_n_29 : STD_LOGIC;
  signal CONT_n_30 : STD_LOGIC;
  signal CONT_n_31 : STD_LOGIC;
  signal CONT_n_32 : STD_LOGIC;
  signal CONT_n_33 : STD_LOGIC;
  signal CONT_n_34 : STD_LOGIC;
  signal CONT_n_35 : STD_LOGIC;
  signal CONT_n_36 : STD_LOGIC;
  signal CONT_n_37 : STD_LOGIC;
  signal CONT_n_4 : STD_LOGIC;
  signal DATA_IN_IBUF : STD_LOGIC;
  signal DATA_OUT_OBUF : STD_LOGIC;
  signal LR_W_SEL_DAC_OBUF : STD_LOGIC;
  signal MCLK_DAC_OBUF : STD_LOGIC;
  signal SCLK_DAC_OBUF : STD_LOGIC;
  signal an_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal clk_100MHz : STD_LOGIC;
  signal clk_50MHz : STD_LOGIC;
  signal play_enable_IBUF : STD_LOGIC;
  signal pre_resultiSTFT0_n_100 : STD_LOGIC;
  signal pre_resultiSTFT0_n_101 : STD_LOGIC;
  signal pre_resultiSTFT0_n_102 : STD_LOGIC;
  signal pre_resultiSTFT0_n_103 : STD_LOGIC;
  signal pre_resultiSTFT0_n_104 : STD_LOGIC;
  signal pre_resultiSTFT0_n_105 : STD_LOGIC;
  signal pre_resultiSTFT0_n_74 : STD_LOGIC;
  signal pre_resultiSTFT0_n_75 : STD_LOGIC;
  signal pre_resultiSTFT0_n_76 : STD_LOGIC;
  signal pre_resultiSTFT0_n_77 : STD_LOGIC;
  signal pre_resultiSTFT0_n_78 : STD_LOGIC;
  signal pre_resultiSTFT0_n_79 : STD_LOGIC;
  signal pre_resultiSTFT0_n_80 : STD_LOGIC;
  signal pre_resultiSTFT0_n_81 : STD_LOGIC;
  signal pre_resultiSTFT0_n_82 : STD_LOGIC;
  signal pre_resultiSTFT0_n_83 : STD_LOGIC;
  signal pre_resultiSTFT0_n_84 : STD_LOGIC;
  signal pre_resultiSTFT0_n_85 : STD_LOGIC;
  signal pre_resultiSTFT0_n_86 : STD_LOGIC;
  signal pre_resultiSTFT0_n_87 : STD_LOGIC;
  signal pre_resultiSTFT0_n_88 : STD_LOGIC;
  signal pre_resultiSTFT0_n_89 : STD_LOGIC;
  signal pre_resultiSTFT0_n_90 : STD_LOGIC;
  signal pre_resultiSTFT0_n_91 : STD_LOGIC;
  signal pre_resultiSTFT0_n_92 : STD_LOGIC;
  signal pre_resultiSTFT0_n_93 : STD_LOGIC;
  signal pre_resultiSTFT0_n_94 : STD_LOGIC;
  signal pre_resultiSTFT0_n_95 : STD_LOGIC;
  signal pre_resultiSTFT0_n_96 : STD_LOGIC;
  signal pre_resultiSTFT0_n_97 : STD_LOGIC;
  signal pre_resultiSTFT0_n_98 : STD_LOGIC;
  signal pre_resultiSTFT0_n_99 : STD_LOGIC;
  signal reset_IBUF : STD_LOGIC;
  signal \result1buf_reg[15]_i_2_n_0\ : STD_LOGIC;
  signal \result1buf_reg[15]_i_3_n_0\ : STD_LOGIC;
  signal seg_OBUF : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal NLW_pre_resultiSTFT0_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultiSTFT0_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultiSTFT0_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultiSTFT0_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultiSTFT0_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultiSTFT0_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_pre_resultiSTFT0_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_pre_resultiSTFT0_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_pre_resultiSTFT0_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_pre_resultiSTFT0_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal NLW_pre_resultiSTFT0_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute syn_black_box : string;
  attribute syn_black_box of clk_gen : label is "TRUE";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of pre_resultiSTFT0 : label is "{SYNTH-12 {cell *THIS*}}";
  attribute CLOCK_BUFFER_TYPE : string;
  attribute CLOCK_BUFFER_TYPE of clk_fpga : signal is "none";
begin
CONT: entity work.master_controller
     port map (
      A(14) => CONT_n_23,
      A(13) => CONT_n_24,
      A(12) => CONT_n_25,
      A(11) => CONT_n_26,
      A(10) => CONT_n_27,
      A(9) => CONT_n_28,
      A(8) => CONT_n_29,
      A(7) => CONT_n_30,
      A(6) => CONT_n_31,
      A(5) => CONT_n_32,
      A(4) => CONT_n_33,
      A(3) => CONT_n_34,
      A(2) => CONT_n_35,
      A(1) => CONT_n_36,
      A(0) => CONT_n_37,
      B(15 downto 0) => B(15 downto 0),
      CLK => clk_50MHz,
      D(0) => DATA_IN_IBUF,
      DATA_OUT_OBUF => DATA_OUT_OBUF,
      LR_W_SEL_DAC_OBUF => LR_W_SEL_DAC_OBUF,
      MCLK_DAC_OBUF => MCLK_DAC_OBUF,
      P(15) => pre_resultiSTFT0_n_75,
      P(14) => pre_resultiSTFT0_n_76,
      P(13) => pre_resultiSTFT0_n_77,
      P(12) => pre_resultiSTFT0_n_78,
      P(11) => pre_resultiSTFT0_n_79,
      P(10) => pre_resultiSTFT0_n_80,
      P(9) => pre_resultiSTFT0_n_81,
      P(8) => pre_resultiSTFT0_n_82,
      P(7) => pre_resultiSTFT0_n_83,
      P(6) => pre_resultiSTFT0_n_84,
      P(5) => pre_resultiSTFT0_n_85,
      P(4) => pre_resultiSTFT0_n_86,
      P(3) => pre_resultiSTFT0_n_87,
      P(2) => pre_resultiSTFT0_n_88,
      P(1) => pre_resultiSTFT0_n_89,
      P(0) => pre_resultiSTFT0_n_90,
      SCLK_DAC_OBUF => SCLK_DAC_OBUF,
      clk_100MHz => clk_100MHz,
      pre_resultiSTFT0 => CONT_n_4,
      reset_IBUF => reset_IBUF,
      \result1buf_reg[15]_i_2\ => CONT_n_21,
      \result1buf_reg[15]_i_2_0\ => \result1buf_reg[15]_i_2_n_0\,
      \result1buf_reg[15]_i_3\ => CONT_n_22,
      \result1buf_reg[15]_i_3_0\ => \result1buf_reg[15]_i_3_n_0\,
      state(1 downto 0) => state(1 downto 0)
    );
DATA_IN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => DATA_IN,
      O => DATA_IN_IBUF
    );
DATA_OUT_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => DATA_OUT_OBUF,
      O => DATA_OUT
    );
LR_W_SEL_ADC_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => LR_W_SEL_DAC_OBUF,
      O => LR_W_SEL_ADC
    );
LR_W_SEL_DAC_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => LR_W_SEL_DAC_OBUF,
      O => LR_W_SEL_DAC
    );
MCLK_ADC_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => MCLK_DAC_OBUF,
      O => MCLK_ADC
    );
MCLK_DAC_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => MCLK_DAC_OBUF,
      O => MCLK_DAC
    );
SCLK_ADC_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => SCLK_DAC_OBUF,
      O => SCLK_ADC
    );
SCLK_DAC_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => SCLK_DAC_OBUF,
      O => SCLK_DAC
    );
\an_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => an_OBUF(0),
      O => an(0)
    );
\an_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => an_OBUF(1),
      O => an(1)
    );
\an_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => an_OBUF(2),
      O => an(2)
    );
\an_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => an_OBUF(3),
      O => an(3)
    );
\an_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => an_OBUF(4),
      O => an(4)
    );
\an_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => an_OBUF(5),
      O => an(5)
    );
\an_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => an_OBUF(6),
      O => an(6)
    );
\an_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => an_OBUF(7),
      O => an(7)
    );
clk_gen: entity work.clk_generator
     port map (
      clk_100MHz => clk_100MHz,
      clk_50MHz => clk_50MHz,
      clk_fpga => clk_fpga
    );
displays: entity work.display_interface
     port map (
      an_OBUF(7 downto 0) => an_OBUF(7 downto 0),
      clk_100MHz => clk_100MHz,
      reset_IBUF => reset_IBUF,
      seg_OBUF(6 downto 0) => seg_OBUF(6 downto 0),
      state(1 downto 0) => state(1 downto 0)
    );
play_enable_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => play_enable,
      O => play_enable_IBUF
    );
pre_resultiSTFT0: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 15) => B"000000000000000",
      A(14) => CONT_n_23,
      A(13) => CONT_n_24,
      A(12) => CONT_n_25,
      A(11) => CONT_n_26,
      A(10) => CONT_n_27,
      A(9) => CONT_n_28,
      A(8) => CONT_n_29,
      A(7) => CONT_n_30,
      A(6) => CONT_n_31,
      A(5) => CONT_n_32,
      A(4) => CONT_n_33,
      A(3) => CONT_n_34,
      A(2) => CONT_n_35,
      A(1) => CONT_n_36,
      A(0) => CONT_n_37,
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_pre_resultiSTFT0_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => B(15),
      B(16) => B(15),
      B(15 downto 0) => B(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_pre_resultiSTFT0_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_pre_resultiSTFT0_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_pre_resultiSTFT0_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => CONT_n_4,
      CLK => clk_100MHz,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_pre_resultiSTFT0_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_pre_resultiSTFT0_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_pre_resultiSTFT0_P_UNCONNECTED(47 downto 32),
      P(31) => pre_resultiSTFT0_n_74,
      P(30) => pre_resultiSTFT0_n_75,
      P(29) => pre_resultiSTFT0_n_76,
      P(28) => pre_resultiSTFT0_n_77,
      P(27) => pre_resultiSTFT0_n_78,
      P(26) => pre_resultiSTFT0_n_79,
      P(25) => pre_resultiSTFT0_n_80,
      P(24) => pre_resultiSTFT0_n_81,
      P(23) => pre_resultiSTFT0_n_82,
      P(22) => pre_resultiSTFT0_n_83,
      P(21) => pre_resultiSTFT0_n_84,
      P(20) => pre_resultiSTFT0_n_85,
      P(19) => pre_resultiSTFT0_n_86,
      P(18) => pre_resultiSTFT0_n_87,
      P(17) => pre_resultiSTFT0_n_88,
      P(16) => pre_resultiSTFT0_n_89,
      P(15) => pre_resultiSTFT0_n_90,
      P(14) => pre_resultiSTFT0_n_91,
      P(13) => pre_resultiSTFT0_n_92,
      P(12) => pre_resultiSTFT0_n_93,
      P(11) => pre_resultiSTFT0_n_94,
      P(10) => pre_resultiSTFT0_n_95,
      P(9) => pre_resultiSTFT0_n_96,
      P(8) => pre_resultiSTFT0_n_97,
      P(7) => pre_resultiSTFT0_n_98,
      P(6) => pre_resultiSTFT0_n_99,
      P(5) => pre_resultiSTFT0_n_100,
      P(4) => pre_resultiSTFT0_n_101,
      P(3) => pre_resultiSTFT0_n_102,
      P(2) => pre_resultiSTFT0_n_103,
      P(1) => pre_resultiSTFT0_n_104,
      P(0) => pre_resultiSTFT0_n_105,
      PATTERNBDETECT => NLW_pre_resultiSTFT0_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_pre_resultiSTFT0_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_pre_resultiSTFT0_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_pre_resultiSTFT0_UNDERFLOW_UNCONNECTED
    );
reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset,
      O => reset_IBUF
    );
\result1buf_reg[15]_i_2\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => CONT_n_21,
      Q => \result1buf_reg[15]_i_2_n_0\
    );
\result1buf_reg[15]_i_3\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => CONT_n_22,
      Q => \result1buf_reg[15]_i_3_n_0\
    );
\seg_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_OBUF(0),
      O => seg(0)
    );
\seg_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_OBUF(1),
      O => seg(1)
    );
\seg_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_OBUF(2),
      O => seg(2)
    );
\seg_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_OBUF(3),
      O => seg(3)
    );
\seg_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_OBUF(4),
      O => seg(4)
    );
\seg_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_OBUF(5),
      O => seg(5)
    );
\seg_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_OBUF(6),
      O => seg(6)
    );
\state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => play_enable_IBUF,
      O => \state[0]_i_1_n_0\
    );
\state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      O => \state[1]_i_1_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \state[0]_i_1_n_0\,
      Q => state(0)
    );
\state_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      D => \state[1]_i_1_n_0\,
      PRE => reset_IBUF,
      Q => state(1)
    );
end STRUCTURE;
