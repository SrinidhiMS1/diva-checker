-- megafunction wizard: %ALTIOBUF%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altiobuf_bidir 

-- ============================================================
-- File Name: bidir_dq_iobuf_inst.vhd
-- Megafunction Name(s):
-- 			altiobuf_bidir
--
-- Simulation Library Files(s):
-- 			stratixiii
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 7.2 Build 207 03/18/2008 SP 3 SJ Full Version
-- ************************************************************


--Copyright (C) 1991-2007 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


--altiobuf_bidir CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix III" ENABLE_BUS_HOLD="FALSE" NUMBER_OF_CHANNELS=8 OPEN_DRAIN_OUTPUT="FALSE" USE_DIFFERENTIAL_MODE="FALSE" USE_DYNAMIC_TERMINATION_CONTROL="TRUE" USE_TERMINATION_CONTROL="FALSE" datain dataio dataout dynamicterminationcontrol oe
--VERSION_BEGIN 7.2SP3 cbx_altiobuf_in 2007:08:30:02:46:00:SJ cbx_mgl 2007:08:03:23:48:12:SJ cbx_stratixiii 2007:06:29:01:16:20:SJ  VERSION_END

 LIBRARY stratixiii;
 USE stratixiii.all;

--synthesis_resources = stratixiii_io_ibuf 8 stratixiii_io_obuf 8 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  bidir_dq_iobuf_inst_iobuf_bidir_8jr IS 
	 PORT 
	 ( 
		 datain	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 dataio	:	INOUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 dataout	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 dynamicterminationcontrol	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
		 oe	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0)
	 ); 
 END bidir_dq_iobuf_inst_iobuf_bidir_8jr;

 ARCHITECTURE RTL OF bidir_dq_iobuf_inst_iobuf_bidir_8jr IS

	 ATTRIBUTE synthesis_clearbox : boolean;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS true;
	 SIGNAL  wire_ibufa_i	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_ibufa_o	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_obufa_dynamicterminationcontrol	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_obufa_i	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_obufa_o	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_obufa_oe	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 COMPONENT  stratixiii_io_ibuf
	 GENERIC 
	 (
		bus_hold	:	STRING := "false";
		differential_mode	:	STRING := "false";
		lpm_type	:	STRING := "stratixiii_io_ibuf"
	 );
	 PORT
	 ( 
		i	:	IN STD_LOGIC := '0';
		ibar	:	IN STD_LOGIC := '0';
		o	:	OUT STD_LOGIC
	 ); 
	 END COMPONENT;
	 COMPONENT  stratixiii_io_obuf
	 GENERIC 
	 (
		bus_hold	:	STRING := "false";
		open_drain_output	:	STRING := "false";
		shift_series_termination_control	:	STRING := "false";
		lpm_type	:	STRING := "stratixiii_io_obuf"
	 );
	 PORT
	 ( 
		dynamicterminationcontrol	:	IN STD_LOGIC := '0';
		i	:	IN STD_LOGIC := '0';
		o	:	OUT STD_LOGIC;
		obar	:	OUT STD_LOGIC;
		oe	:	IN STD_LOGIC := '1';
		parallelterminationcontrol	:	IN STD_LOGIC_VECTOR(13 DOWNTO 0) := (OTHERS => '0');
		seriesterminationcontrol	:	IN STD_LOGIC_VECTOR(13 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
 BEGIN

	dataio <= wire_obufa_o;
	dataout <= wire_ibufa_o;
	wire_ibufa_i <= dataio;
	loop0 : FOR i IN 0 TO 7 GENERATE 
	  ibufa :  stratixiii_io_ibuf
	  GENERIC MAP (
		bus_hold => "false",
		differential_mode => "false"
	  )
	  PORT MAP ( 
		i => wire_ibufa_i(i),
		o => wire_ibufa_o(i)
	  );
	END GENERATE loop0;
	wire_obufa_dynamicterminationcontrol <= dynamicterminationcontrol;
	wire_obufa_i <= datain;
	wire_obufa_oe <= oe;
	loop1 : FOR i IN 0 TO 7 GENERATE 
	  obufa :  stratixiii_io_obuf
	  GENERIC MAP (
		bus_hold => "false",
		open_drain_output => "false"
	  )
	  PORT MAP ( 
		dynamicterminationcontrol => wire_obufa_dynamicterminationcontrol(i),
		i => wire_obufa_i(i),
		o => wire_obufa_o(i),
		oe => wire_obufa_oe(i)
	  );
	END GENERATE loop1;

 END RTL; --bidir_dq_iobuf_inst_iobuf_bidir_8jr
--VALID FILE


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bidir_dq_iobuf_inst IS
	PORT
	(
		datain		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		dyn_term_ctrl		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		oe		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		dataio		: INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		dataout		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END bidir_dq_iobuf_inst;


ARCHITECTURE RTL OF bidir_dq_iobuf_inst IS

	ATTRIBUTE synthesis_clearbox: boolean;
	ATTRIBUTE synthesis_clearbox OF RTL: ARCHITECTURE IS TRUE;
	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (7 DOWNTO 0);



	COMPONENT bidir_dq_iobuf_inst_iobuf_bidir_8jr
	PORT (
			dataout	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			datain	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			dataio	: INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			oe	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			dynamicterminationcontrol	: IN STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	dataout    <= sub_wire0(7 DOWNTO 0);

	bidir_dq_iobuf_inst_iobuf_bidir_8jr_component : bidir_dq_iobuf_inst_iobuf_bidir_8jr
	PORT MAP (
		datain => datain,
		oe => oe,
		dynamicterminationcontrol => dyn_term_ctrl,
		dataout => sub_wire0,
		dataio => dataio
	);



END RTL;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix III"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix III"
-- Retrieval info: CONSTANT: enable_bus_hold STRING "FALSE"
-- Retrieval info: CONSTANT: number_of_channels NUMERIC "8"
-- Retrieval info: CONSTANT: open_drain_output STRING "FALSE"
-- Retrieval info: CONSTANT: use_differential_mode STRING "FALSE"
-- Retrieval info: CONSTANT: use_dynamic_termination_control STRING "TRUE"
-- Retrieval info: CONSTANT: use_termination_control STRING "FALSE"
-- Retrieval info: USED_PORT: datain 0 0 8 0 INPUT NODEFVAL "datain[7..0]"
-- Retrieval info: USED_PORT: dataio 0 0 8 0 BIDIR NODEFVAL "dataio[7..0]"
-- Retrieval info: USED_PORT: dataout 0 0 8 0 OUTPUT NODEFVAL "dataout[7..0]"
-- Retrieval info: USED_PORT: dyn_term_ctrl 0 0 8 0 INPUT NODEFVAL "dyn_term_ctrl[7..0]"
-- Retrieval info: USED_PORT: oe 0 0 8 0 INPUT NODEFVAL "oe[7..0]"
-- Retrieval info: CONNECT: @datain 0 0 8 0 datain 0 0 8 0
-- Retrieval info: CONNECT: @dynamicterminationcontrol 0 0 8 0 dyn_term_ctrl 0 0 8 0
-- Retrieval info: CONNECT: @oe 0 0 8 0 oe 0 0 8 0
-- Retrieval info: CONNECT: dataout 0 0 8 0 @dataout 0 0 8 0
-- Retrieval info: CONNECT: dataio 0 0 8 0 @dataio 0 0 8 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL bidir_dq_iobuf_inst.vhd TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL bidir_dq_iobuf_inst.inc FALSE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL bidir_dq_iobuf_inst.cmp FALSE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL bidir_dq_iobuf_inst.bsf FALSE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL bidir_dq_iobuf_inst_inst.vhd FALSE FALSE
-- Retrieval info: LIB_FILE: stratixiii
