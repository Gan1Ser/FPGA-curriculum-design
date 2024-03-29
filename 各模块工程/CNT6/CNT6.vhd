LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CNT6 IS
	PORT(CLK5 :IN STD_LOGIC;
	     N:    OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END CNT6;

ARCHITECTURE SM OF CNT6 IS
	SIGNAL cnt: STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
	PROCESS(CLK5)
		BEGIN
			IF CLK5'EVENT AND CLK5='1'THEN
				cnt <=cnt+1;
				IF	(cnt = 5) THEN
					cnt <= "000";
				END IF;
			END IF;
	END PROCESS;
	N <= cnt;
END SM;