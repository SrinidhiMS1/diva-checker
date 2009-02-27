# GRLIB Makefile generated settings
set design leon3mp
set pnc 
set device 
set package 
set top_hdl 

### Project Settings
#
# The parameters in this section are for documentation purposes mostly
# and can be changed by the user without affecting synthesis results
# Multi-word strings (e.g. eASIC Corp) must be enwrapped in double
# quotes, so "eASIC Corp."

# project: string; Project name
set project "leon3"

# company: string; Company name
set company "gaisler"

# designer: string; Designer name
set designer ""

# email: string; Designer's email address
set email "${designer}@${company}.com"

# email_notification: enumerated [on,off]
# When 'on' CDB sends an email to the designer's email address
# with the status of the last run and the log file attached
set email_notification off


### Design
#
# The parameters in this section define the eASIC Structured ASIC
# the design will be implemented on 

# pnc: number; Part Number Code, unique project identifier
# provided by eASIC
#set pnc 50123

# design: string; Top Level name
#set design leon3mp

# device: enumerated [NX750,NX1500,NX2500,NX4000,NX5000]
# Device selects the eASIC Structured ASIC platform
#set device NX1500

# package: string; package for selected device
# 
#set package FC480

# device_type: enumerated [sl,vl]
# sl: SRAM configured Lookup table device
# vl: Via configured Lookup table device
set device_type sl

# technology; enumerated [std,hp]
# std: 1.2V standard device
# hp : 1.3V high performance device
set technology std


### Flow
#
# The parameters in this section provide various options
# to guide the synthesis flow

# fsm_optimization: enumerated [on,off]
# fsm_encoding    : enumerated [auto,binary,gray,one_hot]
# These parameters turn on/off Finite State Machine recoding with the
# method defined by 'fsm_encoding'.
# Turning on this option can result in smaller and/or faster FSM
# implementations, but may lead to formal verification errors
set fsm_optimization off
set fsm_encoding auto

# boolean_mapper: enumerated [on,off]
# Turn on/off Magma boolean mapper technology
# Turning on this option generally yields a smaller and faster design
set boolean_mapper on

# use_rtbuf: enumerated [on,off]
# Turn on/off long net buffering using high-drive buffers (rtbuf)
# Setting use_rtbuf to 'off' disables 'fix fj90 rtbuf'
set use_rtbuf on

# effort: enumerated [low,medium,high]; (area) synthesis effort
set effort medium

# timing_effort: enumerated [low,medium,high]; timing effort
set timing_effort medium

# timing_slack: real; initial positive timing slack target
set timing_slack 1n

# clock_effort: enumerated [low,high]
# Should be set to 'low' for 2008 Magma releases, can be set to 'high' for older releases
set clock_effort low

# utilization: real; area utilization
# Maximum area utilization during placement. Typical values range
# from 0.7 to 1.0. Lower values may improve timing or relax placement
# effort, but lead to less area efficient implementations.
set utilization 0.8

# clone_ff: enumerated [on,off]
# Turn on/off replication of flipflops to drive large loads.
# It is recommended to set this parameter to 'on'.
# Set it to 'off' if encountering formal verification issues.
set clone_ff on

# fanout_limit: integer;
# fanout_strict: enumerated [strict,noworse]
# Sets the maximum fanout per cell (fanout_limit) and how the
# synthesis tool resolves the fanout; always buffer if the load is
# higher than the fanout (strict), or only buffer if the load is
# higher than the fanout AND buffering doesn't affect timing (noworse)
set fanout_limit 10
set fanout_strict strict

# timing_paths: integer
# Sets the number of timing paths reported during the various timing
# analysis reports
set timing_paths 10


### Directories
#
# The parameters in this section set multiple directories.
# There should be no need to change any of the following parameters 

# proj_rootdir: string
# Sets the path to the project root, as seen from the 'run' directory
set proj_rootdir ../../..

# srcdir: string
# Sets the directory containing user files (e.g. design and constraints)
# This typically points to 'src'
set srcdir $proj_rootdir/src

# rtldir: string
# Sets the directory containing RTL files
# This typically points to 'src/rtl'
set rtldir $srcdir/rtl

# constraintsdir: string
# Sets the directory containing design constraints (.sdc, .pad) files
# This typically points to 'src/constraints'
set constraintsdir $srcdir/constraints

# snap: enumerated [on|off]
# Enables or disabled Magma synthesis snap-shot generation.
# snap must be on if the CDB 'start_at' option is to be used.
set snap on

# volcano_compression: enumerated [none,min,med,max]
# Sets the Magma library volcano compression level
set volcano_compression none


### Constraints
#
# The parameters in this section set/point to synthesis constraints

