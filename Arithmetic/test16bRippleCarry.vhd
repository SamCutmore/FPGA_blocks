library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench for 16-bit ripple carry adder implemented using a hierarchy of full and half adders.
entity tb_adder_16bit is
end tb_adder_16bit;

architecture Behavioral of tb_adder_16bit is
    signal A, B, SUM : STD_LOGIC_VECTOR(15 downto 0);
    signal CARRY_OUT : STD_LOGIC;

    component adder_16bit
        Port (
            A         : in  STD_LOGIC_VECTOR (15 downto 0);
            B         : in  STD_LOGIC_VECTOR (15 downto 0);
	    cin       : in  STD_LOGIC;
            SUM       : out STD_LOGIC_VECTOR (15 downto 0);
            CARRY_OUT : out STD_LOGIC
        );
    end component;

begin
    UUT: adder_16bit
        port map (
            A => A,
            B => B,
	    Cin =>'0',
            SUM => SUM,
            CARRY_OUT => CARRY_OUT
        );

    process
    begin
        A <= x"0001"; B <= x"0001"; wait for 10 ns;
	assert SUM = x"0002" and CARRY_OUT = '0'
	    report "Test 1 failed" severity failure;
        A <= x"7FFF"; B <= x"0001"; wait for 10 ns;
	assert SUM = x"8000" and CARRY_OUT = '0'
	    report "Test 2 failed" severity failure;
        A <= x"FFFF"; B <= x"0001"; wait for 10 ns;
	assert SUM = x"0000" and CARRY_OUT = '1'
	    report "Test 3 failed" severity failure;
        A <= x"8000"; B <= x"8000"; wait for 10 ns;
	assert SUM = x"0000" and CARRY_OUT = '1'
	    report "Test 4 failed" severity failure;
        wait;
    end process;
end Behavioral;
