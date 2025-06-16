library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench for 16-bit ripple carry subtractor implemented using a hierarchy of full and half adders.
entity tb_subtractor_16bit is
end tb_subtractor_16bit;

architecture Behavioral of tb_subtractor_16bit is
    signal A, B, SUM : STD_LOGIC_VECTOR(15 downto 0);
    signal CARRY_OUT : STD_LOGIC;

    component subtractor_16bit
        Port (
            A         : in  STD_LOGIC_VECTOR (15 downto 0);
            B         : in  STD_LOGIC_VECTOR (15 downto 0);
            SUM       : out STD_LOGIC_VECTOR (15 downto 0);
            CARRY_OUT : out STD_LOGIC
        );
    end component;

begin
    UUT: subtractor_16bit
        port map (
            A => A,
            B => B,
            SUM => SUM,
            CARRY_OUT => CARRY_OUT
        );

    process
    begin
        A <= x"0001"; B <= x"0001"; wait for 10 ns;
	assert SUM = x"0000" and CARRY_OUT = '1'
	    report "Test 1 failed" severity failure;
        A <= x"0002"; B <= x"0003"; wait for 10 ns;
	assert SUM = x"FFFF" and CARRY_OUT = '0'
	    report "Test 2 failed" severity failure;
        wait;
    end process;
end Behavioral;