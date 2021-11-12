-- --- Seven segment component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_ave is
    Port ( mux_bit_ave : in  STD_LOGIC;
           ave     : in  STD_LOGIC_VECTOR (11 downto 0);
           not_ave : in STD_LOGIC_VECTOR (11 downto 0);
			  output  : out STD_LOGIC_VECTOR (11 downto 0) 
          );
end mux_ave;

architecture Behavioral of mux_ave is

begin

	process(mux_bit_ave)
		begin
			if(mux_bit_ave = '1') then
				output(11 downto 0) <= ave(11 downto 0);
			else
				output(11 downto 0) <= not_ave(11 downto 0);
			end if;
	end process;
                          
end Behavioral;