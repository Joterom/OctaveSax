-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
-- Date        : Thu Apr 11 16:30:49 2019
-- Host        : vhdl-2018 running 64-bit Ubuntu 18.04.1 LTS
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/joterom/workspace/OctaveSax/Vivado/octave_main/octave_main.sim/sim_1/impl/func/xsim/main_tb_func_impl.vhd
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
    \curr_display_reg[0]\ : out STD_LOGIC;
    \curr_display_reg[0]_0\ : out STD_LOGIC;
    \curr_display_reg[0]_1\ : out STD_LOGIC;
    \curr_display_reg[0]_2\ : out STD_LOGIC;
    \curr_display_reg[2]\ : out STD_LOGIC;
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
  signal \counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \^curr_display_reg[0]\ : STD_LOGIC;
  signal \^curr_display_reg[0]_0\ : STD_LOGIC;
  signal \^curr_display_reg[0]_1\ : STD_LOGIC;
  signal \^curr_display_reg[0]_2\ : STD_LOGIC;
  signal \NLW_counter_reg[0]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
  \curr_display_reg[0]\ <= \^curr_display_reg[0]\;
  \curr_display_reg[0]_0\ <= \^curr_display_reg[0]_0\;
  \curr_display_reg[0]_1\ <= \^curr_display_reg[0]_1\;
  \curr_display_reg[0]_2\ <= \^curr_display_reg[0]_2\;
\counter[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55565555"
    )
        port map (
      I0 => counter_reg(0),
      I1 => \^curr_display_reg[0]\,
      I2 => \^curr_display_reg[0]_0\,
      I3 => \^curr_display_reg[0]_1\,
      I4 => \^curr_display_reg[0]_2\,
      O => \counter[0]_i_2_n_0\
    );
\counter[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => counter_reg(15),
      I1 => \^curr_display_reg[0]\,
      I2 => \^curr_display_reg[0]_0\,
      I3 => \^curr_display_reg[0]_1\,
      I4 => \^curr_display_reg[0]_2\,
      O => \counter[12]_i_2_n_0\
    );
\counter[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => counter_reg(14),
      I1 => \^curr_display_reg[0]\,
      I2 => \^curr_display_reg[0]_0\,
      I3 => \^curr_display_reg[0]_1\,
      I4 => \^curr_display_reg[0]_2\,
      O => \counter[12]_i_3_n_0\
    );
\counter[12]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => counter_reg(12),
      I1 => \^curr_display_reg[0]\,
      I2 => \^curr_display_reg[0]_0\,
      I3 => \^curr_display_reg[0]_1\,
      I4 => \^curr_display_reg[0]_2\,
      O => \counter[12]_i_4_n_0\
    );
\counter[16]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => counter_reg(17),
      I1 => \^curr_display_reg[0]\,
      I2 => \^curr_display_reg[0]_0\,
      I3 => \^curr_display_reg[0]_1\,
      I4 => \^curr_display_reg[0]_2\,
      O => \counter[16]_i_2_n_0\
    );
\counter[16]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => counter_reg(16),
      I1 => \^curr_display_reg[0]\,
      I2 => \^curr_display_reg[0]_0\,
      I3 => \^curr_display_reg[0]_1\,
      I4 => \^curr_display_reg[0]_2\,
      O => \counter[16]_i_3_n_0\
    );
\counter[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => counter_reg(7),
      I1 => \^curr_display_reg[0]\,
      I2 => \^curr_display_reg[0]_0\,
      I3 => \^curr_display_reg[0]_1\,
      I4 => \^curr_display_reg[0]_2\,
      O => \counter[4]_i_2_n_0\
    );
\counter[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => counter_reg(4),
      I1 => \^curr_display_reg[0]\,
      I2 => \^curr_display_reg[0]_0\,
      I3 => \^curr_display_reg[0]_1\,
      I4 => \^curr_display_reg[0]_2\,
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
      CO(2 downto 0) => \NLW_counter_reg[0]_i_1_CO_UNCONNECTED\(2 downto 0),
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
      CO(2 downto 0) => \NLW_counter_reg[12]_i_1_CO_UNCONNECTED\(2 downto 0),
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
      CO(3 downto 0) => \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
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
      CO(2 downto 0) => \NLW_counter_reg[4]_i_1_CO_UNCONNECTED\(2 downto 0),
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
      CO(2 downto 0) => \NLW_counter_reg[8]_i_1_CO_UNCONNECTED\(2 downto 0),
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
\curr_display[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => counter_reg(16),
      I1 => counter_reg(0),
      I2 => counter_reg(3),
      I3 => counter_reg(10),
      O => \^curr_display_reg[0]_1\
    );
\curr_display[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => counter_reg(7),
      I1 => counter_reg(15),
      I2 => counter_reg(14),
      I3 => counter_reg(11),
      O => \^curr_display_reg[0]_0\
    );
\curr_display[1]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter_reg(1),
      I1 => counter_reg(13),
      I2 => counter_reg(6),
      I3 => counter_reg(8),
      O => \^curr_display_reg[0]\
    );
\curr_display[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000040000000000"
    )
        port map (
      I0 => counter_reg(2),
      I1 => counter_reg(17),
      I2 => counter_reg(9),
      I3 => counter_reg(12),
      I4 => counter_reg(5),
      I5 => counter_reg(4),
      O => \^curr_display_reg[0]_2\
    );
\curr_display[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => counter_reg(8),
      I1 => counter_reg(6),
      I2 => counter_reg(13),
      I3 => counter_reg(1),
      I4 => \^curr_display_reg[0]_0\,
      I5 => \^curr_display_reg[0]_1\,
      O => \curr_display_reg[2]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fsm_control is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \writing_sample_memo1_reg[15]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \memo1_address_reg[0]\ : out STD_LOGIC;
    \writing_sample_memo2_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    write_sample_memo_next : out STD_LOGIC;
    espera_next : out STD_LOGIC;
    \read_buffer2_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \read_buffer0_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \read_buffer1_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \output_sample_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \memo2_address_reg[9]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \memo2_address_reg[9]_0\ : out STD_LOGIC;
    \win_stage_reg[0]\ : out STD_LOGIC;
    start_proc_win_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    stage : in STD_LOGIC_VECTOR ( 1 downto 0 );
    end_proc_win : in STD_LOGIC;
    \win_stage_reg[0]_0\ : in STD_LOGIC;
    reading_ready : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \win_stage_reg[1]\ : in STD_LOGIC;
    \win_stage_reg[0]_1\ : in STD_LOGIC;
    \win_stage_reg[0]_2\ : in STD_LOGIC;
    start_buffer2r : in STD_LOGIC;
    start_buffer3r : in STD_LOGIC;
    start_buffer1r : in STD_LOGIC;
    reset_IBUF : in STD_LOGIC;
    \control_reg[1]\ : in STD_LOGIC;
    reading_ready_reg : in STD_LOGIC;
    end_proc_win_reg : in STD_LOGIC;
    \win_stage_reg[1]_0\ : in STD_LOGIC;
    \frame_num_reg[0]\ : in STD_LOGIC;
    \frame_num_reg[3]\ : in STD_LOGIC;
    \frame_num_reg[2]\ : in STD_LOGIC;
    \frame_num_reg[4]\ : in STD_LOGIC;
    \FSM_sequential_input_fsm_state_reg[1]_0\ : in STD_LOGIC;
    clk_100MHz : in STD_LOGIC
  );
end fsm_control;

architecture STRUCTURE of fsm_control is
  signal \FSM_sequential_input_fsm_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_input_fsm_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_input_fsm_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_input_fsm_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_input_fsm_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_input_fsm_state[2]_i_2_n_0\ : STD_LOGIC;
  signal input_fsm_state : STD_LOGIC_VECTOR ( 2 to 2 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of input_fsm_state : signal is "yes";
  signal \^memo1_address_reg[0]\ : STD_LOGIC;
  signal \memo2_address[9]_i_5_n_0\ : STD_LOGIC;
  signal \^memo2_address_reg[9]_0\ : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of \^out\ : signal is "yes";
  signal \^writing_sample_memo1_reg[15]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_input_fsm_state_reg[0]\ : label is "write_input:001,load_fft_even:010,load_fft_odd:011,read_output:100,read_sum:101,iSTATE:000";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_input_fsm_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_input_fsm_state_reg[1]\ : label is "write_input:001,load_fft_even:010,load_fft_odd:011,read_output:100,read_sum:101,iSTATE:000";
  attribute KEEP of \FSM_sequential_input_fsm_state_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_input_fsm_state_reg[2]\ : label is "write_input:001,load_fft_even:010,load_fft_odd:011,read_output:100,read_sum:101,iSTATE:000";
  attribute KEEP of \FSM_sequential_input_fsm_state_reg[2]\ : label is "yes";
begin
  \memo1_address_reg[0]\ <= \^memo1_address_reg[0]\;
  \memo2_address_reg[9]_0\ <= \^memo2_address_reg[9]_0\;
  \out\(1 downto 0) <= \^out\(1 downto 0);
  \writing_sample_memo1_reg[15]\(0) <= \^writing_sample_memo1_reg[15]\(0);
\FSM_sequential_input_fsm_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \FSM_sequential_input_fsm_state[0]_i_2_n_0\,
      I1 => \frame_num_reg[4]\,
      I2 => input_fsm_state(2),
      I3 => \FSM_sequential_input_fsm_state_reg[1]_0\,
      I4 => \^out\(0),
      O => \FSM_sequential_input_fsm_state[0]_i_1_n_0\
    );
\FSM_sequential_input_fsm_state[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"80D4"
    )
        port map (
      I0 => input_fsm_state(2),
      I1 => \^out\(1),
      I2 => \frame_num_reg[0]\,
      I3 => \^out\(0),
      O => \FSM_sequential_input_fsm_state[0]_i_2_n_0\
    );
\FSM_sequential_input_fsm_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \FSM_sequential_input_fsm_state[1]_i_2_n_0\,
      I1 => \frame_num_reg[4]\,
      I2 => input_fsm_state(2),
      I3 => \FSM_sequential_input_fsm_state_reg[1]_0\,
      I4 => \^out\(1),
      O => \FSM_sequential_input_fsm_state[1]_i_1_n_0\
    );
\FSM_sequential_input_fsm_state[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"80D4"
    )
        port map (
      I0 => input_fsm_state(2),
      I1 => \^out\(1),
      I2 => \frame_num_reg[3]\,
      I3 => \^out\(0),
      O => \FSM_sequential_input_fsm_state[1]_i_2_n_0\
    );
\FSM_sequential_input_fsm_state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BAB0"
    )
        port map (
      I0 => \FSM_sequential_input_fsm_state[2]_i_2_n_0\,
      I1 => \frame_num_reg[4]\,
      I2 => input_fsm_state(2),
      I3 => \FSM_sequential_input_fsm_state_reg[1]_0\,
      O => \FSM_sequential_input_fsm_state[2]_i_1_n_0\
    );
\FSM_sequential_input_fsm_state[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A010"
    )
        port map (
      I0 => input_fsm_state(2),
      I1 => \^out\(0),
      I2 => \frame_num_reg[2]\,
      I3 => \^out\(1),
      O => \FSM_sequential_input_fsm_state[2]_i_2_n_0\
    );
\FSM_sequential_input_fsm_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \FSM_sequential_input_fsm_state[0]_i_1_n_0\,
      Q => \^out\(0)
    );
\FSM_sequential_input_fsm_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \FSM_sequential_input_fsm_state[1]_i_1_n_0\,
      Q => \^out\(1)
    );
\FSM_sequential_input_fsm_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \FSM_sequential_input_fsm_state[2]_i_1_n_0\,
      Q => input_fsm_state(2)
    );
espera_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \win_stage_reg[1]\,
      I1 => \^out\(0),
      I2 => input_fsm_state(2),
      I3 => \^out\(1),
      I4 => Q(1),
      I5 => end_proc_win,
      O => espera_next
    );
\memo1_address[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAABBBBAABA"
    )
        port map (
      I0 => \^writing_sample_memo1_reg[15]\(0),
      I1 => \win_stage_reg[0]_0\,
      I2 => end_proc_win,
      I3 => reading_ready,
      I4 => Q(0),
      I5 => \^memo1_address_reg[0]\,
      O => E(0)
    );
\memo2_address[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004550400"
    )
        port map (
      I0 => reset_IBUF,
      I1 => stage(1),
      I2 => \control_reg[1]\,
      I3 => \^memo2_address_reg[9]_0\,
      I4 => reading_ready_reg,
      I5 => \memo2_address[9]_i_5_n_0\,
      O => \memo2_address_reg[9]\(0)
    );
\memo2_address[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF2CD3FFFFFFFFFF"
    )
        port map (
      I0 => \^out\(0),
      I1 => input_fsm_state(2),
      I2 => \^out\(1),
      I3 => stage(0),
      I4 => stage(1),
      I5 => end_proc_win,
      O => D(0)
    );
\memo2_address[9]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F9"
    )
        port map (
      I0 => \^out\(0),
      I1 => input_fsm_state(2),
      I2 => \^out\(1),
      O => \memo2_address[9]_i_5_n_0\
    );
\multiplicand[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D3"
    )
        port map (
      I0 => \^out\(0),
      I1 => input_fsm_state(2),
      I2 => \^out\(1),
      O => \^memo2_address_reg[9]_0\
    );
\output_sample[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00B1000000000000"
    )
        port map (
      I0 => start_buffer2r,
      I1 => start_buffer3r,
      I2 => start_buffer1r,
      I3 => \^out\(1),
      I4 => input_fsm_state(2),
      I5 => \^out\(0),
      O => \output_sample_reg[0]\(0)
    );
\read_buffer0[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => \win_stage_reg[0]_1\,
      I1 => reading_ready,
      I2 => Q(0),
      I3 => \^out\(1),
      I4 => input_fsm_state(2),
      I5 => \^out\(0),
      O => \read_buffer0_reg[0]\(0)
    );
\read_buffer1[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => \win_stage_reg[0]_2\,
      I1 => reading_ready,
      I2 => Q(0),
      I3 => \^out\(1),
      I4 => input_fsm_state(2),
      I5 => \^out\(0),
      O => \read_buffer1_reg[0]\(0)
    );
\read_buffer2[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => \^memo1_address_reg[0]\,
      I1 => stage(0),
      I2 => stage(1),
      I3 => Q(0),
      I4 => end_proc_win,
      I5 => reading_ready,
      O => \read_buffer2_reg[0]\(0)
    );
reading_ready_nn_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \^out\(1),
      I1 => input_fsm_state(2),
      I2 => \^out\(0),
      O => \^memo1_address_reg[0]\
    );
start_proc_win_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000200000F0200"
    )
        port map (
      I0 => reading_ready,
      I1 => Q(0),
      I2 => \^out\(1),
      I3 => input_fsm_state(2),
      I4 => \^out\(0),
      I5 => \win_stage_reg[1]_0\,
      O => start_proc_win_reg(0)
    );
\win_stage[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100310"
    )
        port map (
      I0 => end_proc_win_reg,
      I1 => \^out\(1),
      I2 => input_fsm_state(2),
      I3 => \^out\(0),
      I4 => \win_stage_reg[1]_0\,
      O => \win_stage_reg[0]\
    );
write_sample_memo_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \^out\(0),
      I1 => input_fsm_state(2),
      I2 => \^out\(1),
      I3 => Q(1),
      I4 => end_proc_win,
      O => write_sample_memo_next
    );
\writing_sample_memo1[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => stage(1),
      I1 => \^out\(0),
      I2 => input_fsm_state(2),
      I3 => \^out\(1),
      I4 => Q(1),
      I5 => end_proc_win,
      O => \^writing_sample_memo1_reg[15]\(0)
    );
\writing_sample_memo2[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => stage(1),
      I1 => \^out\(0),
      I2 => input_fsm_state(2),
      I3 => \^out\(1),
      I4 => Q(1),
      I5 => end_proc_win,
      O => \writing_sample_memo2_reg[0]\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sampling is
  port (
    CLK : out STD_LOGIC;
    \control_reg[1]_0\ : out STD_LOGIC;
    mc_reg_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 2 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    reading_ready_nn_next : out STD_LOGIC;
    \address_buf3r_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \address_buf2r_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \address_buf0r_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    DATA_OUTn0_out : out STD_LOGIC;
    enable_shift_next : out STD_LOGIC;
    \memo2_address_reg[9]\ : out STD_LOGIC;
    \memo1_address_reg[0]\ : out STD_LOGIC;
    \address_buf3_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \address_buf2_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \address_buf1_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    start_buffer2r_reg : out STD_LOGIC;
    start_buffer1r_reg : out STD_LOGIC;
    start_buffer3r_reg : out STD_LOGIC;
    \address_buf1r_reg[8]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \win_stage_reg[0]\ : out STD_LOGIC;
    \win_stage_reg[1]\ : out STD_LOGIC;
    \FSM_sequential_input_fsm_state_reg[2]\ : out STD_LOGIC;
    \FSM_sequential_input_fsm_state_reg[2]_0\ : out STD_LOGIC;
    \FSM_sequential_input_fsm_state_reg[2]_1\ : out STD_LOGIC;
    \FSM_sequential_input_fsm_state_reg[1]\ : out STD_LOGIC;
    \FSM_sequential_input_fsm_state_reg[0]\ : out STD_LOGIC;
    bbstub_clk_50MHz : in STD_LOGIC;
    reset_IBUF : in STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    end_proc_win : in STD_LOGIC;
    espera : in STD_LOGIC;
    \FSM_sequential_input_fsm_state_reg[0]_0\ : in STD_LOGIC;
    stage : in STD_LOGIC_VECTOR ( 1 downto 0 );
    reading_ready : in STD_LOGIC;
    \FSM_sequential_input_fsm_state_reg[1]_0\ : in STD_LOGIC;
    start_buffer3r : in STD_LOGIC;
    start_buffer2r : in STD_LOGIC;
    start_buffer1r : in STD_LOGIC;
    start_buffer2 : in STD_LOGIC;
    \output_sample_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \state_reg[1]\ : in STD_LOGIC;
    start_buffer3 : in STD_LOGIC;
    start_buffer1 : in STD_LOGIC;
    \counter_buf0r_reg[8]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \counter_buf0r_reg[6]\ : in STD_LOGIC;
    \FSM_sequential_input_fsm_state_reg[1]_1\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    lopt : out STD_LOGIC;
    lopt_1 : out STD_LOGIC;
    lopt_2 : out STD_LOGIC;
    lopt_3 : out STD_LOGIC
  );
end sampling;

architecture STRUCTURE of sampling is
  signal \^clk\ : STD_LOGIC;
  signal DATA_OUTr_i_10_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_11_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_12_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_2_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_3_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_4_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_5_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_6_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_7_n_0 : STD_LOGIC;
  signal DATA_OUTr_i_8_n_0 : STD_LOGIC;
  signal \FSM_sequential_input_fsm_state[2]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_input_fsm_state[2]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_input_fsm_state[2]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_input_fsm_state[2]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_input_fsm_state[2]_i_9_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \control[0]_i_2_n_0\ : STD_LOGIC;
  signal \control[0]_i_3_n_0\ : STD_LOGIC;
  signal \control[0]_i_4_n_0\ : STD_LOGIC;
  signal \control[1]_i_2_n_0\ : STD_LOGIC;
  signal \control[1]_i_3_n_0\ : STD_LOGIC;
  signal \control[2]_i_2_n_0\ : STD_LOGIC;
  signal \control[2]_i_3_n_0\ : STD_LOGIC;
  signal control_next : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^control_reg[1]_0\ : STD_LOGIC;
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
  signal \frame_num[4]_i_2_n_0\ : STD_LOGIC;
  signal frame_number : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal frame_number_next : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal init : STD_LOGIC;
  signal init_next : STD_LOGIC;
  signal init_next_i_1_n_0 : STD_LOGIC;
  signal lr_reg_lopt_replica_1 : STD_LOGIC;
  signal lr_reg_lopt_replica_2_1 : STD_LOGIC;
  signal mc_i_1_n_0 : STD_LOGIC;
  signal \^mc_reg_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal sc_next : STD_LOGIC;
  signal sc_reg_lopt_replica_1 : STD_LOGIC;
  signal sc_reg_lopt_replica_2_1 : STD_LOGIC;
  signal \win_stage[1]_i_2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[7]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \count[8]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter32[0]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \counter32[1]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \counter32[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \counter32[3]_i_2\ : label is "soft_lutpair15";
  attribute OPT_INSERTED_REPDRIVER : boolean;
  attribute OPT_INSERTED_REPDRIVER of lr_reg_lopt_replica : label is std.standard.true;
  attribute OPT_INSERTED_REPDRIVER of lr_reg_lopt_replica_2 : label is std.standard.true;
  attribute SOFT_HLUTNM of mc_i_1 : label is "soft_lutpair19";
  attribute OPT_INSERTED_REPDRIVER of sc_reg_lopt_replica : label is std.standard.true;
  attribute OPT_INSERTED_REPDRIVER of sc_reg_lopt_replica_2 : label is std.standard.true;
  attribute SOFT_HLUTNM of \win_stage[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \win_stage[1]_i_1\ : label is "soft_lutpair16";
begin
  CLK <= \^clk\;
  Q(2 downto 0) <= \^q\(2 downto 0);
  lopt <= lr_reg_lopt_replica_1;
  lopt_1 <= lr_reg_lopt_replica_2_1;
  lopt_2 <= sc_reg_lopt_replica_1;
  lopt_3 <= sc_reg_lopt_replica_2_1;
  mc_reg_0 <= \^mc_reg_0\;
  \control_reg[1]_0\ <= 'Z';
DATA_OUTr_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00002220AAAAAAAA"
    )
        port map (
      I0 => start_buffer2,
      I1 => DATA_OUTr_i_2_n_0,
      I2 => \control[1]_i_2_n_0\,
      I3 => DATA_OUTr_i_3_n_0,
      I4 => DATA_OUTr_i_4_n_0,
      I5 => DATA_OUTr_i_5_n_0,
      O => DATA_OUTn0_out
    );
DATA_OUTr_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0350035FF350F35F"
    )
        port map (
      I0 => \output_sample_reg[15]\(7),
      I1 => \output_sample_reg[15]\(6),
      I2 => frame_number(0),
      I3 => frame_number(1),
      I4 => \output_sample_reg[15]\(8),
      I5 => \output_sample_reg[15]\(5),
      O => DATA_OUTr_i_10_n_0
    );
DATA_OUTr_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55330F0055330FFF"
    )
        port map (
      I0 => \output_sample_reg[15]\(1),
      I1 => \output_sample_reg[15]\(2),
      I2 => \output_sample_reg[15]\(3),
      I3 => frame_number(0),
      I4 => frame_number(1),
      I5 => \output_sample_reg[15]\(4),
      O => DATA_OUTr_i_11_n_0
    );
DATA_OUTr_i_12: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => frame_number(1),
      I1 => frame_number(4),
      O => DATA_OUTr_i_12_n_0
    );
DATA_OUTr_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF4044FFFF"
    )
        port map (
      I0 => DATA_OUTr_i_6_n_0,
      I1 => DATA_OUTr_i_7_n_0,
      I2 => DATA_OUTr_i_8_n_0,
      I3 => \output_sample_reg[15]\(14),
      I4 => \state_reg[1]\,
      I5 => frame_number(4),
      O => DATA_OUTr_i_2_n_0
    );
DATA_OUTr_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAC0FACF0AC00AC"
    )
        port map (
      I0 => \output_sample_reg[15]\(11),
      I1 => \output_sample_reg[15]\(12),
      I2 => frame_number(0),
      I3 => frame_number(1),
      I4 => \output_sample_reg[15]\(9),
      I5 => \output_sample_reg[15]\(10),
      O => DATA_OUTr_i_3_n_0
    );
DATA_OUTr_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C808"
    )
        port map (
      I0 => DATA_OUTr_i_10_n_0,
      I1 => frame_number(3),
      I2 => frame_number(2),
      I3 => DATA_OUTr_i_11_n_0,
      O => DATA_OUTr_i_4_n_0
    );
DATA_OUTr_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFDFFFF"
    )
        port map (
      I0 => \output_sample_reg[15]\(0),
      I1 => frame_number(0),
      I2 => frame_number(3),
      I3 => frame_number(2),
      I4 => \state_reg[1]\,
      I5 => DATA_OUTr_i_12_n_0,
      O => DATA_OUTr_i_5_n_0
    );
DATA_OUTr_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B080"
    )
        port map (
      I0 => \output_sample_reg[15]\(13),
      I1 => frame_number(1),
      I2 => frame_number(0),
      I3 => \output_sample_reg[15]\(15),
      O => DATA_OUTr_i_6_n_0
    );
DATA_OUTr_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => frame_number(3),
      I1 => frame_number(2),
      O => DATA_OUTr_i_7_n_0
    );
DATA_OUTr_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => frame_number(0),
      I1 => frame_number(1),
      O => DATA_OUTr_i_8_n_0
    );
\FSM_sequential_input_fsm_state[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DF7FFFFF"
    )
        port map (
      I0 => frame_number(0),
      I1 => frame_number(3),
      I2 => frame_number(2),
      I3 => frame_number(1),
      I4 => frame_number(4),
      O => \FSM_sequential_input_fsm_state_reg[0]\
    );
