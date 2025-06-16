library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_2bit is
    Port (
        a         : in  STD_LOGIC_VECTOR (1 downto 0);
        b         : in  STD_LOGIC_VECTOR (1 downto 0);
	cin       : in  STD_LOGIC;
        sum       : out STD_LOGIC_VECTOR (1 downto 0);
        carry_out : out STD_LOGIC
    );
end adder_2bit;

architecture Structural of adder_2bit is

    component full_adder
        Port (
            a         : in  STD_LOGIC;
            b         : in  STD_LOGIC;
            cin       : in  STD_LOGIC;
            sum       : out STD_LOGIC;
            carry_out : out STD_LOGIC
        );
    end component;

    signal carry : STD_LOGIC_VECTOR(1 downto 0);
    
begin

    FA0: full_adder port map(a => a(0), b => b(0), cin => cin, sum => sum(0), carry_out => carry(0));
    FA1: full_adder port map(a => a(1), b => b(1), cin => carry(0), sum => sum(1), carry_out => carry(1));
    carry_out <= carry(1);

end Structural;