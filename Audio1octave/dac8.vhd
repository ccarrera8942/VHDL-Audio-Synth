----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:42 10/13/2014 
-- Design Name: 
-- Module Name:    dac8 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dac8 is
    Port ( Clk : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (7 downto 0);
           PulseStream : out  STD_LOGIC);
end dac8;

architecture Behavioral of dac8 is
	signal sum	:	STD_LOGIC_VECTOR (8 downto 0);
begin
	PulseStream <= sum(8);
	
	process	(Clk, sum)
	begin
		if rising_edge(Clk) then
			sum <= ("0" & sum(7 downto 0)) + ("0" &Data);
		end if;
	end process;


end Behavioral;

