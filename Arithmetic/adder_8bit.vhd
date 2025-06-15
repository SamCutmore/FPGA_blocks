library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_8bit is
    Port (
        A         : in  STD_LOGIC_VECTOR (7 downto 0);
        B         : in  STD_LOGIC_VECTOR (7 downto 0);
	Cin	  : in  STD_LOGIC;
        SUM       : out STD_LOGIC_VECTOR (7 downto 0);
        CARRY_OUT : out STD_LOGIC
    );
end adder_8bit;

architecture Structural of adder_8bit is

    component adder_4bit
        Port (
            a         : in  STD_LOGIC_VECTOR (3 downto 0);
            b         : in  STD_LOGIC_VECTOR (3 downto 0);
            cin       : in  STD_LOGIC;
            sum       : out STD_LOGIC_VECTOR (3 downto 0);
            carry_out : out STD_LOGIC
        );
    end component;

    signal carry : STD_LOGIC_VECTOR(1 downto 0);
    
begin

    FA0: adder_4bit port map(a => A(3 downto 0), b => B(3 downto 0), cin => Cin, sum => SUM(3 downto 0), carry_out => carry(0));
    FA1: adder_4bit port map(a => A(7 downto 4), b => B(7 downto 4), cin => carry(0), sum => SUM(7 downto 4), carry_out => carry(1));

    CARRY_OUT <= carry(1);

end Structural;