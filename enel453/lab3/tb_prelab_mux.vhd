library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_prelab is
end tb_prelab;

architecture test of tb_prelab is

	signal clk, reset, mux_bit : STD_LOGIC;
	signal LEDR : STD_LOGIC_VECTOR (9 downto 0);
	signal HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : STD_LOGIC_VECTOR (7 downto 0);


	-- Clock period definition
	constant clk_period : time := 10 ns;

	component Voltmeter is
		Port	(	clk : in STD_LOGIC;
					reset : in STD_LOGIC;
					mux_bit : in  STD_LOGIC;
					LEDR : out STD_LOGIC_VECTOR (9 downto 0);
					HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out STD_LOGIC_VECTOR (7 downto 0)
				);
	end component;


	begin

	volt_meter : Voltmeter

    port map(
		clk     => clk,
		reset   => reset,
		mux_bit => mux_bit,
		LEDR    => LEDR,
		HEX0    => HEX0,
		HEX1    => HEX1,
		HEX2    => HEX2,
		HEX3    => HEX3,
		HEX4    => HEX4,
		HEX5    => HEX5
	);


	-- Clock process definitions
	clk_process : process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;


	-- Stimulus process
	stim_process : process
	begin
		reset <= '1';
		wait for 5 * clk_period;
		reset <= '0';
		wait;
	end process;
	
	-- Mux process
	mux_process : process
	begin
		mux_bit <= '0';
		wait for 500 * clk_period;
		mux_bit <= '1';
		wait for 500 * clk_period;
	end process;

end;
