library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity rom_sprite_high is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(3 downto 0)
);
end entity;

architecture prom of rom_sprite_high is
	type rom is array(0 to  31) of std_logic_vector(3 downto 0);
	signal rom_data: rom := (
		"0001","0001","0001","0001","0000","0000","0000","0000","0001","0001","0001","0001","0000","0000","0000","0000",
		"0001","0001","0001","0001","0000","0000","0000","0000","0001","0001","0001","0001","0000","0000","0000","0000");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;