\FSM_sequential_input_fsm_state[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40020000"
    )
        port map (
      I0 => frame_number(3),
      I1 => frame_number(1),
      I2 => frame_number(2),
      I3 => frame_number(0),
      I4 => frame_number(4),
      O => \FSM_sequential_input_fsm_state_reg[1]\
    );
\FSM_sequential_input_fsm_state[2]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^control_reg[1]_0\,
      I1 => frame_number(4),
      O => \FSM_sequential_input_fsm_state[2]_i_10_n_0\
    );
\FSM_sequential_input_fsm_state[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08FF0800"
    )
        port map (
      I0 => \FSM_sequential_input_fsm_state[2]_i_6_n_0\,
      I1 => frame_number(4),
      I2 => \^control_reg[1]_0\,
      I3 => \out\(1),
      I4 => \FSM_sequential_input_fsm_state[2]_i_7_n_0\,
      O => \FSM_sequential_input_fsm_state_reg[2]\
    );
\FSM_sequential_input_fsm_state[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888B888B8BBB888"
    )
        port map (
      I0 => \FSM_sequential_input_fsm_state[2]_i_8_n_0\,
      I1 => \out\(1),
      I2 => \FSM_sequential_input_fsm_state[2]_i_9_n_0\,
      I3 => \out\(0),
      I4 => \FSM_sequential_input_fsm_state[2]_i_6_n_0\,
      I5 => \FSM_sequential_input_fsm_state[2]_i_10_n_0\,
      O => \FSM_sequential_input_fsm_state_reg[2]_0\
    );
\FSM_sequential_input_fsm_state[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7EDFFFF"
    )
        port map (
      I0 => frame_number(2),
      I1 => frame_number(1),
      I2 => frame_number(3),
      I3 => frame_number(0),
      I4 => frame_number(4),
      O => \FSM_sequential_input_fsm_state_reg[2]_1\
    );
\FSM_sequential_input_fsm_state[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80C08330"
    )
        port map (
      I0 => start_buffer2,
      I1 => frame_number(0),
      I2 => frame_number(2),
      I3 => frame_number(3),
      I4 => frame_number(1),
      O => \FSM_sequential_input_fsm_state[2]_i_6_n_0\
    );
\FSM_sequential_input_fsm_state[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000002"
    )
        port map (
      I0 => \out\(0),
      I1 => frame_number(3),
      I2 => frame_number(2),
      I3 => frame_number(1),
      I4 => frame_number(4),
      I5 => frame_number(0),
      O => \FSM_sequential_input_fsm_state[2]_i_7_n_0\
    );
\FSM_sequential_input_fsm_state[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000080000000400"
    )
        port map (
      I0 => \out\(0),
      I1 => frame_number(4),
      I2 => frame_number(1),
      I3 => frame_number(3),
      I4 => frame_number(2),
      I5 => frame_number(0),
      O => \FSM_sequential_input_fsm_state[2]_i_8_n_0\
    );
\FSM_sequential_input_fsm_state[2]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => frame_number(0),
      I1 => frame_number(1),
      I2 => frame_number(4),
      I3 => frame_number(3),
      I4 => frame_number(2),
      O => \FSM_sequential_input_fsm_state[2]_i_9_n_0\
    );
\address_buf0r[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_buffer2,
      I1 => \^q\(2),
      O => \address_buf0r_reg[0]\(0)
    );
\address_buf1[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(2),
      I1 => start_buffer1,
      O => \address_buf1_reg[0]\(0)
    );
\address_buf1r[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^q\(2),
      I1 => start_buffer2,
      I2 => start_buffer1r,
      O => \address_buf1r_reg[8]\(0)
    );
\address_buf2[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => start_buffer2,
      I1 => start_buffer1,
      I2 => \^q\(2),
      O => \address_buf2_reg[0]\(0)
    );
\address_buf2r[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => start_buffer2,
      I2 => start_buffer1r,
      I3 => start_buffer2r,
      O => \address_buf2r_reg[0]\(0)
    );
\address_buf3[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => start_buffer3,
      I1 => \^q\(2),
      I2 => start_buffer1,
      I3 => start_buffer2,
      O => \address_buf3_reg[0]\(0)
    );
\address_buf3r[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => start_buffer3r,
      I1 => start_buffer2r,
      I2 => start_buffer1r,
      I3 => start_buffer2,
      I4 => \^q\(2),
      O => \address_buf3r_reg[0]\(0)
    );
\control[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0E0E0E0E000E0E0E"
    )
        port map (
      I0 => \control[0]_i_2_n_0\,
      I1 => \control[0]_i_3_n_0\,
      I2 => \control[1]_i_3_n_0\,
      I3 => \control[0]_i_4_n_0\,
      I4 => \^control_reg[1]_0\,
      I5 => \^clk\,
      O => control_next(0)
    );
\control[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000008100000"
    )
        port map (
      I0 => frame_number(0),
      I1 => frame_number(2),
      I2 => frame_number(3),
      I3 => frame_number(1),
      I4 => frame_number(4),
      I5 => \^clk\,
      O => \control[0]_i_2_n_0\
    );
\control[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => frame_number(3),
      I1 => frame_number(2),
      I2 => frame_number(4),
      I3 => \control[2]_i_3_n_0\,
      I4 => \^clk\,
      I5 => \^control_reg[1]_0\,
      O => \control[0]_i_3_n_0\
    );
\control[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => frame_number(1),
      I1 => frame_number(0),
      I2 => frame_number(3),
      I3 => frame_number(2),
      I4 => frame_number(4),
      O => \control[0]_i_4_n_0\
    );
\control[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => \control[1]_i_2_n_0\,
      I1 => frame_number(1),
      I2 => frame_number(4),
      I3 => \^clk\,
      I4 => \^control_reg[1]_0\,
      I5 => \control[1]_i_3_n_0\,
      O => control_next(1)
    );
\control[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => frame_number(3),
      I1 => frame_number(2),
      O => \control[1]_i_2_n_0\
    );
\control[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => counter32(0),
      I1 => counter32(2),
      I2 => counter32(3),
      I3 => counter32(1),
      O => \control[1]_i_3_n_0\
    );
\control[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \control[2]_i_2_n_0\,
      I1 => counter32(1),
      I2 => counter32(3),
      I3 => counter32(2),
      I4 => counter32(0),
      O => control_next(2)
    );
\control[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => frame_number(4),
      I1 => frame_number(2),
      I2 => frame_number(3),
      I3 => \control[2]_i_3_n_0\,
      I4 => \^control_reg[1]_0\,
      I5 => \^clk\,
      O => \control[2]_i_2_n_0\
    );
\control[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => frame_number(1),
      I1 => frame_number(0),
      O => \control[2]_i_3_n_0\
    );
\control_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => control_next(0),
      Q => \^q\(0)
    );
\control_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => control_next(1),
      Q => \^q\(1)
    );
\control_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => control_next(2),
      Q => \^q\(2)
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
      C => bbstub_clk_50MHz,
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
      C => bbstub_clk_50MHz,
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
      C => bbstub_clk_50MHz,
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
      C => bbstub_clk_50MHz,
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
      C => bbstub_clk_50MHz,
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
      C => bbstub_clk_50MHz,
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
      C => bbstub_clk_50MHz,
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
      C => bbstub_clk_50MHz,
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
      C => bbstub_clk_50MHz,
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
      I0 => counter32(1),
      I1 => counter32(0),
      O => counter32_next(1)
    );
\counter32[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => counter32(2),
      I1 => counter32(0),
      I2 => counter32(1),
      O => counter32_next(2)
    );
\counter32[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8880A829"
    )
        port map (
      I0 => frame_number(4),
      I1 => frame_number(2),
      I2 => frame_number(3),
      I3 => frame_number(0),
      I4 => frame_number(1),
      O => \counter32[3]_i_1_n_0\
    );
\counter32[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => counter32(3),
      I1 => counter32(2),
      I2 => counter32(0),
      I3 => counter32(1),
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
      INIT => X"1111111111111114"
    )
        port map (
      I0 => \^control_reg[1]_0\,
      I1 => frame_number(4),
      I2 => frame_number(2),
      I3 => frame_number(3),
      I4 => frame_number(0),
      I5 => frame_number(1),
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
      O => frame_number_next(2)
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
      C => \^clk\,
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
      C => \^clk\,
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
      C => \^clk\,
      CE => '1',
      CLR => \frame_num[4]_i_2_n_0\,
      D => frame_number_next(2),
      Q => frame_number(2)
    );
\frame_num_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => \^clk\,
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
      C => \^clk\,
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
      I2 => \^control_reg[1]_0\,
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
      C => bbstub_clk_50MHz,
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
      O => p_0_in
    );
lr_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => bbstub_clk_50MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => p_0_in,
      Q => \^control_reg[1]_0\
    );
lr_reg_lopt_replica: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => bbstub_clk_50MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => p_0_in,
      Q => lr_reg_lopt_replica_1
    );
lr_reg_lopt_replica_2: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => bbstub_clk_50MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => p_0_in,
      Q => lr_reg_lopt_replica_2_1
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
      C => bbstub_clk_50MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => mc_i_1_n_0,
      Q => \^mc_reg_0\
    );
\memo1_address[9]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => stage(0),
      I1 => stage(1),
      I2 => \^q\(0),
      O => \memo1_address_reg[0]\
    );
\memo2_address[9]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^q\(1),
      I1 => end_proc_win,
      O => \memo2_address_reg[9]\
    );
\read_buffer3[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => \^q\(0),
      I1 => stage(0),
      I2 => stage(1),
      I3 => reading_ready,
      I4 => end_proc_win,
      I5 => \FSM_sequential_input_fsm_state_reg[1]_0\,
      O => E(0)
    );
reading_ready_nn_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AABFAAAA"
    )
        port map (
      I0 => \^q\(0),
      I1 => stage(0),
      I2 => stage(1),
      I3 => reading_ready,
      I4 => end_proc_win,
      I5 => \FSM_sequential_input_fsm_state_reg[1]_0\,
      O => reading_ready_nn_next
    );
sc_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => bbstub_clk_50MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => sc_next,
      Q => \^clk\
    );
sc_reg_lopt_replica: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => bbstub_clk_50MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => sc_next,
      Q => sc_reg_lopt_replica_1
    );
sc_reg_lopt_replica_2: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => bbstub_clk_50MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => sc_next,
      Q => sc_reg_lopt_replica_2_1
    );
start_buffer1r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000040"
    )
        port map (
      I0 => \counter_buf0r_reg[8]\(1),
      I1 => start_buffer2,
      I2 => \^q\(2),
      I3 => \counter_buf0r_reg[8]\(0),
      I4 => \counter_buf0r_reg[6]\,
      I5 => start_buffer1r,
      O => start_buffer1r_reg
    );
start_buffer2r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000080"
    )
        port map (
      I0 => \^q\(2),
      I1 => start_buffer2,
      I2 => \counter_buf0r_reg[8]\(0),
      I3 => \counter_buf0r_reg[6]\,
      I4 => \counter_buf0r_reg[8]\(1),
      I5 => start_buffer2r,
      O => start_buffer2r_reg
    );
start_buffer3r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000080"
    )
        port map (
      I0 => \counter_buf0r_reg[8]\(1),
      I1 => start_buffer2,
      I2 => \^q\(2),
      I3 => \counter_buf0r_reg[8]\(0),
      I4 => \counter_buf0r_reg[6]\,
      I5 => start_buffer3r,
      O => start_buffer3r_reg
    );
\win_stage[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"34"
    )
        port map (
      I0 => \win_stage[1]_i_2_n_0\,
      I1 => \FSM_sequential_input_fsm_state_reg[1]_1\,
      I2 => stage(0),
      O => \win_stage_reg[0]\
    );
\win_stage[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F20"
    )
        port map (
      I0 => stage(0),
      I1 => \win_stage[1]_i_2_n_0\,
      I2 => \FSM_sequential_input_fsm_state_reg[1]_1\,
      I3 => stage(1),
      O => \win_stage_reg[1]\
    );
\win_stage[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0FFDDDD"
    )
        port map (
      I0 => end_proc_win,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => espera,
      I4 => \FSM_sequential_input_fsm_state_reg[0]_0\,
      O => \win_stage[1]_i_2_n_0\
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
    CLK : in STD_LOGIC;
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
      C => CLK,
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
    D : out STD_LOGIC_VECTOR ( 9 downto 0 );
    end_proc_win : out STD_LOGIC;
    \memo2_address_reg[8]\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \memo2_address_reg[9]\ : out STD_LOGIC;
    \win_stage_reg[0]\ : out STD_LOGIC;
    start_proc_win_reg : out STD_LOGIC;
    read_sample_memo_reg : out STD_LOGIC;
    \read_buffer0_reg[0]\ : out STD_LOGIC;
    \read_buffer1_reg[0]\ : out STD_LOGIC;
    DI : out STD_LOGIC_VECTOR ( 3 downto 0 );
    result : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \read_buffer0_reg[13]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    read_buffer0_next3 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    read_buffer0_next1 : out STD_LOGIC_VECTOR ( 12 downto 0 );
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    \read_buffer0_reg[13]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stage : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    \FSM_sequential_input_fsm_state_reg[0]\ : in STD_LOGIC;
    \control_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \address_buf0r_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \address_buf1r_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \address_buf1_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    reading_ready : in STD_LOGIC;
    \address_buf3r_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \address_buf2r_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \address_buf3_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \address_buf2_reg[8]\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    espera : in STD_LOGIC;
    \win_stage_reg[1]\ : in STD_LOGIC;
    \FSM_sequential_input_fsm_state_reg[1]\ : in STD_LOGIC;
    read_sample : in STD_LOGIC;
    start_proc_win : in STD_LOGIC;
    \result_pre_reg[17]_0\ : in STD_LOGIC;
    \result_pre_reg[21]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \result_pre_reg[25]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \result_pre_reg[29]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \result_pre_reg[30]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_100MHz : in STD_LOGIC;
    reset_IBUF : in STD_LOGIC;
    \multiplicand_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end window_controller;

architecture STRUCTURE of window_controller is
  signal \^end_proc_win\ : STD_LOGIC;
  signal \memo1_address[0]_i_2_n_0\ : STD_LOGIC;
  signal \memo1_address[1]_i_2_n_0\ : STD_LOGIC;
  signal \memo1_address[2]_i_2_n_0\ : STD_LOGIC;
  signal \memo1_address[3]_i_2_n_0\ : STD_LOGIC;
  signal \memo1_address[4]_i_2_n_0\ : STD_LOGIC;
  signal \memo1_address[5]_i_2_n_0\ : STD_LOGIC;
  signal \memo1_address[6]_i_2_n_0\ : STD_LOGIC;
  signal \memo1_address[7]_i_2_n_0\ : STD_LOGIC;
  signal \memo1_address[8]_i_2_n_0\ : STD_LOGIC;
  signal \memo2_address[0]_i_2_n_0\ : STD_LOGIC;
  signal \memo2_address[0]_i_3_n_0\ : STD_LOGIC;
  signal \memo2_address[1]_i_2_n_0\ : STD_LOGIC;
  signal \memo2_address[1]_i_3_n_0\ : STD_LOGIC;
  signal \memo2_address[2]_i_2_n_0\ : STD_LOGIC;
  signal \memo2_address[2]_i_3_n_0\ : STD_LOGIC;
  signal \memo2_address[3]_i_2_n_0\ : STD_LOGIC;
  signal \memo2_address[3]_i_3_n_0\ : STD_LOGIC;
  signal \memo2_address[4]_i_2_n_0\ : STD_LOGIC;
  signal \memo2_address[4]_i_3_n_0\ : STD_LOGIC;
  signal \memo2_address[5]_i_2_n_0\ : STD_LOGIC;
  signal \memo2_address[5]_i_3_n_0\ : STD_LOGIC;
  signal \memo2_address[6]_i_2_n_0\ : STD_LOGIC;
  signal \memo2_address[6]_i_3_n_0\ : STD_LOGIC;
  signal \memo2_address[7]_i_2_n_0\ : STD_LOGIC;
  signal \memo2_address[7]_i_3_n_0\ : STD_LOGIC;
  signal \memo2_address[8]_i_2_n_0\ : STD_LOGIC;
  signal \memo2_address[8]_i_3_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \read_buffer1_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \read_buffer1_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \read_buffer1_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \read_buffer1_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \read_buffer1_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \read_buffer1_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \^result\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal result_next0_n_75 : STD_LOGIC;
  signal result_next0_n_76 : STD_LOGIC;
  signal result_next0_n_77 : STD_LOGIC;
  signal result_next0_n_78 : STD_LOGIC;
  signal result_next0_n_79 : STD_LOGIC;
  signal result_next0_n_80 : STD_LOGIC;
  signal result_next0_n_81 : STD_LOGIC;
  signal result_next0_n_82 : STD_LOGIC;
  signal result_next0_n_83 : STD_LOGIC;
  signal result_next0_n_84 : STD_LOGIC;
  signal result_next0_n_85 : STD_LOGIC;
  signal result_next0_n_86 : STD_LOGIC;
  signal result_next0_n_87 : STD_LOGIC;
  signal result_next0_n_88 : STD_LOGIC;
  signal result_next0_n_89 : STD_LOGIC;
  signal result_next0_n_90 : STD_LOGIC;
  signal \result_pre[15]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[16]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[17]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[18]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[19]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[20]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[21]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[22]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[23]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[24]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[25]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[26]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[27]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[28]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[29]_i_1_n_0\ : STD_LOGIC;
  signal \result_pre[30]_i_1_n_0\ : STD_LOGIC;
  signal \NLW_read_buffer1_reg[10]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_read_buffer1_reg[12]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_read_buffer1_reg[13]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_read_buffer1_reg[13]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_read_buffer1_reg[15]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_read_buffer1_reg[15]_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_read_buffer1_reg[2]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_read_buffer1_reg[2]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_read_buffer1_reg[4]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_read_buffer1_reg[6]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_read_buffer1_reg[8]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_result_next0_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_result_next0_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_result_next0_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_result_next0_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_result_next0_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_result_next0_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_result_next0_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_result_next0_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_result_next0_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_result_next0_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_result_next0_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of result_next0 : label is "{SYNTH-13 {cell *THIS*}}";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \result_pre[15]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \result_pre[16]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \result_pre[17]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \result_pre[18]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \result_pre[19]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \result_pre[20]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \result_pre[21]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \result_pre[22]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \result_pre[23]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \result_pre[24]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \result_pre[25]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \result_pre[26]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \result_pre[27]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \result_pre[28]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \result_pre[29]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \result_pre[30]_i_1\ : label is "soft_lutpair26";
begin
  end_proc_win <= \^end_proc_win\;
  result(15 downto 0) <= \^result\(15 downto 0);
end_proc_win_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => start_proc_win,
      Q => \^end_proc_win\
    );
\memo1_address[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \memo1_address[0]_i_2_n_0\,
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => \address_buf0r_reg[8]\(0),
      I3 => \control_reg[1]\(0),
      I4 => \address_buf1r_reg[8]\(0),
      O => D(0)
    );
\memo1_address[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAA8AA"
    )
        port map (
      I0 => \address_buf1_reg[8]\(0),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => Q(0),
      O => \memo1_address[0]_i_2_n_0\
    );
\memo1_address[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \memo1_address[1]_i_2_n_0\,
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => \address_buf0r_reg[8]\(1),
      I3 => \control_reg[1]\(0),
      I4 => \address_buf1r_reg[8]\(1),
      O => D(1)
    );
\memo1_address[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAA8AA"
    )
        port map (
      I0 => \address_buf1_reg[8]\(1),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => Q(1),
      O => \memo1_address[1]_i_2_n_0\
    );
\memo1_address[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \memo1_address[2]_i_2_n_0\,
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => \address_buf0r_reg[8]\(2),
      I3 => \control_reg[1]\(0),
      I4 => \address_buf1r_reg[8]\(2),
      O => D(2)
    );
\memo1_address[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAA8AA"
    )
        port map (
      I0 => \address_buf1_reg[8]\(2),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => Q(2),
      O => \memo1_address[2]_i_2_n_0\
    );
\memo1_address[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \memo1_address[3]_i_2_n_0\,
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => \address_buf0r_reg[8]\(3),
      I3 => \control_reg[1]\(0),
      I4 => \address_buf1r_reg[8]\(3),
      O => D(3)
    );
\memo1_address[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAA8AA"
    )
        port map (
      I0 => \address_buf1_reg[8]\(3),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => Q(3),
      O => \memo1_address[3]_i_2_n_0\
    );
\memo1_address[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \memo1_address[4]_i_2_n_0\,
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => \address_buf0r_reg[8]\(4),
      I3 => \control_reg[1]\(0),
      I4 => \address_buf1r_reg[8]\(4),
      O => D(4)
    );
\memo1_address[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAA8AA"
    )
        port map (
      I0 => \address_buf1_reg[8]\(4),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => Q(4),
      O => \memo1_address[4]_i_2_n_0\
    );
\memo1_address[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \memo1_address[5]_i_2_n_0\,
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => \address_buf0r_reg[8]\(5),
      I3 => \control_reg[1]\(0),
      I4 => \address_buf1r_reg[8]\(5),
      O => D(5)
    );
\memo1_address[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAA8AA"
    )
        port map (
      I0 => \address_buf1_reg[8]\(5),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => Q(5),
      O => \memo1_address[5]_i_2_n_0\
    );
\memo1_address[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \memo1_address[6]_i_2_n_0\,
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => \address_buf0r_reg[8]\(6),
      I3 => \control_reg[1]\(0),
      I4 => \address_buf1r_reg[8]\(6),
      O => D(6)
    );
\memo1_address[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAA8AA"
    )
        port map (
      I0 => \address_buf1_reg[8]\(6),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => Q(6),
      O => \memo1_address[6]_i_2_n_0\
    );
\memo1_address[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \memo1_address[7]_i_2_n_0\,
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => \address_buf0r_reg[8]\(7),
      I3 => \control_reg[1]\(0),
      I4 => \address_buf1r_reg[8]\(7),
      O => D(7)
    );
\memo1_address[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAA8AA"
    )
        port map (
      I0 => \address_buf1_reg[8]\(7),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => Q(7),
      O => \memo1_address[7]_i_2_n_0\
    );
\memo1_address[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \memo1_address[8]_i_2_n_0\,
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => \address_buf0r_reg[8]\(8),
      I3 => \control_reg[1]\(0),
      I4 => \address_buf1r_reg[8]\(8),
      O => D(8)
    );
\memo1_address[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAA8AA"
    )
        port map (
      I0 => \address_buf1_reg[8]\(8),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => Q(8),
      O => \memo1_address[8]_i_2_n_0\
    );
\memo1_address[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFD0000FFFDFFFF"
    )
        port map (
      I0 => \^end_proc_win\,
      I1 => stage(1),
      I2 => stage(0),
      I3 => Q(9),
      I4 => \FSM_sequential_input_fsm_state_reg[0]\,
      I5 => \control_reg[1]\(0),
      O => D(9)
    );
\memo2_address[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3r_reg[8]\(0),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => \address_buf2r_reg[8]\(0),
      O => \memo2_address[0]_i_2_n_0\
    );
\memo2_address[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3_reg[8]\(0),
      I1 => \^end_proc_win\,
      I2 => stage(0),
      I3 => stage(1),
      I4 => \address_buf2_reg[8]\(0),
      O => \memo2_address[0]_i_3_n_0\
    );
\memo2_address[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3r_reg[8]\(1),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => \address_buf2r_reg[8]\(1),
      O => \memo2_address[1]_i_2_n_0\
    );
\memo2_address[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3_reg[8]\(1),
      I1 => \^end_proc_win\,
      I2 => stage(0),
      I3 => stage(1),
      I4 => \address_buf2_reg[8]\(1),
      O => \memo2_address[1]_i_3_n_0\
    );
\memo2_address[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3r_reg[8]\(2),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => \address_buf2r_reg[8]\(2),
      O => \memo2_address[2]_i_2_n_0\
    );
\memo2_address[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3_reg[8]\(2),
      I1 => \^end_proc_win\,
      I2 => stage(0),
      I3 => stage(1),
      I4 => \address_buf2_reg[8]\(2),
      O => \memo2_address[2]_i_3_n_0\
    );
\memo2_address[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3r_reg[8]\(3),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => \address_buf2r_reg[8]\(3),
      O => \memo2_address[3]_i_2_n_0\
    );
\memo2_address[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3_reg[8]\(3),
      I1 => \^end_proc_win\,
      I2 => stage(0),
      I3 => stage(1),
      I4 => \address_buf2_reg[8]\(3),
      O => \memo2_address[3]_i_3_n_0\
    );
\memo2_address[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3r_reg[8]\(4),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => \address_buf2r_reg[8]\(4),
      O => \memo2_address[4]_i_2_n_0\
    );
\memo2_address[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3_reg[8]\(4),
      I1 => \^end_proc_win\,
      I2 => stage(0),
      I3 => stage(1),
      I4 => \address_buf2_reg[8]\(4),
      O => \memo2_address[4]_i_3_n_0\
    );
\memo2_address[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3r_reg[8]\(5),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => \address_buf2r_reg[8]\(5),
      O => \memo2_address[5]_i_2_n_0\
    );
