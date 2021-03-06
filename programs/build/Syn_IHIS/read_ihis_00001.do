* NOTE: You need to set the Stata working directory to the path
* where the data file is located.
* NOTE -- this is a lightly edited version of ihis_00001.do provided by NCHS and available in the data repository. See readme.txt

set more off

clear
quietly infix                  ///
  int     year        1-4      ///
  long    serial      5-10     ///
  int     strata      11-14    ///
  int     psu         15-17    ///
  str     nhishid     18-31    ///
  long    hhweight    32-37    ///
  str     nhispid     38-53    ///
  str     hhx         54-59    ///
  str     fmx         60-61    ///
  str     px          62-63    ///
  double  perweight   64-72    ///
  double  sampweight  73-81    ///
  long    fweight     82-87    ///
  byte    astatflg    88-88    ///
  byte    cstatflg    89-89    ///
  byte    pernum      90-91    ///
  byte    age         92-93    ///
  byte    sex         94-94    ///
  byte    earnings    95-96    ///
  byte    health      97-97    ///
  byte    height      98-99    ///
  int     weight      100-102  ///
  float   bmicalc     103-106  ///
  float   bmi         107-110  ///
  str     nhisiid     111-129  ///
  using `"ihis_00001.dat"'

replace bmicalc    = bmicalc    / 10
replace bmi        = bmi        / 100

format perweight  %9.0f
format sampweight %9.0f
format bmicalc    %4.1f
format bmi        %4.2f

label var year       `"Survey year"'
label var serial     `"Sequential Serial Number, Household Record"'
label var strata     `"Stratum for variance estimation"'
label var psu        `"Primary sampling unit (PSU) for variance estimation"'
label var nhishid    `"NHIS Unique identifier, household"'
label var hhweight   `"Household weight, final annual"'
label var nhispid    `"NHIS Unique Identifier, person"'
label var hhx        `"Household number (from NHIS)"'
label var fmx        `"Family number (from NHIS)"'
label var px         `"Person number of respondent (from NHIS)."'
label var perweight  `"Final basic annual weight"'
label var sampweight `"Sample Person Weight"'
label var fweight    `"Final annual family weight"'
label var astatflg   `"Sample adult flag"'
label var cstatflg   `"Sample child flag"'
label var pernum     `"Person number within family (from reformatting)"'
label var age        `"Age"'
label var sex        `"Sex"'
label var earnings   `"Person's total earnings, previous calendar year"'
label var health     `"Health status"'
label var height     `"Height in inches without shoes"'
label var weight     `"Weight in pounds without clothes or shoes"'
label var bmicalc    `"Body Mass Index, calculated from publicly released height and weight variables"'
label var bmi        `"Body mass index"'
label var nhisiid    `"NHIS unique identifier, injury"'

