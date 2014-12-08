
-- VHDL Instantiation Created from source file AudioMultiplexer.vhd -- 17:22:29 12/03/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_AudioMultiplexer: AudioMultiplexer PORT MAP(
		clk => ,
		A => ,
		B => ,
		C => ,
		D => ,
		E => ,
		F => ,
		G => ,
		Ahigh => ,
		audiosource => ,
		dout => 
	);