\memo2_address[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3_reg[8]\(5),
      I1 => \^end_proc_win\,
      I2 => stage(0),
      I3 => stage(1),
      I4 => \address_buf2_reg[8]\(5),
      O => \memo2_address[5]_i_3_n_0\
    );
\memo2_address[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3r_reg[8]\(6),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => \address_buf2r_reg[8]\(6),
      O => \memo2_address[6]_i_2_n_0\
    );
\memo2_address[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3_reg[8]\(6),
      I1 => \^end_proc_win\,
      I2 => stage(0),
      I3 => stage(1),
      I4 => \address_buf2_reg[8]\(6),
      O => \memo2_address[6]_i_3_n_0\
    );
\memo2_address[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3r_reg[8]\(7),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => \address_buf2r_reg[8]\(7),
      O => \memo2_address[7]_i_2_n_0\
    );
\memo2_address[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3_reg[8]\(7),
      I1 => \^end_proc_win\,
      I2 => stage(0),
      I3 => stage(1),
      I4 => \address_buf2_reg[8]\(7),
      O => \memo2_address[7]_i_3_n_0\
    );
\memo2_address[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3r_reg[8]\(8),
      I1 => stage(0),
      I2 => stage(1),
      I3 => \^end_proc_win\,
      I4 => \address_buf2r_reg[8]\(8),
      O => \memo2_address[8]_i_2_n_0\
    );
\memo2_address[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEAAA2AA"
    )
        port map (
      I0 => \address_buf3_reg[8]\(8),
      I1 => \^end_proc_win\,
      I2 => stage(0),
      I3 => stage(1),
      I4 => \address_buf2_reg[8]\(8),
      O => \memo2_address[8]_i_3_n_0\
    );
\memo2_address[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040400"
    )
        port map (
      I0 => reading_ready,
      I1 => \^end_proc_win\,
      I2 => \control_reg[1]\(0),
      I3 => stage(1),
      I4 => stage(0),
      O => \memo2_address_reg[9]\
    );
\memo2_address_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \memo2_address[0]_i_2_n_0\,
      I1 => \memo2_address[0]_i_3_n_0\,
      O => \memo2_address_reg[8]\(0),
      S => \FSM_sequential_input_fsm_state_reg[0]\
    );
\memo2_address_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \memo2_address[1]_i_2_n_0\,
      I1 => \memo2_address[1]_i_3_n_0\,
      O => \memo2_address_reg[8]\(1),
      S => \FSM_sequential_input_fsm_state_reg[0]\
    );
\memo2_address_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \memo2_address[2]_i_2_n_0\,
      I1 => \memo2_address[2]_i_3_n_0\,
      O => \memo2_address_reg[8]\(2),
      S => \FSM_sequential_input_fsm_state_reg[0]\
    );
\memo2_address_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \memo2_address[3]_i_2_n_0\,
      I1 => \memo2_address[3]_i_3_n_0\,
      O => \memo2_address_reg[8]\(3),
      S => \FSM_sequential_input_fsm_state_reg[0]\
    );
\memo2_address_reg[4]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \memo2_address[4]_i_2_n_0\,
      I1 => \memo2_address[4]_i_3_n_0\,
      O => \memo2_address_reg[8]\(4),
      S => \FSM_sequential_input_fsm_state_reg[0]\
    );
\memo2_address_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \memo2_address[5]_i_2_n_0\,
      I1 => \memo2_address[5]_i_3_n_0\,
      O => \memo2_address_reg[8]\(5),
      S => \FSM_sequential_input_fsm_state_reg[0]\
    );
\memo2_address_reg[6]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \memo2_address[6]_i_2_n_0\,
      I1 => \memo2_address[6]_i_3_n_0\,
      O => \memo2_address_reg[8]\(6),
      S => \FSM_sequential_input_fsm_state_reg[0]\
    );
\memo2_address_reg[7]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \memo2_address[7]_i_2_n_0\,
      I1 => \memo2_address[7]_i_3_n_0\,
      O => \memo2_address_reg[8]\(7),
      S => \FSM_sequential_input_fsm_state_reg[0]\
    );
\memo2_address_reg[8]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \memo2_address[8]_i_2_n_0\,
      I1 => \memo2_address[8]_i_3_n_0\,
      O => \memo2_address_reg[8]\(8),
      S => \FSM_sequential_input_fsm_state_reg[0]\
    );
\read_buffer0[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => stage(0),
      I1 => stage(1),
      I2 => \^end_proc_win\,
      O => \read_buffer0_reg[0]\
    );
\read_buffer0_next4_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^result\(14),
      I1 => \^result\(15),
      O => DI(3)
    );
\read_buffer0_next4_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^result\(12),
      I1 => \^result\(13),
      O => DI(2)
    );
\read_buffer0_next4_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^result\(10),
      I1 => \^result\(11),
      O => DI(1)
    );
\read_buffer0_next4_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^result\(8),
      I1 => \^result\(9),
      O => DI(0)
    );
\read_buffer0_next4_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(14),
      I1 => \^result\(15),
      O => S(3)
    );
\read_buffer0_next4_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(12),
      I1 => \^result\(13),
      O => S(2)
    );
\read_buffer0_next4_carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(10),
      I1 => \^result\(11),
      O => S(1)
    );
\read_buffer0_next4_carry__0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(8),
      I1 => \^result\(9),
      O => S(0)
    );
read_buffer0_next4_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^result\(6),
      I1 => \^result\(7),
      O => \read_buffer0_reg[13]_0\(3)
    );
read_buffer0_next4_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^result\(4),
      I1 => \^result\(5),
      O => \read_buffer0_reg[13]_0\(2)
    );
read_buffer0_next4_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^result\(2),
      I1 => \^result\(3),
      O => \read_buffer0_reg[13]_0\(1)
    );
read_buffer0_next4_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^result\(0),
      I1 => \^result\(1),
      O => \read_buffer0_reg[13]_0\(0)
    );
read_buffer0_next4_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(6),
      I1 => \^result\(7),
      O => \read_buffer0_reg[13]\(3)
    );
read_buffer0_next4_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(4),
      I1 => \^result\(5),
      O => \read_buffer0_reg[13]\(2)
    );
read_buffer0_next4_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(2),
      I1 => \^result\(3),
      O => \read_buffer0_reg[13]\(1)
    );
read_buffer0_next4_carry_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(0),
      I1 => \^result\(1),
      O => \read_buffer0_reg[13]\(0)
    );
\read_buffer1[10]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(12),
      O => p_0_in(12)
    );
\read_buffer1[10]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(11),
      O => p_0_in(11)
    );
\read_buffer1[10]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(10),
      O => p_0_in(10)
    );
\read_buffer1[10]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(9),
      O => p_0_in(9)
    );
\read_buffer1[13]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(15),
      O => p_0_in(15)
    );
\read_buffer1[13]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(14),
      O => p_0_in(14)
    );
\read_buffer1[13]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(13),
      O => p_0_in(13)
    );
\read_buffer1[15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => stage(0),
      I1 => stage(1),
      I2 => \^end_proc_win\,
      O => \read_buffer1_reg[0]\
    );
\read_buffer1[2]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(0),
      O => p_0_in(0)
    );
\read_buffer1[2]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(4),
      O => p_0_in(4)
    );
\read_buffer1[2]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(3),
      O => p_0_in(3)
    );
\read_buffer1[2]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(2),
      O => p_0_in(2)
    );
\read_buffer1[2]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(1),
      O => p_0_in(1)
    );
\read_buffer1[6]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(8),
      O => p_0_in(8)
    );
\read_buffer1[6]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(7),
      O => p_0_in(7)
    );
\read_buffer1[6]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(6),
      O => p_0_in(6)
    );
\read_buffer1[6]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^result\(5),
      O => p_0_in(5)
    );
\read_buffer1_reg[10]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \read_buffer1_reg[6]_i_2_n_0\,
      CO(3) => \read_buffer1_reg[10]_i_2_n_0\,
      CO(2 downto 0) => \NLW_read_buffer1_reg[10]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => read_buffer0_next3(10 downto 7),
      S(3 downto 0) => p_0_in(12 downto 9)
    );
\read_buffer1_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \read_buffer1_reg[8]_i_2_n_0\,
      CO(3) => \read_buffer1_reg[12]_i_2_n_0\,
      CO(2 downto 0) => \NLW_read_buffer1_reg[12]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => read_buffer0_next1(11 downto 8),
      S(3 downto 0) => \result_pre_reg[29]_0\(3 downto 0)
    );
\read_buffer1_reg[13]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \read_buffer1_reg[10]_i_2_n_0\,
      CO(3 downto 0) => \NLW_read_buffer1_reg[13]_i_2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_read_buffer1_reg[13]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => read_buffer0_next3(13 downto 11),
      S(3) => '0',
      S(2 downto 0) => p_0_in(15 downto 13)
    );
\read_buffer1_reg[15]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \read_buffer1_reg[12]_i_2_n_0\,
      CO(3 downto 2) => \NLW_read_buffer1_reg[15]_i_4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => CO(0),
      CO(0) => \NLW_read_buffer1_reg[15]_i_4_CO_UNCONNECTED\(0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_read_buffer1_reg[15]_i_4_O_UNCONNECTED\(3 downto 1),
      O(0) => read_buffer0_next1(12),
      S(3 downto 1) => B"001",
      S(0) => \result_pre_reg[30]_0\(0)
    );
\read_buffer1_reg[2]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \read_buffer1_reg[2]_i_2_n_0\,
      CO(2 downto 0) => \NLW_read_buffer1_reg[2]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => p_0_in(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => read_buffer0_next3(2 downto 0),
      O(0) => \NLW_read_buffer1_reg[2]_i_2_O_UNCONNECTED\(0),
      S(3 downto 0) => p_0_in(4 downto 1)
    );
\read_buffer1_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \read_buffer1_reg[4]_i_2_n_0\,
      CO(2 downto 0) => \NLW_read_buffer1_reg[4]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => \result_pre_reg[17]_0\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => read_buffer0_next1(3 downto 0),
      S(3 downto 0) => \result_pre_reg[21]_0\(3 downto 0)
    );
\read_buffer1_reg[6]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \read_buffer1_reg[2]_i_2_n_0\,
      CO(3) => \read_buffer1_reg[6]_i_2_n_0\,
      CO(2 downto 0) => \NLW_read_buffer1_reg[6]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => read_buffer0_next3(6 downto 3),
      S(3 downto 0) => p_0_in(8 downto 5)
    );
\read_buffer1_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \read_buffer1_reg[4]_i_2_n_0\,
      CO(3) => \read_buffer1_reg[8]_i_2_n_0\,
      CO(2 downto 0) => \NLW_read_buffer1_reg[8]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => read_buffer0_next1(7 downto 4),
      S(3 downto 0) => \result_pre_reg[25]_0\(3 downto 0)
    );
read_sample_memo_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFCFCF0000CECC"
    )
        port map (
      I0 => \^end_proc_win\,
      I1 => \control_reg[1]\(0),
      I2 => reading_ready,
      I3 => \win_stage_reg[1]\,
      I4 => \FSM_sequential_input_fsm_state_reg[1]\,
      I5 => read_sample,
      O => read_sample_memo_reg
    );
result_next0: unisim.vcomponents.DSP48E1
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
      PREG => 0,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 0) => B"000000000000000111111111111111",
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_result_next0_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => \multiplicand_reg[15]\(15),
      B(16) => \multiplicand_reg[15]\(15),
      B(15 downto 0) => \multiplicand_reg[15]\(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_result_next0_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_result_next0_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_result_next0_CARRYOUT_UNCONNECTED(3 downto 0),
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
      CEP => '0',
      CLK => '0',
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_result_next0_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_result_next0_OVERFLOW_UNCONNECTED,
      P(47 downto 31) => NLW_result_next0_P_UNCONNECTED(47 downto 31),
      P(30) => result_next0_n_75,
      P(29) => result_next0_n_76,
      P(28) => result_next0_n_77,
      P(27) => result_next0_n_78,
      P(26) => result_next0_n_79,
      P(25) => result_next0_n_80,
      P(24) => result_next0_n_81,
      P(23) => result_next0_n_82,
      P(22) => result_next0_n_83,
      P(21) => result_next0_n_84,
      P(20) => result_next0_n_85,
      P(19) => result_next0_n_86,
      P(18) => result_next0_n_87,
      P(17) => result_next0_n_88,
      P(16) => result_next0_n_89,
      P(15) => result_next0_n_90,
      P(14 downto 0) => NLW_result_next0_P_UNCONNECTED(14 downto 0),
      PATTERNBDETECT => NLW_result_next0_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_result_next0_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_result_next0_PCOUT_UNCONNECTED(47 downto 0),
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
      UNDERFLOW => NLW_result_next0_UNDERFLOW_UNCONNECTED
    );
\result_pre[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_90,
      O => \result_pre[15]_i_1_n_0\
    );
\result_pre[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_89,
      O => \result_pre[16]_i_1_n_0\
    );
\result_pre[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_88,
      O => \result_pre[17]_i_1_n_0\
    );
\result_pre[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_87,
      O => \result_pre[18]_i_1_n_0\
    );
\result_pre[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_86,
      O => \result_pre[19]_i_1_n_0\
    );
\result_pre[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_85,
      O => \result_pre[20]_i_1_n_0\
    );
\result_pre[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_84,
      O => \result_pre[21]_i_1_n_0\
    );
\result_pre[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_83,
      O => \result_pre[22]_i_1_n_0\
    );
\result_pre[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_82,
      O => \result_pre[23]_i_1_n_0\
    );
\result_pre[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_81,
      O => \result_pre[24]_i_1_n_0\
    );
\result_pre[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_80,
      O => \result_pre[25]_i_1_n_0\
    );
\result_pre[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_79,
      O => \result_pre[26]_i_1_n_0\
    );
\result_pre[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_78,
      O => \result_pre[27]_i_1_n_0\
    );
\result_pre[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_77,
      O => \result_pre[28]_i_1_n_0\
    );
\result_pre[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_76,
      O => \result_pre[29]_i_1_n_0\
    );
\result_pre[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => start_proc_win,
      I1 => result_next0_n_75,
      O => \result_pre[30]_i_1_n_0\
    );
\result_pre_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[15]_i_1_n_0\,
      Q => \^result\(0)
    );
\result_pre_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[16]_i_1_n_0\,
      Q => \^result\(1)
    );
\result_pre_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[17]_i_1_n_0\,
      Q => \^result\(2)
    );
\result_pre_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[18]_i_1_n_0\,
      Q => \^result\(3)
    );
\result_pre_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[19]_i_1_n_0\,
      Q => \^result\(4)
    );
\result_pre_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[20]_i_1_n_0\,
      Q => \^result\(5)
    );
\result_pre_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[21]_i_1_n_0\,
      Q => \^result\(6)
    );
\result_pre_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[22]_i_1_n_0\,
      Q => \^result\(7)
    );
\result_pre_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[23]_i_1_n_0\,
      Q => \^result\(8)
    );
\result_pre_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[24]_i_1_n_0\,
      Q => \^result\(9)
    );
\result_pre_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[25]_i_1_n_0\,
      Q => \^result\(10)
    );
\result_pre_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[26]_i_1_n_0\,
      Q => \^result\(11)
    );
\result_pre_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[27]_i_1_n_0\,
      Q => \^result\(12)
    );
\result_pre_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[28]_i_1_n_0\,
      Q => \^result\(13)
    );
\result_pre_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[29]_i_1_n_0\,
      Q => \^result\(14)
    );
\result_pre_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => \result_pre[30]_i_1_n_0\,
      Q => \^result\(15)
    );
start_proc_win_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F8FF"
    )
        port map (
      I0 => stage(1),
      I1 => stage(0),
      I2 => \^end_proc_win\,
      I3 => espera,
      I4 => \control_reg[1]\(1),
      O => start_proc_win_reg
    );
