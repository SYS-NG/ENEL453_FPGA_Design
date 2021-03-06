-- --- Seven segment component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( mux_bit : in  STD_LOGIC;
           ave     : in  STD_LOGIC_VECTOR (11 downto 0);
           not_ave : in STD_LOGIC_VECTOR (11 downto 0);
			  output  : out STD_LOGIC_VECTOR (11 downto 0) 
          );
end mux;

architecture Behavioral of mux is

begin

	process(mux_bit, ave, not_ave)
		begin
			if(mux_bit = '0') then
				output(11 downto 0) <= ave(11 downto 0);
			else
				output(11 downto 0) <= not_ave(11 downto 0);
			end if;
	end process;
                          
end Behavioral;