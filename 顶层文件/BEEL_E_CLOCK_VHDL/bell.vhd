LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY bell IS
PORT(H_SHI, H_GE, M_SHI,M_GE,S_SHI,S_GE:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	 ALARM_OFF : IN STD_LOGIC;
	 speaker:OUT STD_LOGIC;
	 CLK4 : IN STD_LOGIC);
END bell;

ARCHITECTURE BAV OF bell IS
SIGNAL FLAG: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL alarm_stopped: STD_LOGIC := '0';
BEGIN
	FLAG <= H_SHI&H_GE;
	PROCESS(H_SHI, H_GE, M_SHI,M_GE,S_SHI,S_GE,ALARM_OFF)
	BEGIN
		IF(ALARM_OFF'EVENT AND ALARM_OFF = '1') THEN
			alarm_stopped <= '1'; -- 当检测到 ALARM_OFF 高电平时，设置状态标志
		END IF;
		
		IF(FLAG /= "00000111") THEN
			IF(FLAG /= "0000000" AND M_SHI = "0000" AND M_GE = "0000" AND S_SHI = "0000" AND S_GE = "0000") THEN --00 00 00
				speaker <= '1';
			ELSIF(M_SHI = "0000" AND M_GE = "0000" AND S_SHI = "0000" AND S_GE = "0010") THEN -- 00 00 02
				speaker <= '0';
			ELSE speaker <= '0';
			END IF;
		ELSIF(FLAG = "00000111") THEN
			IF (alarm_stopped = '0') THEN 
				IF S_SHI = "0011" THEN
					speaker <= '0';
				ELSIF(M_SHI = "0000" AND M_GE = "0000" AND S_SHI = "0000") THEN -- 00 00 00
					speaker <= '1';
				ELSE speaker <= '0';
				END IF;
			ELSIF(alarm_stopped = '1') THEN
				speaker <= '0';
			END IF;
		END IF;
	END PROCESS;
END BAV;