\win_stage[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FDDD"
    )
        port map (
      I0 => \^end_proc_win\,
      I1 => reading_ready,
      I2 => stage(1),
      I3 => stage(0),
      I4 => \control_reg[1]\(0),
      O => \win_stage_reg[0]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \ram_memo__blk_mem_gen_prim_wrapper\ is
  port (
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_prim_wrapper\ : entity is "blk_mem_gen_prim_wrapper";
end \ram_memo__blk_mem_gen_prim_wrapper\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_prim_wrapper\ is
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram\: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 1,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
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
      INIT_A => X"00000",
      INIT_B => X"00000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "NO_CHANGE",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 4) => addra(9 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 0) => B"00000000000000",
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DIADI(15 downto 0) => dina(15 downto 0),
      DIBDI(15 downto 0) => B"0000000000000000",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"00",
      DOADO(15 downto 0) => douta(15 downto 0),
      DOBDO(15 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED\(15 downto 0),
      DOPADOP(1 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED\(1 downto 0),
      DOPBDOP(1 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED\(1 downto 0),
      ENARDEN => ena,
      ENBWREN => '0',
      REGCEAREGCE => ena,
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(3 downto 0) => B"0000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \ram_memo__blk_mem_gen_prim_wrapper_HD8\ is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_prim_wrapper_HD8\ : entity is "blk_mem_gen_prim_wrapper";
end \ram_memo__blk_mem_gen_prim_wrapper_HD8\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_prim_wrapper_HD8\ is
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram\: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 1,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
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
      INIT_A => X"00000",
      INIT_B => X"00000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "NO_CHANGE",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 4) => addra(9 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 0) => B"00000000000000",
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DIADI(15 downto 0) => dina(15 downto 0),
      DIBDI(15 downto 0) => B"0000000000000000",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"00",
      DOADO(15 downto 0) => douta(15 downto 0),
      DOBDO(15 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED\(15 downto 0),
      DOPADOP(1 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED\(1 downto 0),
      DOPBDOP(1 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED\(1 downto 0),
      ENARDEN => ena,
      ENBWREN => '0',
      REGCEAREGCE => ena,
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(3 downto 0) => B"0000"
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
  signal counter_assig_n_0 : STD_LOGIC;
  signal counter_assig_n_1 : STD_LOGIC;
  signal counter_assig_n_2 : STD_LOGIC;
  signal counter_assig_n_3 : STD_LOGIC;
  signal counter_assig_n_4 : STD_LOGIC;
  signal curr_display : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \curr_display[0]_i_1_n_0\ : STD_LOGIC;
  signal \curr_display[1]_i_1_n_0\ : STD_LOGIC;
  signal \curr_display[2]_i_1_n_0\ : STD_LOGIC;
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
      INIT => X"DF"
    )
        port map (
      I0 => curr_display(1),
      I1 => curr_display(2),
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
      \curr_display_reg[0]\ => counter_assig_n_0,
      \curr_display_reg[0]_0\ => counter_assig_n_1,
      \curr_display_reg[0]_1\ => counter_assig_n_2,
      \curr_display_reg[0]_2\ => counter_assig_n_3,
      \curr_display_reg[2]\ => counter_assig_n_4,
      reset_IBUF => reset_IBUF
    );
\curr_display[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0100"
    )
        port map (
      I0 => counter_assig_n_0,
      I1 => counter_assig_n_1,
      I2 => counter_assig_n_2,
      I3 => counter_assig_n_3,
      I4 => curr_display(0),
      O => \curr_display[0]_i_1_n_0\
    );
\curr_display[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF700000008"
    )
        port map (
      I0 => curr_display(0),
      I1 => counter_assig_n_3,
      I2 => counter_assig_n_2,
      I3 => counter_assig_n_1,
      I4 => counter_assig_n_0,
      I5 => curr_display(1),
      O => \curr_display[1]_i_1_n_0\
    );
\curr_display[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7F0080"
    )
        port map (
      I0 => curr_display(1),
      I1 => curr_display(0),
      I2 => counter_assig_n_3,
      I3 => counter_assig_n_4,
      I4 => curr_display(2),
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
      INIT => X"FFFFFFFFFA9FFB8F"
    )
        port map (
      I0 => state(1),
      I1 => curr_display(0),
      I2 => curr_display(1),
      I3 => curr_display(2),
      I4 => state(0),
      I5 => reset_IBUF,
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
      INIT => X"FFDFECEFFFDEFCFF"
    )
        port map (
      I0 => state(1),
      I1 => reset_IBUF,
      I2 => curr_display(0),
      I3 => curr_display(1),
      I4 => curr_display(2),
      I5 => state(0),
      O => seg_OBUF(3)
    );
\seg_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EECDEFCDEECDEFDD"
    )
        port map (
      I0 => curr_display(2),
      I1 => reset_IBUF,
      I2 => curr_display(0),
      I3 => curr_display(1),
      I4 => state(1),
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
      INIT => X"FFFFF0F1F4FAF1FF"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => reset_IBUF,
      I3 => curr_display(0),
      I4 => curr_display(1),
      I5 => curr_display(2),
      O => seg_OBUF(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \ram_memo__blk_mem_gen_prim_width\ is
  port (
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_prim_width\ : entity is "blk_mem_gen_prim_width";
end \ram_memo__blk_mem_gen_prim_width\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_prim_width\ is
begin
\prim_noinit.ram\: entity work.\ram_memo__blk_mem_gen_prim_wrapper\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
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
entity \ram_memo__blk_mem_gen_prim_width_HD7\ is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_prim_width_HD7\ : entity is "blk_mem_gen_prim_width";
end \ram_memo__blk_mem_gen_prim_width_HD7\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_prim_width_HD7\ is
begin
\prim_noinit.ram\: entity work.\ram_memo__blk_mem_gen_prim_wrapper_HD8\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
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
entity \ram_memo__blk_mem_gen_generic_cstr\ is
  port (
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_generic_cstr\ : entity is "blk_mem_gen_generic_cstr";
end \ram_memo__blk_mem_gen_generic_cstr\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_generic_cstr\ is
begin
\ramloop[0].ram.r\: entity work.\ram_memo__blk_mem_gen_prim_width\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
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
entity \ram_memo__blk_mem_gen_generic_cstr_HD6\ is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_generic_cstr_HD6\ : entity is "blk_mem_gen_generic_cstr";
end \ram_memo__blk_mem_gen_generic_cstr_HD6\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_generic_cstr_HD6\ is
begin
\ramloop[0].ram.r\: entity work.\ram_memo__blk_mem_gen_prim_width_HD7\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
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
entity \ram_memo__blk_mem_gen_top\ is
  port (
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_top\ : entity is "blk_mem_gen_top";
end \ram_memo__blk_mem_gen_top\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_top\ is
begin
\valid.cstr\: entity work.\ram_memo__blk_mem_gen_generic_cstr\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
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
entity \ram_memo__blk_mem_gen_top_HD5\ is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_top_HD5\ : entity is "blk_mem_gen_top";
end \ram_memo__blk_mem_gen_top_HD5\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_top_HD5\ is
begin
\valid.cstr\: entity work.\ram_memo__blk_mem_gen_generic_cstr_HD6\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
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
entity \ram_memo__blk_mem_gen_v8_4_1_synth\ is
  port (
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_v8_4_1_synth\ : entity is "blk_mem_gen_v8_4_1_synth";
end \ram_memo__blk_mem_gen_v8_4_1_synth\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_v8_4_1_synth\ is
begin
\gnbram.gnativebmg.native_blk_mem_gen\: entity work.\ram_memo__blk_mem_gen_top\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
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
entity \ram_memo__blk_mem_gen_v8_4_1_synth_HD4\ is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_v8_4_1_synth_HD4\ : entity is "blk_mem_gen_v8_4_1_synth";
end \ram_memo__blk_mem_gen_v8_4_1_synth_HD4\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_v8_4_1_synth_HD4\ is
begin
\gnbram.gnativebmg.native_blk_mem_gen\: entity work.\ram_memo__blk_mem_gen_top_HD5\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
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
entity \ram_memo__blk_mem_gen_v8_4_1\ is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    eccpipece : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    rdaddrecc : out STD_LOGIC_VECTOR ( 9 downto 0 );
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
    s_axi_rdaddrecc : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 10;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 10;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "1";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "0";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "Estimated Power for IP     :     1.371299 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "freq_short_memo.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "no_coe_file_loaded";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1024;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1024;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 16;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 16;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1024;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 1024;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "NO_CHANGE";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 16;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of \ram_memo__blk_mem_gen_v8_4_1\ : entity is 16;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "artix7";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "blk_mem_gen_v8_4_1";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of \ram_memo__blk_mem_gen_v8_4_1\ : entity is "yes";
end \ram_memo__blk_mem_gen_v8_4_1\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_v8_4_1\ is
begin
  dbiterr <= 'Z';
  rsta_busy <= 'Z';
  rstb_busy <= 'Z';
  s_axi_arready <= 'Z';
  s_axi_awready <= 'Z';
  s_axi_bvalid <= 'Z';
  s_axi_dbiterr <= 'Z';
  s_axi_rlast <= 'Z';
  s_axi_rvalid <= 'Z';
  s_axi_sbiterr <= 'Z';
  s_axi_wready <= 'Z';
  sbiterr <= 'Z';
  doutb(0) <= 'Z';
  doutb(1) <= 'Z';
  doutb(2) <= 'Z';
  doutb(3) <= 'Z';
  doutb(4) <= 'Z';
  doutb(5) <= 'Z';
  doutb(6) <= 'Z';
  doutb(7) <= 'Z';
  doutb(8) <= 'Z';
  doutb(9) <= 'Z';
  doutb(10) <= 'Z';
  doutb(11) <= 'Z';
  doutb(12) <= 'Z';
  doutb(13) <= 'Z';
  doutb(14) <= 'Z';
  doutb(15) <= 'Z';
  rdaddrecc(0) <= 'Z';
  rdaddrecc(1) <= 'Z';
  rdaddrecc(2) <= 'Z';
  rdaddrecc(3) <= 'Z';
  rdaddrecc(4) <= 'Z';
  rdaddrecc(5) <= 'Z';
  rdaddrecc(6) <= 'Z';
  rdaddrecc(7) <= 'Z';
  rdaddrecc(8) <= 'Z';
  rdaddrecc(9) <= 'Z';
  s_axi_bid(0) <= 'Z';
  s_axi_bid(1) <= 'Z';
  s_axi_bid(2) <= 'Z';
  s_axi_bid(3) <= 'Z';
  s_axi_bresp(0) <= 'Z';
  s_axi_bresp(1) <= 'Z';
  s_axi_rdaddrecc(0) <= 'Z';
  s_axi_rdaddrecc(1) <= 'Z';
  s_axi_rdaddrecc(2) <= 'Z';
  s_axi_rdaddrecc(3) <= 'Z';
  s_axi_rdaddrecc(4) <= 'Z';
  s_axi_rdaddrecc(5) <= 'Z';
  s_axi_rdaddrecc(6) <= 'Z';
  s_axi_rdaddrecc(7) <= 'Z';
  s_axi_rdaddrecc(8) <= 'Z';
  s_axi_rdaddrecc(9) <= 'Z';
  s_axi_rdata(0) <= 'Z';
  s_axi_rdata(1) <= 'Z';
  s_axi_rdata(2) <= 'Z';
  s_axi_rdata(3) <= 'Z';
  s_axi_rdata(4) <= 'Z';
  s_axi_rdata(5) <= 'Z';
  s_axi_rdata(6) <= 'Z';
  s_axi_rdata(7) <= 'Z';
  s_axi_rdata(8) <= 'Z';
  s_axi_rdata(9) <= 'Z';
  s_axi_rdata(10) <= 'Z';
  s_axi_rdata(11) <= 'Z';
  s_axi_rdata(12) <= 'Z';
  s_axi_rdata(13) <= 'Z';
  s_axi_rdata(14) <= 'Z';
  s_axi_rdata(15) <= 'Z';
  s_axi_rid(0) <= 'Z';
  s_axi_rid(1) <= 'Z';
  s_axi_rid(2) <= 'Z';
  s_axi_rid(3) <= 'Z';
  s_axi_rresp(0) <= 'Z';
  s_axi_rresp(1) <= 'Z';
inst_blk_mem_gen: entity work.\ram_memo__blk_mem_gen_v8_4_1_synth\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
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
entity \ram_memo__blk_mem_gen_v8_4_1_HD3\ is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    eccpipece : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    sleep : in STD_LOGIC;
    deepsleep : in STD_LOGIC;
    shutdown : in STD_LOGIC;
    rsta_busy : out STD_LOGIC;
    rstb_busy : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_injectsbiterr : in STD_LOGIC;
    s_axi_injectdbiterr : in STD_LOGIC;
    s_axi_sbiterr : out STD_LOGIC;
    s_axi_dbiterr : out STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rdaddrecc : out STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rdaddrecc : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 10;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 10;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "1";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "0";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "Estimated Power for IP     :     1.371299 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "freq_short_memo.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "no_coe_file_loaded";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1024;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1024;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 16;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 16;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1024;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 1024;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "NO_CHANGE";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 16;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is 16;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "artix7";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "blk_mem_gen_v8_4_1";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of \ram_memo__blk_mem_gen_v8_4_1_HD3\ : entity is "yes";
end \ram_memo__blk_mem_gen_v8_4_1_HD3\;

architecture STRUCTURE of \ram_memo__blk_mem_gen_v8_4_1_HD3\ is
begin
  dbiterr <= 'Z';
  rsta_busy <= 'Z';
  rstb_busy <= 'Z';
  s_axi_arready <= 'Z';
  s_axi_awready <= 'Z';
  s_axi_bvalid <= 'Z';
  s_axi_dbiterr <= 'Z';
  s_axi_rlast <= 'Z';
  s_axi_rvalid <= 'Z';
  s_axi_sbiterr <= 'Z';
  s_axi_wready <= 'Z';
  sbiterr <= 'Z';
  doutb(0) <= 'Z';
  doutb(1) <= 'Z';
  doutb(2) <= 'Z';
  doutb(3) <= 'Z';
  doutb(4) <= 'Z';
  doutb(5) <= 'Z';
  doutb(6) <= 'Z';
  doutb(7) <= 'Z';
  doutb(8) <= 'Z';
  doutb(9) <= 'Z';
  doutb(10) <= 'Z';
  doutb(11) <= 'Z';
  doutb(12) <= 'Z';
  doutb(13) <= 'Z';
  doutb(14) <= 'Z';
  doutb(15) <= 'Z';
  rdaddrecc(0) <= 'Z';
  rdaddrecc(1) <= 'Z';
  rdaddrecc(2) <= 'Z';
  rdaddrecc(3) <= 'Z';
  rdaddrecc(4) <= 'Z';
  rdaddrecc(5) <= 'Z';
  rdaddrecc(6) <= 'Z';
  rdaddrecc(7) <= 'Z';
  rdaddrecc(8) <= 'Z';
  rdaddrecc(9) <= 'Z';
  s_axi_bid(0) <= 'Z';
  s_axi_bid(1) <= 'Z';
  s_axi_bid(2) <= 'Z';
  s_axi_bid(3) <= 'Z';
  s_axi_bresp(0) <= 'Z';
  s_axi_bresp(1) <= 'Z';
  s_axi_rdaddrecc(0) <= 'Z';
  s_axi_rdaddrecc(1) <= 'Z';
  s_axi_rdaddrecc(2) <= 'Z';
  s_axi_rdaddrecc(3) <= 'Z';
  s_axi_rdaddrecc(4) <= 'Z';
  s_axi_rdaddrecc(5) <= 'Z';
  s_axi_rdaddrecc(6) <= 'Z';
  s_axi_rdaddrecc(7) <= 'Z';
  s_axi_rdaddrecc(8) <= 'Z';
  s_axi_rdaddrecc(9) <= 'Z';
  s_axi_rdata(0) <= 'Z';
  s_axi_rdata(1) <= 'Z';
  s_axi_rdata(2) <= 'Z';
  s_axi_rdata(3) <= 'Z';
  s_axi_rdata(4) <= 'Z';
  s_axi_rdata(5) <= 'Z';
  s_axi_rdata(6) <= 'Z';
  s_axi_rdata(7) <= 'Z';
  s_axi_rdata(8) <= 'Z';
  s_axi_rdata(9) <= 'Z';
  s_axi_rdata(10) <= 'Z';
  s_axi_rdata(11) <= 'Z';
  s_axi_rdata(12) <= 'Z';
  s_axi_rdata(13) <= 'Z';
  s_axi_rdata(14) <= 'Z';
  s_axi_rdata(15) <= 'Z';
  s_axi_rid(0) <= 'Z';
  s_axi_rid(1) <= 'Z';
  s_axi_rid(2) <= 'Z';
  s_axi_rid(3) <= 'Z';
  s_axi_rresp(0) <= 'Z';
  s_axi_rresp(1) <= 'Z';
inst_blk_mem_gen: entity work.\ram_memo__blk_mem_gen_v8_4_1_synth_HD4\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
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
entity ram_memo is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ram_memo : entity is "freq_short_memo,blk_mem_gen_v8_4_1,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of ram_memo : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of ram_memo : entity is "blk_mem_gen_v8_4_1,Vivado 2017.4";
end ram_memo;

architecture STRUCTURE of ram_memo is
  signal NLW_U0_clkb_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_deepsleep_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_eccpipece_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_enb_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_injectdbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_injectsbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_regcea_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_regceb_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rsta_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rstb_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rstb_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_aclk_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_aresetn_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_injectdbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_injectsbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_shutdown_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sleep_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_addrb_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_dinb_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_doutb_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_s_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_s_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_s_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_s_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_s_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_s_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_s_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_web_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of U0 : label is 10;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of U0 : label is 10;
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
  attribute C_COUNT_18K_BRAM of U0 : label is "1";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of U0 : label is "0";
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
  attribute C_EST_POWER_SUMMARY of U0 : label is "Estimated Power for IP     :     1.371299 mW";
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
  attribute C_INIT_FILE of U0 : label is "freq_short_memo.mem";
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
  attribute C_READ_DEPTH_A of U0 : label is 1024;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of U0 : label is 1024;
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
  attribute C_WRITE_DEPTH_A of U0 : label is 1024;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of U0 : label is 1024;
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
U0: entity work.\ram_memo__blk_mem_gen_v8_4_1\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
      addrb(9 downto 0) => NLW_U0_addrb_UNCONNECTED(9 downto 0),
      clka => clka,
      clkb => NLW_U0_clkb_UNCONNECTED,
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      deepsleep => NLW_U0_deepsleep_UNCONNECTED,
      dina(15 downto 0) => dina(15 downto 0),
      dinb(15 downto 0) => NLW_U0_dinb_UNCONNECTED(15 downto 0),
      douta(15 downto 0) => douta(15 downto 0),
      doutb(15 downto 0) => NLW_U0_doutb_UNCONNECTED(15 downto 0),
      eccpipece => NLW_U0_eccpipece_UNCONNECTED,
      ena => ena,
      enb => NLW_U0_enb_UNCONNECTED,
      injectdbiterr => NLW_U0_injectdbiterr_UNCONNECTED,
      injectsbiterr => NLW_U0_injectsbiterr_UNCONNECTED,
      rdaddrecc(9 downto 0) => NLW_U0_rdaddrecc_UNCONNECTED(9 downto 0),
      regcea => NLW_U0_regcea_UNCONNECTED,
      regceb => NLW_U0_regceb_UNCONNECTED,
      rsta => NLW_U0_rsta_UNCONNECTED,
      rsta_busy => NLW_U0_rsta_busy_UNCONNECTED,
      rstb => NLW_U0_rstb_UNCONNECTED,
      rstb_busy => NLW_U0_rstb_busy_UNCONNECTED,
      s_aclk => NLW_U0_s_aclk_UNCONNECTED,
      s_aresetn => NLW_U0_s_aresetn_UNCONNECTED,
      s_axi_araddr(31 downto 0) => NLW_U0_s_axi_araddr_UNCONNECTED(31 downto 0),
      s_axi_arburst(1 downto 0) => NLW_U0_s_axi_arburst_UNCONNECTED(1 downto 0),
      s_axi_arid(3 downto 0) => NLW_U0_s_axi_arid_UNCONNECTED(3 downto 0),
      s_axi_arlen(7 downto 0) => NLW_U0_s_axi_arlen_UNCONNECTED(7 downto 0),
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arsize(2 downto 0) => NLW_U0_s_axi_arsize_UNCONNECTED(2 downto 0),
      s_axi_arvalid => NLW_U0_s_axi_arvalid_UNCONNECTED,
      s_axi_awaddr(31 downto 0) => NLW_U0_s_axi_awaddr_UNCONNECTED(31 downto 0),
      s_axi_awburst(1 downto 0) => NLW_U0_s_axi_awburst_UNCONNECTED(1 downto 0),
      s_axi_awid(3 downto 0) => NLW_U0_s_axi_awid_UNCONNECTED(3 downto 0),
      s_axi_awlen(7 downto 0) => NLW_U0_s_axi_awlen_UNCONNECTED(7 downto 0),
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awsize(2 downto 0) => NLW_U0_s_axi_awsize_UNCONNECTED(2 downto 0),
      s_axi_awvalid => NLW_U0_s_axi_awvalid_UNCONNECTED,
      s_axi_bid(3 downto 0) => NLW_U0_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => NLW_U0_s_axi_bready_UNCONNECTED,
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_dbiterr => NLW_U0_s_axi_dbiterr_UNCONNECTED,
      s_axi_injectdbiterr => NLW_U0_s_axi_injectdbiterr_UNCONNECTED,
      s_axi_injectsbiterr => NLW_U0_s_axi_injectsbiterr_UNCONNECTED,
      s_axi_rdaddrecc(9 downto 0) => NLW_U0_s_axi_rdaddrecc_UNCONNECTED(9 downto 0),
      s_axi_rdata(15 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(15 downto 0),
      s_axi_rid(3 downto 0) => NLW_U0_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => NLW_U0_s_axi_rready_UNCONNECTED,
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_sbiterr => NLW_U0_s_axi_sbiterr_UNCONNECTED,
      s_axi_wdata(15 downto 0) => NLW_U0_s_axi_wdata_UNCONNECTED(15 downto 0),
      s_axi_wlast => NLW_U0_s_axi_wlast_UNCONNECTED,
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(0) => NLW_U0_s_axi_wstrb_UNCONNECTED(0),
      s_axi_wvalid => NLW_U0_s_axi_wvalid_UNCONNECTED,
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      shutdown => NLW_U0_shutdown_UNCONNECTED,
      sleep => NLW_U0_sleep_UNCONNECTED,
      wea(0) => wea(0),
      web(0) => NLW_U0_web_UNCONNECTED(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ram_memo_HD2 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ram_memo_HD2 : entity is "freq_short_memo,blk_mem_gen_v8_4_1,{}";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ram_memo_HD2 : entity is "ram_memo";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of ram_memo_HD2 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of ram_memo_HD2 : entity is "blk_mem_gen_v8_4_1,Vivado 2017.4";
end ram_memo_HD2;

architecture STRUCTURE of ram_memo_HD2 is
  signal NLW_U0_clkb_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_deepsleep_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_eccpipece_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_enb_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_injectdbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_injectsbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_regcea_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_regceb_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rsta_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rstb_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rstb_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_aclk_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_aresetn_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_injectdbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_injectsbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_shutdown_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sleep_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_addrb_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_dinb_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_doutb_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_s_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_s_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_s_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_s_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_s_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_s_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_s_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_web_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of U0 : label is 10;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of U0 : label is 10;
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
  attribute C_COUNT_18K_BRAM of U0 : label is "1";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of U0 : label is "0";
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
  attribute C_EST_POWER_SUMMARY of U0 : label is "Estimated Power for IP     :     1.371299 mW";
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
  attribute C_INIT_FILE of U0 : label is "freq_short_memo.mem";
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
  attribute C_READ_DEPTH_A of U0 : label is 1024;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of U0 : label is 1024;
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
  attribute C_WRITE_DEPTH_A of U0 : label is 1024;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of U0 : label is 1024;
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
U0: entity work.\ram_memo__blk_mem_gen_v8_4_1_HD3\
     port map (
      addra(9 downto 0) => addra(9 downto 0),
      addrb(9 downto 0) => NLW_U0_addrb_UNCONNECTED(9 downto 0),
      clka => clka,
      clkb => NLW_U0_clkb_UNCONNECTED,
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      deepsleep => NLW_U0_deepsleep_UNCONNECTED,
      dina(15 downto 0) => dina(15 downto 0),
      dinb(15 downto 0) => NLW_U0_dinb_UNCONNECTED(15 downto 0),
      douta(15 downto 0) => douta(15 downto 0),
      doutb(15 downto 0) => NLW_U0_doutb_UNCONNECTED(15 downto 0),
      eccpipece => NLW_U0_eccpipece_UNCONNECTED,
      ena => ena,
      enb => NLW_U0_enb_UNCONNECTED,
      injectdbiterr => NLW_U0_injectdbiterr_UNCONNECTED,
      injectsbiterr => NLW_U0_injectsbiterr_UNCONNECTED,
      rdaddrecc(9 downto 0) => NLW_U0_rdaddrecc_UNCONNECTED(9 downto 0),
      regcea => NLW_U0_regcea_UNCONNECTED,
      regceb => NLW_U0_regceb_UNCONNECTED,
      rsta => NLW_U0_rsta_UNCONNECTED,
      rsta_busy => NLW_U0_rsta_busy_UNCONNECTED,
      rstb => NLW_U0_rstb_UNCONNECTED,
      rstb_busy => NLW_U0_rstb_busy_UNCONNECTED,
      s_aclk => NLW_U0_s_aclk_UNCONNECTED,
      s_aresetn => NLW_U0_s_aresetn_UNCONNECTED,
      s_axi_araddr(31 downto 0) => NLW_U0_s_axi_araddr_UNCONNECTED(31 downto 0),
      s_axi_arburst(1 downto 0) => NLW_U0_s_axi_arburst_UNCONNECTED(1 downto 0),
      s_axi_arid(3 downto 0) => NLW_U0_s_axi_arid_UNCONNECTED(3 downto 0),
      s_axi_arlen(7 downto 0) => NLW_U0_s_axi_arlen_UNCONNECTED(7 downto 0),
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arsize(2 downto 0) => NLW_U0_s_axi_arsize_UNCONNECTED(2 downto 0),
      s_axi_arvalid => NLW_U0_s_axi_arvalid_UNCONNECTED,
      s_axi_awaddr(31 downto 0) => NLW_U0_s_axi_awaddr_UNCONNECTED(31 downto 0),
      s_axi_awburst(1 downto 0) => NLW_U0_s_axi_awburst_UNCONNECTED(1 downto 0),
      s_axi_awid(3 downto 0) => NLW_U0_s_axi_awid_UNCONNECTED(3 downto 0),
      s_axi_awlen(7 downto 0) => NLW_U0_s_axi_awlen_UNCONNECTED(7 downto 0),
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awsize(2 downto 0) => NLW_U0_s_axi_awsize_UNCONNECTED(2 downto 0),
      s_axi_awvalid => NLW_U0_s_axi_awvalid_UNCONNECTED,
      s_axi_bid(3 downto 0) => NLW_U0_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => NLW_U0_s_axi_bready_UNCONNECTED,
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_dbiterr => NLW_U0_s_axi_dbiterr_UNCONNECTED,
      s_axi_injectdbiterr => NLW_U0_s_axi_injectdbiterr_UNCONNECTED,
      s_axi_injectsbiterr => NLW_U0_s_axi_injectsbiterr_UNCONNECTED,
      s_axi_rdaddrecc(9 downto 0) => NLW_U0_s_axi_rdaddrecc_UNCONNECTED(9 downto 0),
      s_axi_rdata(15 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(15 downto 0),
      s_axi_rid(3 downto 0) => NLW_U0_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => NLW_U0_s_axi_rready_UNCONNECTED,
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_sbiterr => NLW_U0_s_axi_sbiterr_UNCONNECTED,
      s_axi_wdata(15 downto 0) => NLW_U0_s_axi_wdata_UNCONNECTED(15 downto 0),
      s_axi_wlast => NLW_U0_s_axi_wlast_UNCONNECTED,
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(0) => NLW_U0_s_axi_wstrb_UNCONNECTED(0),
      s_axi_wvalid => NLW_U0_s_axi_wvalid_UNCONNECTED,
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      shutdown => NLW_U0_shutdown_UNCONNECTED,
      sleep => NLW_U0_sleep_UNCONNECTED,
      wea(0) => wea(0),
      web(0) => NLW_U0_web_UNCONNECTED(0)
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
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    \writing_sample_memo1_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \memo2_address_reg[9]\ : in STD_LOGIC_VECTOR ( 9 downto 0 );
    \writing_sample_memo2_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \r_reg_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \FSM_sequential_input_fsm_state_reg[0]\ : in STD_LOGIC;
    stage : in STD_LOGIC_VECTOR ( 0 to 0 );
    reading_ready : in STD_LOGIC;
    write_sample : in STD_LOGIC;
    read_sample : in STD_LOGIC
  );
end memo_controller;

architecture STRUCTURE of memo_controller is
  signal ram1_i_1_n_0 : STD_LOGIC;
  signal ram2_i_1_n_0 : STD_LOGIC;
  signal storaged_sample1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal storaged_sample2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal wea1 : STD_LOGIC;
  attribute syn_black_box : string;
  attribute syn_black_box of ram1 : label is "TRUE";
  attribute x_core_info : string;
  attribute x_core_info of ram1 : label is "blk_mem_gen_v8_4_1,Vivado 2017.4";
  attribute syn_black_box of ram2 : label is "TRUE";
  attribute x_core_info of ram2 : label is "blk_mem_gen_v8_4_1,Vivado 2017.4";
begin
\multiplicand[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(0),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(0),
      I5 => storaged_sample2(0),
      O => D(0)
    );
\multiplicand[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(10),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(10),
      I5 => storaged_sample2(10),
      O => D(10)
    );
\multiplicand[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(11),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(11),
      I5 => storaged_sample2(11),
      O => D(11)
    );
\multiplicand[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(12),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(12),
      I5 => storaged_sample2(12),
      O => D(12)
    );
\multiplicand[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(13),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(13),
      I5 => storaged_sample2(13),
      O => D(13)
    );
\multiplicand[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(14),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(14),
      I5 => storaged_sample2(14),
      O => D(14)
    );
\multiplicand[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(15),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(15),
      I5 => storaged_sample2(15),
      O => D(15)
    );
\multiplicand[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(1),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(1),
      I5 => storaged_sample2(1),
      O => D(1)
    );
\multiplicand[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(2),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(2),
      I5 => storaged_sample2(2),
      O => D(2)
    );
\multiplicand[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(3),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(3),
      I5 => storaged_sample2(3),
      O => D(3)
    );
\multiplicand[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(4),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(4),
      I5 => storaged_sample2(4),
      O => D(4)
    );
\multiplicand[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(5),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(5),
      I5 => storaged_sample2(5),
      O => D(5)
    );
\multiplicand[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(6),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(6),
      I5 => storaged_sample2(6),
      O => D(6)
    );
\multiplicand[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(7),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(7),
      I5 => storaged_sample2(7),
      O => D(7)
    );
\multiplicand[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(8),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(8),
      I5 => storaged_sample2(8),
      O => D(8)
    );
\multiplicand[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8BB8B888888"
    )
        port map (
      I0 => \r_reg_reg[15]\(9),
      I1 => \FSM_sequential_input_fsm_state_reg[0]\,
      I2 => stage(0),
      I3 => reading_ready,
      I4 => storaged_sample1(9),
      I5 => storaged_sample2(9),
      O => D(9)
    );
ram1: entity work.ram_memo
     port map (
      addra(9 downto 0) => Q(9 downto 0),
      clka => clk_100MHz,
      dina(15 downto 0) => \writing_sample_memo1_reg[15]\(15 downto 0),
      douta(15 downto 0) => storaged_sample1(15 downto 0),
      ena => ram1_i_1_n_0,
      wea(0) => wea1
    );
ram1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => stage(0),
      I1 => write_sample,
      I2 => read_sample,
      O => ram1_i_1_n_0
    );
ram1_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => write_sample,
      I1 => read_sample,
      O => wea1
    );
ram2: entity work.ram_memo_HD2
     port map (
      addra(9 downto 0) => \memo2_address_reg[9]\(9 downto 0),
      clka => clk_100MHz,
      dina(15 downto 0) => \writing_sample_memo2_reg[15]\(15 downto 0),
      douta(15 downto 0) => storaged_sample2(15 downto 0),
      ena => ram2_i_1_n_0,
      wea(0) => wea1
    );
ram2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => stage(0),
      I1 => write_sample,
      I2 => read_sample,
      O => ram2_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity master_controller is
  port (
    SCLK_DAC_OBUF : out STD_LOGIC;
    LR_W_SEL_DAC_OBUF : out STD_LOGIC;
    MCLK_DAC_OBUF : out STD_LOGIC;
    DATA_OUT_OBUF : out STD_LOGIC;
    CLK : in STD_LOGIC;
    reset_IBUF : in STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    lopt : out STD_LOGIC;
    lopt_1 : out STD_LOGIC;
    lopt_2 : out STD_LOGIC;
    lopt_3 : out STD_LOGIC
  );
end master_controller;

architecture STRUCTURE of master_controller is
  signal DATA_OUTn0_out : STD_LOGIC;
  signal DATA_OUTr_i_9_n_0 : STD_LOGIC;
  signal FSM_n_0 : STD_LOGIC;
  signal FSM_n_1 : STD_LOGIC;
  signal FSM_n_10 : STD_LOGIC;
  signal FSM_n_11 : STD_LOGIC;
  signal FSM_n_12 : STD_LOGIC;
  signal FSM_n_13 : STD_LOGIC;
  signal FSM_n_14 : STD_LOGIC;
  signal FSM_n_15 : STD_LOGIC;
  signal FSM_n_16 : STD_LOGIC;
  signal FSM_n_3 : STD_LOGIC;
  signal FSM_n_4 : STD_LOGIC;
  signal FSM_n_5 : STD_LOGIC;
  signal FSM_n_6 : STD_LOGIC;
  signal FSM_n_9 : STD_LOGIC;
  signal SAMP_n_10 : STD_LOGIC;
  signal SAMP_n_13 : STD_LOGIC;
  signal SAMP_n_14 : STD_LOGIC;
  signal SAMP_n_15 : STD_LOGIC;
  signal SAMP_n_16 : STD_LOGIC;
  signal SAMP_n_17 : STD_LOGIC;
  signal SAMP_n_18 : STD_LOGIC;
  signal SAMP_n_19 : STD_LOGIC;
  signal SAMP_n_20 : STD_LOGIC;
  signal SAMP_n_21 : STD_LOGIC;
  signal SAMP_n_22 : STD_LOGIC;
  signal SAMP_n_23 : STD_LOGIC;
  signal SAMP_n_24 : STD_LOGIC;
  signal SAMP_n_25 : STD_LOGIC;
  signal SAMP_n_26 : STD_LOGIC;
  signal SAMP_n_27 : STD_LOGIC;
  signal SAMP_n_28 : STD_LOGIC;
  signal SAMP_n_6 : STD_LOGIC;
  signal SAMP_n_8 : STD_LOGIC;
  signal SAMP_n_9 : STD_LOGIC;
  signal \^sclk_dac_obuf\ : STD_LOGIC;
  signal WIN1_n_20 : STD_LOGIC;
  signal WIN1_n_21 : STD_LOGIC;
  signal WIN1_n_22 : STD_LOGIC;
  signal WIN1_n_23 : STD_LOGIC;
  signal WIN1_n_24 : STD_LOGIC;
  signal WIN1_n_25 : STD_LOGIC;
  signal WIN1_n_26 : STD_LOGIC;
  signal WIN1_n_27 : STD_LOGIC;
  signal WIN1_n_28 : STD_LOGIC;
  signal WIN1_n_29 : STD_LOGIC;
  signal WIN1_n_46 : STD_LOGIC;
  signal WIN1_n_47 : STD_LOGIC;
  signal WIN1_n_48 : STD_LOGIC;
  signal WIN1_n_49 : STD_LOGIC;
  signal WIN1_n_50 : STD_LOGIC;
  signal WIN1_n_51 : STD_LOGIC;
  signal WIN1_n_52 : STD_LOGIC;
  signal WIN1_n_53 : STD_LOGIC;
  signal WIN1_n_81 : STD_LOGIC;
  signal WIN1_n_82 : STD_LOGIC;
  signal WIN1_n_83 : STD_LOGIC;
  signal WIN1_n_84 : STD_LOGIC;
  signal WIN1_n_85 : STD_LOGIC;
  signal address_buf0 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \address_buf0[2]_i_1_n_0\ : STD_LOGIC;
  signal \address_buf0[9]_i_2_n_0\ : STD_LOGIC;
  signal address_buf0_next : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal address_buf0r : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \address_buf0r[2]_i_1_n_0\ : STD_LOGIC;
  signal \address_buf0r[8]_i_3_n_0\ : STD_LOGIC;
  signal address_buf0r_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal address_buf1 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \address_buf1[6]_i_1_n_0\ : STD_LOGIC;
  signal \address_buf1[7]_i_1_n_0\ : STD_LOGIC;
  signal \address_buf1[8]_i_3_n_0\ : STD_LOGIC;
  signal address_buf1_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal address_buf1r : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \address_buf1r[2]_i_1_n_0\ : STD_LOGIC;
  signal \address_buf1r[8]_i_3_n_0\ : STD_LOGIC;
  signal address_buf1r_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal address_buf2 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \address_buf2[8]_i_3_n_0\ : STD_LOGIC;
  signal address_buf2_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal address_buf2r : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \address_buf2r[2]_i_1_n_0\ : STD_LOGIC;
  signal \address_buf2r[8]_i_3_n_0\ : STD_LOGIC;
  signal address_buf2r_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal address_buf3 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \address_buf3[2]_i_1_n_0\ : STD_LOGIC;
  signal \address_buf3[7]_i_1_n_0\ : STD_LOGIC;
  signal \address_buf3[8]_i_3_n_0\ : STD_LOGIC;
  signal address_buf3_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal address_buf3r : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \address_buf3r[8]_i_3_n_0\ : STD_LOGIC;
  signal address_buf3r_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal control_sampling : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \counter_buf0[8]_i_2_n_0\ : STD_LOGIC;
  signal counter_buf0_next : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \counter_buf0_reg__0\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \counter_buf0r[8]_i_2_n_0\ : STD_LOGIC;
  signal counter_buf0r_next0_in : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \counter_buf0r_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \counter_buf0r_reg_n_0_[8]\ : STD_LOGIC;
  signal enable : STD_LOGIC;
  signal enable_shift_next : STD_LOGIC;
  signal end_proc_win : STD_LOGIC;
  signal espera : STD_LOGIC;
  signal espera_i_2_n_0 : STD_LOGIC;
  signal espera_next : STD_LOGIC;
  signal \i___2_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_13_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_14_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_15_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_16_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_17_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_18_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_19_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_20_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \i___2_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_10_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_11_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_12_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_13_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_14_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_15_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_16_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_17_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_18_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_19_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_20_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \i___2_carry__1_i_9_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_10_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_11_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_12_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_13_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_14_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_15_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_16_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_17_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \i___2_carry__2_i_9_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_10_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_11_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_12_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_13_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_14_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_1_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_2_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_3_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_4_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_5_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_6_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_7_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_8_n_0\ : STD_LOGIC;
  signal \i___2_carry_i_9_n_0\ : STD_LOGIC;
  signal memo1_address : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal memo1_address_next : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal memo2_address : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal memo2_address_next : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal multiplicand : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal multiplicand_next0_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal output_sample : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal output_sample_next : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \output_sample_next0_inferred__0/i___2_carry__0_n_0\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__0_n_4\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__0_n_5\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__0_n_6\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__0_n_7\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__1_n_0\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__1_n_4\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__1_n_5\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__1_n_6\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__1_n_7\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__2_n_4\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__2_n_5\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__2_n_6\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry__2_n_7\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry_n_0\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry_n_4\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry_n_5\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry_n_6\ : STD_LOGIC;
  signal \output_sample_next0_inferred__0/i___2_carry_n_7\ : STD_LOGIC;
  signal r_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal read_buffer0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal read_buffer0_next1 : STD_LOGIC_VECTOR ( 13 downto 1 );
  signal read_buffer0_next3 : STD_LOGIC_VECTOR ( 15 downto 2 );
  signal read_buffer0_next4 : STD_LOGIC;
  signal read_buffer0_next4_carry_n_0 : STD_LOGIC;
  signal read_buffer1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \read_buffer1[12]_i_3_n_0\ : STD_LOGIC;
  signal \read_buffer1[12]_i_4_n_0\ : STD_LOGIC;
  signal \read_buffer1[12]_i_5_n_0\ : STD_LOGIC;
  signal \read_buffer1[12]_i_6_n_0\ : STD_LOGIC;
  signal \read_buffer1[15]_i_5_n_0\ : STD_LOGIC;
  signal \read_buffer1[4]_i_3_n_0\ : STD_LOGIC;
  signal \read_buffer1[4]_i_4_n_0\ : STD_LOGIC;
  signal \read_buffer1[4]_i_5_n_0\ : STD_LOGIC;
  signal \read_buffer1[4]_i_6_n_0\ : STD_LOGIC;
  signal \read_buffer1[4]_i_7_n_0\ : STD_LOGIC;
  signal \read_buffer1[8]_i_3_n_0\ : STD_LOGIC;
  signal \read_buffer1[8]_i_4_n_0\ : STD_LOGIC;
  signal \read_buffer1[8]_i_5_n_0\ : STD_LOGIC;
  signal \read_buffer1[8]_i_6_n_0\ : STD_LOGIC;
  signal read_buffer2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal read_buffer3 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal read_buffer3_next : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal read_sample : STD_LOGIC;
  signal reading_ready : STD_LOGIC;
  signal reading_ready_n : STD_LOGIC;
  signal reading_ready_nn : STD_LOGIC;
  signal reading_ready_nn_next : STD_LOGIC;
  signal result : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal stage : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal start_buffer1 : STD_LOGIC;
  signal start_buffer1_i_1_n_0 : STD_LOGIC;
  signal start_buffer1r : STD_LOGIC;
  signal start_buffer2 : STD_LOGIC;
  signal start_buffer2r : STD_LOGIC;
  signal start_buffer2r_i_2_n_0 : STD_LOGIC;
  signal start_buffer3 : STD_LOGIC;
  signal start_buffer3_i_2_n_0 : STD_LOGIC;
  signal start_buffer3_next : STD_LOGIC;
  signal start_buffer3r : STD_LOGIC;
  signal start_proc_win : STD_LOGIC;
  signal start_reading_i_1_n_0 : STD_LOGIC;
  signal start_reading_i_2_n_0 : STD_LOGIC;
  signal write_sample : STD_LOGIC;
  signal write_sample_memo_next : STD_LOGIC;
  signal writing_sample_memo1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal writing_sample_memo2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_SAMP_control_reg[1]_0_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_output_sample_next0_inferred__0/i___2_carry_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_output_sample_next0_inferred__0/i___2_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_output_sample_next0_inferred__0/i___2_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_output_sample_next0_inferred__0/i___2_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_read_buffer0_next4_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_read_buffer0_next4_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_read_buffer0_next4_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_read_buffer0_next4_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \address_buf0[1]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \address_buf0[2]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \address_buf0[3]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \address_buf0[4]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \address_buf0[6]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \address_buf0[7]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \address_buf0[8]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \address_buf0[9]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \address_buf0r[1]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \address_buf0r[2]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \address_buf0r[3]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \address_buf0r[4]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \address_buf0r[7]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \address_buf0r[8]_i_2\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \address_buf1[0]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \address_buf1[1]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \address_buf1[2]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \address_buf1[3]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \address_buf1[7]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \address_buf1[8]_i_2\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \address_buf1r[1]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \address_buf1r[2]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \address_buf1r[3]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \address_buf1r[4]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \address_buf1r[7]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \address_buf1r[8]_i_2\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \address_buf2[1]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \address_buf2[2]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \address_buf2[3]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \address_buf2[4]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \address_buf2[7]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \address_buf2[8]_i_2\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \address_buf2r[1]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \address_buf2r[2]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \address_buf2r[3]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \address_buf2r[4]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \address_buf2r[7]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \address_buf2r[8]_i_2\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \address_buf3[1]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \address_buf3[2]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \address_buf3[3]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \address_buf3[4]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \address_buf3[7]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \address_buf3[8]_i_2\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \address_buf3r[1]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \address_buf3r[2]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \address_buf3r[3]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \address_buf3r[4]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \address_buf3r[7]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \address_buf3r[8]_i_2\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \counter_buf0[1]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \counter_buf0[2]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \counter_buf0[7]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \counter_buf0[8]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \counter_buf0r[0]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \counter_buf0r[1]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \counter_buf0r[2]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \counter_buf0r[3]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \counter_buf0r[7]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \counter_buf0r[8]_i_1\ : label is "soft_lutpair40";
begin
  LR_W_SEL_DAC_OBUF <= 'Z';
  SCLK_DAC_OBUF <= 'Z';
DATA_OUTr_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      O => DATA_OUTr_i_9_n_0
    );
DATA_OUTr_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => DATA_OUTn0_out,
      Q => DATA_OUT_OBUF
    );
FSM: entity work.fsm_control
     port map (
      D(0) => memo2_address_next(9),
      E(0) => FSM_n_3,
      \FSM_sequential_input_fsm_state_reg[1]_0\ => SAMP_n_25,
      Q(1 downto 0) => control_sampling(1 downto 0),
      clk_100MHz => clk_100MHz,
      \control_reg[1]\ => SAMP_n_13,
      end_proc_win => end_proc_win,
      end_proc_win_reg => WIN1_n_21,
      espera_next => espera_next,
      \frame_num_reg[0]\ => SAMP_n_28,
      \frame_num_reg[2]\ => SAMP_n_26,
      \frame_num_reg[3]\ => SAMP_n_27,
      \frame_num_reg[4]\ => SAMP_n_24,
      \memo1_address_reg[0]\ => FSM_n_5,
      \memo2_address_reg[9]\(0) => FSM_n_13,
      \memo2_address_reg[9]_0\ => FSM_n_14,
      \out\(1) => FSM_n_0,
      \out\(0) => FSM_n_1,
      \output_sample_reg[0]\(0) => FSM_n_12,
      \read_buffer0_reg[0]\(0) => FSM_n_10,
      \read_buffer1_reg[0]\(0) => FSM_n_11,
      \read_buffer2_reg[0]\(0) => FSM_n_9,
      reading_ready => reading_ready,
      reading_ready_reg => WIN1_n_20,
      reset_IBUF => reset_IBUF,
      stage(1 downto 0) => stage(1 downto 0),
      start_buffer1r => start_buffer1r,
      start_buffer2r => start_buffer2r,
      start_buffer3r => start_buffer3r,
      start_proc_win_reg(0) => FSM_n_16,
      \win_stage_reg[0]\ => FSM_n_15,
      \win_stage_reg[0]_0\ => SAMP_n_14,
      \win_stage_reg[0]_1\ => WIN1_n_24,
      \win_stage_reg[0]_2\ => WIN1_n_25,
      \win_stage_reg[1]\ => espera_i_2_n_0,
      \win_stage_reg[1]_0\ => WIN1_n_22,
      write_sample_memo_next => write_sample_memo_next,
      \writing_sample_memo1_reg[15]\(0) => FSM_n_4,
      \writing_sample_memo2_reg[0]\(0) => FSM_n_6
    );
IN_MEMO: entity work.memo_controller
     port map (
      D(15 downto 0) => multiplicand_next0_in(15 downto 0),
      \FSM_sequential_input_fsm_state_reg[0]\ => FSM_n_14,
      Q(9 downto 0) => memo1_address(9 downto 0),
      clk_100MHz => clk_100MHz,
      \memo2_address_reg[9]\(9 downto 0) => memo2_address(9 downto 0),
      \r_reg_reg[15]\(15 downto 0) => r_reg(15 downto 0),
      read_sample => read_sample,
      reading_ready => reading_ready,
      stage(0) => stage(1),
      write_sample => write_sample,
      \writing_sample_memo1_reg[15]\(15 downto 0) => writing_sample_memo1(15 downto 0),
      \writing_sample_memo2_reg[15]\(15 downto 0) => writing_sample_memo2(15 downto 0)
    );
SAMP: entity work.sampling
     port map (
      CLK => \^sclk_dac_obuf\,
      DATA_OUTn0_out => DATA_OUTn0_out,
      E(0) => SAMP_n_6,
      \FSM_sequential_input_fsm_state_reg[0]\ => SAMP_n_28,
      \FSM_sequential_input_fsm_state_reg[0]_0\ => FSM_n_14,
      \FSM_sequential_input_fsm_state_reg[1]\ => SAMP_n_27,
      \FSM_sequential_input_fsm_state_reg[1]_0\ => FSM_n_5,
      \FSM_sequential_input_fsm_state_reg[1]_1\ => FSM_n_15,
      \FSM_sequential_input_fsm_state_reg[2]\ => SAMP_n_24,
      \FSM_sequential_input_fsm_state_reg[2]_0\ => SAMP_n_25,
      \FSM_sequential_input_fsm_state_reg[2]_1\ => SAMP_n_26,
      Q(2 downto 0) => control_sampling(2 downto 0),
      \address_buf0r_reg[0]\(0) => SAMP_n_10,
      \address_buf1_reg[0]\(0) => SAMP_n_17,
      \address_buf1r_reg[8]\(0) => SAMP_n_21,
      \address_buf2_reg[0]\(0) => SAMP_n_16,
      \address_buf2r_reg[0]\(0) => SAMP_n_9,
      \address_buf3_reg[0]\(0) => SAMP_n_15,
      \address_buf3r_reg[0]\(0) => SAMP_n_8,
      bbstub_clk_50MHz => CLK,
      clk_100MHz => clk_100MHz,
      \control_reg[1]_0\ => \NLW_SAMP_control_reg[1]_0_UNCONNECTED\,
      \counter_buf0r_reg[6]\ => start_buffer2r_i_2_n_0,
      \counter_buf0r_reg[8]\(1) => \counter_buf0r_reg_n_0_[8]\,
      \counter_buf0r_reg[8]\(0) => \counter_buf0r_reg__0\(7),
      enable_shift_next => enable_shift_next,
      end_proc_win => end_proc_win,
      espera => espera,
      lopt => lopt,
      lopt_1 => lopt_1,
      lopt_2 => lopt_2,
      lopt_3 => lopt_3,
      mc_reg_0 => MCLK_DAC_OBUF,
      \memo1_address_reg[0]\ => SAMP_n_14,
      \memo2_address_reg[9]\ => SAMP_n_13,
      \out\(1) => FSM_n_0,
      \out\(0) => FSM_n_1,
      \output_sample_reg[15]\(15 downto 0) => output_sample(15 downto 0),
      reading_ready => reading_ready,
      reading_ready_nn_next => reading_ready_nn_next,
      reset_IBUF => reset_IBUF,
      stage(1 downto 0) => stage(1 downto 0),
      start_buffer1 => start_buffer1,
      start_buffer1r => start_buffer1r,
      start_buffer1r_reg => SAMP_n_19,
      start_buffer2 => start_buffer2,
      start_buffer2r => start_buffer2r,
      start_buffer2r_reg => SAMP_n_18,
      start_buffer3 => start_buffer3,
      start_buffer3r => start_buffer3r,
      start_buffer3r_reg => SAMP_n_20,
      \state_reg[1]\ => DATA_OUTr_i_9_n_0,
      \win_stage_reg[0]\ => SAMP_n_22,
      \win_stage_reg[1]\ => SAMP_n_23
    );
SHFT: entity work.shift_register
     port map (
      CLK => \^sclk_dac_obuf\,
      D(0) => D(0),
      E(0) => enable,
      Q(15 downto 0) => r_reg(15 downto 0),
      reset_IBUF => reset_IBUF
    );
WIN1: entity work.window_controller
     port map (
      CO(0) => WIN1_n_81,
      D(9 downto 0) => memo1_address_next(9 downto 0),
      DI(3) => WIN1_n_26,
      DI(2) => WIN1_n_27,
      DI(1) => WIN1_n_28,
      DI(0) => WIN1_n_29,
      \FSM_sequential_input_fsm_state_reg[0]\ => FSM_n_14,
      \FSM_sequential_input_fsm_state_reg[1]\ => FSM_n_5,
      Q(9 downto 0) => address_buf0(9 downto 0),
      S(3) => WIN1_n_46,
      S(2) => WIN1_n_47,
      S(1) => WIN1_n_48,
      S(0) => WIN1_n_49,
      \address_buf0r_reg[8]\(8 downto 0) => address_buf0r(8 downto 0),
      \address_buf1_reg[8]\(8 downto 0) => address_buf1(8 downto 0),
      \address_buf1r_reg[8]\(8 downto 0) => address_buf1r(8 downto 0),
      \address_buf2_reg[8]\(8 downto 0) => address_buf2(8 downto 0),
      \address_buf2r_reg[8]\(8 downto 0) => address_buf2r(8 downto 0),
      \address_buf3_reg[8]\(8 downto 0) => address_buf3(8 downto 0),
      \address_buf3r_reg[8]\(8 downto 0) => address_buf3r(8 downto 0),
      clk_100MHz => clk_100MHz,
      \control_reg[1]\(1 downto 0) => control_sampling(1 downto 0),
      end_proc_win => end_proc_win,
      espera => espera,
      \memo2_address_reg[8]\(8 downto 0) => memo2_address_next(8 downto 0),
      \memo2_address_reg[9]\ => WIN1_n_20,
      \multiplicand_reg[15]\(15 downto 0) => multiplicand(15 downto 0),
      read_buffer0_next1(12 downto 0) => read_buffer0_next1(13 downto 1),
      read_buffer0_next3(13 downto 0) => read_buffer0_next3(15 downto 2),
      \read_buffer0_reg[0]\ => WIN1_n_24,
      \read_buffer0_reg[13]\(3) => WIN1_n_50,
      \read_buffer0_reg[13]\(2) => WIN1_n_51,
      \read_buffer0_reg[13]\(1) => WIN1_n_52,
      \read_buffer0_reg[13]\(0) => WIN1_n_53,
      \read_buffer0_reg[13]_0\(3) => WIN1_n_82,
      \read_buffer0_reg[13]_0\(2) => WIN1_n_83,
      \read_buffer0_reg[13]_0\(1) => WIN1_n_84,
      \read_buffer0_reg[13]_0\(0) => WIN1_n_85,
      \read_buffer1_reg[0]\ => WIN1_n_25,
      read_sample => read_sample,
      read_sample_memo_reg => WIN1_n_23,
      reading_ready => reading_ready,
      reset_IBUF => reset_IBUF,
      result(15 downto 0) => result(15 downto 0),
      \result_pre_reg[17]_0\ => \read_buffer1[4]_i_3_n_0\,
      \result_pre_reg[21]_0\(3) => \read_buffer1[4]_i_4_n_0\,
      \result_pre_reg[21]_0\(2) => \read_buffer1[4]_i_5_n_0\,
      \result_pre_reg[21]_0\(1) => \read_buffer1[4]_i_6_n_0\,
      \result_pre_reg[21]_0\(0) => \read_buffer1[4]_i_7_n_0\,
      \result_pre_reg[25]_0\(3) => \read_buffer1[8]_i_3_n_0\,
      \result_pre_reg[25]_0\(2) => \read_buffer1[8]_i_4_n_0\,
      \result_pre_reg[25]_0\(1) => \read_buffer1[8]_i_5_n_0\,
      \result_pre_reg[25]_0\(0) => \read_buffer1[8]_i_6_n_0\,
      \result_pre_reg[29]_0\(3) => \read_buffer1[12]_i_3_n_0\,
      \result_pre_reg[29]_0\(2) => \read_buffer1[12]_i_4_n_0\,
      \result_pre_reg[29]_0\(1) => \read_buffer1[12]_i_5_n_0\,
      \result_pre_reg[29]_0\(0) => \read_buffer1[12]_i_6_n_0\,
      \result_pre_reg[30]_0\(0) => \read_buffer1[15]_i_5_n_0\,
      stage(1 downto 0) => stage(1 downto 0),
      start_proc_win => start_proc_win,
      start_proc_win_reg => WIN1_n_22,
      \win_stage_reg[0]\ => WIN1_n_21,
      \win_stage_reg[1]\ => espera_i_2_n_0
    );
\address_buf0[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => address_buf0(0),
      O => address_buf0_next(0)
    );
\address_buf0[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf0(0),
      I1 => address_buf0(1),
      O => address_buf0_next(1)
    );
\address_buf0[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf0(2),
      I1 => address_buf0(1),
      I2 => address_buf0(0),
      O => \address_buf0[2]_i_1_n_0\
    );
\address_buf0[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => address_buf0(1),
      I1 => address_buf0(0),
      I2 => address_buf0(2),
      I3 => address_buf0(3),
      O => address_buf0_next(3)
    );
\address_buf0[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => address_buf0(4),
      I1 => address_buf0(1),
      I2 => address_buf0(0),
      I3 => address_buf0(2),
      I4 => address_buf0(3),
      O => address_buf0_next(4)
    );
\address_buf0[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => address_buf0(5),
      I1 => address_buf0(4),
      I2 => address_buf0(1),
      I3 => address_buf0(0),
      I4 => address_buf0(2),
      I5 => address_buf0(3),
      O => address_buf0_next(5)
    );
\address_buf0[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf0(6),
      I1 => \address_buf0[9]_i_2_n_0\,
      O => address_buf0_next(6)
    );
\address_buf0[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf0(7),
      I1 => \address_buf0[9]_i_2_n_0\,
      I2 => address_buf0(6),
      O => address_buf0_next(7)
    );
\address_buf0[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf0(8),
      I1 => address_buf0(6),
      I2 => \address_buf0[9]_i_2_n_0\,
      I3 => address_buf0(7),
      O => address_buf0_next(8)
    );
\address_buf0[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => address_buf0(9),
      I1 => address_buf0(7),
      I2 => \address_buf0[9]_i_2_n_0\,
      I3 => address_buf0(6),
      I4 => address_buf0(8),
      O => address_buf0_next(9)
    );
\address_buf0[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => address_buf0(5),
      I1 => address_buf0(3),
      I2 => address_buf0(2),
      I3 => address_buf0(0),
      I4 => address_buf0(1),
      I5 => address_buf0(4),
      O => \address_buf0[9]_i_2_n_0\
    );
\address_buf0_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => address_buf0_next(0),
      Q => address_buf0(0)
    );
\address_buf0_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => address_buf0_next(1),
      Q => address_buf0(1)
    );
\address_buf0_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => \address_buf0[2]_i_1_n_0\,
      Q => address_buf0(2)
    );
\address_buf0_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => address_buf0_next(3),
      Q => address_buf0(3)
    );
\address_buf0_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => address_buf0_next(4),
      Q => address_buf0(4)
    );
\address_buf0_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => address_buf0_next(5),
      Q => address_buf0(5)
    );
\address_buf0_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => address_buf0_next(6),
      Q => address_buf0(6)
    );
\address_buf0_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => address_buf0_next(7),
      Q => address_buf0(7)
    );
\address_buf0_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => address_buf0_next(8),
      Q => address_buf0(8)
    );
\address_buf0_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => address_buf0_next(9),
      Q => address_buf0(9)
    );
\address_buf0r[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => address_buf0r(0),
      O => address_buf0r_next(0)
    );
\address_buf0r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf0r(0),
      I1 => address_buf0r(1),
      O => address_buf0r_next(1)
    );
