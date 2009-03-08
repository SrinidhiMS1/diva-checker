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
-- Entity: 	leon3s
-- File:	leon3s.vhd
-- Author:	Jiri Gaisler, Edvin Catovic, Gaisler Research
-- Description:	Top-level LEON3 component
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
library techmap;
use techmap.gencomp.all;
use gaisler.leon3.all;
use gaisler.libiu.all;
use gaisler.libcache.all;
use gaisler.libproc3.all;
use gaisler.libchecker.all;
use gaisler.arith.all;
--library fpu;
--use fpu.libfpu.all;

entity leon3s is
  -- see grip.pdf Section 52.10 (page 536-537) for configuration option descriptions
  generic (
    hindex    : integer               := 0; -- AHB bus index (for debugging purposes
    fabtech   : integer range 0 to NTECH  := DEFFABTECH; -- target technology selector
    memtech   : integer range 0 to NTECH  := DEFMEMTECH; -- selector for the memory cell technology
    nwindows  : integer range 2 to 32 := 8; -- the number of SPARC register windows
    dsu       : integer range 0 to 1  := 0; -- enable debug support unit
    fpu       : integer range 0 to 31 := 0; -- floating point unit selector
    v8        : integer range 0 to 63 := 0; -- generate SPARC V8 MUL and DIV instructions
    cp        : integer range 0 to 1  := 0; -- generate co-processor interface
    mac       : integer range 0 to 1  := 0; -- generate SPARC V8e SMAC/UMAC instruction
    pclow     : integer range 0 to 2  := 2; -- least significant bit of PC that is actually generated
    notag     : integer range 0 to 1  := 0; -- currently not used
    nwp       : integer range 0 to 4  := 0; -- number of watchpoints
    icen      : integer range 0 to 1  := 0; -- enable instruction cache
    irepl     : integer range 0 to 2  := 2; -- instruction cache replacement policy
    isets     : integer range 1 to 4  := 1; -- number of instruction cache sets
    ilinesize : integer range 4 to 8  := 4; -- instruction cache line size in number of words
    isetsize  : integer range 1 to 256 := 1; -- size of each instruction cache set in kByte
    isetlock  : integer range 0 to 1  := 0; -- enable instruction cache line locking
    dcen      : integer range 0 to 1  := 0; -- data cache enable
    drepl     : integer range 0 to 2  := 2; -- data cache replacement policy
    dsets     : integer range 1 to 4  := 1; -- number of data cache sets
    dlinesize : integer range 4 to 8  := 4; -- data cache line size in number of words
    dsetsize  : integer range 1 to 256 := 1; -- size of each data cache set in kByte
    dsetlock  : integer range 0 to 1  := 0; -- enable data cache line locking
    dsnoop    : integer range 0 to 6  := 0; -- enable data cache snooping
    ilram      : integer range 0 to 1 := 0; -- enable local instruction RAM
    ilramsize  : integer range 1 to 512 := 1; -- local instruction RAM size in kB
    ilramstart : integer range 0 to 255 := 16#8e#; -- 8 MSB bits used to decode local instruction RAM area
    dlram      : integer range 0 to 1 := 0; -- enable local data RAM (scratch-pad RAM)
    dlramsize  : integer range 1 to 512 := 1; -- local data RAM size in kB
    dlramstart : integer range 0 to 255 := 16#8f#; -- 8 MSB bits used to decode local data RAM area
    mmuen     : integer range 0 to 1  := 0; -- enable memory management unit (MMU)
    itlbnum   : integer range 2 to 64 := 8; -- number of instruction TLB entries
    dtlbnum   : integer range 2 to 64 := 8; -- number of data TLB entries
    tlb_type  : integer range 0 to 3  := 1; -- determines shared/separate TLB with fast/slow write
    tlb_rep   : integer range 0 to 1  := 0; -- TLB replacement (LRU = 0 or Random = 1)
    lddel     : integer range 1 to 2  := 2; -- Load delay
    disas     : integer range 0 to 2  := 0; -- print instruction disassembly in VHDL simulator console
    tbuf      : integer range 0 to 64 := 0; -- size of instruction trace buffer in kB
    pwd       : integer range 0 to 2  := 2; -- power-down
    svt       : integer range 0 to 1  := 1; -- single vector trapping
    rstaddr   : integer               := 0; -- default reset start address
    smp       : integer range 0 to 15 := 0; -- support SMP systems
    cached    : integer               := 0;	-- cacheability table
    scantest  : integer               := 0  -- enable scan test support
  );
  -- see grip.pdf Section 52.11 (page 538) for signal descriptions
  port (
    clk    : in  std_ulogic;    -- AMBA and processor clock
    rstn   : in  std_ulogic;    -- Reset
    ahbi   : in  ahb_mst_in_type;   -- AHB master input signals
    ahbo   : out ahb_mst_out_type;  -- AHB master output signals
    ahbsi  : in  ahb_slv_in_type;   -- AHB slave input signals
    ahbso  : in  ahb_slv_out_vector;    -- AHB slave output signals
    irqi   : in  l3_irq_in_type;    -- interrupt level
    irqo   : out l3_irq_out_type;   -- interrupt acknowledge
    dbgi   : in  l3_debug_in_type;  -- debug inputs from DSU
    dbgo   : out l3_debug_out_type  -- debug outputs from DSU
  );
end; 

architecture rtl of leon3s is

constant IRFBITS  : integer range 6 to 10 := log2(NWINDOWS+1) + 4;
constant IREGNUM  : integer := NWINDOWS * 16 + 8;

signal holdn : std_logic;
signal ahboCore : ahb_mst_out_type;
signal ahboChecker : ahb_mst_out_type;
signal irqoCore : l3_irq_out_type;
signal irqoChecker : l3_irq_out_type;
signal dbgoCore : l3_debug_out_type;
signal dbgoChecker : l3_debug_out_type;
signal rfi   : iregfile_in_type;
signal rfiCore   : iregfile_in_type;
signal rfiChecker   : iregfile_in_type;
signal rfo   : iregfile_out_type;
signal crami : cram_in_type;
signal cramiCore : cram_in_type;
signal cramiChecker : cram_in_type;
signal cramo : cram_out_type;
signal tbi   : tracebuf_in_type;
signal tbo   : tracebuf_out_type;
signal rst   : std_ulogic;
signal fpi   : fpc_in_type;
signal fpiCore   : fpc_in_type;
signal fpiChecker   : fpc_in_type;
signal fpo   : fpc_out_type;
signal cpi   : fpc_in_type;
signal cpiCore   : fpc_in_type;
signal cpiChecker   : fpc_in_type;
signal cpo   : fpc_out_type;
signal cpodb : fpc_debug_out_type;

signal rd1, rd2, wd : std_logic_vector(35 downto 0);
signal gnd, vcc : std_logic;

constant FPURFHARD : integer := 1; --1-is_fpga(memtech);
constant fpuarch   : integer := fpu mod 16;
constant fpunet    : integer := fpu / 16;

attribute sync_set_reset : string;
attribute sync_set_reset of rst : signal is "true";

begin

   gnd <= '0'; vcc <= '1';

-- leon3 processor core (iu, caches & mul/div)

  p0 : proc3 
  generic map (hindex, fabtech, memtech, nwindows, dsu, fpuarch, v8, cp, mac,      
    pclow, notag, nwp, icen, irepl, isets, ilinesize, isetsize, isetlock, 
    dcen, drepl, dsets, dlinesize, dsetsize, dsetlock, dsnoop, ilram, 
    ilramsize, ilramstart, dlram, dlramsize, dlramstart, mmuen, itlbnum, dtlbnum,
    tlb_type, tlb_rep, lddel, disas, tbuf, pwd, svt, rstaddr, smp, cached, 0, scantest)
  port map (clk, rst, holdn, ahbi, ahboCore, ahbsi, ahbso, rfiCore, rfo, cramiCore, cramo, 
    tbi, tbo, fpiCore, fpo, cpiCore, cpo, irqi, irqoCore, dbgi, dbgoCore, gnd, clk, vcc);

  c0: checker
  generic map (hindex, fabtech, memtech, nwindows, dsu, fpuarch, v8, cp, mac,      
    pclow, notag, nwp, icen, irepl, isets, ilinesize, isetsize, isetlock, 
    dcen, drepl, dsets, dlinesize, dsetsize, dsetlock, dsnoop, ilram, 
    ilramsize, ilramstart, dlram, dlramsize, dlramstart, mmuen, itlbnum, dtlbnum,
    tlb_type, tlb_rep, lddel, disas, tbuf, pwd, svt, rstaddr, smp, cached, 0, scantest)
  port map (clk, rst, holdn, ahbi, ahboChecker, ahbsi, ahbso, rfiChecker, rfo, cramiChecker, cramo, 
    tbi, tbo, fpiChecker, fpo, cpiChecker, cpo, irqi, irqoChecker, dbgi, dbgoChecker, gnd, clk, vcc);
  
  assert irqoCore = irqoChecker report "Checker and Core out of synch" severity FAILURE;
  irqo <= irqoCore;

  assert dbgoCore = dbgoChecker report "Checker and Core out of synch" severity FAILURE;
  dbgo <= dbgoCore;

  assert rfiCore = rfiChecker report "Checker and Core out of synch" severity FAILURE;
  rfi <= rfiCore;

  assert fpiCore = fpiChecker report "Checker and Core out of synch" severity FAILURE;
  fpi <= fpiCore;

  assert cpiCore = cpiChecker report "Checker and Core out of synch" severity FAILURE;
  cpi <= cpiCore;

  assert cramiCore = cramiChecker report "Checker and Core out of synch" severity FAILURE;
  crami <= cramiCore;

  assert ahboCore = ahboChecker report "Checker and Core out of synch" severity FAILURE;
  ahbo <= ahboCore;

-- IU register file
  
    rf0 : regfile_3p generic map (memtech, IRFBITS, 32, 1, IREGNUM)
        port map (clk, rfi.waddr(IRFBITS-1 downto 0), rfi.wdata, rfi.wren, 
		  clk, rfi.raddr1(IRFBITS-1 downto 0), rfi.ren1, rfo.data1, 
		  rfi.raddr2(IRFBITS-1 downto 0), rfi.ren2, rfo.data2, rfi.diag);

-- cache memory

    cmem0 : cachemem 
    generic map (memtech, icen, irepl, isets, ilinesize, isetsize, isetlock, dcen,
                 drepl, dsets,  dlinesize, dsetsize, dsetlock, dsnoop, ilram,
                 ilramsize, dlram, dlramsize, mmuen) 
    port map (clk, crami, cramo, clk);

-- instruction trace buffer memory

  tbmem_gen : if (tbuf /= 0) generate
    tbmem0 : tbufmem
      generic map (tech => memtech, tbuf => tbuf)
      port map (clk, tbi, tbo);
  end generate;
    
-- FPU

  fpu0 : if (fpu = 0) generate fpo.ldlock <= '0'; fpo.ccv <= '1'; fpo.holdn <= '1'; end generate;

  grfpw0gen : if (fpuarch > 0) and (fpuarch < 8) generate
    fpu0: grfpwx
      generic map (fabtech, FPURFHARD*memtech, (fpuarch-1), pclow, dsu, disas, fpunet, 0)
      port map (rst, clk, holdn, fpi, fpo);
  end generate;

  mfpw0gen : if (fpuarch = 15) generate
    fpu0 : mfpwx
      generic map (FPURFHARD*memtech, pclow, dsu, disas)
      port map (rst, clk, holdn, fpi, fpo);
  end generate;

   grlfpc0gen : if (fpuarch >= 8) and (fpuarch < 15) generate
     fpu0 : grlfpwx
       generic map (FPURFHARD*memtech, pclow, dsu, disas, (fpuarch-8), fpunet)
       port map (rst, clk, holdn, fpi, fpo);
   end generate;

-- Default Co-Proc drivers

  cpodb.data <= zero32;
  cpo <= (zero32, '0', "00", '0', '0', '0', cpodb);
 
-- 1-clock reset delay

  rstreg : process(clk)
  begin if rising_edge(clk) then rst <= rstn; end if; end process;
  
-- pragma translate_off
  bootmsg : report_version 
  generic map (
    "leon3_" & tost(hindex) & ": LEON3 SPARC V8 processor rev " & tost(LEON3_VERSION),
    "leon3_" & tost(hindex) & ": icache " & tost(isets*icen) & "*" & tost(isetsize*icen) &
	" kbyte, dcache "  & tost(dsets*dcen) & "*" & tost(dsetsize*dcen) & " kbyte"
  );
-- pragma translate_on


end;
