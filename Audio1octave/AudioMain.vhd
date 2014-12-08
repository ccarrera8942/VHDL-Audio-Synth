------------------------------------------------------------------
---- Howard Community College Fall 2014 ENES-245              ----
---- This file is the final draft for the culminating project ----
---- for ENES-245                                             ----
---- Description: Multiplex audio from 8 block memory modules ----
---- so that it sounds like we are playing multiple sounds at ----
---- once. Each audio sample will be triggered by the 8       ----
---- switches on the Papilio. Please note that this project   ----
---- made heavy use of Xilinx IP cores.                       ---- 
---- Date: 2014DEC08                                          ----
---- Current Status: Designing                                ----
---- Christopher M. Carreras                                  ----
------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 	-- Was included in Ch16 audio project
use IEEE.STD_LOGIC_UNSIGNED.ALL;	-- Was included in Ch16 audio project

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AudioMain is
	Port
	(
		CLK			:	IN		STD_LOGIC;
		SWITCH		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
		AUDIO			:	OUT	STD_LOGIC
	);
end AudioMain;

architecture Behavioral of AudioMain is
-------BEGIN SIGNAL DECLARATIONS--------------
signal	count					:	STD_LOGIC_VECTOR(29 DOWNTO 0);
signal	datasig				:	STD_LOGIC_VECTOR(7 downto 0);
signal	anote					:	STD_LOGIC_VECTOR(7 downto 0);
signal 	bnote					:	STD_LOGIC_VECTOR(7 downto 0);
signal	cnote					:	STD_LOGIC_VECTOR(7 downto 0);
signal	dnote					:	STD_LOGIC_VECTOR(7 downto 0);
signal	enote					:	STD_LOGIC_VECTOR(7 downto 0);
signal	fnote					:	STD_LOGIC_VECTOR(7 downto 0);
signal	gnote					:	STD_LOGIC_VECTOR(7 downto 0);
signal	anotehigh			:	STD_LOGIC_VECTOR(7 downto 0);
-------END SIGNAL DECLARATIONS----------------

-------BEGIN COMPONENT DECLARATIONS-----------
	COMPONENT dac8
	PORT(
		Clk : IN std_logic;
		Data : IN std_logic_vector(7 downto 0);          
		PulseStream : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT AudioMultiplexer
	PORT(
		clk : IN std_logic;
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		C : IN std_logic_vector(7 downto 0);
		D : IN std_logic_vector(7 downto 0);
		E : IN std_logic_vector(7 downto 0);
		F : IN std_logic_vector(7 downto 0);
		G : IN std_logic_vector(7 downto 0);
		Ahigh : IN std_logic_vector(7 downto 0);
		audiosource : IN std_logic_vector(7 downto 0);          
		dout : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT counter30
	PORT (
    clk : IN STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)
	);
	END COMPONENT;
	
	COMPONENT Agenerator
	PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT Bgenerator
	PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT Cgenerator
	PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT Dgenerator
	PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT Egenerator
	PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT Fgenerator
	PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT Ggenerator
	PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;
	COMPONENT Ahighgenerator
	PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;
	


-------END COMPONENT DECLARATIONS-------------
begin

	counter30bit : counter30
	PORT MAP (
    clk => CLK,
    q => count
	);

	AudioMux: AudioMultiplexer PORT MAP(
		clk => CLK,
		A => anote,
		B => bnote,
		C => cnote,
		D => dnote,
		E => enote,
		F => fnote,
		G => gnote,
		Ahigh => anotehigh,
		audiosource => SWITCH,
		dout => datasig
		);
		
		Inst_dac8: dac8 PORT MAP(
		Clk => CLK,
		Data => datasig,
		PulseStream => AUDIO
		);

	A : Agenerator
	PORT MAP (
    clka => CLK,
    addra => count(13 downto 7),
    douta => anote
	);

	B : Bgenerator
	PORT MAP (
    clka => CLK,
    addra => count(13 downto 7),
    douta => bnote
	);

	C : Cgenerator
	PORT MAP (
    clka => CLK,
    addra => count(13 downto 7),
    douta => cnote
	);

	D : Dgenerator
	PORT MAP (
    clka => CLK,
    addra => count(13 downto 8),
    douta => dnote
	);

	E : Egenerator
	PORT MAP (
    clka => CLK,
    addra => count(13 downto 7),
    douta => enote
	);

	F : Fgenerator
	PORT MAP (
    clka => CLK,
    addra => count(13 downto 7),
    douta => fnote
	);
  
	G : Ggenerator
	PORT MAP (
    clka => CLK,
    addra => count(13 downto 7),
    douta => gnote
	);
  
	Ahigh : Ahighgenerator
	PORT MAP (
    clka => CLK,
    addra => count(13 downto 7),
    douta => anotehigh
	);
  
  
  
  

end Behavioral;

