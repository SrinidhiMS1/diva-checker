project new leon3mp.ise
project set family "virtex2"
project set device xc2v3000
project set speed -4
project set package fg676
xfile add "config.vhd" -lib_vhdl work
xfile add "ahbrom.vhd" -lib_vhdl work
xfile add "leon3mp.vhd" -lib_vhdl work
xfile add "../../boards/gr-pci-xc2v/leon3mp.ucf"
lib_vhdl new grlib
xfile add "../../lib/grlib/stdlib/version.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/stdlib/stdlib.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/sparc/sparc.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/modgen/multlib.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/modgen/leaves.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/amba/amba.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/amba/devices.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/amba/defmst.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/amba/apbctrl.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/amba/ahbctrl.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/amba/dma2ahb_pkg.vhd" -lib_vhdl grlib
xfile add "../../lib/grlib/amba/dma2ahb.vhd" -lib_vhdl grlib
lib_vhdl new unisim
lib_vhdl new synplify
lib_vhdl new techmap
xfile add "../../lib/techmap/gencomp/gencomp.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/gencomp/netcomp.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/inferred/memory_inferred.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/inferred/ddr_inferred.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/inferred/mul_inferred.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/inferred/ddr_phy_inferred.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/memory_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/buffer_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/pads_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/clkgen_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/tap_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/ddr_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/ddr_phy_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/grspwc_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/grfpw_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/grusbhc_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/ssrctrl_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/unisim/sysmon_unisim.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/allclkgen.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/allddr.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/allmem.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/allpads.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/alltap.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/clkgen.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/clkmux.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/clkand.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/ddr_ireg.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/ddr_oreg.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/ddrphy.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/syncram.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/syncram64.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/syncram_2p.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/syncram_dp.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/syncfifo.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/regfile_3p.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/tap.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/techbuf.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/clkpad.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/clkpad_ds.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/inpad.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/inpad_ds.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/iodpad.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/iopad.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/iopad_ds.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/lvds_combo.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/odpad.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/outpad.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/outpad_ds.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/toutpad.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/skew_outpad.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/grspwc_net.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/grlfpw_net.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/grfpw_net.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/mul_61x61.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/cpu_disas_net.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/grusbhc_net.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/ringosc.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/ssrctrl_net.vhd" -lib_vhdl techmap
xfile add "../../lib/techmap/maps/system_monitor.vhd" -lib_vhdl techmap
lib_vhdl new spw
xfile add "../../lib/spw/comp/spwcomp.vhd" -lib_vhdl spw
xfile add "../../lib/spw/wrapper/grspw_gen.vhd" -lib_vhdl spw
lib_vhdl new eth
xfile add "../../lib/eth/comp/ethcomp.vhd" -lib_vhdl eth
xfile add "../../lib/eth/core/greth_pkg.vhd" -lib_vhdl eth
xfile add "../../lib/eth/core/eth_rstgen.vhd" -lib_vhdl eth
xfile add "../../lib/eth/core/eth_ahb_mst.vhd" -lib_vhdl eth
xfile add "../../lib/eth/core/greth_tx.vhd" -lib_vhdl eth
xfile add "../../lib/eth/core/greth_rx.vhd" -lib_vhdl eth
xfile add "../../lib/eth/core/grethc.vhd" -lib_vhdl eth
xfile add "../../lib/eth/wrapper/greth_gen.vhd" -lib_vhdl eth
xfile add "../../lib/eth/wrapper/greth_gbit_gen.vhd" -lib_vhdl eth
lib_vhdl new opencores
xfile add "../../lib/opencores/occomp/occomp.vhd" -lib_vhdl opencores
xfile add "../../lib/opencores/can/cancomp.vhd" -lib_vhdl opencores
xfile add "../../lib/opencores/can/can_top.vhd" -lib_vhdl opencores
xfile add "../../lib/opencores/can/can_top_core_sync.vhd" -lib_vhdl opencores
xfile add "../../lib/opencores/i2c/i2c_master_bit_ctrl.vhd" -lib_vhdl opencores
xfile add "../../lib/opencores/i2c/i2c_master_byte_ctrl.vhd" -lib_vhdl opencores
xfile add "../../lib/opencores/i2c/i2coc.vhd" -lib_vhdl opencores
xfile add "../../lib/opencores/spi/simple_spi_top.v"
lib_vhdl new gaisler
xfile add "../../lib/gaisler/arith/arith.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/arith/mul32.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/arith/div32.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/memctrl/memctrl.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/memctrl/sdctrl.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/memctrl/sdmctrl.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/memctrl/srctrl.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/memctrl/spimctrl.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/leon3.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmuconfig.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmuiface.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/libmmu.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/libiu.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/libcache.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/libproc3.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/cachemem.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmu_icache.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmu_dcache.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmu_acache.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmutlbcam.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmulrue.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmulru.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmutlb.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmutw.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmu.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mmu_cache.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/acache.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/dcache.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/icache.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/cache.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/cpu_disasx.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/iu3.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/grfpwx.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/mfpwx.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/grlfpwx.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/tbufmem.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/dsu3x.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/dsu3.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/proc3.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/leon3s.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/leon3cg.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/irqmp.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/grfpwxsh.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/grfpushwx.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/leon3/leon3sh.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/can/can.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/can/can_mod.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/can/can_oc.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/can/can_mc.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/can/canmux.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/can/can_rd.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/misc.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/rstgen.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/gptimer.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/ahbram.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/ahbdpram.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/ahbtrace.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/ahbmst.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/grgpio.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/ahbstat.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/logan.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/apbps2.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/charrom_package.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/charrom.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/apbvga.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/ahbdma.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/svgactrl.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/i2cmst.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/spictrl.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/i2cslv.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/wild.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/wild2ahb.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/grsysmon.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/misc/gracectrl.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/net/net.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/pci/pci.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/pci/pcilib.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/pci/pciahbmst.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/pci/pcitrace.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/pci/pci_target.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/pci/pci_mt.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/pci/dmactrl.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/pci/pci_mtf.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/pci/pcipads.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/pci/pcidma.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/uart/uart.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/uart/libdcom.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/uart/apbuart.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/uart/dcom.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/uart/dcom_uart.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/uart/ahbuart.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/jtag/jtag.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/jtag/libjtagcom.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/jtag/jtagcom.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/jtag/ahbjtag.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/jtag/ahbjtag_bsd.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/greth/ethernet_mac.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/greth/greth.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/greth/greth_gbit.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/greth/grethm.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/spacewire/spacewire.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/spacewire/grspw.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/spacewire/grspw2.vhd" -lib_vhdl gaisler
xfile add "../../lib/gaisler/spacewire/grspwm.vhd" -lib_vhdl gaisler
lib_vhdl new esa
xfile add "../../lib/esa/memoryctrl/memoryctrl.vhd" -lib_vhdl esa
xfile add "../../lib/esa/memoryctrl/mctrl.vhd" -lib_vhdl esa
xfile add "../../lib/esa/pci/pcicomp.vhd" -lib_vhdl esa
xfile add "../../lib/esa/pci/pci_arb_pkg.vhd" -lib_vhdl esa
xfile add "../../lib/esa/pci/pci_arb.vhd" -lib_vhdl esa
xfile add "../../lib/esa/pci/pciarb.vhd" -lib_vhdl esa
lib_vhdl new work
project set "Bus Delimiter" ()
project set "FSM Encoding Algorithm" None
project set "Pack I/O Registers into IOBs" yes
project set "Verilog Macros" ""
project set "Other XST Command Line Options" ""
project set "Allow Unmatched LOC Constraints" true
project set "Macro Search Path" "../../netlists/xilinx/virtex2" -process "Translate"
project set "Pack I/O Registers/Latches into IOBs" {For Inputs and Outputs}
project set "Other MAP Command Line Options" ""
project set "Create ReadBack Data Files" true
project set "Create Mask File" true
project close
exit
