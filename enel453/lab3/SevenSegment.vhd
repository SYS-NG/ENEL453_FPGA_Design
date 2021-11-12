-- --- Seven segment component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenSegment is
    Port ( DP_in                                                 : in  STD_LOGIC_VECTOR (5 downto 0);
           Num_Hex0,Num_Hex1,Num_Hex2,Num_Hex3,Num_Hex4,Num_Hex5 : in  STD_LOGIC_VECTOR (3 downto 0);
           HEX0,HEX1,HEX2,HEX3,HEX4,HEX5                         : out STD_LOGIC_VECTOR (7 downto 0)
          );
end SevenSegment;

architecture Behavioral of SevenSegment is

	--Note that component declaration comes after architecture and before begin (common source of error).
   Component SevenSegment_decoder is 
      port(  H     : out STD_LOGIC_VECTOR (7 downto 0);
             input : in  STD_LOGIC_VECTOR (3 downto 0);
             DP    : in  STD_LOGIC                               
          );     
   end  Component;
	
	-- Define new types of array used to index HEX<> and Num_Hex<>
	type hex_array is array (5 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
	type num_hex_array is array (5 downto 0) of STD_LOGIC_VECTOR (3 downto 0);
	
	signal HEX : hex_array;
	signal Num_Hex : num_hex_array;
begin

Num_Hex <= (0 => Num_Hex0, 1 => Num_Hex1, 2 => Num_Hex2, 3 => Num_Hex3, 4 => Num_Hex4, 5 => Num_Hex5);

--Note that port mapping begins after begin (common source of error).
g_decoder: for i in 0 to 5 generate
	begin
		decoder: SevenSegment_decoder port map
												  (H     => Hex(i),
													input => Num_Hex(i),
													DP    => DP_in(i)
													);
	end generate g_decoder;
												
HEX0 <= HEX(0);
HEX1 <= HEX(1);
HEX2 <= HEX(2);
HEX3 <= HEX(3);
HEX4 <= HEX(4);
HEX5 <= HEX(5);
												
end Behavioral;