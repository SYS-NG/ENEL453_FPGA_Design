-- averages 16 samples
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.log2;

entity averager is
	port (
		  clk   : in  std_logic;
		  EN    : in  std_logic;
		  reset : in  std_logic;
		  Din   : in  std_logic_vector(11 downto 0);
		  Q     : out std_logic_vector(11 downto 0));
	end averager;

architecture rtl of averager is

	-- Clock period definition
	constant n : integer := 64;
	
	-- "Shift left factor" for dividing at the end
	signal n_copy : std_logic_vector(16 downto 0);
	signal slf : integer := integer(log2(real(n)));
	
	
	-- Create an array to store binary data
	type t_data is array (0 to (n - 1)) of std_logic_vector(11 downto 0);
	
	signal data : t_data := (others => "000000000000");
	
	-- Create an array to store temporary integers
	type t_temp is array (0 to (n - 1)) of integer;
	
	signal temp : t_temp := (others => 0);

	
	-- Final return value
	signal rv : std_logic_vector((12 + n) downto 0);

	
begin

	shift_reg : process(clk, reset)
		begin
			if(reset = '1') then
				
				for i in 0 to (n - 1) loop
					data(i) <= (others => '0');
				end loop;
				
				Q <= (others => '0');
				
			elsif rising_edge(clk) then
				if EN = '1' then
					for i in (n - 1) downto 1 loop
						data(i) <= data(i - 1);
					end loop;
					
					data(0) <= Din;
					
					Q <= rv((slf + 11) downto slf);
				end if;
			end if;
		end process shift_reg;
		
		
	sum: process(temp)
		begin
			temp(0) <= to_integer(unsigned(data(0)));

			for i in 1 to (n - 1) loop
				temp(i) <= temp(i - 1) + to_integer(unsigned(data(i)));
			end loop;

			rv <= std_logic_vector(to_unsigned(temp(n - 1), rv'length)); 
		end process sum;
		
end rtl;
