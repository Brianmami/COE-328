LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

Entity C IS 
PORT (
s : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
L : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
end C;

ARCHITECTURE Behaviour OF C IS 
BEGIN 
L(3) <= not s(0) and not s(1) and s(2);
L(2) <= not s(0) and not s(1) and not s(2);
L(1) <= (not s(0) and s(3)) or (s(0) and s(2));
L(0) <= (not s(1) and s(2)) or (s(1) and not s(2)) or (not s(0) and not s(3));
END Behaviour;

