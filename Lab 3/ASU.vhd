LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ASU IS 
	PORT(		Cin   : IN        STD_LOGIC;
				X, Y	: IN 			STD_LOGIC_VECTOR(3 DOWNTO 0);
				S		: OUT			STD_LOGIC_VECTOR(3 DOWNTO 0);
				neg	: BUFFER    STD_LOGIC;
				Cout	: OUT		   STD_LOGIC);
	END ASU;
	
	ARCHITECTURE Behaviour OF ASU IS 
		SIGNAL Result : STD_LOGIC_VECTOR(4 DOWNTO 0);
	BEGIN
		PROCESS(Cin, X, Y, neg)
		BEGIN 
			IF(Cin ='0') THEN 
					Result <= ('0' & X) + ('0' & Y);
				neg <= '0';
				Cout <= Result(4);
				S <= Result(3 DOWNTO 0);
			ELSE 
				Result <= ('0' & X) - ('0' & Y);
				neg <= Result(4);
				Cout <= Result(4);
				IF(neg = '1')THEN 
					S <= not(Result(3 DOWNTO 0) - 1);
				ELSE 
					S <= Result(3 DOWNTO 0);
				END IF;
			END IF;
		END PROCESS;
	END Behaviour;
