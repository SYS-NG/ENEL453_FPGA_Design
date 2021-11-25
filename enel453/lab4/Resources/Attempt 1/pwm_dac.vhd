library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity PWM_DAC is
   Generic ( width : integer := 10);
   Port    (
			    clk        : in STD_LOGIC;
				 reset      : in STD_LOGIC;
				 count_ena  : in STD_LOGIC;
             duty_cycle : in STD_LOGIC_VECTOR (width-1 downto 0);
             dac_out    : out STD_LOGIC
           );
end PWM_DAC;

architecture Behavioral of PWM_DAC is
   signal counter : unsigned (width-1 downto 0);
       
begin
   count : process(clk,reset)
   begin
       if (reset = '1') then
			  counter <= (others => '0');
       elsif (rising_edge(clk)) and (count_ena = '1') then
			  counter <= counter + 1;
       end if;
   end process;
 
   compare : process(counter, duty_cycle)
   begin    
       if (counter < unsigned(duty_cycle)) then
           dac_out <= '1';
       else 
           dac_out <= '0';
       end if;
   end process;
  
end Behavioral;

