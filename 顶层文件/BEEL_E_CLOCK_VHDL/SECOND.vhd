LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY SECOND IS
	PORT(CLK1,EN1:   IN  STD_LOGIC;
	     QA:         OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	     CO1:        OUT STD_LOGIC;
	     QB:         OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END SECOND;

ARCHITECTURE CC OF SECOND IS
	SIGNAL COUT2,COUT1:  STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL MM:           STD_LOGIC;
BEGIN
	PROCESS(CLK1,EN1)
	BEGIN
		IF EN1 = '1' THEN
			COUT2 <= "0000";
			COUT1 <= "0000";
		ELSE
			IF (CLK1'EVENT AND CLK1 = '1') THEN
				IF(COUT2 = 5 AND COUT1 = 8) THEN
					MM <= '1';
					COUT1 <= COUT1 + 1;
				ELSIF (COUT2 = 5 AND COUT1 = 9) THEN
					COUT2 <= "0000";
					COUT1 <= "0000";
					MM <= '0';
				ELSIF (COUT1 = 9) THEN
				    COUT2 <= COUT2 + 1;
				    COUT1 <= "0000";
				    MM <= '0';
				ELSE
					COUT2 <= COUT2;
					COUT1 <= COUT1 + 1;
					MM <= '0';
				END IF;
			END IF;
		END IF;
	END PROCESS;
	CO1 <= MM;
	QA <= COUT2;
	QB <= COUT1;
END CC;