label define year_lbl 1963 `"1963"'
label define year_lbl 1964 `"1964"', add
label define year_lbl 1965 `"1965"', add
label define year_lbl 1966 `"1966"', add
label define year_lbl 1967 `"1967"', add
label define year_lbl 1968 `"1968"', add
label define year_lbl 1969 `"1969"', add
label define year_lbl 1970 `"1970"', add
label define year_lbl 1971 `"1971"', add
label define year_lbl 1972 `"1972"', add
label define year_lbl 1973 `"1973"', add
label define year_lbl 1974 `"1974"', add
label define year_lbl 1975 `"1975"', add
label define year_lbl 1976 `"1976"', add
label define year_lbl 1977 `"1977"', add
label define year_lbl 1978 `"1978"', add
label define year_lbl 1979 `"1979"', add
label define year_lbl 1980 `"1980"', add
label define year_lbl 1981 `"1981"', add
label define year_lbl 1982 `"1982"', add
label define year_lbl 1983 `"1983"', add
label define year_lbl 1984 `"1984"', add
label define year_lbl 1985 `"1985"', add
label define year_lbl 1986 `"1986"', add
label define year_lbl 1987 `"1987"', add
label define year_lbl 1988 `"1988"', add
label define year_lbl 1989 `"1989"', add
label define year_lbl 1990 `"1990"', add
label define year_lbl 1991 `"1991"', add
label define year_lbl 1992 `"1992"', add
label define year_lbl 1993 `"1993"', add
label define year_lbl 1994 `"1994"', add
label define year_lbl 1995 `"1995"', add
label define year_lbl 1996 `"1996"', add
label define year_lbl 1997 `"1997"', add
label define year_lbl 1998 `"1998"', add
label define year_lbl 1999 `"1999"', add
label define year_lbl 2000 `"2000"', add
label define year_lbl 2001 `"2001"', add
label define year_lbl 2002 `"2002"', add
label define year_lbl 2003 `"2003"', add
label define year_lbl 2004 `"2004"', add
label define year_lbl 2005 `"2005"', add
label define year_lbl 2006 `"2006"', add
label define year_lbl 2007 `"2007"', add
label define year_lbl 2008 `"2008"', add
label define year_lbl 2009 `"2009"', add
label define year_lbl 2010 `"2010"', add
label define year_lbl 2011 `"2011"', add
label define year_lbl 2012 `"2012"', add
label define year_lbl 2013 `"2013"', add
label define year_lbl 2014 `"2014"', add
label define year_lbl 2015 `"2015"', add
label values year year_lbl

label define astatflg_lbl 0 `"NIU"'
label define astatflg_lbl 1 `"Sample adult, has record"', add
label define astatflg_lbl 2 `"Sample adult, no record"', add
label define astatflg_lbl 3 `"Not selected as sample adult"', add
label define astatflg_lbl 4 `"No one selected as sample adult"', add
label define astatflg_lbl 5 `"Armed force member"', add
label define astatflg_lbl 6 `"AF member, selected as sample adult"', add
label values astatflg astatflg_lbl

label define cstatflg_lbl 0 `"NIU"'
label define cstatflg_lbl 1 `"Sample child-has record"', add
label define cstatflg_lbl 2 `"Sample child-no record"', add
label define cstatflg_lbl 3 `"Not selected as sample child"', add
label define cstatflg_lbl 4 `"No one selected as sample child"', add
label define cstatflg_lbl 5 `"Emancipated minor"', add
label values cstatflg cstatflg_lbl

