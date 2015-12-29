# Introduction #
Prerequisites needed are a PC, FPGA development board, software, and knowledge. Development of the VHDL files is done in Xilinx ISE Project Navigator. To generate the project file, we used _make ise-map_ or one of the other ise related makes.

# Details #
Under ISE we have used Synthesize.

Further work to be done as far as infrastructure:
  * generating the implementation file, or (.bit) file
  * connecting to the fpga card and flashing (JTAG) the PROM
  * connecting via DSU (debug support unit) to monitor the card
  * set up small linux environment to install onto fpga and execute c files.

Our development system specs.
  * FPGA Board: Xilinx gr-pci-xc2v3000
  * PC: Core2Duo @3GHz + 4GB RAM (Vista / Ubuntu 8.04)
  * Xilinx ISE 10.1
  * Other software: Modelsim + others?