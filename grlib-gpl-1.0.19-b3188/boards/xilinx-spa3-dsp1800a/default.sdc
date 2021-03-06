# Synplicity, Inc. constraint file
# /home/magnus/grlib-gpl-1.0.18-b2950/boards/xilinx-spa3-dsp1800a/default.sdc
# Written on Mon Jul 21 10:31:29 2008
# by Synplify Pro, Synplify Pro 8.9 Scope Editor

#
# Collections
#

#
# Clocks
#
define_clock            {clk_in}     -name {clk_in}      -freq 135    -clockgroup default_clkgroup -route 0
define_clock            {clkm}       -name {clkm}        -freq 48     -clockgroup main_clkgroup    -route 0
define_clock            {clkml}      -name {clkml}       -freq 135    -clockgroup ddr_clkgroup     -route 0
define_clock            {ddr_clk_fb} -name {ddr_clk_fb}  -freq 135    -clockgroup ddr_fb_clkgroup  -route 0
define_clock            {clk_vga}    -name {clk_vga}     -freq 25     -clockgroup vga_clkgroup     -route 0
define_clock            {etx_clk}    -name {etx_clk}     -freq 25     -clockgroup phy_rx_clkgroup  -route 0
define_clock            {erx_clk}    -name {erx_clk}     -freq 25     -clockgroup phy_tx_clkgroup  -route 0

#
# Clock to Clock
#

#
# Inputs/Outputs
#
define_output_delay -disable -default 10.00 -improve 0.00 -route 0.00 -ref {clk:r}
define_input_delay  -disable -default 10.00 -improve 0.00 -route 0.00 -ref {clk:r}

#
# Registers
#

#
# Multicycle Path
#

#
# False Path
#

#
# Path Delay
#

#
# Attributes
#
define_global_attribute          syn_useioff {1}

#
# I/O standards
#

#
# Compile Points
#

#
# Other Constraints
#
