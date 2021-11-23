LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY distance2downcount IS
   PORT(
      clk            :  IN    STD_LOGIC;                                
      reset          :  IN    STD_LOGIC;		                         
      distance       :  IN    STD_LOGIC_VECTOR(12 DOWNTO 0);
		zero           :  OUT   STD_LOGIC
		);
END distance2downcount;

ARCHITECTURE behavior OF distance2downcount IS

	signal counter       : natural := 1;
	signal counter_limit : natural;

begin
	
	determine_limit: process (clk, distance) is
	begin
		if rising_edge(clk) then
			if to_integer(unsigned(distance)) >= 3300 then
				counter_limit <= 200;	
			elsif to_integer(unsigned(distance)) <= 0 then
				counter_limit <= 50;
			else
				counter_limit <= to_integer(unsigned(distance) * 150 / 3300) + 50;
			end if;
		end if;
		
	end process;
	
	
	downcount: process (clk, reset, counter_limit) is
	begin
		if rising_edge(clk) then
			if reset = '1' then
				counter <= 0;
				zero <= '0';
			else
				if counter >= counter_limit then
					counter <= 0;
					zero <= '1';
				else
					counter <= counter - 1;
					zero <= '0';
				end if;
			end if;
		end if;
	end process;
				
end behavior;
