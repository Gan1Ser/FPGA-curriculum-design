 LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY SelTube IS
	PORT( M:  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		  B:  OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
END SelTube;

ARCHITECTURE EE OF SelTube IS
BEGIN
	WITH M SELECT
	B <= "100000" WHEN "000",
		 "010000" WHEN "001",
		 "001000" WHEN "010",
		 "000100" WHEN "011",
		 "000010" WHEN "100",
		 "000001" WHEN "101",
		 "000000" WHEN OTHERS;
END EE;