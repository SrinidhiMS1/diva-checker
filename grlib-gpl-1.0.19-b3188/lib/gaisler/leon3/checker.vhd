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
-- Entity: 	checker
-- File:	checker.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	LEON3 checker with pipeline, mul/div & cache control
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;

library gaisler;
use gaisler.leon3.all;
use gaisler.libiu.all;
use gaisler.libcache.all;
use gaisler.arith.all;
--library fpu;
--use fpu.libfpu.all;

entity checker is
  generic (
    hindex    : integer               := 0;     -- AHB Master Index
    fabtech   : integer range 0 to NTECH  := 0; -- Target Technology
    memtech   : integer range 0 to NTECH  := 0; -- Vendor library for regfile and cahe RAMs
    nwindows  : integer range 2 to 32 := 8;     -- number of SPARC register windows
    dsu       : integer range 0 to 1  := 0;     -- enable Debug Support Unit interface
    fpu       : integer range 0 to 15 := 0;     -- Floating Point Unit
    v8        : integer range 0 to 63 := 0;     -- Generate SPARC V8 MUL and DIV instructions
    cp        : integer range 0 to 1  := 0;     -- Generate co-processor interface
    mac       : integer range 0 to 1  := 0;     -- Generate SPARC V8c SMAC/UMAC instruction
    pclow     : integer range 0 to 2  := 2;     -- Least significant bit of PC that is actually generated
    notag     : integer range 0 to 1  := 0;     -- Not used
    nwp       : integer range 0 to 4  := 0;     -- Number of watchpoints
    icen      : integer range 0 to 1  := 0;     -- Enable Instruction Cache
    irepl     : integer range 0 to 2  := 2;     -- Instruction cache replacement policy
    isets     : integer range 1 to 4  := 1;     -- number of instruction cache sets
    ilinesize : integer range 4 to 8  := 4;     -- instruction cache line size
    isetsize  : integer range 1 to 256 := 1;    -- size of each instruction cache set
    isetlock  : integer range 0 to 1  := 0;     -- enable instruction cache line locking
    dcen      : integer range 0 to 1  := 0;     -- data cache enable
    drepl     : integer range 0 to 2  := 2;     -- data cache replacement policy
    dsets     : integer range 1 to 4  := 1;     -- number of data cache sets
    dlinesize : integer range 4 to 8  := 4;     -- data cache line size
    dsetsize  : integer range 1 to 256 := 1;    -- size of each data cache set
    dsetlock  : integer range 0 to 1  := 0;     -- enable data cache line locking
    dsnoop    : integer range 0 to 6  := 0;     -- enable data cache snooping
    ilram      : integer range 0 to 1 := 0;     -- enable local instruction RAM
    ilramsize  : integer range 1 to 512 := 1;   -- local instruction RAM size
    ilramstart : integer range 0 to 255 := 16#8e#;  -- 8 MSB bits used to decode local instruction RAM area
    dlram      : integer range 0 to 1 := 0;     -- enable local data RAM (scratch-pad RAM)
    dlramsize  : integer range 1 to 512 := 1;   -- local data RAM size
    dlramstart : integer range 0 to 255 := 16#8f#;  -- 8 MSB bits used to decode local instruction RAM area
    mmuen     : integer range 0 to 1  := 0;     -- enable MMU
    itlbnum   : integer range 2 to 64 := 8;     -- number of instruction TLB entries
    dtlbnum   : integer range 2 to 64 := 8;     -- number of data TLB entries
    tlb_type  : integer range 0 to 3 := 1;      -- TLB type
    tlb_rep   : integer range 0 to 1 := 0;      -- TLB replacement
    lddel     : integer range 1 to 2 := 2;      -- load delay
    disas     : integer range 0 to 2  := 0;     -- print instruction disassembly in VHDL simulator console
    tbuf      : integer range 0 to 64 := 0;     -- size of instruction trace buffer
    pwd      : integer range 0 to 2 := 0;       -- power-down
    svt      : integer range 0 to 1 := 0;       -- single-vector trapping
    rstaddr  : integer              := 0;       -- default reset start address
    smp      : integer range 0 to 15 := 0;      -- support SMP systems
    cached   : integer := 0;                    -- fixed cacheability mask
    clk2x    : integer := 0;                    -- enable processor clock in 2x mode
    scantest : integer := 0                     -- enable scan test support
  );
  port (
    clk    : in  std_ulogic;            -- AMBA and processor clock
    rstn   : in  std_ulogic;            -- reset
    holdn  : out std_ulogic;            -- hold line
    rfo    : in  iregfile_out_type;     -- register file outputs
    tbo    : in  tracebuf_out_type;     -- trace buffer output
    fpo    : in  fpc_out_type;
    cpo    : in  fpc_out_type;
    irqi   : in  l3_irq_in_type;
    dbgi   : in  l3_debug_in_type;
    dbgo   : out l3_debug_out_type;
    hclk, sclk   : in std_ulogic;
    hclken   : in std_ulogic    
  );
end; 

architecture rtl of checker is

constant IRFWT    : integer := regfile_3p_write_through(memtech);

signal ici : icache_in_type;
signal ico : icache_out_type;
signal dci : dcache_in_type;
signal dco : dcache_out_type;

signal holdnx, pholdn : std_logic;
signal muli  : mul32_in_type;
signal mulo  : mul32_out_type;
signal divi  : div32_in_type;
signal divo  : div32_out_type;
signal tbiTemp   : tracebuf_in_type;
signal rfiTemp   : iregfile_in_type;
signal fpiTemp   : fpc_in_type;
signal cpiTemp   : fpc_in_type;
signal irqoTemp  : l3_irq_out_type;

begin

  holdnx <= ico.hold and dco.hold and fpo.holdn; holdn <= holdnx;
  pholdn <= fpo.holdn;

-- integer unit 

     iu0 : iu3  
       generic map (nwindows, isets, dsets, fpu, v8, cp, mac, dsu, nwp, pclow,
	 0, hindex, lddel, IRFWT, disas, tbuf, pwd, svt, rstaddr, smp, fabtech, clk2x)
       port map (clk, rstn, holdnx, ici, ico, dci, dco, rfiTemp, rfo, irqi, irqoTemp, 
                 dbgi, dbgo, muli, mulo, divi, divo, fpo, fpiTemp, cpo, cpiTemp, tbo, tbiTemp, sclk);

-- multiply and divide units 
-- Actel FPGAs cannot use inferred mul due to bug in synplify 8.9 and 9.0

  mgen : if v8 /= 0 generate
   mgen2 : if (fabtech = axcel) or (fabtech = apa3) generate
    mul0 : mul32 generic map (0, v8/16, (v8 mod 4)/2, mac)
	    port map (rstn, clk, holdnx, muli, mulo);
   end generate;
   mgen3 : if not ((fabtech = axcel) or (fabtech = apa3)) generate
    mul0 : mul32 generic map (is_fpga(fabtech), v8/16, (v8 mod 4)/2, mac)
	    port map (rstn, clk, holdnx, muli, mulo);
   end generate;
    div0 : div32 port map (rstn, clk, holdnx, divi, divo);
  end generate;
  nomgen : if v8 = 0 generate
    divo <= ('0', '0', "0000", zero32);
    mulo <= ('0', '0', "0000", zero32&zero32);
  end generate;

end;
