library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        a        : in  STD_LOGIC;
        b        : in  STD_LOGIC;
        cin      : in  STD_LOGIC;
        sum      : out STD_LOGIC;
        carry_out: out STD_LOGIC
    );
end full_adder;

architecture Structural of full_adder is
    signal s1, c1, c2 : STD_LOGIC;

    component half_adder
        Port (
            a     : in  STD_LOGIC;
            b     : in  STD_LOGIC;
            sum   : out STD_LOGIC;
            carry : out STD_LOGIC
        );
    end component;

begin
    HA1: half_adder port map(a => a, b => b, sum => s1, carry => c1);
    HA2: half_adder port map(a => s1, b => cin, sum => sum, carry => c2);
    carry_out <= c1 OR c2;
end Structural;
