library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity SL31253 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(9 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of SL31253 is
	type rom is array(0 to  1023) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"70",X"0B",X"70",X"5C",X"0A",X"1F",X"25",X"40",X"94",X"F8",X"67",X"6B",X"20",X"28",X"5C",X"2A",
		X"08",X"00",X"16",X"25",X"55",X"94",X"04",X"29",X"08",X"02",X"20",X"D6",X"53",X"28",X"00",X"D0",
		X"20",X"4A",X"50",X"28",X"00",X"99",X"63",X"6C",X"74",X"5C",X"44",X"6F",X"5C",X"25",X"03",X"91",
		X"F0",X"28",X"01",X"35",X"28",X"02",X"24",X"28",X"00",X"88",X"28",X"02",X"DA",X"28",X"00",X"88",
		X"28",X"02",X"E8",X"28",X"00",X"88",X"21",X"04",X"84",X"07",X"28",X"03",X"8C",X"28",X"03",X"99",
		X"28",X"06",X"58",X"28",X"04",X"67",X"28",X"03",X"D3",X"63",X"6F",X"4C",X"25",X"02",X"94",X"04",
		X"28",X"04",X"47",X"64",X"6F",X"4C",X"1F",X"5C",X"70",X"B0",X"A0",X"21",X"04",X"94",X"04",X"28",
		X"02",X"24",X"63",X"6C",X"2A",X"00",X"83",X"4C",X"12",X"8E",X"16",X"55",X"28",X"00",X"8F",X"70",
		X"B5",X"90",X"B5",X"22",X"13",X"07",X"03",X"03",X"64",X"6E",X"4E",X"51",X"4C",X"50",X"1C",X"20",
		X"FF",X"56",X"36",X"94",X"FE",X"35",X"94",X"F8",X"1C",X"08",X"28",X"01",X"07",X"20",X"33",X"51",
		X"20",X"13",X"52",X"28",X"06",X"79",X"20",X"8B",X"50",X"28",X"06",X"79",X"28",X"00",X"C1",X"20",
		X"33",X"51",X"20",X"13",X"52",X"7D",X"50",X"28",X"06",X"79",X"28",X"06",X"79",X"28",X"01",X"1E",
		X"0C",X"A0",X"18",X"21",X"0F",X"84",X"FB",X"54",X"20",X"FF",X"55",X"35",X"94",X"FE",X"90",X"C0",
		X"08",X"28",X"01",X"07",X"70",X"52",X"20",X"7E",X"51",X"43",X"22",X"10",X"50",X"28",X"06",X"79",
		X"75",X"51",X"7D",X"50",X"28",X"06",X"79",X"31",X"41",X"25",X"70",X"81",X"F6",X"42",X"24",X"05",
		X"52",X"63",X"6F",X"73",X"FC",X"84",X"08",X"42",X"25",X"30",X"81",X"DB",X"70",X"53",X"42",X"25",
		X"40",X"81",X"D4",X"28",X"01",X"1E",X"0C",X"0A",X"57",X"67",X"6B",X"4C",X"0B",X"00",X"5C",X"0A",
		X"1F",X"0B",X"01",X"5C",X"0A",X"1F",X"0B",X"0A",X"67",X"6B",X"5C",X"47",X"0B",X"1C",X"0A",X"57",
		X"67",X"6B",X"4C",X"24",X"FF",X"0B",X"4C",X"05",X"0A",X"24",X"FF",X"0B",X"4C",X"04",X"0A",X"67",
		X"6B",X"5C",X"47",X"0B",X"1C",X"08",X"28",X"01",X"07",X"63",X"6F",X"4C",X"64",X"6D",X"25",X"01",
		X"84",X"0E",X"20",X"53",X"5D",X"7C",X"5E",X"20",X"D0",X"53",X"28",X"00",X"D0",X"90",X"2F",X"20",
		X"17",X"5D",X"20",X"FF",X"5C",X"20",X"D6",X"53",X"28",X"00",X"D0",X"20",X"11",X"51",X"78",X"52",
		X"28",X"01",X"F6",X"20",X"11",X"51",X"20",X"25",X"52",X"28",X"01",X"F6",X"20",X"5C",X"51",X"78",
		X"52",X"28",X"01",X"F6",X"20",X"5C",X"51",X"20",X"25",X"52",X"28",X"01",X"F6",X"20",X"14",X"51",
		X"76",X"52",X"28",X"02",X"0E",X"20",X"14",X"51",X"20",X"2E",X"52",X"28",X"02",X"0E",X"20",X"99",
		X"62",X"6E",X"5D",X"5C",X"28",X"02",X"AC",X"28",X"02",X"B5",X"64",X"6A",X"72",X"5C",X"90",X"05",
		X"08",X"28",X"01",X"07",X"62",X"68",X"20",X"17",X"5C",X"6B",X"5C",X"20",X"1C",X"51",X"20",X"1A",
		X"52",X"20",X"B0",X"50",X"28",X"06",X"79",X"20",X"38",X"51",X"20",X"1B",X"52",X"20",X"55",X"50",
		X"28",X"06",X"79",X"20",X"52",X"51",X"20",X"1A",X"52",X"20",X"71",X"50",X"28",X"06",X"79",X"64",
		X"6D",X"4C",X"13",X"81",X"06",X"28",X"04",X"47",X"90",X"19",X"20",X"11",X"51",X"20",X"1A",X"52",
		X"20",X"B2",X"50",X"28",X"06",X"79",X"20",X"5E",X"51",X"20",X"1A",X"52",X"20",X"73",X"50",X"28",
		X"06",X"79",X"28",X"01",X"1E",X"0C",X"08",X"28",X"01",X"07",X"78",X"53",X"20",X"81",X"50",X"28",
		X"06",X"79",X"41",X"24",X"FA",X"51",X"42",X"1F",X"52",X"33",X"94",X"F1",X"90",X"E5",X"08",X"28",
		X"01",X"07",X"20",X"46",X"53",X"20",X"92",X"50",X"28",X"06",X"79",X"41",X"24",X"FB",X"51",X"33",
		X"94",X"F4",X"90",X"CF",X"08",X"28",X"01",X"07",X"20",X"85",X"50",X"28",X"00",X"99",X"44",X"25",
		X"08",X"94",X"05",X"28",X"01",X"1E",X"0C",X"25",X"02",X"94",X"0D",X"20",X"8E",X"50",X"28",X"00",
		X"99",X"63",X"6C",X"44",X"5C",X"90",X"E2",X"25",X"01",X"94",X"DE",X"20",X"8C",X"50",X"28",X"00",
		X"99",X"2A",X"02",X"6C",X"44",X"12",X"8E",X"16",X"67",X"69",X"5D",X"70",X"5C",X"66",X"6F",X"7F",
		X"5C",X"28",X"02",X"71",X"64",X"6D",X"4C",X"22",X"20",X"5C",X"90",X"BD",X"02",X"05",X"10",X"10",
		X"20",X"08",X"28",X"01",X"07",X"67",X"6A",X"4E",X"54",X"4C",X"53",X"14",X"22",X"80",X"50",X"20",
		X"2A",X"51",X"20",X"33",X"52",X"28",X"06",X"79",X"43",X"21",X"0F",X"22",X"80",X"50",X"28",X"06",
		X"79",X"20",X"91",X"50",X"28",X"06",X"79",X"44",X"14",X"22",X"80",X"50",X"28",X"06",X"79",X"44",
		X"21",X"0F",X"22",X"80",X"50",X"28",X"06",X"79",X"28",X"01",X"1E",X"0C",X"08",X"28",X"01",X"07",
		X"6E",X"20",X"17",X"90",X"08",X"08",X"28",X"01",X"07",X"6F",X"20",X"50",X"62",X"51",X"20",X"33",
		X"52",X"71",X"24",X"66",X"DC",X"5C",X"14",X"22",X"40",X"50",X"28",X"06",X"79",X"4C",X"21",X"0F",
		X"22",X"40",X"50",X"28",X"06",X"79",X"28",X"01",X"1E",X"0C",X"08",X"28",X"01",X"07",X"20",X"B0",
		X"54",X"62",X"69",X"70",X"B4",X"A4",X"90",X"0D",X"08",X"28",X"01",X"07",X"20",X"71",X"54",X"62",
		X"6C",X"70",X"B1",X"A1",X"18",X"F1",X"50",X"4D",X"51",X"4C",X"52",X"71",X"F0",X"84",X"05",X"41",
		X"24",X"02",X"51",X"72",X"F0",X"84",X"05",X"41",X"24",X"FE",X"51",X"74",X"F0",X"84",X"05",X"42",
		X"24",X"02",X"52",X"78",X"F0",X"84",X"05",X"42",X"24",X"FE",X"52",X"63",X"6F",X"4C",X"25",X"02",
		X"91",X"36",X"94",X"17",X"71",X"F4",X"94",X"0B",X"41",X"25",X"2D",X"81",X"04",X"20",X"2D",X"51",
		X"90",X"09",X"41",X"25",X"3D",X"91",X"04",X"20",X"3D",X"51",X"41",X"25",X"52",X"81",X"04",X"20",
		X"52",X"51",X"25",X"1A",X"91",X"04",X"20",X"1A",X"51",X"42",X"25",X"2B",X"81",X"04",X"20",X"2B",
		X"52",X"25",X"09",X"91",X"03",X"79",X"52",X"64",X"6F",X"4C",X"21",X"03",X"25",X"03",X"94",X"24",
		X"62",X"68",X"71",X"F4",X"84",X"02",X"6B",X"20",X"10",X"F0",X"84",X"02",X"3C",X"20",X"20",X"F0",
		X"84",X"04",X"4C",X"1F",X"5C",X"4C",X"25",X"16",X"94",X"03",X"20",X"1D",X"25",X"1E",X"94",X"03",
		X"20",X"17",X"5C",X"44",X"50",X"28",X"06",X"79",X"28",X"01",X"1E",X"0C",X"08",X"28",X"01",X"07",
		X"68",X"20",X"B2",X"53",X"70",X"B4",X"A4",X"90",X"0C",X"08",X"28",X"01",X"07",X"6A",X"20",X"73",
		X"53",X"70",X"B1",X"A1",X"18",X"50",X"63",X"4D",X"51",X"4C",X"52",X"40",X"21",X"80",X"84",X"05",
		X"42",X"24",X"02",X"52",X"40",X"21",X"40",X"84",X"03",X"32",X"32",X"42",X"25",X"14",X"91",X"04",
		X"20",X"14",X"52",X"25",X"20",X"81",X"04",X"20",X"20",X"52",X"43",X"50",X"28",X"06",X"79",X"28",
		X"01",X"1E",X"0C",X"08",X"28",X"01",X"07",X"64",X"68",X"4D",X"51",X"4D",X"52",X"4D",X"53",X"4D",
		X"54",X"4C",X"25",X"00",X"84",X"0D",X"70",X"5C",X"43",X"13",X"C3",X"C3",X"53",X"44",X"13",X"C4",
		X"C4",X"54",X"41",X"C3",X"51",X"42",X"C4",X"52",X"64",X"6D",X"20",X"44",X"FC",X"84",X"3D",X"28");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
