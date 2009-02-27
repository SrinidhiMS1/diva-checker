-- megafunction wizard: %ALTIOBUF%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altiobuf_bidir 

-- ============================================================
-- File Name: bidir_dqs_iobuf_inst.vhd
-- Megafunction Name(s):
-- 			altiobuf_bidir
--
-- Simulation Library Files(s):
-- 			stratixiii
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 8.0 Build 231 07/10/2008 SP 1 SJ Full Version
-- ************************************************************


--Copyright (C) 1991-2008 Altera Corporation
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


--altiobuf_bidir CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Stratix III" ENABLE_BUS_HOLD="FALSE" NUMBER_OF_CHANNELS=1 OPEN_DRAIN_OUTPUT="FALSE" USE_DIFFERENTIAL_MODE="TRUE" USE_DYNAMIC_TERMINATION_CONTROL="TRUE" USE_TERMINATION_CONTROL="FALSE" datain dataio dataio_b dataout dynamicterminationcontrol dynamicterminationcontrol_b oe oe_b
--VERSION_BEGIN 8.0SP1 cbx_altiobuf_in 2008:06:02:292401 cbx_mgl 2008:06:02:292401 cbx_stratixiii 2008:06:18:296807  VERSION_END

 LIBRARY stratixiii;
 USE stratixiii.all;