# pad_file: string
# Points to an eWizard generated file containing pad and macro placement commands
# Typically points to 'src/constraints/<design>.pad
set pad_file $constraintsdir/${design}.pad

# sdc_file: string
# Points to a user generated file containing timing constraints in
# Synopsys Design Constraints (sdc) format.
# Typically points to 'src/constraints/<design>.sdc
set sdc_file $constraintsdir/${design}.sdc

# verilog2k: enumerated [on|off]
# Enables/disabled Verilog2001 support
set verilog2k on

# undriven: enumerated [0,1,X,U,reset]
# Sets the physical synthesis tool's behaviour with regards to undriven
# pins. By default this is set to 'U', meaning leave undriven pins
# floating so they can be detected and fixed in RTL.
set undriven U

# topfile: string
# The name of the file containing the top level RTL module
#set topfile $rtldir/<top file>
#if {[regexp {\.v$} $topfile]} {set top_hdl verilog} else {set top_hdl vhdl}


### Design files
#
set includeList  {}
set defineList   {}
set netlistList  {}
set vhdllibList  {}
set read_netlist {}
set read_rtl     {}
set read_plan    {}

# GRLIB Makefile generated HDL list
set vhdlList {
{grlib  ../../../../../../lib/grlib/stdlib/version.vhd ../../../../../../lib/grlib/stdlib/stdlib.vhd ../../../../../../lib/grlib/sparc/sparc.vhd ../../../../../../lib/grlib/sparc/sparc_disas.vhd ../../../../../../lib/grlib/sparc/cpu_disas.vhd ../../../../../../lib/grlib/modgen/multlib.vhd ../../../../../../lib/grlib/modgen/leaves.vhd ../../../../../../lib/grlib/amba/amba.vhd ../../../../../../lib/grlib/amba/devices.vhd ../../../../../../lib/grlib/amba/defmst.vhd ../../../../../../lib/grlib/amba/apbctrl.vhd ../../../../../../lib/grlib/amba/ahbctrl.vhd ../../../../../../lib/grlib/amba/dma2ahb_pkg.vhd ../../../../../../lib/grlib/amba/dma2ahb.vhd}
{techmap  ../../../../../../lib/techmap/gencomp/gencomp.vhd ../../../../../../lib/techmap/gencomp/netcomp.vhd ../../../../../../lib/techmap/inferred/memory_inferred.vhd ../../../../../../lib/techmap/inferred/ddr_inferred.vhd ../../../../../../lib/techmap/inferred/mul_inferred.vhd ../../../../../../lib/techmap/inferred/ddr_phy_inferred.vhd ../../../../../../lib/techmap/dw02/mul_dw_gen.vhd ../../../../../../lib/techmap/maps/allclkgen.vhd ../../../../../../lib/techmap/maps/allddr.vhd ../../../../../../lib/techmap/maps/allmem.vhd ../../../../../../lib/techmap/maps/allpads.vhd ../../../../../../lib/techmap/maps/alltap.vhd ../../../../../../lib/techmap/maps/clkgen.vhd ../../../../../../lib/techmap/maps/clkmux.vhd ../../../../../../lib/techmap/maps/clkand.vhd ../../../../../../lib/techmap/maps/ddr_ireg.vhd ../../../../../../lib/techmap/maps/ddr_oreg.vhd ../../../../../../lib/techmap/maps/ddrphy.vhd ../../../../../../lib/techmap/maps/syncram.vhd ../../../../../../lib/techmap/maps/syncram64.vhd ../../../../../../lib/techmap/maps/syncram_2p.vhd ../../../../../../lib/techmap/maps/syncram_dp.vhd ../../../../../../lib/techmap/maps/syncfifo.vhd ../../../../../../lib/techmap/maps/regfile_3p.vhd ../../../../../../lib/techmap/maps/tap.vhd ../../../../../../lib/techmap/maps/techbuf.vhd ../../../../../../lib/techmap/maps/clkpad.vhd ../../../../../../lib/techmap/maps/clkpad_ds.vhd ../../../../../../lib/techmap/maps/inpad.vhd ../../../../../../lib/techmap/maps/inpad_ds.vhd ../../../../../../lib/techmap/maps/iodpad.vhd ../../../../../../lib/techmap/maps/iopad.vhd ../../../../../../lib/techmap/maps/iopad_ds.vhd ../../../../../../lib/techmap/maps/lvds_combo.vhd ../../../../../../lib/techmap/maps/odpad.vhd ../../../../../../lib/techmap/maps/outpad.vhd ../../../../../../lib/techmap/maps/outpad_ds.vhd ../../../../../../lib/techmap/maps/toutpad.vhd ../../../../../../lib/techmap/maps/skew_outpad.vhd ../../../../../../lib/techmap/maps/grspwc_net.vhd ../../../../../../lib/techmap/maps/grlfpw_net.vhd ../../../../../../lib/techmap/maps/grfpw_net.vhd ../../../../../../lib/techmap/maps/mul_61x61.vhd ../../../../../../lib/techmap/maps/cpu_disas_net.vhd ../../../../../../lib/techmap/maps/grusbhc_net.vhd ../../../../../../lib/techmap/maps/ringosc.vhd ../../../../../../lib/techmap/maps/ssrctrl_net.vhd ../../../../../../lib/techmap/maps/system_monitor.vhd}
{spw  ../../../../../../lib/spw/comp/spwcomp.vhd ../../../../../../lib/spw/wrapper/grspw_gen.vhd}
{eth  ../../../../../../lib/eth/comp/ethcomp.vhd ../../../../../../lib/eth/core/greth_pkg.vhd ../../../../../../lib/eth/core/eth_rstgen.vhd ../../../../../../lib/eth/core/eth_ahb_mst.vhd ../../../../../../lib/eth/core/greth_tx.vhd ../../../../../../lib/eth/core/greth_rx.vhd ../../../../../../lib/eth/core/grethc.vhd ../../../../../../lib/eth/wrapper/greth_gen.vhd ../../../../../../lib/eth/wrapper/greth_gbit_gen.vhd}
{opencores  ../../../../../../lib/opencores/occomp/occomp.vhd ../../../../../../lib/opencores/can/cancomp.vhd ../../../../../../lib/opencores/can/can_top.vhd ../../../../../../lib/opencores/can/can_top_core_sync.vhd ../../../../../../lib/opencores/i2c/i2c_master_bit_ctrl.vhd ../../../../../../lib/opencores/i2c/i2c_master_byte_ctrl.vhd ../../../../../../lib/opencores/i2c/i2coc.vhd}
{gaisler  ../../../../../../lib/gaisler/arith/arith.vhd ../../../../../../lib/gaisler/arith/mul32.vhd ../../../../../../lib/gaisler/arith/div32.vhd ../../../../../../lib/gaisler/memctrl/memctrl.vhd ../../../../../../lib/gaisler/memctrl/sdctrl.vhd ../../../../../../lib/gaisler/memctrl/sdmctrl.vhd ../../../../../../lib/gaisler/memctrl/srctrl.vhd ../../../../../../lib/gaisler/memctrl/spimctrl.vhd ../../../../../../lib/gaisler/leon3/leon3.vhd ../../../../../../lib/gaisler/leon3/mmuconfig.vhd ../../../../../../lib/gaisler/leon3/mmuiface.vhd ../../../../../../lib/gaisler/leon3/libmmu.vhd ../../../../../../lib/gaisler/leon3/libiu.vhd ../../../../../../lib/gaisler/leon3/libcache.vhd ../../../../../../lib/gaisler/leon3/libproc3.vhd ../../../../../../lib/gaisler/leon3/cachemem.vhd ../../../../../../lib/gaisler/leon3/mmu_icache.vhd ../../../../../../lib/gaisler/leon3/mmu_dcache.vhd ../../../../../../lib/gaisler/leon3/mmu_acache.vhd ../../../../../../lib/gaisler/leon3/mmutlbcam.vhd ../../../../../../lib/gaisler/leon3/mmulrue.vhd ../../../../../../lib/gaisler/leon3/mmulru.vhd ../../../../../../lib/gaisler/leon3/mmutlb.vhd ../../../../../../lib/gaisler/leon3/mmutw.vhd ../../../../../../lib/gaisler/leon3/mmu.vhd ../../../../../../lib/gaisler/leon3/mmu_cache.vhd ../../../../../../lib/gaisler/leon3/acache.vhd ../../../../../../lib/gaisler/leon3/dcache.vhd ../../../../../../lib/gaisler/leon3/icache.vhd ../../../../../../lib/gaisler/leon3/cache.vhd ../../../../../../lib/gaisler/leon3/cpu_disasx.vhd ../../../../../../lib/gaisler/leon3/iu3.vhd ../../../../../../lib/gaisler/leon3/grfpwx.vhd ../../../../../../lib/gaisler/leon3/mfpwx.vhd ../../../../../../lib/gaisler/leon3/grlfpwx.vhd ../../../../../../lib/gaisler/leon3/tbufmem.vhd ../../../../../../lib/gaisler/leon3/dsu3x.vhd ../../../../../../lib/gaisler/leon3/dsu3.vhd ../../../../../../lib/gaisler/leon3/proc3.vhd ../../../../../../lib/gaisler/leon3/leon3s.vhd ../../../../../../lib/gaisler/leon3/leon3cg.vhd ../../../../../../lib/gaisler/leon3/irqmp.vhd ../../../../../../lib/gaisler/leon3/grfpwxsh.vhd ../../../../../../lib/gaisler/leon3/grfpushwx.vhd ../../../../../../lib/gaisler/leon3/leon3sh.vhd ../../../../../../lib/gaisler/can/can.vhd ../../../../../../lib/gaisler/can/can_mod.vhd ../../../../../../lib/gaisler/can/can_oc.vhd ../../../../../../lib/gaisler/can/can_mc.vhd ../../../../../../lib/gaisler/can/canmux.vhd ../../../../../../lib/gaisler/can/can_rd.vhd ../../../../../../lib/gaisler/misc/misc.vhd ../../../../../../lib/gaisler/misc/rstgen.vhd ../../../../../../lib/gaisler/misc/gptimer.vhd ../../../../../../lib/gaisler/misc/ahbram.vhd ../../../../../../lib/gaisler/misc/ahbdpram.vhd ../../../../../../lib/gaisler/misc/ahbtrace.vhd ../../../../../../lib/gaisler/misc/ahbmst.vhd ../../../../../../lib/gaisler/misc/grgpio.vhd ../../../../../../lib/gaisler/misc/ahbstat.vhd ../../../../../../lib/gaisler/misc/logan.vhd ../../../../../../lib/gaisler/misc/apbps2.vhd ../../../../../../lib/gaisler/misc/charrom_package.vhd ../../../../../../lib/gaisler/misc/charrom.vhd ../../../../../../lib/gaisler/misc/apbvga.vhd ../../../../../../lib/gaisler/misc/ahbdma.vhd ../../../../../../lib/gaisler/misc/svgactrl.vhd ../../../../../../lib/gaisler/misc/i2cmst.vhd ../../../../../../lib/gaisler/misc/spictrl.vhd ../../../../../../lib/gaisler/misc/i2cslv.vhd ../../../../../../lib/gaisler/misc/wild.vhd ../../../../../../lib/gaisler/misc/wild2ahb.vhd ../../../../../../lib/gaisler/misc/grsysmon.vhd ../../../../../../lib/gaisler/misc/gracectrl.vhd ../../../../../../lib/gaisler/net/net.vhd ../../../../../../lib/gaisler/pci/pci.vhd ../../../../../../lib/gaisler/pci/pcilib.vhd ../../../../../../lib/gaisler/pci/pciahbmst.vhd ../../../../../../lib/gaisler/pci/pcitrace.vhd ../../../../../../lib/gaisler/pci/pci_target.vhd ../../../../../../lib/gaisler/pci/pci_mt.vhd ../../../../../../lib/gaisler/pci/dmactrl.vhd ../../../../../../lib/gaisler/pci/pci_mtf.vhd ../../../../../../lib/gaisler/pci/pcipads.vhd ../../../../../../lib/gaisler/pci/pcidma.vhd ../../../../../../lib/gaisler/uart/uart.vhd ../../../../../../lib/gaisler/uart/libdcom.vhd ../../../../../../lib/gaisler/uart/apbuart.vhd ../../../../../../lib/gaisler/uart/dcom.vhd ../../../../../../lib/gaisler/uart/dcom_uart.vhd ../../../../../../lib/gaisler/uart/ahbuart.vhd ../../../../../../lib/gaisler/jtag/jtag.vhd ../../../../../../lib/gaisler/jtag/libjtagcom.vhd ../../../../../../lib/gaisler/jtag/jtagcom.vhd ../../../../../../lib/gaisler/jtag/ahbjtag.vhd ../../../../../../lib/gaisler/jtag/ahbjtag_bsd.vhd ../../../../../../lib/gaisler/greth/ethernet_mac.vhd ../../../../../../lib/gaisler/greth/greth.vhd ../../../../../../lib/gaisler/greth/greth_gbit.vhd ../../../../../../lib/gaisler/greth/grethm.vhd ../../../../../../lib/gaisler/spacewire/spacewire.vhd ../../../../../../lib/gaisler/spacewire/grspw.vhd ../../../../../../lib/gaisler/spacewire/grspw2.vhd ../../../../../../lib/gaisler/spacewire/grspwm.vhd}
{esa  ../../../../../../lib/esa/memoryctrl/memoryctrl.vhd ../../../../../../lib/esa/memoryctrl/mctrl.vhd ../../../../../../lib/esa/pci/pcicomp.vhd ../../../../../../lib/esa/pci/pci_arb_pkg.vhd ../../../../../../lib/esa/pci/pci_arb.vhd ../../../../../../lib/esa/pci/pciarb.vhd}
{work  ../../../../config.vhd ../../../../ahbrom.vhd ../../../../leon3mp.vhd}
}
set verilogList {
../../../../../../lib/opencores/spi/simple_spi_top.v
}
