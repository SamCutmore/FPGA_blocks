library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_16bit is
    Port (
        A         : in  STD_LOGIC_VECTOR (15 downto 0);
        B         : in  STD_LOGIC_VECTOR (15 downto 0);
	Cin	  : in  STD_LOGIC;
        SUM       : out STD_LOGIC_VECTOR (15 downto 0);
        CARRY_OUT : out STD_LOGIC
    );
end adder_16bit;

architecture Structural of adder_16bit is

    component adder_8bit
        Port (
            a         : in  STD_LOGIC_VECTOR (7 downto 0);
            b         : in  STD_LOGIC_VECTOR (7 downto 0);
            cin       : in  STD_LOGIC;
            sum       : out STD_LOGIC_VECTOR (7 downto 0);
            carry_out : out STD_LOGIC
        );
    end component;

    signal carry : STD_LOGIC_VECTOR(1 downto 0);
    
begin

    eightBitAdder0: adder_8bit port map(a => A(7 downto 0), b => B(7 downto 0), cin => Cin, sum => SUM(7 downto 0), carry_out => carry(0));
    eightBitAdder1: adder_8bit port map(a => A(15 downto 8), b => B(15 downto 8), cin => carry(0), sum => SUM(15 downto 8), carry_out => carry(1));
    CARRY_OUT <= carry(1);

end Structural;