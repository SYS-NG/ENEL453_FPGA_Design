-- --- Seven segment component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_dis is
    Port ( mux_bit_dis : in  STD_LOGIC;
           distance    : in  STD_LOGIC_VECTOR(12 downto 0);
           voltage     : in  STD_LOGIC_VECTOR(12 downto 0);
			  output      : out STD_LOGIC_VECTOR(12 downto 0) 
          );
end mux_dis;

architecture Behavioral of mux_dis is

begin

	process(mux_bit_dis)
		begin
			if(mux_bit_dis = '1') then
				output(12 downto 0) <= distance(12 downto 0);
			else
				output(12 downto 0) <= voltage(12 downto 0);
			end if;
	end process;
                          
end Behavioral;