--synthesis_resources = stratixiii_io_ibuf 1 stratixiii_io_obuf 2 stratixiii_pseudo_diff_out 1 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  bidir_dqs_iobuf_inst_iobuf_bidir_fkv IS 
	 PORT 
	 ( 
		 datain	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 dataio	:	INOUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 dataio_b	:	INOUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 dataout	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 dynamicterminationcontrol	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0) := (OTHERS => '0');
		 dynamicterminationcontrol_b	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0) := (OTHERS => '0');
		 oe	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 oe_b	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0) := (OTHERS => '1')
	 ); 
 END bidir_dqs_iobuf_inst_iobuf_bidir_fkv;

 ARCHITECTURE RTL OF bidir_dqs_iobuf_inst_iobuf_bidir_fkv IS

	 ATTRIBUTE synthesis_clearbox : boolean;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS true;
	 SIGNAL  wire_ibufa_o	:	STD_LOGIC;
	 SIGNAL  wire_obuf_ba_o	:	STD_LOGIC;
	 SIGNAL  wire_obufa_o	:	STD_LOGIC;
	 SIGNAL  wire_pseudo_diffa_o	:	STD_LOGIC;
	 SIGNAL  wire_pseudo_diffa_obar	:	STD_LOGIC;
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
		--sim_dynamic_termination_control_is_connected	:	STRING := "false";
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
	 COMPONENT  stratixiii_pseudo_diff_out
	 PORT
	 ( 
		i	:	IN STD_LOGIC := '0';
		o	:	OUT STD_LOGIC;
		obar	:	OUT STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	dataio(0) <= wire_obufa_o;
	dataio_b(0) <= wire_obuf_ba_o;
	dataout(0) <= wire_ibufa_o;
	ibufa :  stratixiii_io_ibuf
	  GENERIC MAP (
		bus_hold => "false"
	  )
	  PORT MAP ( 
		i => dataio(0),
		ibar => dataio_b(0),
		o => wire_ibufa_o
	  );
	obuf_ba :  stratixiii_io_obuf
	  GENERIC MAP (
		bus_hold => "false",
		open_drain_output => "false"
	  )
	  PORT MAP ( 
		dynamicterminationcontrol => dynamicterminationcontrol_b(0),
		i => wire_pseudo_diffa_obar,
		o => wire_obuf_ba_o,
		oe => oe_b(0)
	  );
	obufa :  stratixiii_io_obuf
	  GENERIC MAP (
		bus_hold => "false",
		open_drain_output => "false"
	  )
	  PORT MAP ( 
		dynamicterminationcontrol => dynamicterminationcontrol(0),
		i => wire_pseudo_diffa_o,
		o => wire_obufa_o,
		oe => oe(0)
	  );
	pseudo_diffa :  stratixiii_pseudo_diff_out
	  PORT MAP ( 
		i => datain(0),
		o => wire_pseudo_diffa_o,
		obar => wire_pseudo_diffa_obar
	  );

 END RTL; --bidir_dqs_iobuf_inst_iobuf_bidir_fkv
--VALID FILE


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bidir_dqs_iobuf_inst IS
	PORT
	(
		datain		: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
		dyn_term_ctrl		: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
		dyn_term_ctrl_b		: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
		oe		: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
		oe_b		: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
		dataio		: INOUT STD_LOGIC_VECTOR (0 DOWNTO 0);
		dataio_b		: INOUT STD_LOGIC_VECTOR (0 DOWNTO 0);
		dataout		: OUT STD_LOGIC_VECTOR (0 DOWNTO 0)
	);
END bidir_dqs_iobuf_inst;


ARCHITECTURE RTL OF bidir_dqs_iobuf_inst IS

	ATTRIBUTE synthesis_clearbox: boolean;
	ATTRIBUTE synthesis_clearbox OF RTL: ARCHITECTURE IS TRUE;
	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (0 DOWNTO 0);



	COMPONENT bidir_dqs_iobuf_inst_iobuf_bidir_fkv
	PORT (
			dataout	: OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
			datain	: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
			dataio	: INOUT STD_LOGIC_VECTOR (0 DOWNTO 0);
			dataio_b	: INOUT STD_LOGIC_VECTOR (0 DOWNTO 0);
			dynamicterminationcontrol_b	: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
			oe	: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
			oe_b	: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
			dynamicterminationcontrol	: IN STD_LOGIC_VECTOR (0 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	dataout    <= sub_wire0(0 DOWNTO 0);

	bidir_dqs_iobuf_inst_iobuf_bidir_fkv_component : bidir_dqs_iobuf_inst_iobuf_bidir_fkv
	PORT MAP (
		datain => datain,
		dynamicterminationcontrol_b => dyn_term_ctrl_b,
		oe => oe,
		oe_b => oe_b,
		dynamicterminationcontrol => dyn_term_ctrl,
		dataout => sub_wire0,
		dataio => dataio,
		dataio_b => dataio_b
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
-- Retrieval info: CONSTANT: number_of_channels NUMERIC "1"
-- Retrieval info: CONSTANT: open_drain_output STRING "FALSE"
-- Retrieval info: CONSTANT: use_differential_mode STRING "TRUE"
-- Retrieval info: CONSTANT: use_dynamic_termination_control STRING "TRUE"
-- Retrieval info: CONSTANT: use_termination_control STRING "FALSE"
-- Retrieval info: USED_PORT: datain 0 0 1 0 INPUT NODEFVAL "datain[0..0]"
-- Retrieval info: USED_PORT: dataio 0 0 1 0 BIDIR NODEFVAL "dataio[0..0]"
-- Retrieval info: USED_PORT: dataio_b 0 0 1 0 BIDIR NODEFVAL "dataio_b[0..0]"
-- Retrieval info: USED_PORT: dataout 0 0 1 0 OUTPUT NODEFVAL "dataout[0..0]"
-- Retrieval info: USED_PORT: dyn_term_ctrl 0 0 1 0 INPUT NODEFVAL "dyn_term_ctrl[0..0]"
-- Retrieval info: USED_PORT: dyn_term_ctrl_b 0 0 1 0 INPUT NODEFVAL "dyn_term_ctrl_b[0..0]"
-- Retrieval info: USED_PORT: oe 0 0 1 0 INPUT NODEFVAL "oe[0..0]"
-- Retrieval info: USED_PORT: oe_b 0 0 1 0 INPUT NODEFVAL "oe_b[0..0]"
-- Retrieval info: CONNECT: @datain 0 0 1 0 datain 0 0 1 0
-- Retrieval info: CONNECT: @dynamicterminationcontrol_b 0 0 1 0 dyn_term_ctrl_b 0 0 1 0
-- Retrieval info: CONNECT: @dynamicterminationcontrol 0 0 1 0 dyn_term_ctrl 0 0 1 0
-- Retrieval info: CONNECT: @oe 0 0 1 0 oe 0 0 1 0
-- Retrieval info: CONNECT: dataout 0 0 1 0 @dataout 0 0 1 0
-- Retrieval info: CONNECT: @oe_b 0 0 1 0 oe_b 0 0 1 0
-- Retrieval info: CONNECT: dataio_b 0 0 1 0 @dataio_b 0 0 1 0
-- Retrieval info: CONNECT: dataio 0 0 1 0 @dataio 0 0 1 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL bidir_dqs_iobuf_inst.vhd TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL bidir_dqs_iobuf_inst.inc FALSE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL bidir_dqs_iobuf_inst.cmp FALSE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL bidir_dqs_iobuf_inst.bsf FALSE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL bidir_dqs_iobuf_inst_inst.vhd FALSE FALSE
-- Retrieval info: LIB_FILE: stratixiii