\address_buf0r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf0r(2),
      I1 => address_buf0r(1),
      I2 => address_buf0r(0),
      O => \address_buf0r[2]_i_1_n_0\
    );
\address_buf0r[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => address_buf0r(1),
      I1 => address_buf0r(0),
      I2 => address_buf0r(2),
      I3 => address_buf0r(3),
      O => address_buf0r_next(3)
    );
\address_buf0r[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => address_buf0r(4),
      I1 => address_buf0r(1),
      I2 => address_buf0r(0),
      I3 => address_buf0r(2),
      I4 => address_buf0r(3),
      O => address_buf0r_next(4)
    );
\address_buf0r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => address_buf0r(5),
      I1 => address_buf0r(4),
      I2 => address_buf0r(1),
      I3 => address_buf0r(0),
      I4 => address_buf0r(2),
      I5 => address_buf0r(3),
      O => address_buf0r_next(5)
    );
\address_buf0r[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf0r(6),
      I1 => \address_buf0r[8]_i_3_n_0\,
      O => address_buf0r_next(6)
    );
\address_buf0r[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf0r(7),
      I1 => \address_buf0r[8]_i_3_n_0\,
      I2 => address_buf0r(6),
      O => address_buf0r_next(7)
    );
\address_buf0r[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf0r(8),
      I1 => address_buf0r(6),
      I2 => \address_buf0r[8]_i_3_n_0\,
      I3 => address_buf0r(7),
      O => address_buf0r_next(8)
    );