label define age_lbl 00 `"0"'
label define age_lbl 01 `"1"', add
label define age_lbl 02 `"2"', add
label define age_lbl 03 `"3"', add
label define age_lbl 04 `"4"', add
label define age_lbl 05 `"5"', add
label define age_lbl 06 `"6"', add
label define age_lbl 07 `"7"', add
label define age_lbl 08 `"8"', add
label define age_lbl 09 `"9"', add
label define age_lbl 10 `"10"', add
label define age_lbl 11 `"11"', add
label define age_lbl 12 `"12"', add
label define age_lbl 13 `"13"', add
label define age_lbl 14 `"14"', add
label define age_lbl 15 `"15"', add
label define age_lbl 16 `"16"', add
label define age_lbl 17 `"17"', add
label define age_lbl 18 `"18"', add
label define age_lbl 19 `"19"', add
label define age_lbl 20 `"20"', add
label define age_lbl 21 `"21"', add
label define age_lbl 22 `"22"', add
label define age_lbl 23 `"23"', add
label define age_lbl 24 `"24"', add
label define age_lbl 25 `"25"', add
label define age_lbl 26 `"26"', add
label define age_lbl 27 `"27"', add
label define age_lbl 28 `"28"', add
label define age_lbl 29 `"29"', add
label define age_lbl 30 `"30"', add
label define age_lbl 31 `"31"', add
label define age_lbl 32 `"32"', add
label define age_lbl 33 `"33"', add
label define age_lbl 34 `"34"', add
label define age_lbl 35 `"35"', add
label define age_lbl 36 `"36"', add
label define age_lbl 37 `"37"', add
label define age_lbl 38 `"38"', add
label define age_lbl 39 `"39"', add
label define age_lbl 40 `"40"', add
label define age_lbl 41 `"41"', add
label define age_lbl 42 `"42"', add
label define age_lbl 43 `"43"', add
label define age_lbl 44 `"44"', add
label define age_lbl 45 `"45"', add
label define age_lbl 46 `"46"', add
label define age_lbl 47 `"47"', add
label define age_lbl 48 `"48"', add
label define age_lbl 49 `"49"', add
label define age_lbl 50 `"50"', add
label define age_lbl 51 `"51"', add
label define age_lbl 52 `"52"', add
label define age_lbl 53 `"53"', add
label define age_lbl 54 `"54"', add
label define age_lbl 55 `"55"', add
label define age_lbl 56 `"56"', add
label define age_lbl 57 `"57"', add
label define age_lbl 58 `"58"', add
label define age_lbl 59 `"59"', add
label define age_lbl 60 `"60"', add
label define age_lbl 61 `"61"', add
label define age_lbl 62 `"62"', add
label define age_lbl 63 `"63"', add
label define age_lbl 64 `"64"', add
label define age_lbl 65 `"65"', add
label define age_lbl 66 `"66"', add
label define age_lbl 67 `"67"', add
label define age_lbl 68 `"68"', add
label define age_lbl 69 `"69"', add
label define age_lbl 70 `"70"', add
label define age_lbl 71 `"71"', add
label define age_lbl 72 `"72"', add
label define age_lbl 73 `"73"', add
label define age_lbl 74 `"74"', add
label define age_lbl 75 `"75"', add
label define age_lbl 76 `"76"', add
label define age_lbl 77 `"77"', add
label define age_lbl 78 `"78"', add
label define age_lbl 79 `"79"', add
label define age_lbl 80 `"80"', add
label define age_lbl 81 `"81"', add
label define age_lbl 82 `"82"', add
label define age_lbl 83 `"83"', add
label define age_lbl 84 `"84"', add
label define age_lbl 85 `"85 (1963-1968 and 1997 forward: 85+)"', add
label define age_lbl 86 `"86"', add
label define age_lbl 87 `"87"', add
label define age_lbl 88 `"88"', add
label define age_lbl 89 `"89"', add
label define age_lbl 90 `"90 (1996: 90+)"', add
label define age_lbl 91 `"91"', add
label define age_lbl 92 `"92"', add
label define age_lbl 93 `"93"', add
label define age_lbl 94 `"94"', add
label define age_lbl 95 `"95"', add
label define age_lbl 96 `"96"', add
label define age_lbl 97 `"97"', add
label define age_lbl 98 `"98"', add
label define age_lbl 99 `"99+"', add
label values age age_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label values sex sex_lbl

