library ieee;
use ieee.std_logic_1164.all;

entity registers is

generic(stages : integer := 3);

-- Overall inputs and outputs
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

architecture Behavioral of registers is
	
	-- Define new types of arrays to hold ADC data and "valid" bits
	type data_array is array ((stages) downto 0) of STD_LOGIC_VECTOR (11 downto 0);
	type valid_array is array ((stages) downto 0) of STD_LOGIC_VECTOR (0 downto 0);
	
	signal DATA_A : data_array := (others => "000000000000");
	signal VALID_A : valid_array := (others => "0");
	
	
begin

	-- Store the two inputs at the start of the arrays as a buffer
	DATA_A(0)  <= input;
	VALID_A(0) <= valid;

	
	-- Generate code to create registers which connect to the previous array values
	g_registers: for i in 1 to (stages) generate
	begin
	
		reg_op: process (clk) is
		begin
			if (rising_edge(clk)) then
				if (enable = '1') then				
					DATA_A(i)  <= DATA_A(i - 1);
					VALID_A(i) <= VALID_A(i - 1);
				end if;
			end if;
		end process;
			
	end generate g_registers;
	
	
	-- Asynchronously return the output of the final registers or 0 if reset is enabled
	rv: process (reset, DATA_A, VALID_A) is
	begin
		if reset = '1' then
			output    <= (others=>'0');
			valid_out <= (others=>'0');
		else
			output    <= DATA_A(stages);
			valid_out <= VALID_A(stages);
		end if;
	end process;
	
end Behavioral;
