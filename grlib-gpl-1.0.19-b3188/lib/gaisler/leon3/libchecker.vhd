------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003, Gaisler Research
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Package: 	libchecker
-- File:	libchecker.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	LEON3 proc3 component declaration
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
library techmap;
use techmap.gencomp.all;
library gaisler;
use gaisler.leon3.all;
use gaisler.libcache.all;
use gaisler.libiu.all;
--library fpu;
--use fpu.libfpu.all;

package libchecker is

  -- pulled from sparcv8.pdf page 88
  type INSTRUCTION is (
    LOAD_,
    STORE_,
    SETHI_,
    NOP_,
    AND_,
    ANDN_,
    OR_,
    ORN_,
    XOR_,
    XNOR_,
    SLL_,
    SRL_,
    SRA_,
    ADD_,
    SUB_,
    UMUL_,
    SMUL_,
    UDIV_,
    SDIV_
  );

  type checker_info_in_type is record
    icache    : cram_in_type;
    iregfile  : iregfile_out_type;
    itbo      : tracebuf_out_type;
    ifpo      : fpc_out_type;
    icpo      : fpc_out_type;
    iirqi     : l3_irq_in_type;
    --instr     : INSTRUCTION;
    aluop     : std_logic_vector(2 downto 0);
  end record;

  component checker 
  generic (
    hindex    : integer               := 0;
    fabtech   : integer range 0 to NTECH  := 0;
    memtech   : integer range 0 to NTECH  := 0;
    nwindows  : integer range 2 to 32 := 8;
    dsu       : integer range 0 to 1  := 0;
    fpu       : integer range 0 to 15 := 0;
    v8        : integer range 0 to 63 := 0;
    cp        : integer range 0 to 1  := 0;
    mac       : integer range 0 to 1  := 0;
    pclow     : integer range 0 to 2  := 2;
    notag     : integer range 0 to 1  := 0;
    nwp       : integer range 0 to 4  := 0;
    icen      : integer range 0 to 1  := 0;
    irepl     : integer range 0 to 2  := 2;
    isets     : integer range 1 to 4  := 1;
    ilinesize : integer range 4 to 8  := 4;
    isetsize  : integer range 1 to 256 := 1;
    isetlock  : integer range 0 to 1  := 0;
    dcen      : integer range 0 to 1  := 0;
    drepl     : integer range 0 to 2  := 2;
    dsets     : integer range 1 to 4  := 1;
    dlinesize : integer range 4 to 8  := 4;
    dsetsize  : integer range 1 to 256 := 1;
    dsetlock  : integer range 0 to 1  := 0;
    dsnoop    : integer range 0 to 6  := 0;
    ilram     : integer range 0 to 1  := 0;
    ilramsize : integer range 1 to 512 := 1;
    ilramstart: integer range 0 to 255 := 16#8e#;
    dlram     : integer range 0 to 1  := 0;
    dlramsize : integer range 1 to 512 := 1;
    dlramstart: integer range 0 to 255 := 16#8f#;
    mmuen     : integer range 0 to 1  := 0;
    itlbnum   : integer range 2 to 64 := 8;
    dtlbnum   : integer range 2 to 64 := 8;
    tlb_type  : integer range 0 to 3  := 1;
    tlb_rep   : integer range 0 to 1  := 0;
    lddel     : integer range 1 to 2  := 2;
    disas     : integer range 0 to 2  := 0;
    tbuf      : integer range 0 to 64 := 0;
    pwd       : integer range 0 to 2  := 0;     -- power-down
    svt       : integer range 0 to 1  := 0;     -- single-vector trapping
    rstaddr   : integer               := 0;
    smp       : integer range 0 to 15 := 0;     -- support SMP systems
    cached    : integer := 0;
    clk2x     : integer := 0;
    scantest : integer := 0    
  );
  port (
    clk    : in  std_ulogic;
    rstn   : in  std_ulogic;
    holdn  : out std_ulogic;    
    rfo    : in  iregfile_out_type;
    tbo    : in  tracebuf_out_type;
    fpo    : in  fpc_out_type;
    cpo    : in  fpc_out_type;
    irqi   : in  l3_irq_in_type;
    dbgi   : in  l3_debug_in_type;
    dbgo   : out l3_debug_out_type;
    hclk, sclk : in  std_ulogic;
    hclken : in std_ulogic
  );
  end component; 

end;
