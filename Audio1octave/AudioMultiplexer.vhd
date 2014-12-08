----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:54:04 12/01/2014 
-- Design Name: 
-- Module Name:    AudioMultiplexer - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AudioMultiplexer is
    Port ( clk 				: in  STD_LOGIC;
   --      audiochannel 	: out  STD_LOGIC_VECTOR (1 downto 0);
           A 					: in  STD_LOGIC_VECTOR(7 downto 0);
           B 					: in  STD_LOGIC_VECTOR(7 downto 0);
           C 					: in  STD_LOGIC_VECTOR(7 downto 0);
           D 					: in  STD_LOGIC_VECTOR(7 downto 0);
			  E 					: in  STD_LOGIC_VECTOR(7 downto 0);
			  F 					: in  STD_LOGIC_VECTOR(7 downto 0);
			  G 					: in  STD_LOGIC_VECTOR(7 downto 0);
			  Ahigh				: in  STD_LOGIC_VECTOR(7 downto 0);
   --      counter 			: in  STD_LOGIC_VECTOR (29 downto 0);
           audiosource		: in  STD_LOGIC_VECTOR (7 downto 0); -- these will be the switches
			  dout				: out STD_LOGIC_VECTOR (7 downto 0));
end AudioMultiplexer;

architecture Behavioral of AudioMultiplexer is
	signal 	seconds			:	STD_LOGIC_VECTOR(2 downto 0)	:= (others=>'0');
	signal	count				:	STD_LOGIC_VECTOR(29 downto 0)	:= (others=>'0');
	signal	wave1				: 	STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal	wave2				: 	STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal	wave3				: 	STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal	wave4				: 	STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal	wave5				: 	STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal	wave6				: 	STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal	wave7				: 	STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal	wave8				: 	STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	
begin

audiomux_proc: process(clk)
	begin
		if rising_edge(clk) then
			count <= count + 1;
			if (count = 319) then
				seconds <= seconds + 1;
				count <= (others=> '0');
			end if;
			
			------------------1
			if (audiosource(0) = '1') then
				wave1 <= A;
			else
				wave1 <= (others=>'0');
			end if;
			------------------2
			if (audiosource(1) = '1') then
				wave2 <= B;
			else
				wave2 <= (others=>'0');
			end if;
			------------------3
			if (audiosource(2) = '1') then
				wave3 <= C;
			else
				wave3 <= (others=>'0');
			end if;
			-----------------4
			if (audiosource(3) = '1') then
				wave4 <= D;
			else
				wave4 <= (others=>'0');
			end if;
			-----------------5
			if (audiosource(4) = '1') then
				wave5 <= E;
			else
				wave5 <= (others=>'0');
			end if;
			-----------------6
			if (audiosource(5) = '1') then
				wave6 <= F;
			else
				wave6 <= (others=>'0');
			end if;
			-----------------7
			if (audiosource(6) = '1') then
				wave7 <= G;
			else
				wave7 <= (others=>'0');
			end if;
			-----------------8
			if (audiosource(7) = '1') then
				wave8 <= Ahigh;
			else
				wave8 <= (others=>'0');
			end if;
			-----------------
			
			
			
			CASE seconds IS
				WHEN "000" =>
						dout <= wave1; --A
				WHEN "001" =>
						dout <= wave2; --B
				WHEN "010" =>
						dout <= wave3; --C
				WHEN "011" =>
						dout <= wave4; --D
				WHEN "100" =>
						dout <= wave5; --E
				WHEN "101" =>
						dout <= wave6; --F
				WHEN "110" =>
						dout <= wave7; --G
				WHEN OTHERS =>
						dout <= wave8; --A
			END CASE;
		end if;
	end process;

end Behavioral;