\address_buf0r[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => address_buf0r(5),
      I1 => address_buf0r(3),
      I2 => address_buf0r(2),
      I3 => address_buf0r(0),
      I4 => address_buf0r(1),
      I5 => address_buf0r(4),
      O => \address_buf0r[8]_i_3_n_0\
    );
\address_buf0r_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => address_buf0r_next(0),
      Q => address_buf0r(0)
    );
\address_buf0r_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => address_buf0r_next(1),
      Q => address_buf0r(1)
    );
\address_buf0r_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => \address_buf0r[2]_i_1_n_0\,
      Q => address_buf0r(2)
    );
\address_buf0r_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => address_buf0r_next(3),
      Q => address_buf0r(3)
    );
\address_buf0r_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => address_buf0r_next(4),
      Q => address_buf0r(4)
    );
\address_buf0r_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => address_buf0r_next(5),
      Q => address_buf0r(5)
    );
\address_buf0r_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => address_buf0r_next(6),
      Q => address_buf0r(6)
    );
\address_buf0r_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => address_buf0r_next(7),
      Q => address_buf0r(7)
    );
\address_buf0r_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => address_buf0r_next(8),
      Q => address_buf0r(8)
    );
\address_buf1[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => address_buf1(0),
      O => address_buf1_next(0)
    );
\address_buf1[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf1(0),
      I1 => address_buf1(1),
      O => address_buf1_next(1)
    );
\address_buf1[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf1(2),
      I1 => address_buf1(0),
      I2 => address_buf1(1),
      O => address_buf1_next(2)
    );
\address_buf1[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf1(3),
      I1 => address_buf1(1),
      I2 => address_buf1(0),
      I3 => address_buf1(2),
      O => address_buf1_next(3)
    );
\address_buf1[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => address_buf1(2),
      I1 => address_buf1(0),
      I2 => address_buf1(1),
      I3 => address_buf1(3),
      I4 => address_buf1(4),
      O => address_buf1_next(4)
    );
\address_buf1[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => address_buf1(5),
      I1 => address_buf1(2),
      I2 => address_buf1(0),
      I3 => address_buf1(1),
      I4 => address_buf1(3),
      I5 => address_buf1(4),
      O => address_buf1_next(5)
    );
\address_buf1[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf1(6),
      I1 => \address_buf1[8]_i_3_n_0\,
      I2 => address_buf1(5),
      O => \address_buf1[6]_i_1_n_0\
    );
\address_buf1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf1(7),
      I1 => address_buf1(6),
      I2 => address_buf1(5),
      I3 => \address_buf1[8]_i_3_n_0\,
      O => \address_buf1[7]_i_1_n_0\
    );
\address_buf1[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => address_buf1(8),
      I1 => \address_buf1[8]_i_3_n_0\,
      I2 => address_buf1(5),
      I3 => address_buf1(6),
      I4 => address_buf1(7),
      O => address_buf1_next(8)
    );
\address_buf1[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => address_buf1(4),
      I1 => address_buf1(3),
      I2 => address_buf1(1),
      I3 => address_buf1(0),
      I4 => address_buf1(2),
      O => \address_buf1[8]_i_3_n_0\
    );
\address_buf1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_17,
      CLR => reset_IBUF,
      D => address_buf1_next(0),
      Q => address_buf1(0)
    );
\address_buf1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_17,
      CLR => reset_IBUF,
      D => address_buf1_next(1),
      Q => address_buf1(1)
    );
\address_buf1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_17,
      CLR => reset_IBUF,
      D => address_buf1_next(2),
      Q => address_buf1(2)
    );
\address_buf1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_17,
      CLR => reset_IBUF,
      D => address_buf1_next(3),
      Q => address_buf1(3)
    );
\address_buf1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_17,
      CLR => reset_IBUF,
      D => address_buf1_next(4),
      Q => address_buf1(4)
    );
\address_buf1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_17,
      CLR => reset_IBUF,
      D => address_buf1_next(5),
      Q => address_buf1(5)
    );
\address_buf1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_17,
      CLR => reset_IBUF,
      D => \address_buf1[6]_i_1_n_0\,
      Q => address_buf1(6)
    );
\address_buf1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_17,
      CLR => reset_IBUF,
      D => \address_buf1[7]_i_1_n_0\,
      Q => address_buf1(7)
    );
\address_buf1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_17,
      CLR => reset_IBUF,
      D => address_buf1_next(8),
      Q => address_buf1(8)
    );
\address_buf1r[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => address_buf1r(0),
      O => address_buf1r_next(0)
    );
\address_buf1r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf1r(0),
      I1 => address_buf1r(1),
      O => address_buf1r_next(1)
    );
\address_buf1r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf1r(2),
      I1 => address_buf1r(1),
      I2 => address_buf1r(0),
      O => \address_buf1r[2]_i_1_n_0\
    );
\address_buf1r[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => address_buf1r(1),
      I1 => address_buf1r(0),
      I2 => address_buf1r(2),
      I3 => address_buf1r(3),
      O => address_buf1r_next(3)
    );
\address_buf1r[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => address_buf1r(4),
      I1 => address_buf1r(1),
      I2 => address_buf1r(0),
      I3 => address_buf1r(2),
      I4 => address_buf1r(3),
      O => address_buf1r_next(4)
    );
\address_buf1r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => address_buf1r(5),
      I1 => address_buf1r(4),
      I2 => address_buf1r(1),
      I3 => address_buf1r(0),
      I4 => address_buf1r(2),
      I5 => address_buf1r(3),
      O => address_buf1r_next(5)
    );
\address_buf1r[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf1r(6),
      I1 => \address_buf1r[8]_i_3_n_0\,
      O => address_buf1r_next(6)
    );
\address_buf1r[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf1r(7),
      I1 => \address_buf1r[8]_i_3_n_0\,
      I2 => address_buf1r(6),
      O => address_buf1r_next(7)
    );
\address_buf1r[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf1r(8),
      I1 => address_buf1r(6),
      I2 => \address_buf1r[8]_i_3_n_0\,
      I3 => address_buf1r(7),
      O => address_buf1r_next(8)
    );
\address_buf1r[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => address_buf1r(5),
      I1 => address_buf1r(3),
      I2 => address_buf1r(2),
      I3 => address_buf1r(0),
      I4 => address_buf1r(1),
      I5 => address_buf1r(4),
      O => \address_buf1r[8]_i_3_n_0\
    );
\address_buf1r_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_21,
      CLR => reset_IBUF,
      D => address_buf1r_next(0),
      Q => address_buf1r(0)
    );
\address_buf1r_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_21,
      CLR => reset_IBUF,
      D => address_buf1r_next(1),
      Q => address_buf1r(1)
    );
\address_buf1r_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_21,
      CLR => reset_IBUF,
      D => \address_buf1r[2]_i_1_n_0\,
      Q => address_buf1r(2)
    );
\address_buf1r_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_21,
      CLR => reset_IBUF,
      D => address_buf1r_next(3),
      Q => address_buf1r(3)
    );
\address_buf1r_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_21,
      CLR => reset_IBUF,
      D => address_buf1r_next(4),
      Q => address_buf1r(4)
    );
\address_buf1r_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_21,
      CLR => reset_IBUF,
      D => address_buf1r_next(5),
      Q => address_buf1r(5)
    );
\address_buf1r_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_21,
      CLR => reset_IBUF,
      D => address_buf1r_next(6),
      Q => address_buf1r(6)
    );
\address_buf1r_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_21,
      CLR => reset_IBUF,
      D => address_buf1r_next(7),
      Q => address_buf1r(7)
    );
\address_buf1r_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_21,
      CLR => reset_IBUF,
      D => address_buf1r_next(8),
      Q => address_buf1r(8)
    );
\address_buf2[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => address_buf2(0),
      O => address_buf2_next(0)
    );
\address_buf2[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf2(0),
      I1 => address_buf2(1),
      O => address_buf2_next(1)
    );
\address_buf2[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf2(2),
      I1 => address_buf2(0),
      I2 => address_buf2(1),
      O => address_buf2_next(2)
    );
\address_buf2[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf2(3),
      I1 => address_buf2(1),
      I2 => address_buf2(0),
      I3 => address_buf2(2),
      O => address_buf2_next(3)
    );
\address_buf2[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => address_buf2(4),
      I1 => address_buf2(2),
      I2 => address_buf2(0),
      I3 => address_buf2(1),
      I4 => address_buf2(3),
      O => address_buf2_next(4)
    );
\address_buf2[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => address_buf2(5),
      I1 => address_buf2(3),
      I2 => address_buf2(1),
      I3 => address_buf2(0),
      I4 => address_buf2(2),
      I5 => address_buf2(4),
      O => address_buf2_next(5)
    );
\address_buf2[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf2(6),
      I1 => \address_buf2[8]_i_3_n_0\,
      O => address_buf2_next(6)
    );
\address_buf2[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf2(7),
      I1 => \address_buf2[8]_i_3_n_0\,
      I2 => address_buf2(6),
      O => address_buf2_next(7)
    );
\address_buf2[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf2(8),
      I1 => address_buf2(6),
      I2 => \address_buf2[8]_i_3_n_0\,
      I3 => address_buf2(7),
      O => address_buf2_next(8)
    );
\address_buf2[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => address_buf2(5),
      I1 => address_buf2(4),
      I2 => address_buf2(2),
      I3 => address_buf2(0),
      I4 => address_buf2(1),
      I5 => address_buf2(3),
      O => \address_buf2[8]_i_3_n_0\
    );
\address_buf2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_16,
      CLR => reset_IBUF,
      D => address_buf2_next(0),
      Q => address_buf2(0)
    );
\address_buf2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_16,
      CLR => reset_IBUF,
      D => address_buf2_next(1),
      Q => address_buf2(1)
    );
\address_buf2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_16,
      CLR => reset_IBUF,
      D => address_buf2_next(2),
      Q => address_buf2(2)
    );
\address_buf2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_16,
      CLR => reset_IBUF,
      D => address_buf2_next(3),
      Q => address_buf2(3)
    );
\address_buf2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_16,
      CLR => reset_IBUF,
      D => address_buf2_next(4),
      Q => address_buf2(4)
    );
\address_buf2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_16,
      CLR => reset_IBUF,
      D => address_buf2_next(5),
      Q => address_buf2(5)
    );
\address_buf2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_16,
      CLR => reset_IBUF,
      D => address_buf2_next(6),
      Q => address_buf2(6)
    );
\address_buf2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_16,
      CLR => reset_IBUF,
      D => address_buf2_next(7),
      Q => address_buf2(7)
    );
\address_buf2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_16,
      CLR => reset_IBUF,
      D => address_buf2_next(8),
      Q => address_buf2(8)
    );
\address_buf2r[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => address_buf2r(0),
      O => address_buf2r_next(0)
    );
\address_buf2r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf2r(0),
      I1 => address_buf2r(1),
      O => address_buf2r_next(1)
    );
\address_buf2r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf2r(2),
      I1 => address_buf2r(1),
      I2 => address_buf2r(0),
      O => \address_buf2r[2]_i_1_n_0\
    );
\address_buf2r[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => address_buf2r(1),
      I1 => address_buf2r(0),
      I2 => address_buf2r(2),
      I3 => address_buf2r(3),
      O => address_buf2r_next(3)
    );
\address_buf2r[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => address_buf2r(4),
      I1 => address_buf2r(1),
      I2 => address_buf2r(0),
      I3 => address_buf2r(2),
      I4 => address_buf2r(3),
      O => address_buf2r_next(4)
    );
\address_buf2r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => address_buf2r(5),
      I1 => address_buf2r(4),
      I2 => address_buf2r(1),
      I3 => address_buf2r(0),
      I4 => address_buf2r(2),
      I5 => address_buf2r(3),
      O => address_buf2r_next(5)
    );
\address_buf2r[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf2r(6),
      I1 => \address_buf2r[8]_i_3_n_0\,
      O => address_buf2r_next(6)
    );
\address_buf2r[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf2r(7),
      I1 => \address_buf2r[8]_i_3_n_0\,
      I2 => address_buf2r(6),
      O => address_buf2r_next(7)
    );
\address_buf2r[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf2r(8),
      I1 => address_buf2r(6),
      I2 => \address_buf2r[8]_i_3_n_0\,
      I3 => address_buf2r(7),
      O => address_buf2r_next(8)
    );
\address_buf2r[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => address_buf2r(5),
      I1 => address_buf2r(3),
      I2 => address_buf2r(2),
      I3 => address_buf2r(0),
      I4 => address_buf2r(1),
      I5 => address_buf2r(4),
      O => \address_buf2r[8]_i_3_n_0\
    );
\address_buf2r_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_9,
      CLR => reset_IBUF,
      D => address_buf2r_next(0),
      Q => address_buf2r(0)
    );
\address_buf2r_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_9,
      CLR => reset_IBUF,
      D => address_buf2r_next(1),
      Q => address_buf2r(1)
    );
\address_buf2r_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_9,
      CLR => reset_IBUF,
      D => \address_buf2r[2]_i_1_n_0\,
      Q => address_buf2r(2)
    );
\address_buf2r_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_9,
      CLR => reset_IBUF,
      D => address_buf2r_next(3),
      Q => address_buf2r(3)
    );
\address_buf2r_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_9,
      CLR => reset_IBUF,
      D => address_buf2r_next(4),
      Q => address_buf2r(4)
    );
\address_buf2r_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_9,
      CLR => reset_IBUF,
      D => address_buf2r_next(5),
      Q => address_buf2r(5)
    );
\address_buf2r_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_9,
      CLR => reset_IBUF,
      D => address_buf2r_next(6),
      Q => address_buf2r(6)
    );
\address_buf2r_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_9,
      CLR => reset_IBUF,
      D => address_buf2r_next(7),
      Q => address_buf2r(7)
    );
\address_buf2r_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_9,
      CLR => reset_IBUF,
      D => address_buf2r_next(8),
      Q => address_buf2r(8)
    );
\address_buf3[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => address_buf3(0),
      O => address_buf3_next(0)
    );
\address_buf3[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf3(0),
      I1 => address_buf3(1),
      O => address_buf3_next(1)
    );
\address_buf3[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf3(2),
      I1 => address_buf3(1),
      I2 => address_buf3(0),
      O => \address_buf3[2]_i_1_n_0\
    );
\address_buf3[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => address_buf3(1),
      I1 => address_buf3(0),
      I2 => address_buf3(2),
      I3 => address_buf3(3),
      O => address_buf3_next(3)
    );
\address_buf3[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => address_buf3(4),
      I1 => address_buf3(1),
      I2 => address_buf3(0),
      I3 => address_buf3(2),
      I4 => address_buf3(3),
      O => address_buf3_next(4)
    );
\address_buf3[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => address_buf3(5),
      I1 => address_buf3(4),
      I2 => address_buf3(1),
      I3 => address_buf3(0),
      I4 => address_buf3(2),
      I5 => address_buf3(3),
      O => address_buf3_next(5)
    );
\address_buf3[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf3(6),
      I1 => \address_buf3[8]_i_3_n_0\,
      O => address_buf3_next(6)
    );
\address_buf3[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf3(7),
      I1 => \address_buf3[8]_i_3_n_0\,
      I2 => address_buf3(6),
      O => \address_buf3[7]_i_1_n_0\
    );
\address_buf3[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf3(8),
      I1 => address_buf3(6),
      I2 => \address_buf3[8]_i_3_n_0\,
      I3 => address_buf3(7),
      O => address_buf3_next(8)
    );
\address_buf3[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => address_buf3(5),
      I1 => address_buf3(3),
      I2 => address_buf3(2),
      I3 => address_buf3(0),
      I4 => address_buf3(1),
      I5 => address_buf3(4),
      O => \address_buf3[8]_i_3_n_0\
    );
\address_buf3_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_15,
      CLR => reset_IBUF,
      D => address_buf3_next(0),
      Q => address_buf3(0)
    );
\address_buf3_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_15,
      CLR => reset_IBUF,
      D => address_buf3_next(1),
      Q => address_buf3(1)
    );
\address_buf3_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_15,
      CLR => reset_IBUF,
      D => \address_buf3[2]_i_1_n_0\,
      Q => address_buf3(2)
    );
\address_buf3_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_15,
      CLR => reset_IBUF,
      D => address_buf3_next(3),
      Q => address_buf3(3)
    );
\address_buf3_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_15,
      CLR => reset_IBUF,
      D => address_buf3_next(4),
      Q => address_buf3(4)
    );
\address_buf3_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_15,
      CLR => reset_IBUF,
      D => address_buf3_next(5),
      Q => address_buf3(5)
    );
\address_buf3_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_15,
      CLR => reset_IBUF,
      D => address_buf3_next(6),
      Q => address_buf3(6)
    );
\address_buf3_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_15,
      CLR => reset_IBUF,
      D => \address_buf3[7]_i_1_n_0\,
      Q => address_buf3(7)
    );
\address_buf3_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_15,
      CLR => reset_IBUF,
      D => address_buf3_next(8),
      Q => address_buf3(8)
    );
\address_buf3r[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => address_buf3r(0),
      O => address_buf3r_next(0)
    );
\address_buf3r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf3r(0),
      I1 => address_buf3r(1),
      O => address_buf3r_next(1)
    );
\address_buf3r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf3r(2),
      I1 => address_buf3r(0),
      I2 => address_buf3r(1),
      O => address_buf3r_next(2)
    );
\address_buf3r[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf3r(3),
      I1 => address_buf3r(1),
      I2 => address_buf3r(0),
      I3 => address_buf3r(2),
      O => address_buf3r_next(3)
    );
\address_buf3r[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => address_buf3r(4),
      I1 => address_buf3r(2),
      I2 => address_buf3r(0),
      I3 => address_buf3r(1),
      I4 => address_buf3r(3),
      O => address_buf3r_next(4)
    );
\address_buf3r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => address_buf3r(5),
      I1 => address_buf3r(3),
      I2 => address_buf3r(1),
      I3 => address_buf3r(0),
      I4 => address_buf3r(2),
      I5 => address_buf3r(4),
      O => address_buf3r_next(5)
    );
\address_buf3r[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => address_buf3r(6),
      I1 => \address_buf3r[8]_i_3_n_0\,
      O => address_buf3r_next(6)
    );
\address_buf3r[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => address_buf3r(7),
      I1 => \address_buf3r[8]_i_3_n_0\,
      I2 => address_buf3r(6),
      O => address_buf3r_next(7)
    );
\address_buf3r[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => address_buf3r(8),
      I1 => address_buf3r(6),
      I2 => \address_buf3r[8]_i_3_n_0\,
      I3 => address_buf3r(7),
      O => address_buf3r_next(8)
    );
\address_buf3r[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => address_buf3r(5),
      I1 => address_buf3r(4),
      I2 => address_buf3r(2),
      I3 => address_buf3r(0),
      I4 => address_buf3r(1),
      I5 => address_buf3r(3),
      O => \address_buf3r[8]_i_3_n_0\
    );
\address_buf3r_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_8,
      CLR => reset_IBUF,
      D => address_buf3r_next(0),
      Q => address_buf3r(0)
    );
\address_buf3r_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_8,
      CLR => reset_IBUF,
      D => address_buf3r_next(1),
      Q => address_buf3r(1)
    );
\address_buf3r_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_8,
      CLR => reset_IBUF,
      D => address_buf3r_next(2),
      Q => address_buf3r(2)
    );
\address_buf3r_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_8,
      CLR => reset_IBUF,
      D => address_buf3r_next(3),
      Q => address_buf3r(3)
    );
\address_buf3r_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_8,
      CLR => reset_IBUF,
      D => address_buf3r_next(4),
      Q => address_buf3r(4)
    );
\address_buf3r_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_8,
      CLR => reset_IBUF,
      D => address_buf3r_next(5),
      Q => address_buf3r(5)
    );
\address_buf3r_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_8,
      CLR => reset_IBUF,
      D => address_buf3r_next(6),
      Q => address_buf3r(6)
    );
\address_buf3r_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_8,
      CLR => reset_IBUF,
      D => address_buf3r_next(7),
      Q => address_buf3r(7)
    );
\address_buf3r_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_8,
      CLR => reset_IBUF,
      D => address_buf3r_next(8),
      Q => address_buf3r(8)
    );
\counter_buf0[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_buf0_reg__0\(0),
      O => counter_buf0_next(0)
    );
\counter_buf0[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \counter_buf0_reg__0\(0),
      I1 => \counter_buf0_reg__0\(1),
      O => counter_buf0_next(1)
    );
\counter_buf0[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \counter_buf0_reg__0\(2),
      I1 => \counter_buf0_reg__0\(0),
      I2 => \counter_buf0_reg__0\(1),
      O => counter_buf0_next(2)
    );
\counter_buf0[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \counter_buf0_reg__0\(3),
      I1 => \counter_buf0_reg__0\(1),
      I2 => \counter_buf0_reg__0\(0),
      I3 => \counter_buf0_reg__0\(2),
      O => counter_buf0_next(3)
    );
\counter_buf0[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \counter_buf0_reg__0\(2),
      I1 => \counter_buf0_reg__0\(0),
      I2 => \counter_buf0_reg__0\(1),
      I3 => \counter_buf0_reg__0\(3),
      I4 => \counter_buf0_reg__0\(4),
      O => counter_buf0_next(4)
    );
\counter_buf0[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \counter_buf0_reg__0\(5),
      I1 => \counter_buf0_reg__0\(2),
      I2 => \counter_buf0_reg__0\(0),
      I3 => \counter_buf0_reg__0\(1),
      I4 => \counter_buf0_reg__0\(3),
      I5 => \counter_buf0_reg__0\(4),
      O => counter_buf0_next(5)
    );
\counter_buf0[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \counter_buf0_reg__0\(6),
      I1 => \counter_buf0[8]_i_2_n_0\,
      I2 => \counter_buf0_reg__0\(5),
      O => counter_buf0_next(6)
    );
\counter_buf0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \counter_buf0_reg__0\(7),
      I1 => \counter_buf0_reg__0\(5),
      I2 => \counter_buf0[8]_i_2_n_0\,
      I3 => \counter_buf0_reg__0\(6),
      O => counter_buf0_next(7)
    );
\counter_buf0[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \counter_buf0_reg__0\(8),
      I1 => \counter_buf0_reg__0\(6),
      I2 => \counter_buf0[8]_i_2_n_0\,
      I3 => \counter_buf0_reg__0\(5),
      I4 => \counter_buf0_reg__0\(7),
      O => counter_buf0_next(8)
    );
\counter_buf0[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \counter_buf0_reg__0\(4),
      I1 => \counter_buf0_reg__0\(3),
      I2 => \counter_buf0_reg__0\(1),
      I3 => \counter_buf0_reg__0\(0),
      I4 => \counter_buf0_reg__0\(2),
      O => \counter_buf0[8]_i_2_n_0\
    );
\counter_buf0_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => counter_buf0_next(0),
      Q => \counter_buf0_reg__0\(0)
    );
\counter_buf0_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => counter_buf0_next(1),
      Q => \counter_buf0_reg__0\(1)
    );
\counter_buf0_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => counter_buf0_next(2),
      Q => \counter_buf0_reg__0\(2)
    );
\counter_buf0_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => counter_buf0_next(3),
      Q => \counter_buf0_reg__0\(3)
    );
\counter_buf0_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => counter_buf0_next(4),
      Q => \counter_buf0_reg__0\(4)
    );
\counter_buf0_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => counter_buf0_next(5),
      Q => \counter_buf0_reg__0\(5)
    );
\counter_buf0_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => counter_buf0_next(6),
      Q => \counter_buf0_reg__0\(6)
    );
\counter_buf0_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => counter_buf0_next(7),
      Q => \counter_buf0_reg__0\(7)
    );
\counter_buf0_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => control_sampling(2),
      CLR => reset_IBUF,
      D => counter_buf0_next(8),
      Q => \counter_buf0_reg__0\(8)
    );
