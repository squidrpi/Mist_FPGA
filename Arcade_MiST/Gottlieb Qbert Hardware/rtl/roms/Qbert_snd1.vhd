library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity Qbert_snd1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of Qbert_snd1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"4C",X"35",X"70",X"78",X"A2",X"7F",X"86",X"7C",X"78",X"D8",X"A2",X"7B",X"9A",X"A9",X"00",X"85",
		X"30",X"A9",X"00",X"8D",X"01",X"82",X"8D",X"03",X"82",X"8D",X"07",X"82",X"AE",X"05",X"82",X"AE",
		X"14",X"82",X"8E",X"14",X"82",X"A9",X"F0",X"85",X"2F",X"A9",X"00",X"85",X"21",X"58",X"A9",X"1C",
		X"85",X"20",X"4C",X"E9",X"71",X"58",X"A9",X"00",X"85",X"20",X"85",X"23",X"AD",X"02",X"82",X"29",
		X"40",X"D0",X"03",X"4C",X"5B",X"7C",X"78",X"A5",X"21",X"D0",X"02",X"F0",X"E8",X"85",X"20",X"58",
		X"4C",X"53",X"70",X"D8",X"A5",X"20",X"0A",X"38",X"E9",X"02",X"18",X"85",X"28",X"A9",X"C4",X"65",
		X"28",X"85",X"24",X"A9",X"00",X"69",X"7B",X"85",X"25",X"A0",X"01",X"B1",X"24",X"85",X"26",X"88",
		X"B1",X"24",X"85",X"27",X"6C",X"26",X"00",X"A5",X"7E",X"2A",X"2A",X"2A",X"2A",X"45",X"7E",X"6A",
		X"66",X"7C",X"66",X"7D",X"66",X"7E",X"A5",X"7E",X"60",X"48",X"8A",X"48",X"98",X"48",X"2C",X"05",
		X"82",X"70",X"03",X"4C",X"08",X"71",X"AD",X"05",X"82",X"AD",X"00",X"82",X"29",X"3F",X"D0",X"03",
		X"4C",X"0D",X"71",X"85",X"22",X"C9",X"30",X"B0",X"64",X"A9",X"2C",X"C5",X"22",X"D0",X"15",X"A9",
		X"00",X"85",X"21",X"85",X"20",X"85",X"23",X"A2",X"7B",X"9A",X"A9",X"3F",X"49",X"FF",X"8D",X"00",
		X"A0",X"4C",X"35",X"70",X"A9",X"2D",X"C5",X"22",X"D0",X"08",X"AD",X"00",X"60",X"85",X"5D",X"4C",
		X"0D",X"71",X"A9",X"2E",X"C5",X"22",X"D0",X"08",X"AD",X"00",X"60",X"85",X"5E",X"4C",X"0D",X"71",
		X"A9",X"2F",X"C5",X"22",X"D0",X"0A",X"A0",X"00",X"AD",X"00",X"60",X"91",X"5D",X"4C",X"0D",X"71",
		X"A6",X"22",X"BD",X"2A",X"7C",X"C5",X"23",X"B0",X"02",X"90",X"12",X"85",X"23",X"A5",X"22",X"85",
		X"20",X"A2",X"7B",X"9A",X"58",X"4C",X"53",X"70",X"A9",X"FF",X"8D",X"17",X"82",X"68",X"A8",X"68",
		X"AA",X"68",X"58",X"40",X"A9",X"00",X"85",X"03",X"85",X"02",X"85",X"00",X"85",X"01",X"A9",X"01",
		X"85",X"06",X"85",X"07",X"A5",X"20",X"38",X"E9",X"06",X"85",X"04",X"85",X"05",X"18",X"A5",X"06",
		X"69",X"01",X"85",X"06",X"A5",X"07",X"69",X"00",X"85",X"07",X"A5",X"05",X"4A",X"4A",X"4A",X"09",
		X"01",X"85",X"08",X"38",X"A5",X"04",X"E5",X"08",X"85",X"04",X"A5",X"05",X"E9",X"00",X"85",X"05",
		X"C9",X"01",X"F0",X"31",X"18",X"A5",X"02",X"69",X"03",X"85",X"02",X"A5",X"03",X"69",X"00",X"25",
		X"07",X"85",X"03",X"C9",X"07",X"A4",X"05",X"EA",X"88",X"D0",X"FC",X"18",X"A5",X"00",X"65",X"02",
		X"85",X"00",X"A5",X"01",X"65",X"03",X"85",X"01",X"29",X"0F",X"A8",X"B9",X"88",X"71",X"4A",X"8D",
		X"00",X"90",X"4C",X"2D",X"71",X"4C",X"35",X"70",X"FE",X"F5",X"D9",X"B0",X"80",X"4F",X"26",X"0A",
		X"01",X"0A",X"26",X"4F",X"7F",X"B0",X"D9",X"F5",X"A9",X"0E",X"85",X"03",X"A9",X"5F",X"85",X"02",
		X"A9",X"0F",X"85",X"04",X"85",X"05",X"A5",X"05",X"29",X"0F",X"A8",X"EA",X"88",X"D0",X"FC",X"38",
		X"A5",X"04",X"E9",X"03",X"85",X"04",X"A5",X"05",X"E9",X"00",X"85",X"05",X"90",X"28",X"18",X"A5",
		X"00",X"65",X"02",X"85",X"00",X"A5",X"01",X"65",X"03",X"85",X"01",X"A8",X"B9",X"00",X"7E",X"C5",
		X"05",X"90",X"09",X"A9",X"FF",X"A2",X"06",X"CA",X"D0",X"FD",X"F0",X"03",X"A9",X"00",X"EA",X"4A",
		X"8D",X"00",X"90",X"4C",X"A6",X"71",X"4C",X"35",X"70",X"78",X"A5",X"20",X"38",X"E9",X"1B",X"AA",
		X"A0",X"00",X"A9",X"92",X"85",X"2A",X"A9",X"72",X"85",X"2B",X"CA",X"F0",X"11",X"B1",X"2A",X"E6",
		X"2A",X"D0",X"02",X"E6",X"2B",X"29",X"3F",X"C9",X"3F",X"D0",X"F2",X"4C",X"FA",X"71",X"A9",X"A0",
		X"8D",X"00",X"B0",X"84",X"29",X"B1",X"2A",X"49",X"FF",X"8D",X"00",X"A0",X"58",X"4C",X"35",X"70",
		X"85",X"2D",X"86",X"2E",X"84",X"2C",X"A5",X"2F",X"C9",X"F0",X"D0",X"47",X"A5",X"30",X"F0",X"1F",
		X"C6",X"2A",X"F0",X"09",X"20",X"77",X"70",X"8D",X"00",X"A0",X"4C",X"6C",X"72",X"A9",X"3F",X"49",
		X"FF",X"8D",X"00",X"A0",X"A9",X"00",X"85",X"30",X"A9",X"FF",X"85",X"29",X"4C",X"6C",X"72",X"A5",
		X"29",X"D0",X"19",X"A0",X"00",X"E6",X"2A",X"D0",X"02",X"E6",X"2B",X"B1",X"2A",X"49",X"FF",X"8D",
		X"00",X"A0",X"29",X"3F",X"C9",X"00",X"D0",X"04",X"A9",X"FF",X"85",X"29",X"A4",X"2C",X"A6",X"2E",
		X"A5",X"2D",X"40",X"78",X"D8",X"A9",X"7F",X"86",X"7C",X"A2",X"7B",X"9A",X"A9",X"3F",X"49",X"FF",
		X"8D",X"00",X"A0",X"A9",X"FF",X"85",X"29",X"A9",X"F0",X"85",X"2F",X"A9",X"00",X"85",X"30",X"4C",
		X"11",X"70",X"3E",X"1B",X"00",X"18",X"17",X"2D",X"03",X"03",X"03",X"03",X"03",X"15",X"00",X"09",
		X"29",X"0C",X"2A",X"3A",X"0A",X"0D",X"1E",X"24",X"0D",X"3F",X"A5",X"20",X"38",X"E9",X"11",X"0A",
		X"AA",X"BD",X"CB",X"72",X"85",X"2A",X"E8",X"BD",X"CB",X"72",X"8D",X"00",X"B0",X"A9",X"FF",X"85",
		X"30",X"A9",X"01",X"49",X"FF",X"8D",X"00",X"A0",X"4C",X"35",X"70",X"10",X"FF",X"0B",X"B0",X"09",
		X"80",X"07",X"60",X"05",X"3E",X"A9",X"FF",X"85",X"00",X"85",X"01",X"A9",X"FF",X"85",X"29",X"A9",
		X"00",X"85",X"30",X"A9",X"01",X"49",X"FF",X"8D",X"00",X"A0",X"38",X"A5",X"00",X"E9",X"01",X"85",
		X"00",X"A5",X"01",X"E9",X"00",X"85",X"01",X"8D",X"00",X"B0",X"90",X"03",X"4C",X"EA",X"72",X"A9",
		X"3F",X"49",X"FF",X"8D",X"00",X"A0",X"4C",X"35",X"70",X"A9",X"90",X"85",X"07",X"A9",X"17",X"85",
		X"06",X"85",X"05",X"85",X"04",X"A9",X"00",X"85",X"03",X"85",X"02",X"A9",X"A0",X"85",X"00",X"85",
		X"01",X"A9",X"FF",X"85",X"29",X"A9",X"00",X"85",X"30",X"A9",X"35",X"49",X"FF",X"8D",X"00",X"A0",
		X"A9",X"FF",X"85",X"08",X"38",X"A5",X"04",X"E9",X"27",X"85",X"04",X"A5",X"05",X"E9",X"00",X"85",
		X"05",X"A5",X"06",X"E9",X"00",X"85",X"06",X"18",X"A5",X"02",X"65",X"05",X"85",X"02",X"A5",X"03",
		X"65",X"06",X"85",X"03",X"A8",X"B9",X"00",X"7E",X"C5",X"07",X"B0",X"05",X"A5",X"07",X"4C",X"64",
		X"73",X"A4",X"06",X"EA",X"8D",X"00",X"90",X"A5",X"08",X"F0",X"1A",X"18",X"A5",X"00",X"69",X"0A",
		X"85",X"00",X"A5",X"01",X"69",X"00",X"85",X"01",X"8D",X"00",X"B0",X"C9",X"FF",X"D0",X"1A",X"A9",
		X"00",X"85",X"08",X"F0",X"14",X"38",X"A5",X"00",X"E9",X"03",X"85",X"00",X"A5",X"01",X"E9",X"00",
		X"85",X"01",X"8D",X"00",X"B0",X"C9",X"20",X"90",X"03",X"4C",X"34",X"73",X"A9",X"3F",X"49",X"FF",
		X"8D",X"00",X"A0",X"4C",X"35",X"70",X"A9",X"91",X"85",X"04",X"A9",X"01",X"85",X"05",X"20",X"E0",
		X"73",X"18",X"A5",X"00",X"65",X"02",X"85",X"00",X"A5",X"01",X"65",X"03",X"85",X"01",X"A8",X"B9",
		X"00",X"7E",X"25",X"04",X"8D",X"00",X"90",X"C6",X"06",X"10",X"E6",X"20",X"E0",X"73",X"38",X"A5",
		X"04",X"E9",X"01",X"85",X"04",X"A5",X"05",X"E9",X"00",X"85",X"05",X"B0",X"D4",X"4C",X"35",X"70",
		X"20",X"77",X"70",X"85",X"06",X"20",X"77",X"70",X"85",X"02",X"20",X"77",X"70",X"29",X"27",X"09",
		X"00",X"85",X"03",X"60",X"A9",X"3F",X"49",X"FF",X"8D",X"00",X"A0",X"A9",X"00",X"85",X"02",X"A5",
		X"02",X"18",X"69",X"79",X"85",X"02",X"C9",X"FF",X"90",X"07",X"A9",X"03",X"85",X"23",X"4C",X"35",
		X"70",X"D0",X"02",X"A9",X"01",X"85",X"01",X"A5",X"02",X"49",X"FF",X"85",X"00",X"20",X"77",X"70",
		X"A2",X"01",X"4A",X"90",X"08",X"A4",X"00",X"8C",X"00",X"90",X"4C",X"32",X"74",X"A0",X"00",X"8C",
		X"00",X"90",X"A4",X"02",X"EA",X"88",X"D0",X"FC",X"CA",X"D0",X"E7",X"A5",X"00",X"38",X"E5",X"01",
		X"85",X"00",X"B0",X"D9",X"4C",X"FF",X"73",X"4C",X"35",X"70",X"A9",X"2F",X"85",X"03",X"A9",X"99",
		X"85",X"02",X"A9",X"00",X"85",X"00",X"85",X"01",X"A9",X"FF",X"85",X"06",X"85",X"07",X"85",X"08",
		X"38",X"A5",X"06",X"E9",X"3F",X"85",X"06",X"A5",X"07",X"E9",X"00",X"85",X"07",X"90",X"37",X"18",
		X"A5",X"04",X"69",X"0A",X"85",X"04",X"A5",X"05",X"69",X"00",X"85",X"05",X"18",X"A5",X"00",X"65",
		X"02",X"85",X"00",X"A5",X"01",X"65",X"03",X"85",X"01",X"C5",X"05",X"90",X"04",X"A9",X"FF",X"D0",
		X"03",X"A9",X"00",X"EA",X"C5",X"07",X"90",X"04",X"A5",X"07",X"D0",X"03",X"EA",X"EA",X"EA",X"4A",
		X"8D",X"00",X"90",X"4C",X"60",X"74",X"38",X"A5",X"08",X"E9",X"10",X"85",X"08",X"85",X"07",X"90",
		X"02",X"B0",X"AD",X"4C",X"35",X"70",X"78",X"A9",X"30",X"85",X"21",X"A9",X"02",X"85",X"37",X"A9",
		X"08",X"85",X"39",X"A9",X"1F",X"85",X"3A",X"A9",X"7F",X"85",X"35",X"A9",X"00",X"85",X"31",X"85",
		X"32",X"85",X"33",X"85",X"34",X"85",X"36",X"85",X"38",X"A9",X"FF",X"85",X"3B",X"85",X"3C",X"85",
		X"3D",X"58",X"38",X"A5",X"3B",X"E9",X"BB",X"85",X"3B",X"A5",X"3C",X"E9",X"00",X"85",X"3C",X"A5",
		X"3D",X"E9",X"00",X"85",X"3D",X"18",X"A5",X"33",X"69",X"C7",X"85",X"33",X"A5",X"34",X"69",X"00",
		X"85",X"34",X"A5",X"35",X"69",X"00",X"85",X"35",X"C5",X"39",X"90",X"22",X"18",X"A5",X"38",X"69",
		X"7F",X"85",X"38",X"A5",X"39",X"69",X"00",X"85",X"39",X"C5",X"3A",X"B0",X"2B",X"18",X"A5",X"36",
		X"69",X"8F",X"85",X"36",X"A5",X"37",X"69",X"00",X"85",X"37",X"85",X"35",X"85",X"35",X"18",X"A5",
		X"31",X"65",X"34",X"85",X"31",X"A5",X"32",X"65",X"35",X"85",X"32",X"A8",X"B9",X"00",X"7E",X"25",
		X"3D",X"4A",X"8D",X"00",X"90",X"4C",X"E2",X"74",X"A9",X"00",X"85",X"21",X"4C",X"35",X"70",X"A9",
		X"00",X"85",X"04",X"A9",X"6A",X"85",X"03",X"85",X"02",X"A9",X"1F",X"85",X"05",X"20",X"7B",X"75",
		X"4C",X"35",X"70",X"A9",X"01",X"85",X"04",X"A9",X"47",X"85",X"03",X"85",X"02",X"A9",X"09",X"85",
		X"05",X"20",X"7B",X"75",X"A9",X"00",X"85",X"21",X"4C",X"35",X"70",X"A9",X"00",X"85",X"00",X"85",
		X"01",X"38",X"A5",X"02",X"E5",X"05",X"85",X"02",X"A5",X"03",X"E9",X"00",X"85",X"03",X"A5",X"04",
		X"E9",X"00",X"85",X"04",X"D0",X"06",X"A5",X"03",X"C9",X"07",X"90",X"1A",X"18",X"A5",X"00",X"65",
		X"03",X"85",X"00",X"A5",X"01",X"65",X"04",X"85",X"01",X"29",X"0F",X"A8",X"B9",X"88",X"71",X"4A",
		X"8D",X"00",X"90",X"4C",X"81",X"75",X"18",X"A5",X"02",X"69",X"40",X"85",X"02",X"A5",X"03",X"69",
		X"00",X"85",X"03",X"A5",X"04",X"69",X"00",X"85",X"04",X"C9",X"01",X"D0",X"02",X"F0",X"1A",X"18",
		X"A5",X"00",X"65",X"03",X"85",X"00",X"A5",X"01",X"65",X"04",X"85",X"01",X"29",X"0F",X"A8",X"B9",
		X"88",X"71",X"4A",X"8D",X"00",X"90",X"4C",X"B6",X"75",X"60",X"78",X"A9",X"31",X"85",X"21",X"A9",
		X"00",X"85",X"31",X"85",X"32",X"85",X"38",X"A9",X"FF",X"85",X"35",X"85",X"36",X"A2",X"30",X"A9",
		X"27",X"85",X"39",X"A9",X"00",X"85",X"3B",X"58",X"4C",X"36",X"76",X"38",X"A5",X"35",X"E5",X"39",
		X"85",X"35",X"A5",X"36",X"E9",X"00",X"85",X"36",X"90",X"1C",X"18",X"A5",X"31",X"65",X"33",X"85",
		X"31",X"A5",X"32",X"65",X"34",X"85",X"32",X"29",X"0F",X"A8",X"B9",X"88",X"71",X"25",X"36",X"4A",
		X"8D",X"00",X"90",X"4C",X"0B",X"76",X"A9",X"7F",X"85",X"36",X"85",X"35",X"38",X"A5",X"35",X"E9",
		X"7F",X"85",X"35",X"A5",X"36",X"E9",X"00",X"85",X"36",X"B0",X"F1",X"A9",X"FF",X"85",X"35",X"85",
		X"36",X"A5",X"3B",X"F0",X"02",X"D0",X"2E",X"E6",X"38",X"A5",X"38",X"29",X"07",X"85",X"3A",X"0A",
		X"A8",X"B9",X"DC",X"76",X"85",X"33",X"C8",X"B9",X"DC",X"76",X"85",X"34",X"A5",X"3A",X"D0",X"0B",
		X"18",X"A5",X"39",X"69",X"04",X"85",X"39",X"C9",X"7F",X"B0",X"03",X"4C",X"0B",X"76",X"A9",X"00",
		X"85",X"21",X"4C",X"35",X"70",X"A5",X"3C",X"85",X"33",X"A5",X"3D",X"85",X"34",X"A5",X"38",X"F0",
		X"0B",X"A9",X"00",X"85",X"38",X"46",X"34",X"66",X"33",X"4C",X"0B",X"76",X"A9",X"01",X"85",X"38",
		X"38",X"A5",X"3C",X"E9",X"1F",X"85",X"3C",X"A5",X"3D",X"E9",X"00",X"85",X"3D",X"D0",X"08",X"A5",
		X"3C",X"C9",X"2F",X"B0",X"02",X"90",X"C7",X"4C",X"0B",X"76",X"78",X"A0",X"0E",X"B9",X"DC",X"76",
		X"85",X"3C",X"C8",X"B9",X"DC",X"76",X"85",X"3D",X"A9",X"01",X"85",X"3B",X"A9",X"00",X"85",X"38",
		X"A9",X"73",X"85",X"39",X"A9",X"31",X"85",X"21",X"58",X"4C",X"36",X"76",X"95",X"00",X"D3",X"00",
		X"A7",X"00",X"FB",X"00",X"BC",X"00",X"1A",X"01",X"DF",X"00",X"C0",X"01",X"DB",X"01",X"A9",X"00",
		X"85",X"00",X"85",X"01",X"A2",X"FF",X"4C",X"2E",X"77",X"38",X"A5",X"04",X"E5",X"06",X"85",X"04",
		X"A5",X"05",X"E9",X"00",X"85",X"05",X"90",X"26",X"18",X"A5",X"00",X"65",X"02",X"85",X"00",X"A5",
		X"01",X"65",X"03",X"85",X"01",X"29",X"0F",X"A8",X"B9",X"88",X"71",X"C5",X"05",X"90",X"05",X"A5",
		X"05",X"4C",X"27",X"77",X"24",X"00",X"EA",X"4A",X"8D",X"00",X"90",X"4C",X"F9",X"76",X"A9",X"7F",
		X"85",X"05",X"85",X"04",X"38",X"A5",X"04",X"E9",X"7F",X"85",X"04",X"A5",X"05",X"E9",X"00",X"85",
		X"05",X"B0",X"F1",X"A9",X"FF",X"85",X"04",X"85",X"05",X"E8",X"BD",X"1E",X"78",X"F0",X"2A",X"48",
		X"29",X"F0",X"4A",X"4A",X"4A",X"4A",X"0A",X"A8",X"B9",X"04",X"78",X"85",X"02",X"C8",X"B9",X"04",
		X"78",X"85",X"03",X"68",X"29",X"0F",X"85",X"07",X"A9",X"06",X"38",X"E5",X"07",X"A8",X"A9",X"FF",
		X"4A",X"88",X"D0",X"FC",X"85",X"06",X"4C",X"F9",X"76",X"20",X"7F",X"77",X"4C",X"35",X"70",X"A9",
		X"FA",X"85",X"08",X"85",X"02",X"A9",X"00",X"85",X"09",X"85",X"03",X"A9",X"B8",X"85",X"0A",X"A9",
		X"00",X"85",X"0B",X"38",X"A5",X"0C",X"E9",X"04",X"85",X"0C",X"A5",X"02",X"E9",X"00",X"85",X"02",
		X"A5",X"03",X"E9",X"00",X"85",X"03",X"C5",X"0B",X"D0",X"08",X"A5",X"02",X"C5",X"0A",X"90",X"1C",
		X"B0",X"00",X"18",X"A5",X"00",X"65",X"02",X"85",X"00",X"A5",X"01",X"65",X"03",X"85",X"01",X"29",
		X"0F",X"A8",X"B9",X"88",X"71",X"4A",X"8D",X"00",X"90",X"4C",X"93",X"77",X"18",X"A5",X"0C",X"69",
		X"06",X"85",X"0C",X"A5",X"02",X"69",X"00",X"85",X"02",X"A5",X"03",X"69",X"00",X"85",X"03",X"C5",
		X"09",X"D0",X"06",X"A5",X"02",X"C5",X"08",X"B0",X"1A",X"18",X"A5",X"00",X"65",X"02",X"85",X"00",
		X"A5",X"01",X"65",X"03",X"85",X"01",X"29",X"0F",X"A8",X"B9",X"88",X"71",X"4A",X"8D",X"00",X"90");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;