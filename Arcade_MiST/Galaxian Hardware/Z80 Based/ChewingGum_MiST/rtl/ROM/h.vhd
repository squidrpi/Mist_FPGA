library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity h_rom is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of h_rom is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"38",X"7C",X"C2",X"82",X"86",X"7C",X"38",X"00",X"02",X"02",X"FE",X"FE",X"42",X"02",X"00",X"00",
		X"62",X"F2",X"BA",X"9A",X"9E",X"CE",X"46",X"00",X"1C",X"DE",X"F2",X"B2",X"92",X"86",X"04",X"00",
		X"08",X"FE",X"FE",X"C8",X"68",X"38",X"18",X"00",X"1C",X"BE",X"A2",X"A2",X"A2",X"E6",X"E4",X"00",
		X"0C",X"9E",X"92",X"92",X"D2",X"7E",X"3C",X"00",X"C0",X"E0",X"B0",X"9E",X"8E",X"C0",X"C0",X"00",
		X"6C",X"FE",X"92",X"92",X"92",X"FE",X"6C",X"00",X"78",X"FC",X"96",X"92",X"92",X"F2",X"60",X"00",
		X"3E",X"7E",X"C8",X"88",X"C8",X"7E",X"3E",X"00",X"6C",X"FE",X"92",X"92",X"92",X"FE",X"FE",X"00",
		X"44",X"C6",X"82",X"82",X"C6",X"7C",X"38",X"00",X"38",X"7C",X"C6",X"82",X"82",X"FE",X"FE",X"00",
		X"82",X"92",X"92",X"92",X"FE",X"FE",X"00",X"00",X"82",X"82",X"FE",X"FE",X"82",X"82",X"00",X"00",
		X"82",X"C6",X"6E",X"3C",X"18",X"FE",X"FE",X"00",X"02",X"02",X"02",X"02",X"FE",X"FE",X"00",X"00",
		X"FE",X"FE",X"1C",X"38",X"70",X"FE",X"FE",X"00",X"7C",X"FE",X"82",X"82",X"82",X"FE",X"7C",X"00",
		X"70",X"F8",X"88",X"88",X"88",X"FE",X"FE",X"00",X"72",X"F6",X"9E",X"8C",X"88",X"FE",X"FE",X"00",
		X"4C",X"DE",X"92",X"92",X"92",X"F6",X"64",X"00",X"80",X"80",X"FE",X"FE",X"80",X"80",X"00",X"00",
		X"FC",X"FE",X"02",X"02",X"02",X"FE",X"FC",X"00",X"E0",X"70",X"17",X"17",X"70",X"E0",X"00",X"00",
		X"82",X"44",X"28",X"10",X"28",X"44",X"82",X"00",X"44",X"44",X"44",X"44",X"44",X"44",X"44",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",
		X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",
		X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",
		X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"1F",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",X"CF",
		X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",
		X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",
		X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",
		X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",
		X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"7F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",
		X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",
		X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",
		X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",
		X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"0C",X"0E",X"0E",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"0F",X"0F",X"0F",X"0F",X"1F",X"FF",X"FF",
		X"00",X"83",X"DF",X"FF",X"FF",X"FF",X"FE",X"FE",X"70",X"E0",X"C0",X"C0",X"80",X"00",X"00",X"00",
		X"1F",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"1F",X"0F",X"0F",X"0F",X"0F",
		X"FC",X"FE",X"FE",X"FF",X"FF",X"FF",X"DF",X"83",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"E0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"0E",X"0E",X"0C",X"08",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"70",X"08",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"1F",
		X"00",X"00",X"00",X"00",X"00",X"00",X"E0",X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"01",X"01",X"03",X"03",X"03",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",
		X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"3F",X"00",X"00",X"00",X"80",X"80",X"C0",X"C0",X"C0",
		X"03",X"03",X"03",X"01",X"01",X"00",X"00",X"00",X"FC",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",
		X"3F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"C0",X"C0",X"C0",X"80",X"80",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"07",X"00",X"00",X"00",X"00",X"00",X"00",
		X"F8",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"07",X"1F",
		X"00",X"00",X"03",X"07",X"67",X"E7",X"CF",X"CF",X"00",X"00",X"E0",X"E0",X"F0",X"F0",X"F0",X"F0",
		X"00",X"01",X"01",X"01",X"03",X"1B",X"23",X"23",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"CF",X"CF",X"CF",X"9F",X"9F",X"9F",X"9F",X"9F",X"F0",X"F0",X"F8",X"F8",X"F8",X"F8",X"F8",X"FC",
		X"23",X"23",X"1B",X"03",X"01",X"01",X"01",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"BF",X"E7",X"7B",
		X"9F",X"9F",X"9F",X"9F",X"9F",X"CF",X"CF",X"CF",X"FC",X"F8",X"F8",X"F8",X"F8",X"F8",X"F0",X"F0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1E",X"07",X"01",X"00",X"00",X"00",X"00",X"00",
		X"CF",X"CF",X"E7",X"67",X"07",X"03",X"00",X"00",X"F0",X"F0",X"F0",X"F0",X"E0",X"E0",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"00",X"06",X"1E",X"3F",X"7F",X"FE",X"F6",X"FB",
		X"00",X"20",X"38",X"1C",X"1E",X"0F",X"0B",X"1D",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",
		X"03",X"03",X"03",X"07",X"07",X"07",X"07",X"07",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FD",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"C0",X"C0",X"C0",X"E0",X"60",X"60",X"60",X"60",
		X"07",X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FD",X"60",X"60",X"60",X"60",X"E0",X"C0",X"C0",X"C0",
		X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"7F",X"3F",X"1F",X"07",X"00",
		X"FD",X"FB",X"FF",X"FE",X"FC",X"F8",X"E0",X"00",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"04",X"04",X"03",
		X"00",X"00",X"00",X"00",X"C0",X"20",X"20",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"01",X"01",X"02",X"02",X"02",X"06",X"06",X"06",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"06",X"06",X"06",X"02",X"02",X"02",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"07",X"0F",X"1E",X"1F",
		X"00",X"00",X"F8",X"FC",X"FA",X"F6",X"2E",X"DE",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"03",X"0F",X"3F",X"00",X"00",X"3F",X"7E",X"F9",X"E7",X"9F",X"FE",X"04",X"08",
		X"BC",X"7C",X"F8",X"F0",X"C8",X"04",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"10",X"20",X"40",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"08",X"04",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"02",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"03",X"03",X"03",X"03",X"03",X"03",X"00",X"00",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",
		X"00",X"00",X"03",X"03",X"03",X"03",X"03",X"03",X"00",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",
		X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"FE",X"FE",X"00",X"00",X"00",X"00",X"00",X"00",X"7F",X"7F",X"00",X"00",
		X"00",X"00",X"FE",X"FE",X"00",X"00",X"00",X"00",X"00",X"00",X"7F",X"7F",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"3C",X"1E",X"0F",X"07",X"0F",X"1E",X"3C",X"FF",
		X"FF",X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",X"F8",
		X"F8",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"F8",X"F8",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"FF",X"FF",X"00",X"00",X"FF",
		X"FF",X"03",X"07",X"0F",X"1E",X"3C",X"78",X"FF",X"FF",X"00",X"00",X"FF",X"FF",X"00",X"00",X"FF",
		X"FF",X"00",X"00",X"06",X"03",X"03",X"06",X"00",X"00",X"FF",X"FF",X"00",X"00",X"F8",X"F8",X"E0",
		X"E3",X"E3",X"E1",X"E1",X"E1",X"FF",X"FF",X"00",X"00",X"FF",X"FF",X"01",X"01",X"01",X"01",X"01",
		X"01",X"FF",X"FF",X"00",X"00",X"F8",X"F8",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"FF",X"FF",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"FF",
		X"FF",X"00",X"00",X"FF",X"FF",X"07",X"07",X"07",X"07",X"07",X"07",X"FF",X"FF",X"00",X"00",X"3F",
		X"3F",X"27",X"27",X"07",X"07",X"07",X"07",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"3F",X"3F",X"27",X"27",X"07",X"07",X"07",X"07",X"FF",X"FF",X"00",X"00",X"FF",
		X"FF",X"C0",X"80",X"00",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",X"FF",X"FF",X"00",X"00",X"FF",
		X"FF",X"1C",X"38",X"F0",X"C0",X"C0",X"F0",X"38",X"1C",X"FF",X"FF",X"00",X"00",X"1F",X"1F",X"07",
		X"E7",X"E7",X"C7",X"C7",X"C7",X"FF",X"FF",X"00",X"00",X"FF",X"FF",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"C0",X"FF",X"FF",X"00",X"00",X"1F",X"1F",X"07",X"07",X"07",X"07",X"07",X"07",X"FF",X"FF",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