label define earnings_lbl 00 `"NIU"'
label define earnings_lbl 01 `"$01 to $4999"', add
label define earnings_lbl 02 `"$5000 to $9999"', add
label define earnings_lbl 03 `"$10000 to $14999"', add
label define earnings_lbl 04 `"$15000 to $19999"', add
label define earnings_lbl 05 `"$20000 to $24999"', add
label define earnings_lbl 06 `"$25000 to $34999"', add
label define earnings_lbl 07 `"$35000 to $44999"', add
label define earnings_lbl 08 `"$45000 to $54999"', add
label define earnings_lbl 09 `"$55000 to $64999"', add
label define earnings_lbl 10 `"$65000 to $74999"', add
label define earnings_lbl 11 `"$75000 and over"', add
label define earnings_lbl 97 `"Unknown-refused"', add
label define earnings_lbl 98 `"Unknown-not ascertained"', add
label define earnings_lbl 99 `"Unknown-don't know"', add
label values earnings earnings_lbl

label define health_lbl 1 `"Excellent"'
label define health_lbl 2 `"Very Good"', add
label define health_lbl 3 `"Good"', add
label define health_lbl 4 `"Fair"', add
label define health_lbl 5 `"Poor"', add
label define health_lbl 7 `"Unknown-refused"', add
label define health_lbl 8 `"Unknown-not ascertained"', add
label define health_lbl 9 `"Unknown-don't know"', add
label values health health_lbl

label define height_lbl 00 `"NIU"'
label define height_lbl 12 `"12"', add
label define height_lbl 13 `"13"', add
label define height_lbl 14 `"14"', add
label define height_lbl 15 `"15"', add
label define height_lbl 16 `"16"', add
label define height_lbl 17 `"17"', add
label define height_lbl 18 `"18"', add
label define height_lbl 19 `"19"', add
label define height_lbl 20 `"20"', add
label define height_lbl 21 `"21"', add
label define height_lbl 22 `"22"', add
label define height_lbl 23 `"23"', add
label define height_lbl 24 `"24"', add
label define height_lbl 25 `"25"', add
label define height_lbl 26 `"26"', add
label define height_lbl 27 `"27"', add
label define height_lbl 28 `"28"', add
label define height_lbl 29 `"29"', add
label define height_lbl 30 `"30"', add
label define height_lbl 31 `"31"', add
label define height_lbl 32 `"32"', add
label define height_lbl 33 `"33"', add
label define height_lbl 34 `"34"', add
label define height_lbl 35 `"35"', add
label define height_lbl 36 `"36"', add
label define height_lbl 37 `"37"', add
label define height_lbl 38 `"38"', add
label define height_lbl 39 `"39"', add
label define height_lbl 40 `"40"', add
label define height_lbl 41 `"41"', add
label define height_lbl 42 `"42"', add
label define height_lbl 43 `"43"', add
label define height_lbl 44 `"44"', add
label define height_lbl 45 `"45"', add
label define height_lbl 46 `"46"', add
label define height_lbl 47 `"47"', add
label define height_lbl 48 `"48"', add
label define height_lbl 49 `"49"', add
label define height_lbl 50 `"50"', add
label define height_lbl 51 `"51"', add
label define height_lbl 52 `"52"', add
label define height_lbl 53 `"53"', add
label define height_lbl 54 `"54"', add
label define height_lbl 55 `"55"', add
label define height_lbl 56 `"56"', add
label define height_lbl 57 `"57"', add
label define height_lbl 58 `"58 (1996: 58 inches or less)"', add
label define height_lbl 59 `"59"', add
label define height_lbl 60 `"60"', add
label define height_lbl 61 `"61"', add
label define height_lbl 62 `"62"', add
label define height_lbl 63 `"63"', add
label define height_lbl 64 `"64"', add
label define height_lbl 65 `"65"', add
label define height_lbl 66 `"66"', add
label define height_lbl 67 `"67"', add
label define height_lbl 68 `"68"', add
label define height_lbl 69 `"69"', add
label define height_lbl 70 `"70"', add
label define height_lbl 71 `"71"', add
label define height_lbl 72 `"72"', add
label define height_lbl 73 `"73"', add
label define height_lbl 74 `"74"', add
label define height_lbl 75 `"75"', add
label define height_lbl 76 `"76"', add
label define height_lbl 77 `"77 (1996: 77+ inches)"', add
label define height_lbl 78 `"78"', add
label define height_lbl 79 `"79"', add
label define height_lbl 80 `"80"', add
label define height_lbl 81 `"81"', add
label define height_lbl 82 `"82"', add
label define height_lbl 83 `"83"', add
label define height_lbl 84 `"84 (1976 - 1981: 84+ inches)"', add
label define height_lbl 85 `"85"', add
label define height_lbl 86 `"86"', add
label define height_lbl 87 `"87"', add
label define height_lbl 88 `"88"', add
label define height_lbl 89 `"89"', add
label define height_lbl 90 `"90"', add
label define height_lbl 91 `"91"', add
label define height_lbl 92 `"92"', add
label define height_lbl 93 `"93"', add
label define height_lbl 94 `"94+"', add
label define height_lbl 95 `"Unknown-all causes"', add
label define height_lbl 96 `"Exceptionally short or tall"', add
label define height_lbl 97 `"Unknown-refused"', add
label define height_lbl 98 `"Unknown-not ascertained"', add
label define height_lbl 99 `"Unknown-don't know"', add
label values height height_lbl

save "IHIS_masterfile.dta", replace
exit
