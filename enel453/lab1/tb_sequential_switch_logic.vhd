-- --- from lab instructions pages 9 to 11
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_sequential_switch_logic IS
END tb_sequential_switch_logic;

ARCHITECTURE behavior OF tb_sequential_switch_logic IS

-- Component Declaration for the UUT

    COMPONENT switch_logic
    PORT(
        switches_inputs : IN std_logic_vector(2 downto 0);
        outputs : OUT std_logic_vector(2 downto 0);
        clk : IN std_logic;
        reset : IN std_logic
    );
    END COMPONENT;
    
    --Inputs
	 signal clk : std_logic;
	 signal reset: std_logic;
    signal switches_inputs : std_logic_vector(2 downto 0) := (others => '0');
    
    --Outputs
    signal outputs : std_logic_vector(2 downto 0);
    
    BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: switch_logic PORT MAP (
        switches_inputs => switches_inputs,
        outputs => outputs,
        clk => clk,
        reset => reset
    );
	 
    
    -- Stimulus process here
    -- Stimulus process 
   clk_process: process 
		-- Clock period definition
		constant clk_period: time:= 10 ns;
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;
	 
   stim_proc: process
   begin
      -- hold reset state for 42.5 ns.
		-- to show only updates on rising edges
      wait for 42.5 ns;

      -- Set all inputs to 0
      switches_inputs <= "000";
		reset <= '0';
		-- Add more tests to comprehensively test the circuit

      wait for 50 ns;

      switches_inputs <= "001";

		wait for 50 ns;

      switches_inputs <= "010";

		wait for 50 ns;

      switches_inputs <= "011";

		wait for 50 ns;

      switches_inputs <= "100";

		wait for 50 ns;
		
      switches_inputs <= "101";

		wait for 50 ns;

      switches_inputs <= "110";

		wait for 50 ns;

      switches_inputs <= "111";

		wait for 50 ns;
		
		wait;	-- Keeps it from restarting
	end process;

END;