\counter_buf0r[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_buf0r_reg__0\(0),
      O => counter_buf0r_next0_in(0)
    );
\counter_buf0r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \counter_buf0r_reg__0\(0),
      I1 => \counter_buf0r_reg__0\(1),
      O => counter_buf0r_next0_in(1)
    );
\counter_buf0r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \counter_buf0r_reg__0\(2),
      I1 => \counter_buf0r_reg__0\(0),
      I2 => \counter_buf0r_reg__0\(1),
      O => counter_buf0r_next0_in(2)
    );
\counter_buf0r[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \counter_buf0r_reg__0\(3),
      I1 => \counter_buf0r_reg__0\(1),
      I2 => \counter_buf0r_reg__0\(0),
      I3 => \counter_buf0r_reg__0\(2),
      O => counter_buf0r_next0_in(3)
    );
\counter_buf0r[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \counter_buf0r_reg__0\(4),
      I1 => \counter_buf0r_reg__0\(2),
      I2 => \counter_buf0r_reg__0\(0),
      I3 => \counter_buf0r_reg__0\(1),
      I4 => \counter_buf0r_reg__0\(3),
      O => counter_buf0r_next0_in(4)
    );
\counter_buf0r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \counter_buf0r_reg__0\(5),
      I1 => \counter_buf0r_reg__0\(2),
      I2 => \counter_buf0r_reg__0\(0),
      I3 => \counter_buf0r_reg__0\(1),
      I4 => \counter_buf0r_reg__0\(3),
      I5 => \counter_buf0r_reg__0\(4),
      O => counter_buf0r_next0_in(5)
    );
\counter_buf0r[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \counter_buf0r_reg__0\(6),
      I1 => \counter_buf0r[8]_i_2_n_0\,
      I2 => \counter_buf0r_reg__0\(5),
      O => counter_buf0r_next0_in(6)
    );
\counter_buf0r[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \counter_buf0r_reg__0\(6),
      I1 => \counter_buf0r[8]_i_2_n_0\,
      I2 => \counter_buf0r_reg__0\(5),
      I3 => \counter_buf0r_reg__0\(7),
      O => counter_buf0r_next0_in(7)
    );
\counter_buf0r[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \counter_buf0r_reg_n_0_[8]\,
      I1 => \counter_buf0r_reg__0\(6),
      I2 => \counter_buf0r[8]_i_2_n_0\,
      I3 => \counter_buf0r_reg__0\(5),
      I4 => \counter_buf0r_reg__0\(7),
      O => counter_buf0r_next0_in(8)
    );
\counter_buf0r[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \counter_buf0r_reg__0\(4),
      I1 => \counter_buf0r_reg__0\(3),
      I2 => \counter_buf0r_reg__0\(1),
      I3 => \counter_buf0r_reg__0\(0),
      I4 => \counter_buf0r_reg__0\(2),
      O => \counter_buf0r[8]_i_2_n_0\
    );
\counter_buf0r_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => counter_buf0r_next0_in(0),
      Q => \counter_buf0r_reg__0\(0)
    );
\counter_buf0r_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => counter_buf0r_next0_in(1),
      Q => \counter_buf0r_reg__0\(1)
    );
\counter_buf0r_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => counter_buf0r_next0_in(2),
      Q => \counter_buf0r_reg__0\(2)
    );
\counter_buf0r_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => counter_buf0r_next0_in(3),
      Q => \counter_buf0r_reg__0\(3)
    );
\counter_buf0r_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => counter_buf0r_next0_in(4),
      Q => \counter_buf0r_reg__0\(4)
    );
\counter_buf0r_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => counter_buf0r_next0_in(5),
      Q => \counter_buf0r_reg__0\(5)
    );
\counter_buf0r_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => counter_buf0r_next0_in(6),
      Q => \counter_buf0r_reg__0\(6)
    );
\counter_buf0r_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => counter_buf0r_next0_in(7),
      Q => \counter_buf0r_reg__0\(7)
    );
\counter_buf0r_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_10,
      CLR => reset_IBUF,
      D => counter_buf0r_next0_in(8),
      Q => \counter_buf0r_reg_n_0_[8]\
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
espera_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => stage(1),
      I1 => stage(0),
      O => espera_i_2_n_0
    );
espera_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => espera_next,
      Q => espera
    );
\i___2_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4400000FFFFF440"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(5),
      I2 => read_buffer1(5),
      I3 => \i___2_carry__0_i_9_n_0\,
      I4 => read_buffer0(6),
      I5 => \i___2_carry__0_i_10_n_0\,
      O => \i___2_carry__0_i_1_n_0\
    );
\i___2_carry__0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(6),
      I1 => read_buffer2(6),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(6),
      O => \i___2_carry__0_i_10_n_0\
    );
\i___2_carry__0_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(4),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__0_i_11_n_0\
    );
\i___2_carry__0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(5),
      I1 => read_buffer2(5),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(5),
      O => \i___2_carry__0_i_12_n_0\
    );
\i___2_carry__0_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(3),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__0_i_13_n_0\
    );
\i___2_carry__0_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(4),
      I1 => read_buffer2(4),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(4),
      O => \i___2_carry__0_i_14_n_0\
    );
\i___2_carry__0_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(2),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__0_i_15_n_0\
    );
\i___2_carry__0_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004F444F4FFF4FFF"
    )
        port map (
      I0 => start_buffer3r,
      I1 => start_buffer1r,
      I2 => read_buffer3(6),
      I3 => read_buffer1(6),
      I4 => start_buffer2r,
      I5 => read_buffer2(6),
      O => \i___2_carry__0_i_16_n_0\
    );
\i___2_carry__0_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(7),
      I1 => read_buffer2(7),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(7),
      O => \i___2_carry__0_i_17_n_0\
    );
\i___2_carry__0_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004F444F4FFF4FFF"
    )
        port map (
      I0 => start_buffer3r,
      I1 => start_buffer1r,
      I2 => read_buffer3(5),
      I3 => read_buffer1(5),
      I4 => start_buffer2r,
      I5 => read_buffer2(5),
      O => \i___2_carry__0_i_18_n_0\
    );
\i___2_carry__0_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004F444F4FFF4FFF"
    )
        port map (
      I0 => start_buffer3r,
      I1 => start_buffer1r,
      I2 => read_buffer3(4),
      I3 => read_buffer1(4),
      I4 => start_buffer2r,
      I5 => read_buffer2(4),
      O => \i___2_carry__0_i_19_n_0\
    );
\i___2_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4400000FFFFF440"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(4),
      I2 => read_buffer1(4),
      I3 => \i___2_carry__0_i_11_n_0\,
      I4 => read_buffer0(5),
      I5 => \i___2_carry__0_i_12_n_0\,
      O => \i___2_carry__0_i_2_n_0\
    );
\i___2_carry__0_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004F444F4FFF4FFF"
    )
        port map (
      I0 => start_buffer3r,
      I1 => start_buffer1r,
      I2 => read_buffer3(3),
      I3 => read_buffer1(3),
      I4 => start_buffer2r,
      I5 => read_buffer2(3),
      O => \i___2_carry__0_i_20_n_0\
    );
\i___2_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4400000FFFFF440"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(3),
      I2 => read_buffer1(3),
      I3 => \i___2_carry__0_i_13_n_0\,
      I4 => read_buffer0(4),
      I5 => \i___2_carry__0_i_14_n_0\,
      O => \i___2_carry__0_i_3_n_0\
    );
\i___2_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4400000FFFFF440"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(2),
      I2 => read_buffer1(2),
      I3 => \i___2_carry__0_i_15_n_0\,
      I4 => read_buffer0(3),
      I5 => \i___2_carry_i_13_n_0\,
      O => \i___2_carry__0_i_4_n_0\
    );
\i___2_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__0_i_1_n_0\,
      I1 => \i___2_carry__0_i_16_n_0\,
      I2 => read_buffer0(7),
      I3 => \i___2_carry__0_i_17_n_0\,
      O => \i___2_carry__0_i_5_n_0\
    );
\i___2_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__0_i_2_n_0\,
      I1 => \i___2_carry__0_i_18_n_0\,
      I2 => read_buffer0(6),
      I3 => \i___2_carry__0_i_10_n_0\,
      O => \i___2_carry__0_i_6_n_0\
    );
\i___2_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__0_i_3_n_0\,
      I1 => \i___2_carry__0_i_19_n_0\,
      I2 => read_buffer0(5),
      I3 => \i___2_carry__0_i_12_n_0\,
      O => \i___2_carry__0_i_7_n_0\
    );
\i___2_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__0_i_4_n_0\,
      I1 => \i___2_carry__0_i_20_n_0\,
      I2 => read_buffer0(4),
      I3 => \i___2_carry__0_i_14_n_0\,
      O => \i___2_carry__0_i_8_n_0\
    );
\i___2_carry__0_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(5),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__0_i_9_n_0\
    );
\i___2_carry__1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4400000FFFFF440"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(9),
      I2 => read_buffer1(9),
      I3 => \i___2_carry__1_i_9_n_0\,
      I4 => read_buffer0(10),
      I5 => \i___2_carry__1_i_10_n_0\,
      O => \i___2_carry__1_i_1_n_0\
    );
\i___2_carry__1_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(10),
      I1 => read_buffer2(10),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(10),
      O => \i___2_carry__1_i_10_n_0\
    );
\i___2_carry__1_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(8),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__1_i_11_n_0\
    );
\i___2_carry__1_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(9),
      I1 => read_buffer2(9),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(9),
      O => \i___2_carry__1_i_12_n_0\
    );
\i___2_carry__1_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(7),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__1_i_13_n_0\
    );
\i___2_carry__1_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"993F999966C06666"
    )
        port map (
      I0 => read_buffer3(8),
      I1 => read_buffer2(8),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(8),
      O => \i___2_carry__1_i_14_n_0\
    );
\i___2_carry__1_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(6),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__1_i_15_n_0\
    );
\i___2_carry__1_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004F444F4FFF4FFF"
    )
        port map (
      I0 => start_buffer3r,
      I1 => start_buffer1r,
      I2 => read_buffer3(10),
      I3 => read_buffer1(10),
      I4 => start_buffer2r,
      I5 => read_buffer2(10),
      O => \i___2_carry__1_i_16_n_0\
    );
\i___2_carry__1_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(11),
      I1 => read_buffer2(11),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(11),
      O => \i___2_carry__1_i_17_n_0\
    );
\i___2_carry__1_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004F444F4FFF4FFF"
    )
        port map (
      I0 => start_buffer3r,
      I1 => start_buffer1r,
      I2 => read_buffer3(9),
      I3 => read_buffer1(9),
      I4 => start_buffer2r,
      I5 => read_buffer2(9),
      O => \i___2_carry__1_i_18_n_0\
    );
\i___2_carry__1_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"040C5D5D555DFFFF"
    )
        port map (
      I0 => read_buffer1(8),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => read_buffer2(8),
      I5 => read_buffer3(8),
      O => \i___2_carry__1_i_19_n_0\
    );
\i___2_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88E80000FFFF88E8"
    )
        port map (
      I0 => read_buffer1(8),
      I1 => \i___2_carry__1_i_11_n_0\,
      I2 => read_buffer3(8),
      I3 => \i___2_carry_i_10_n_0\,
      I4 => read_buffer0(9),
      I5 => \i___2_carry__1_i_12_n_0\,
      O => \i___2_carry__1_i_2_n_0\
    );
\i___2_carry__1_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEC0EEEE88008888"
    )
        port map (
      I0 => read_buffer3(7),
      I1 => read_buffer2(7),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(7),
      O => \i___2_carry__1_i_20_n_0\
    );
\i___2_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF440F4400000"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(7),
      I2 => \i___2_carry__1_i_13_n_0\,
      I3 => read_buffer1(7),
      I4 => read_buffer0(8),
      I5 => \i___2_carry__1_i_14_n_0\,
      O => \i___2_carry__1_i_3_n_0\
    );
\i___2_carry__1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4400000FFFFF440"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(6),
      I2 => read_buffer1(6),
      I3 => \i___2_carry__1_i_15_n_0\,
      I4 => read_buffer0(7),
      I5 => \i___2_carry__0_i_17_n_0\,
      O => \i___2_carry__1_i_4_n_0\
    );
\i___2_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__1_i_1_n_0\,
      I1 => \i___2_carry__1_i_16_n_0\,
      I2 => read_buffer0(11),
      I3 => \i___2_carry__1_i_17_n_0\,
      O => \i___2_carry__1_i_5_n_0\
    );
\i___2_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__1_i_2_n_0\,
      I1 => \i___2_carry__1_i_18_n_0\,
      I2 => read_buffer0(10),
      I3 => \i___2_carry__1_i_10_n_0\,
      O => \i___2_carry__1_i_6_n_0\
    );
\i___2_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__1_i_3_n_0\,
      I1 => \i___2_carry__1_i_19_n_0\,
      I2 => read_buffer0(9),
      I3 => \i___2_carry__1_i_12_n_0\,
      O => \i___2_carry__1_i_7_n_0\
    );
\i___2_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__1_i_4_n_0\,
      I1 => \i___2_carry__1_i_20_n_0\,
      I2 => read_buffer0(8),
      I3 => \i___2_carry__1_i_14_n_0\,
      O => \i___2_carry__1_i_8_n_0\
    );
\i___2_carry__1_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(9),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__1_i_9_n_0\
    );
\i___2_carry__2_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4400000FFFFF440"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(12),
      I2 => read_buffer1(12),
      I3 => \i___2_carry__2_i_8_n_0\,
      I4 => read_buffer0(13),
      I5 => \i___2_carry__2_i_9_n_0\,
      O => \i___2_carry__2_i_1_n_0\
    );
\i___2_carry__2_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(11),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__2_i_10_n_0\
    );
\i___2_carry__2_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(12),
      I1 => read_buffer2(12),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(12),
      O => \i___2_carry__2_i_11_n_0\
    );
\i___2_carry__2_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(10),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__2_i_12_n_0\
    );
\i___2_carry__2_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(15),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__2_i_13_n_0\
    );
\i___2_carry__2_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEC0EEEE88008888"
    )
        port map (
      I0 => read_buffer3(13),
      I1 => read_buffer2(13),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(13),
      O => \i___2_carry__2_i_14_n_0\
    );
\i___2_carry__2_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"993F999966C06666"
    )
        port map (
      I0 => read_buffer3(15),
      I1 => read_buffer2(15),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(15),
      O => \i___2_carry__2_i_15_n_0\
    );
\i___2_carry__2_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004F444F4FFF4FFF"
    )
        port map (
      I0 => start_buffer3r,
      I1 => start_buffer1r,
      I2 => read_buffer3(12),
      I3 => read_buffer1(12),
      I4 => start_buffer2r,
      I5 => read_buffer2(12),
      O => \i___2_carry__2_i_16_n_0\
    );
\i___2_carry__2_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004F444F4FFF4FFF"
    )
        port map (
      I0 => start_buffer3r,
      I1 => start_buffer1r,
      I2 => read_buffer3(11),
      I3 => read_buffer1(11),
      I4 => start_buffer2r,
      I5 => read_buffer2(11),
      O => \i___2_carry__2_i_17_n_0\
    );
\i___2_carry__2_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4400000FFFFF440"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(11),
      I2 => read_buffer1(11),
      I3 => \i___2_carry__2_i_10_n_0\,
      I4 => read_buffer0(12),
      I5 => \i___2_carry__2_i_11_n_0\,
      O => \i___2_carry__2_i_2_n_0\
    );
\i___2_carry__2_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4400000FFFFF440"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(10),
      I2 => read_buffer1(10),
      I3 => \i___2_carry__2_i_12_n_0\,
      I4 => read_buffer0(11),
      I5 => \i___2_carry__1_i_17_n_0\,
      O => \i___2_carry__2_i_3_n_0\
    );
\i___2_carry__2_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFF4F4400BBFBFF4"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(15),
      I2 => \i___2_carry__2_i_13_n_0\,
      I3 => read_buffer1(15),
      I4 => read_buffer0(15),
      I5 => \i___2_carry__2_i_14_n_0\,
      O => \i___2_carry__2_i_4_n_0\
    );
\i___2_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__2_i_1_n_0\,
      I1 => \i___2_carry__2_i_14_n_0\,
      I2 => read_buffer0(15),
      I3 => \i___2_carry__2_i_15_n_0\,
      O => \i___2_carry__2_i_5_n_0\
    );
\i___2_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__2_i_2_n_0\,
      I1 => \i___2_carry__2_i_16_n_0\,
      I2 => read_buffer0(13),
      I3 => \i___2_carry__2_i_9_n_0\,
      O => \i___2_carry__2_i_6_n_0\
    );
\i___2_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry__2_i_3_n_0\,
      I1 => \i___2_carry__2_i_17_n_0\,
      I2 => read_buffer0(12),
      I3 => \i___2_carry__2_i_11_n_0\,
      O => \i___2_carry__2_i_7_n_0\
    );
\i___2_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(12),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry__2_i_8_n_0\
    );
\i___2_carry__2_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(13),
      I1 => read_buffer2(13),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(13),
      O => \i___2_carry__2_i_9_n_0\
    );
\i___2_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D444D444DDD4D444"
    )
        port map (
      I0 => \i___2_carry_i_8_n_0\,
      I1 => read_buffer0(2),
      I2 => read_buffer1(1),
      I3 => \i___2_carry_i_9_n_0\,
      I4 => read_buffer3(1),
      I5 => \i___2_carry_i_10_n_0\,
      O => \i___2_carry_i_1_n_0\
    );
\i___2_carry_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => start_buffer1r,
      I1 => start_buffer3r,
      O => \i___2_carry_i_10_n_0\
    );
\i___2_carry_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => start_buffer1r,
      I1 => start_buffer3r,
      I2 => start_buffer2r,
      O => \i___2_carry_i_11_n_0\
    );
\i___2_carry_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"004F444F4FFF4FFF"
    )
        port map (
      I0 => start_buffer3r,
      I1 => start_buffer1r,
      I2 => read_buffer3(2),
      I3 => read_buffer1(2),
      I4 => start_buffer2r,
      I5 => read_buffer2(2),
      O => \i___2_carry_i_12_n_0\
    );
\i___2_carry_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(3),
      I1 => read_buffer2(3),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(3),
      O => \i___2_carry_i_13_n_0\
    );
\i___2_carry_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => read_buffer3(1),
      I1 => start_buffer3r,
      I2 => start_buffer1r,
      O => \i___2_carry_i_14_n_0\
    );
\i___2_carry_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0BBFF440F4400BBF"
    )
        port map (
      I0 => \i___2_carry_i_10_n_0\,
      I1 => read_buffer3(1),
      I2 => \i___2_carry_i_9_n_0\,
      I3 => read_buffer1(1),
      I4 => \i___2_carry_i_8_n_0\,
      I5 => read_buffer0(2),
      O => \i___2_carry_i_2_n_0\
    );
\i___2_carry_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"65659A659A9A659A"
    )
        port map (
      I0 => read_buffer1(1),
      I1 => \i___2_carry_i_11_n_0\,
      I2 => read_buffer2(1),
      I3 => read_buffer3(1),
      I4 => \i___2_carry_i_10_n_0\,
      I5 => read_buffer0(1),
      O => \i___2_carry_i_3_n_0\
    );
\i___2_carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \i___2_carry_i_1_n_0\,
      I1 => \i___2_carry_i_12_n_0\,
      I2 => read_buffer0(3),
      I3 => \i___2_carry_i_13_n_0\,
      O => \i___2_carry_i_4_n_0\
    );
\i___2_carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9666666966696999"
    )
        port map (
      I0 => read_buffer0(2),
      I1 => \i___2_carry_i_8_n_0\,
      I2 => \i___2_carry_i_14_n_0\,
      I3 => \i___2_carry_i_9_n_0\,
      I4 => read_buffer1(1),
      I5 => read_buffer0(1),
      O => \i___2_carry_i_5_n_0\
    );
\i___2_carry_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9A9A559AAAAA9AAA"
    )
        port map (
      I0 => \i___2_carry_i_3_n_0\,
      I1 => \i___2_carry_i_10_n_0\,
      I2 => read_buffer3(0),
      I3 => read_buffer2(0),
      I4 => \i___2_carry_i_11_n_0\,
      I5 => read_buffer1(0),
      O => \i___2_carry_i_6_n_0\
    );
\i___2_carry_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"65659A659A9A659A"
    )
        port map (
      I0 => read_buffer1(0),
      I1 => \i___2_carry_i_11_n_0\,
      I2 => read_buffer2(0),
      I3 => read_buffer3(0),
      I4 => \i___2_carry_i_10_n_0\,
      I5 => read_buffer0(0),
      O => \i___2_carry_i_7_n_0\
    );
\i___2_carry_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"66C06666993F9999"
    )
        port map (
      I0 => read_buffer3(2),
      I1 => read_buffer2(2),
      I2 => start_buffer2r,
      I3 => start_buffer3r,
      I4 => start_buffer1r,
      I5 => read_buffer1(2),
      O => \i___2_carry_i_8_n_0\
    );
\i___2_carry_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AA"
    )
        port map (
      I0 => read_buffer2(1),
      I1 => start_buffer2r,
      I2 => start_buffer3r,
      I3 => start_buffer1r,
      O => \i___2_carry_i_9_n_0\
    );
\memo1_address_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_3,
      CLR => reset_IBUF,
      D => memo1_address_next(0),
      Q => memo1_address(0)
    );
\memo1_address_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_3,
      CLR => reset_IBUF,
      D => memo1_address_next(1),
      Q => memo1_address(1)
    );
\memo1_address_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_3,
      CLR => reset_IBUF,
      D => memo1_address_next(2),
      Q => memo1_address(2)
    );
\memo1_address_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_3,
      CLR => reset_IBUF,
      D => memo1_address_next(3),
      Q => memo1_address(3)
    );
\memo1_address_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_3,
      CLR => reset_IBUF,
      D => memo1_address_next(4),
      Q => memo1_address(4)
    );
\memo1_address_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_3,
      CLR => reset_IBUF,
      D => memo1_address_next(5),
      Q => memo1_address(5)
    );
\memo1_address_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_3,
      CLR => reset_IBUF,
      D => memo1_address_next(6),
      Q => memo1_address(6)
    );
\memo1_address_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_3,
      CLR => reset_IBUF,
      D => memo1_address_next(7),
      Q => memo1_address(7)
    );
\memo1_address_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_3,
      CLR => reset_IBUF,
      D => memo1_address_next(8),
      Q => memo1_address(8)
    );
\memo1_address_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_3,
      CLR => reset_IBUF,
      D => memo1_address_next(9),
      Q => memo1_address(9)
    );
\memo2_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_13,
      D => memo2_address_next(0),
      Q => memo2_address(0),
      R => '0'
    );
\memo2_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_13,
      D => memo2_address_next(1),
      Q => memo2_address(1),
      R => '0'
    );
\memo2_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_13,
      D => memo2_address_next(2),
      Q => memo2_address(2),
      R => '0'
    );
\memo2_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_13,
      D => memo2_address_next(3),
      Q => memo2_address(3),
      R => '0'
    );
\memo2_address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_13,
      D => memo2_address_next(4),
      Q => memo2_address(4),
      R => '0'
    );
\memo2_address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_13,
      D => memo2_address_next(5),
      Q => memo2_address(5),
      R => '0'
    );
\memo2_address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_13,
      D => memo2_address_next(6),
      Q => memo2_address(6),
      R => '0'
    );
\memo2_address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_13,
      D => memo2_address_next(7),
      Q => memo2_address(7),
      R => '0'
    );
\memo2_address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_13,
      D => memo2_address_next(8),
      Q => memo2_address(8),
      R => '0'
    );
\memo2_address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_13,
      D => memo2_address_next(9),
      Q => memo2_address(9),
      R => '0'
    );
\multiplicand_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(0),
      Q => multiplicand(0)
    );
\multiplicand_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(10),
      Q => multiplicand(10)
    );
\multiplicand_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(11),
      Q => multiplicand(11)
    );
\multiplicand_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(12),
      Q => multiplicand(12)
    );
\multiplicand_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(13),
      Q => multiplicand(13)
    );
\multiplicand_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(14),
      Q => multiplicand(14)
    );
\multiplicand_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(15),
      Q => multiplicand(15)
    );
\multiplicand_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(1),
      Q => multiplicand(1)
    );
\multiplicand_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(2),
      Q => multiplicand(2)
    );
\multiplicand_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(3),
      Q => multiplicand(3)
    );
\multiplicand_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(4),
      Q => multiplicand(4)
    );
\multiplicand_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(5),
      Q => multiplicand(5)
    );
\multiplicand_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(6),
      Q => multiplicand(6)
    );
\multiplicand_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(7),
      Q => multiplicand(7)
    );
\multiplicand_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(8),
      Q => multiplicand(8)
    );
\multiplicand_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_16,
      CLR => reset_IBUF,
      D => multiplicand_next0_in(9),
      Q => multiplicand(9)
    );
\output_sample[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(0),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry_n_7\,
      O => output_sample_next(0)
    );
\output_sample[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(10),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__1_n_5\,
      O => output_sample_next(10)
    );
\output_sample[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(11),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__1_n_4\,
      O => output_sample_next(11)
    );
\output_sample[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(12),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__2_n_7\,
      O => output_sample_next(12)
    );
\output_sample[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(13),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__2_n_6\,
      O => output_sample_next(13)
    );
