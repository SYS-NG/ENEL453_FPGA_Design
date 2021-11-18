library ieee;
use ieee.std_logic_1164.all;

entity sync is

generic(stages : integer := 3);

port( 
	  clk       : in  std_logic;
	  reset     : in  std_logic;
	  enable    : in  std_logic;
	  valid     : in  STD_LOGIC_VECTOR(0 downto 0);
	  input     : in  STD_LOGIC_VECTOR (11 downto 0);
	  valid_out : out STD_LOGIC_VECTOR(0 downto 0);
	  output    : out  STD_LOGIC_VECTOR (11 downto 0)	
    );
end entity;

architecture Behavioral of sync is
	
	-- Define new types of array used to index DATA_A<> and VALID_A<>
	type data_array is array ((stages - 1) downto 0) of STD_LOGIC_VECTOR (11 downto 0);
	type valid_array is array ((stages - 1) downto 0) of STD_LOGIC_VECTOR (0 downto 0);
	
	signal DATA_A : data_array;
	signal VALID_A : valid_array;
	
	
begin
	
	process (clk, reset, enable, valid, input)
	begin
	
		if reset = '1' then
		   output <= (others=>'0');
		elsif (rising_edge(clk)) then
		   --if (enable = '1') then				
				for i in (stages - 1) downto 1 loop
					DATA_A(i)  <= DATA_A(i - 1);
					VALID_A(i) <= VALID_A(i - 1); 	
				end loop;
				
				DATA_A(0) <= input;
				VALID_A(0) <= valid;
			--end if;
      end if;
		
		valid_out <= VALID_A(stages - 1);
		output <= DATA_A(stages - 1);
		
	end process;

end Behavioral;
