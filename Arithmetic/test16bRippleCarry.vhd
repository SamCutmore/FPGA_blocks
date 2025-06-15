-- test16bRippleCarry.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_adder_16bit is
end tb_adder_16bit;

architecture Behavioral of tb_adder_16bit is
    signal A, B, SUM : STD_LOGIC_VECTOR(15 downto 0);
    signal CARRY_OUT : STD_LOGIC;

    component adder_16bit
        Port (
            A         : in  STD_LOGIC_VECTOR (15 downto 0);
            B         : in  STD_LOGIC_VECTOR (15 downto 0);
            SUM       : out STD_LOGIC_VECTOR (15 downto 0);
            CARRY_OUT : out STD_LOGIC
        );
    end component;

begin
    UUT: adder_16bit
        port map (
            A => A,
            B => B,
            SUM => SUM,
            CARRY_OUT => CARRY_OUT
        );

    process
    begin
        A <= x"0001"; B <= x"0001"; wait for 10 ns;
        A <= x"7FFF"; B <= x"0001"; wait for 10 ns;
        A <= x"FFFF"; B <= x"0001"; wait for 10 ns;
        A <= x"8000"; B <= x"8000"; wait for 10 ns;
        wait;
    end process;
end Behavioral;
