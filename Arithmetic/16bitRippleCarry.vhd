library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_16bit is
    Port (
        A         : in  STD_LOGIC_VECTOR (15 downto 0);
        B         : in  STD_LOGIC_VECTOR (15 downto 0);
        SUM       : out STD_LOGIC_VECTOR (15 downto 0);
        CARRY_OUT : out STD_LOGIC
    );
end adder_16bit;

architecture Structural of adder_16bit is

    component full_adder
        Port (
            a         : in  STD_LOGIC;
            b         : in  STD_LOGIC;
            cin       : in  STD_LOGIC;
            sum       : out STD_LOGIC;
            carry_out : out STD_LOGIC
        );
    end component;

    signal carry : STD_LOGIC_VECTOR(16 downto 0);
    
begin

    carry(0) <= '0';

    FA0: full_adder port map(a => A(0), b => B(0), cin => carry(0), sum => SUM(0), carry_out => carry(1));
    FA1: full_adder port map(a => A(1), b => B(1), cin => carry(1), sum => SUM(1), carry_out => carry(2));
    FA2: full_adder port map(a => A(2), b => B(2), cin => carry(2), sum => SUM(2), carry_out => carry(3));
    FA3: full_adder port map(a => A(3), b => B(3), cin => carry(3), sum => SUM(3), carry_out => carry(4));
    FA4: full_adder port map(a => A(4), b => B(4), cin => carry(4), sum => SUM(4), carry_out => carry(5));
    FA5: full_adder port map(a => A(5), b => B(5), cin => carry(5), sum => SUM(5), carry_out => carry(6));
    FA6: full_adder port map(a => A(6), b => B(6), cin => carry(6), sum => SUM(6), carry_out => carry(7));
    FA7: full_adder port map(a => A(7), b => B(7), cin => carry(7), sum => SUM(7), carry_out => carry(8));
    FA8: full_adder port map(a => A(8), b => B(8), cin => carry(8), sum => SUM(8), carry_out => carry(9));
    FA9: full_adder port map(a => A(9), b => B(9), cin => carry(9), sum => SUM(9), carry_out => carry(10));
    FA10: full_adder port map(a => A(10), b => B(10), cin => carry(10), sum => SUM(10), carry_out => carry(11));
    FA11: full_adder port map(a => A(11), b => B(11), cin => carry(11), sum => SUM(11), carry_out => carry(12));
    FA12: full_adder port map(a => A(12), b => B(12), cin => carry(12), sum => SUM(12), carry_out => carry(13));
    FA13: full_adder port map(a => A(13), b => B(13), cin => carry(13), sum => SUM(13), carry_out => carry(14));
    FA14: full_adder port map(a => A(14), b => B(14), cin => carry(14), sum => SUM(14), carry_out => carry(15));
    FA15: full_adder port map(a => A(15), b => B(15), cin => carry(15), sum => SUM(15), carry_out => carry(16));

    CARRY_OUT <= carry(16);

end Structural;
