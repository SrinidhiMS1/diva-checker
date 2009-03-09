---------------------------------------------------------------------------
-- Company     : ARMades Systems
-- Author(s)   : Fabien Marteau <fabien.marteau@armadeus.com>
-- 
-- Creation Date : 08/03/2009
-- File          : queue.vhd
--
-- Abstract : 
--
---------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
library gaisler;
use gaisler.libchecker.all;

package queue is

component connector_queue is
  generic (
    queueSize : integer := 5            -- number of spaces in the queue
  );
  port (
    clk    : in  std_ulogic;            -- AMBA and processor clock
    holdn  : in  std_ulogic;            -- hold line
    elmti  : in  checker_info_in_type;  -- register file outputs
    elmto  : out checker_info_in_type   -- cache ram output
  );
end component;

end;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
library gaisler;
use gaisler.libchecker.all;

entity connector_queue is
  generic (
    queueSize : integer := 5            -- number of spaces in the queue
  );
  port (
    clk    : in  std_ulogic;            -- AMBA and processor clock
    holdn  : in  std_ulogic;            -- hold line
    elmti  : in  checker_info_in_type;  -- register file outputs
    elmto  : out checker_info_in_type   -- cache ram output
  );
end;

architecture rtl of connector_queue is

  type QUEUE is array (queueSize downto 0) of checker_info_in_type;

  signal pipe : QUEUE;

begin

  q1 : process (clk, holdn)

  begin 
      if rising_edge(clk) and (holdn = '1') then

          pipe(queueSize) <= elmti;

          for i in queueSize-1 downto 0 loop
            pipe(i) <= pipe(i+1);
          end loop;

          elmto <= pipe(0);

      end if;
  end process;

end;