\output_sample[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(15),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__2_n_5\,
      O => output_sample_next(14)
    );
\output_sample[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(15),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__2_n_4\,
      O => output_sample_next(15)
    );
\output_sample[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(1),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry_n_6\,
      O => output_sample_next(1)
    );
\output_sample[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(2),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry_n_5\,
      O => output_sample_next(2)
    );
\output_sample[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(3),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry_n_4\,
      O => output_sample_next(3)
    );
\output_sample[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(4),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__0_n_7\,
      O => output_sample_next(4)
    );
\output_sample[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(5),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__0_n_6\,
      O => output_sample_next(5)
    );
\output_sample[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(6),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__0_n_5\,
      O => output_sample_next(6)
    );
\output_sample[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(7),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__0_n_4\,
      O => output_sample_next(7)
    );
\output_sample[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(8),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__1_n_7\,
      O => output_sample_next(8)
    );
\output_sample[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => read_buffer0(9),
      I1 => start_buffer1r,
      I2 => start_buffer3r,
      I3 => start_buffer2r,
      I4 => \output_sample_next0_inferred__0/i___2_carry__1_n_6\,
      O => output_sample_next(9)
    );
\output_sample_next0_inferred__0/i___2_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \output_sample_next0_inferred__0/i___2_carry_n_0\,
      CO(2 downto 0) => \NLW_output_sample_next0_inferred__0/i___2_carry_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \i___2_carry_i_1_n_0\,
      DI(2) => \i___2_carry_i_2_n_0\,
      DI(1) => \i___2_carry_i_3_n_0\,
      DI(0) => read_buffer0(0),
      O(3) => \output_sample_next0_inferred__0/i___2_carry_n_4\,
      O(2) => \output_sample_next0_inferred__0/i___2_carry_n_5\,
      O(1) => \output_sample_next0_inferred__0/i___2_carry_n_6\,
      O(0) => \output_sample_next0_inferred__0/i___2_carry_n_7\,
      S(3) => \i___2_carry_i_4_n_0\,
      S(2) => \i___2_carry_i_5_n_0\,
      S(1) => \i___2_carry_i_6_n_0\,
      S(0) => \i___2_carry_i_7_n_0\
    );
\output_sample_next0_inferred__0/i___2_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \output_sample_next0_inferred__0/i___2_carry_n_0\,
      CO(3) => \output_sample_next0_inferred__0/i___2_carry__0_n_0\,
      CO(2 downto 0) => \NLW_output_sample_next0_inferred__0/i___2_carry__0_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \i___2_carry__0_i_1_n_0\,
      DI(2) => \i___2_carry__0_i_2_n_0\,
      DI(1) => \i___2_carry__0_i_3_n_0\,
      DI(0) => \i___2_carry__0_i_4_n_0\,
      O(3) => \output_sample_next0_inferred__0/i___2_carry__0_n_4\,
      O(2) => \output_sample_next0_inferred__0/i___2_carry__0_n_5\,
      O(1) => \output_sample_next0_inferred__0/i___2_carry__0_n_6\,
      O(0) => \output_sample_next0_inferred__0/i___2_carry__0_n_7\,
      S(3) => \i___2_carry__0_i_5_n_0\,
      S(2) => \i___2_carry__0_i_6_n_0\,
      S(1) => \i___2_carry__0_i_7_n_0\,
      S(0) => \i___2_carry__0_i_8_n_0\
    );
\output_sample_next0_inferred__0/i___2_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \output_sample_next0_inferred__0/i___2_carry__0_n_0\,
      CO(3) => \output_sample_next0_inferred__0/i___2_carry__1_n_0\,
      CO(2 downto 0) => \NLW_output_sample_next0_inferred__0/i___2_carry__1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => \i___2_carry__1_i_1_n_0\,
      DI(2) => \i___2_carry__1_i_2_n_0\,
      DI(1) => \i___2_carry__1_i_3_n_0\,
      DI(0) => \i___2_carry__1_i_4_n_0\,
      O(3) => \output_sample_next0_inferred__0/i___2_carry__1_n_4\,
      O(2) => \output_sample_next0_inferred__0/i___2_carry__1_n_5\,
      O(1) => \output_sample_next0_inferred__0/i___2_carry__1_n_6\,
      O(0) => \output_sample_next0_inferred__0/i___2_carry__1_n_7\,
      S(3) => \i___2_carry__1_i_5_n_0\,
      S(2) => \i___2_carry__1_i_6_n_0\,
      S(1) => \i___2_carry__1_i_7_n_0\,
      S(0) => \i___2_carry__1_i_8_n_0\
    );
\output_sample_next0_inferred__0/i___2_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \output_sample_next0_inferred__0/i___2_carry__1_n_0\,
      CO(3 downto 0) => \NLW_output_sample_next0_inferred__0/i___2_carry__2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \i___2_carry__2_i_1_n_0\,
      DI(1) => \i___2_carry__2_i_2_n_0\,
      DI(0) => \i___2_carry__2_i_3_n_0\,
      O(3) => \output_sample_next0_inferred__0/i___2_carry__2_n_4\,
      O(2) => \output_sample_next0_inferred__0/i___2_carry__2_n_5\,
      O(1) => \output_sample_next0_inferred__0/i___2_carry__2_n_6\,
      O(0) => \output_sample_next0_inferred__0/i___2_carry__2_n_7\,
      S(3) => \i___2_carry__2_i_4_n_0\,
      S(2) => \i___2_carry__2_i_5_n_0\,
      S(1) => \i___2_carry__2_i_6_n_0\,
      S(0) => \i___2_carry__2_i_7_n_0\
    );
\output_sample_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(0),
      Q => output_sample(0)
    );
\output_sample_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(10),
      Q => output_sample(10)
    );
\output_sample_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(11),
      Q => output_sample(11)
    );
\output_sample_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(12),
      Q => output_sample(12)
    );
\output_sample_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(13),
      Q => output_sample(13)
    );
\output_sample_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(14),
      Q => output_sample(14)
    );
\output_sample_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(15),
      Q => output_sample(15)
    );
\output_sample_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(1),
      Q => output_sample(1)
    );
\output_sample_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(2),
      Q => output_sample(2)
    );
\output_sample_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(3),
      Q => output_sample(3)
    );
\output_sample_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(4),
      Q => output_sample(4)
    );
\output_sample_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(5),
      Q => output_sample(5)
    );
\output_sample_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(6),
      Q => output_sample(6)
    );
\output_sample_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(7),
      Q => output_sample(7)
    );
\output_sample_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(8),
      Q => output_sample(8)
    );
\output_sample_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_12,
      CLR => reset_IBUF,
      D => output_sample_next(9),
      Q => output_sample(9)
    );
read_buffer0_next4_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => read_buffer0_next4_carry_n_0,
      CO(2 downto 0) => NLW_read_buffer0_next4_carry_CO_UNCONNECTED(2 downto 0),
      CYINIT => '1',
      DI(3) => WIN1_n_82,
      DI(2) => WIN1_n_83,
      DI(1) => WIN1_n_84,
      DI(0) => WIN1_n_85,
      O(3 downto 0) => NLW_read_buffer0_next4_carry_O_UNCONNECTED(3 downto 0),
      S(3) => WIN1_n_50,
      S(2) => WIN1_n_51,
      S(1) => WIN1_n_52,
      S(0) => WIN1_n_53
    );
\read_buffer0_next4_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => read_buffer0_next4_carry_n_0,
      CO(3) => read_buffer0_next4,
      CO(2 downto 0) => \NLW_read_buffer0_next4_carry__0_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3) => WIN1_n_26,
      DI(2) => WIN1_n_27,
      DI(1) => WIN1_n_28,
      DI(0) => WIN1_n_29,
      O(3 downto 0) => \NLW_read_buffer0_next4_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => WIN1_n_46,
      S(2) => WIN1_n_47,
      S(1) => WIN1_n_48,
      S(0) => WIN1_n_49
    );
\read_buffer0_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(0),
      Q => read_buffer0(0)
    );
\read_buffer0_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(10),
      Q => read_buffer0(10)
    );
\read_buffer0_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(11),
      Q => read_buffer0(11)
    );
\read_buffer0_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(12),
      Q => read_buffer0(12)
    );
\read_buffer0_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(13),
      Q => read_buffer0(13)
    );
\read_buffer0_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(15),
      Q => read_buffer0(15)
    );
\read_buffer0_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(1),
      Q => read_buffer0(1)
    );
\read_buffer0_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(2),
      Q => read_buffer0(2)
    );
\read_buffer0_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(3),
      Q => read_buffer0(3)
    );
\read_buffer0_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(4),
      Q => read_buffer0(4)
    );
\read_buffer0_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(5),
      Q => read_buffer0(5)
    );
\read_buffer0_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(6),
      Q => read_buffer0(6)
    );
\read_buffer0_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(7),
      Q => read_buffer0(7)
    );
\read_buffer0_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(8),
      Q => read_buffer0(8)
    );
\read_buffer0_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_10,
      CLR => reset_IBUF,
      D => read_buffer3_next(9),
      Q => read_buffer0(9)
    );
\read_buffer1[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => result(2),
      I1 => read_buffer0_next3(2),
      I2 => read_buffer0_next4,
      O => read_buffer3_next(0)
    );
\read_buffer1[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(10),
      I1 => result(12),
      I2 => read_buffer0_next3(12),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(10)
    );
\read_buffer1[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(11),
      I1 => result(13),
      I2 => read_buffer0_next3(13),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(11)
    );
\read_buffer1[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(12),
      I1 => result(14),
      I2 => read_buffer0_next3(14),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(12)
    );
\read_buffer1[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(14),
      I2 => result(14),
      O => \read_buffer1[12]_i_3_n_0\
    );
\read_buffer1[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(13),
      I2 => result(13),
      O => \read_buffer1[12]_i_4_n_0\
    );
\read_buffer1[12]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(12),
      I2 => result(12),
      O => \read_buffer1[12]_i_5_n_0\
    );
\read_buffer1[12]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(11),
      I2 => result(11),
      O => \read_buffer1[12]_i_6_n_0\
    );
\read_buffer1[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => read_buffer0_next1(13),
      I1 => result(15),
      I2 => read_buffer0_next3(15),
      I3 => read_buffer0_next4,
      O => read_buffer3_next(13)
    );
\read_buffer1[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => result(15),
      I1 => WIN1_n_81,
      O => read_buffer3_next(15)
    );
\read_buffer1[15]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(15),
      I2 => result(15),
      O => \read_buffer1[15]_i_5_n_0\
    );
\read_buffer1[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(1),
      I1 => result(3),
      I2 => read_buffer0_next3(3),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(1)
    );
\read_buffer1[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(2),
      I1 => result(4),
      I2 => read_buffer0_next3(4),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(2)
    );
\read_buffer1[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(3),
      I1 => result(5),
      I2 => read_buffer0_next3(5),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(3)
    );
\read_buffer1[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(4),
      I1 => result(6),
      I2 => read_buffer0_next3(6),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(4)
    );
\read_buffer1[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(2),
      I2 => result(2),
      O => \read_buffer1[4]_i_3_n_0\
    );
\read_buffer1[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(6),
      I2 => result(6),
      O => \read_buffer1[4]_i_4_n_0\
    );
\read_buffer1[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(5),
      I2 => result(5),
      O => \read_buffer1[4]_i_5_n_0\
    );
\read_buffer1[4]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(4),
      I2 => result(4),
      O => \read_buffer1[4]_i_6_n_0\
    );
\read_buffer1[4]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(3),
      I2 => result(3),
      O => \read_buffer1[4]_i_7_n_0\
    );
\read_buffer1[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(5),
      I1 => result(7),
      I2 => read_buffer0_next3(7),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(5)
    );
\read_buffer1[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(6),
      I1 => result(8),
      I2 => read_buffer0_next3(8),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(6)
    );
\read_buffer1[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(7),
      I1 => result(9),
      I2 => read_buffer0_next3(9),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(7)
    );
\read_buffer1[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(8),
      I1 => result(10),
      I2 => read_buffer0_next3(10),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(8)
    );
\read_buffer1[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(10),
      I2 => result(10),
      O => \read_buffer1[8]_i_3_n_0\
    );
\read_buffer1[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(9),
      I2 => result(9),
      O => \read_buffer1[8]_i_4_n_0\
    );
\read_buffer1[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(8),
      I2 => result(8),
      O => \read_buffer1[8]_i_5_n_0\
    );
\read_buffer1[8]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1B"
    )
        port map (
      I0 => read_buffer0_next4,
      I1 => read_buffer0_next3(7),
      I2 => result(7),
      O => \read_buffer1[8]_i_6_n_0\
    );
\read_buffer1[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAACCF0"
    )
        port map (
      I0 => read_buffer0_next1(9),
      I1 => result(11),
      I2 => read_buffer0_next3(11),
      I3 => read_buffer0_next4,
      I4 => result(15),
      O => read_buffer3_next(9)
    );
\read_buffer1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(0),
      Q => read_buffer1(0)
    );
\read_buffer1_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(10),
      Q => read_buffer1(10)
    );
\read_buffer1_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(11),
      Q => read_buffer1(11)
    );
\read_buffer1_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(12),
      Q => read_buffer1(12)
    );
\read_buffer1_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(13),
      Q => read_buffer1(13)
    );
\read_buffer1_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(15),
      Q => read_buffer1(15)
    );
\read_buffer1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(1),
      Q => read_buffer1(1)
    );
\read_buffer1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(2),
      Q => read_buffer1(2)
    );
\read_buffer1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(3),
      Q => read_buffer1(3)
    );
\read_buffer1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(4),
      Q => read_buffer1(4)
    );
\read_buffer1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(5),
      Q => read_buffer1(5)
    );
\read_buffer1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(6),
      Q => read_buffer1(6)
    );
\read_buffer1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(7),
      Q => read_buffer1(7)
    );
\read_buffer1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(8),
      Q => read_buffer1(8)
    );
\read_buffer1_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_11,
      CLR => reset_IBUF,
      D => read_buffer3_next(9),
      Q => read_buffer1(9)
    );
\read_buffer2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(0),
      Q => read_buffer2(0)
    );
\read_buffer2_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(10),
      Q => read_buffer2(10)
    );
\read_buffer2_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(11),
      Q => read_buffer2(11)
    );
\read_buffer2_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(12),
      Q => read_buffer2(12)
    );
\read_buffer2_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(13),
      Q => read_buffer2(13)
    );
\read_buffer2_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(15),
      Q => read_buffer2(15)
    );
\read_buffer2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(1),
      Q => read_buffer2(1)
    );
\read_buffer2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(2),
      Q => read_buffer2(2)
    );
\read_buffer2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(3),
      Q => read_buffer2(3)
    );
\read_buffer2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(4),
      Q => read_buffer2(4)
    );
\read_buffer2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(5),
      Q => read_buffer2(5)
    );
\read_buffer2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(6),
      Q => read_buffer2(6)
    );
\read_buffer2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(7),
      Q => read_buffer2(7)
    );
\read_buffer2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(8),
      Q => read_buffer2(8)
    );
\read_buffer2_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_9,
      CLR => reset_IBUF,
      D => read_buffer3_next(9),
      Q => read_buffer2(9)
    );
\read_buffer3_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(0),
      Q => read_buffer3(0)
    );
\read_buffer3_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(10),
      Q => read_buffer3(10)
    );
\read_buffer3_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(11),
      Q => read_buffer3(11)
    );
\read_buffer3_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(12),
      Q => read_buffer3(12)
    );
\read_buffer3_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(13),
      Q => read_buffer3(13)
    );
\read_buffer3_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(15),
      Q => read_buffer3(15)
    );
\read_buffer3_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(1),
      Q => read_buffer3(1)
    );
\read_buffer3_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(2),
      Q => read_buffer3(2)
    );
\read_buffer3_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(3),
      Q => read_buffer3(3)
    );
\read_buffer3_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(4),
      Q => read_buffer3(4)
    );
\read_buffer3_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(5),
      Q => read_buffer3(5)
    );
\read_buffer3_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(6),
      Q => read_buffer3(6)
    );
\read_buffer3_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(7),
      Q => read_buffer3(7)
    );
\read_buffer3_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(8),
      Q => read_buffer3(8)
    );
\read_buffer3_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => SAMP_n_6,
      CLR => reset_IBUF,
      D => read_buffer3_next(9),
      Q => read_buffer3(9)
    );
read_sample_memo_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => WIN1_n_23,
      Q => read_sample
    );
reading_ready_n_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => reading_ready_nn,
      Q => reading_ready_n
    );
reading_ready_nn_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => reading_ready_nn_next,
      Q => reading_ready_nn
    );
reading_ready_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => reading_ready_n,
      Q => reading_ready
    );
start_buffer1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0001"
    )
        port map (
      I0 => start_buffer3_i_2_n_0,
      I1 => \counter_buf0_reg__0\(8),
      I2 => \counter_buf0_reg__0\(5),
      I3 => \counter_buf0_reg__0\(4),
      I4 => start_buffer1,
      O => start_buffer1_i_1_n_0
    );
start_buffer1_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => start_buffer1_i_1_n_0,
      Q => start_buffer1
    );
start_buffer1r_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => SAMP_n_19,
      Q => start_buffer1r
    );
start_buffer2r_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \counter_buf0r_reg__0\(6),
      I1 => \counter_buf0r[8]_i_2_n_0\,
      I2 => \counter_buf0r_reg__0\(5),
      O => start_buffer2r_i_2_n_0
    );
start_buffer2r_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => SAMP_n_18,
      Q => start_buffer2r
    );
start_buffer3_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAABA"
    )
        port map (
      I0 => start_buffer3,
      I1 => start_buffer3_i_2_n_0,
      I2 => \counter_buf0_reg__0\(8),
      I3 => \counter_buf0_reg__0\(5),
      I4 => \counter_buf0_reg__0\(4),
      O => start_buffer3_next
    );
start_buffer3_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFD"
    )
        port map (
      I0 => \counter_buf0_reg__0\(7),
      I1 => \counter_buf0_reg__0\(6),
      I2 => \counter_buf0_reg__0\(3),
      I3 => \counter_buf0_reg__0\(2),
      I4 => \counter_buf0_reg__0\(0),
      I5 => \counter_buf0_reg__0\(1),
      O => start_buffer3_i_2_n_0
    );
start_buffer3_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => start_buffer3_next,
      Q => start_buffer3
    );
start_buffer3r_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => SAMP_n_20,
      Q => start_buffer3r
    );
start_proc_win_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => FSM_n_16,
      Q => start_proc_win
    );
start_reading_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF01000000"
    )
        port map (
      I0 => \counter_buf0_reg__0\(7),
      I1 => \counter_buf0_reg__0\(4),
      I2 => \counter_buf0_reg__0\(5),
      I3 => \counter_buf0_reg__0\(8),
      I4 => start_reading_i_2_n_0,
      I5 => start_buffer2,
      O => start_reading_i_1_n_0
    );
start_reading_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counter_buf0_reg__0\(1),
      I1 => \counter_buf0_reg__0\(0),
      I2 => \counter_buf0_reg__0\(2),
      I3 => \counter_buf0_reg__0\(3),
      I4 => \counter_buf0_reg__0\(6),
      O => start_reading_i_2_n_0
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
      Q => start_buffer2
    );
\win_stage_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => SAMP_n_22,
      Q => stage(0)
    );
\win_stage_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => SAMP_n_23,
      Q => stage(1)
    );
write_sample_memo_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => '1',
      CLR => reset_IBUF,
      D => write_sample_memo_next,
      Q => write_sample
    );
\writing_sample_memo1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(0),
      Q => writing_sample_memo1(0)
    );
\writing_sample_memo1_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(10),
      Q => writing_sample_memo1(10)
    );
\writing_sample_memo1_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(11),
      Q => writing_sample_memo1(11)
    );
\writing_sample_memo1_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(12),
      Q => writing_sample_memo1(12)
    );
\writing_sample_memo1_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(13),
      Q => writing_sample_memo1(13)
    );
\writing_sample_memo1_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(14),
      Q => writing_sample_memo1(14)
    );
\writing_sample_memo1_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(15),
      Q => writing_sample_memo1(15)
    );
\writing_sample_memo1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(1),
      Q => writing_sample_memo1(1)
    );
\writing_sample_memo1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(2),
      Q => writing_sample_memo1(2)
    );
\writing_sample_memo1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(3),
      Q => writing_sample_memo1(3)
    );
\writing_sample_memo1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(4),
      Q => writing_sample_memo1(4)
    );
\writing_sample_memo1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(5),
      Q => writing_sample_memo1(5)
    );
\writing_sample_memo1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(6),
      Q => writing_sample_memo1(6)
    );
\writing_sample_memo1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(7),
      Q => writing_sample_memo1(7)
    );
\writing_sample_memo1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(8),
      Q => writing_sample_memo1(8)
    );
\writing_sample_memo1_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_4,
      CLR => reset_IBUF,
      D => result(9),
      Q => writing_sample_memo1(9)
    );
\writing_sample_memo2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(0),
      Q => writing_sample_memo2(0)
    );
\writing_sample_memo2_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(10),
      Q => writing_sample_memo2(10)
    );
\writing_sample_memo2_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(11),
      Q => writing_sample_memo2(11)
    );
\writing_sample_memo2_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(12),
      Q => writing_sample_memo2(12)
    );
\writing_sample_memo2_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(13),
      Q => writing_sample_memo2(13)
    );
\writing_sample_memo2_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(14),
      Q => writing_sample_memo2(14)
    );
\writing_sample_memo2_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(15),
      Q => writing_sample_memo2(15)
    );
\writing_sample_memo2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(1),
      Q => writing_sample_memo2(1)
    );
\writing_sample_memo2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(2),
      Q => writing_sample_memo2(2)
    );
\writing_sample_memo2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(3),
      Q => writing_sample_memo2(3)
    );
\writing_sample_memo2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(4),
      Q => writing_sample_memo2(4)
    );
\writing_sample_memo2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(5),
      Q => writing_sample_memo2(5)
    );
\writing_sample_memo2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(6),
      Q => writing_sample_memo2(6)
    );
\writing_sample_memo2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(7),
      Q => writing_sample_memo2(7)
    );
\writing_sample_memo2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(8),
      Q => writing_sample_memo2(8)
    );
\writing_sample_memo2_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_100MHz,
      CE => FSM_n_6,
      CLR => reset_IBUF,
      D => result(9),
      Q => writing_sample_memo2(9)
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
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of fsm_global : entity is "9241e650";
  attribute POWER_OPT_BRAM_CDC : integer;
  attribute POWER_OPT_BRAM_CDC of fsm_global : entity is 0;
  attribute POWER_OPT_BRAM_SR_ADDR : integer;
  attribute POWER_OPT_BRAM_SR_ADDR of fsm_global : entity is 1;
  attribute POWER_OPT_LOOPED_NET_PERCENTAGE : integer;
  attribute POWER_OPT_LOOPED_NET_PERCENTAGE of fsm_global : entity is 0;
end fsm_global;

architecture STRUCTURE of fsm_global is
  signal DATA_IN_IBUF : STD_LOGIC;
  signal DATA_OUT_OBUF : STD_LOGIC;
  signal MCLK_DAC_OBUF : STD_LOGIC;
  signal an_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal clk_100MHz : STD_LOGIC;
  signal clk_50MHz : STD_LOGIC;
  signal lopt : STD_LOGIC;
  signal lopt_1 : STD_LOGIC;
  signal lopt_2 : STD_LOGIC;
  signal lopt_3 : STD_LOGIC;
  signal play_enable_IBUF : STD_LOGIC;
  signal reset_IBUF : STD_LOGIC;
  signal seg_OBUF : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state[0]_i_1_n_0\ : STD_LOGIC;
  signal \state[1]_i_1_n_0\ : STD_LOGIC;
  signal NLW_CONT_LR_W_SEL_DAC_OBUF_UNCONNECTED : STD_LOGIC;
  signal NLW_CONT_SCLK_DAC_OBUF_UNCONNECTED : STD_LOGIC;
  attribute syn_black_box : string;
  attribute syn_black_box of clk_gen : label is "TRUE";
  attribute CLOCK_BUFFER_TYPE : string;
  attribute CLOCK_BUFFER_TYPE of clk_fpga : signal is "none";
begin
CONT: entity work.master_controller
     port map (
      CLK => clk_50MHz,
      D(0) => DATA_IN_IBUF,
      DATA_OUT_OBUF => DATA_OUT_OBUF,
      LR_W_SEL_DAC_OBUF => NLW_CONT_LR_W_SEL_DAC_OBUF_UNCONNECTED,
      MCLK_DAC_OBUF => MCLK_DAC_OBUF,
      SCLK_DAC_OBUF => NLW_CONT_SCLK_DAC_OBUF_UNCONNECTED,
      clk_100MHz => clk_100MHz,
      lopt => lopt,
      lopt_1 => lopt_1,
      lopt_2 => lopt_2,
      lopt_3 => lopt_3,
      reset_IBUF => reset_IBUF,
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
      I => lopt,
      O => LR_W_SEL_ADC
    );
LR_W_SEL_DAC_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => lopt_1,
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
      I => lopt_2,
      O => SCLK_ADC
    );
SCLK_DAC_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => lopt_3,
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
reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset,
      O => reset_IBUF
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
