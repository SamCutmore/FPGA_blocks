library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Perform two's complement A - B = A + notB + 1
entity subtractor_16bit is
    Port (
        A         : in  STD_LOGIC_VECTOR (15 downto 0);
        B         : in  STD_LOGIC_VECTOR (15 downto 0);
        SUM       : out STD_LOGIC_VECTOR (15 downto 0);
        CARRY_OUT : out STD_LOGIC
    );
end subtractor_16bit;

architecture Structural of subtractor_16bit is
signal B_not : STD_LOGIC_VECTOR(15 downto 0);

    component adder_16bit
        Port (
            a         : in  STD_LOGIC_VECTOR (15 downto 0);
            b         : in  STD_LOGIC_VECTOR (15 downto 0);
            cin       : in  STD_LOGIC;
            sum       : out STD_LOGIC_VECTOR (15 downto 0);
            carry_out : out STD_LOGIC
        );
    end component;

begin

    B_not <= not B;
    sixteenBitAdder: adder_16bit port map (a => A, b => B_not, cin => '1', sum => SUM, carry_out => CARRY_OUT);

end Structural;
