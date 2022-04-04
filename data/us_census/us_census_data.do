* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                 ///
  int     year       1-4      ///
  long    sample     5-10     ///
  double  serial     11-18    ///
  double  cbserial   19-31    ///
  double  hhwt       32-41    ///
  double  cluster    42-54    ///
  double  strata     55-66    ///
  byte    gq         67-67    ///
  int     pernum     68-71    ///
  double  perwt      72-81    ///
  byte    classwkr   82-82    ///
  byte    classwkrd  83-84    ///
  int     occ        85-88    ///
  int     occ1950    89-91    ///
  int     occ1990    92-94    ///
  int     ind        95-98    ///
  int     ind1950    99-101   ///
  byte    occscore   102-103  ///
  double  hwsei      104-107  ///
  double  presgl     108-110  ///
  double  erscor50   111-114  ///
  double  edscor50   115-118  ///
  double  edscor90   119-122  ///
  str     occstr     123-174  ///
  using `"usa_00001.dat"'

replace hhwt      = hhwt      / 100
replace perwt     = perwt     / 100
replace hwsei     = hwsei     / 100
replace presgl    = presgl    / 10
replace erscor50  = erscor50  / 10
replace edscor50  = edscor50  / 10
replace edscor90  = edscor90  / 10

format serial    %8.0f
format cbserial  %13.0f
format hhwt      %10.2f
format cluster   %13.0f
format strata    %12.0f
format perwt     %10.2f
format hwsei     %4.2f
format presgl    %3.1f
format erscor50  %4.1f
format edscor50  %4.1f
format edscor90  %4.1f

label var year      `"Census year"'
label var sample    `"IPUMS sample identifier"'
label var serial    `"Household serial number"'
label var cbserial  `"Original Census Bureau household serial number"'
label var hhwt      `"Household weight"'
label var cluster   `"Household cluster for variance estimation"'
label var strata    `"Household strata for variance estimation"'
label var gq        `"Group quarters status"'
label var pernum    `"Person number in sample unit"'
label var perwt     `"Person weight"'
label var classwkr  `"Class of worker [general version]"'
label var classwkrd `"Class of worker [detailed version]"'
label var occ       `"Occupation"'
label var occ1950   `"Occupation, 1950 basis"'
label var occ1990   `"Occupation, 1990 basis"'
label var ind       `"Industry"'
label var ind1950   `"Industry, 1950 basis"'
label var occscore  `"Occupational income score"'
label var hwsei     `"Socioeconomic Index, Hauser and Warren"'
label var presgl    `"Occupational prestige score, Siegel"'
label var erscor50  `"Occupational earnings score, 1950 basis"'
label var edscor50  `"Occupational education score, 1950 basis"'
label var edscor90  `"Occupational education score, 1990 basis"'
label var occstr    `"Occupation, alphabetic string"'

label define year_lbl 1850 `"1850"'
label define year_lbl 1860 `"1860"', add
label define year_lbl 1870 `"1870"', add
label define year_lbl 1880 `"1880"', add
label define year_lbl 1900 `"1900"', add
label define year_lbl 1910 `"1910"', add
label define year_lbl 1920 `"1920"', add
label define year_lbl 1930 `"1930"', add
label define year_lbl 1940 `"1940"', add
label define year_lbl 1950 `"1950"', add
label define year_lbl 1960 `"1960"', add
label define year_lbl 1970 `"1970"', add
label define year_lbl 1980 `"1980"', add
label define year_lbl 1990 `"1990"', add
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
label define year_lbl 2016 `"2016"', add
label define year_lbl 2017 `"2017"', add
label define year_lbl 2018 `"2018"', add
label define year_lbl 2019 `"2019"', add
label define year_lbl 2020 `"2020"', add
label values year year_lbl

label define sample_lbl 202001 `"2020 ACS"'
label define sample_lbl 201904 `"2015-2019, PRCS 5-year"', add
label define sample_lbl 201903 `"2015-2019, ACS 5-year"', add
label define sample_lbl 201902 `"2019 PRCS"', add
label define sample_lbl 201901 `"2019 ACS"', add
label define sample_lbl 201804 `"2014-2018, PRCS 5-year"', add
label define sample_lbl 201803 `"2014-2018, ACS 5-year"', add
label define sample_lbl 201802 `"2018 PRCS"', add
label define sample_lbl 201801 `"2018 ACS"', add
label define sample_lbl 201704 `"2013-2017, PRCS 5-year"', add
label define sample_lbl 201703 `"2013-2017, ACS 5-year"', add
label define sample_lbl 201702 `"2017 PRCS"', add
label define sample_lbl 201701 `"2017 ACS"', add
label define sample_lbl 201604 `"2012-2016, PRCS 5-year"', add
label define sample_lbl 201603 `"2012-2016, ACS 5-year"', add
label define sample_lbl 201602 `"2016 PRCS"', add
label define sample_lbl 201601 `"2016 ACS"', add
label define sample_lbl 201504 `"2011-2015, PRCS 5-year"', add
label define sample_lbl 201503 `"2011-2015, ACS 5-year"', add
label define sample_lbl 201502 `"2015 PRCS"', add
label define sample_lbl 201501 `"2015 ACS"', add
label define sample_lbl 201404 `"2010-2014, PRCS 5-year"', add
label define sample_lbl 201403 `"2010-2014, ACS 5-year"', add
label define sample_lbl 201402 `"2014 PRCS"', add
label define sample_lbl 201401 `"2014 ACS"', add
label define sample_lbl 201306 `"2009-2013, PRCS 5-year"', add
label define sample_lbl 201305 `"2009-2013, ACS 5-year"', add
label define sample_lbl 201304 `"2011-2013, PRCS 3-year"', add
label define sample_lbl 201303 `"2011-2013, ACS 3-year"', add
label define sample_lbl 201302 `"2013 PRCS"', add
label define sample_lbl 201301 `"2013 ACS"', add
label define sample_lbl 201206 `"2008-2012, PRCS 5-year"', add
label define sample_lbl 201205 `"2008-2012, ACS 5-year"', add
label define sample_lbl 201204 `"2010-2012, PRCS 3-year"', add
label define sample_lbl 201203 `"2010-2012, ACS 3-year"', add
label define sample_lbl 201202 `"2012 PRCS"', add
label define sample_lbl 201201 `"2012 ACS"', add
label define sample_lbl 201106 `"2007-2011, PRCS 5-year"', add
label define sample_lbl 201105 `"2007-2011, ACS 5-year"', add
label define sample_lbl 201104 `"2009-2011, PRCS 3-year"', add
label define sample_lbl 201103 `"2009-2011, ACS 3-year"', add
label define sample_lbl 201102 `"2011 PRCS"', add
label define sample_lbl 201101 `"2011 ACS"', add
label define sample_lbl 201008 `"2010 Puerto Rico 10%"', add
label define sample_lbl 201007 `"2010 10%"', add
label define sample_lbl 201006 `"2006-2010, PRCS 5-year"', add
label define sample_lbl 201005 `"2006-2010, ACS 5-year"', add
label define sample_lbl 201004 `"2008-2010, PRCS 3-year"', add
label define sample_lbl 201003 `"2008-2010, ACS 3-year"', add
label define sample_lbl 201002 `"2010 PRCS"', add
label define sample_lbl 201001 `"2010 ACS"', add
label define sample_lbl 200906 `"2005-2009, PRCS 5-year"', add
label define sample_lbl 200905 `"2005-2009, ACS 5-year"', add
label define sample_lbl 200904 `"2007-2009, PRCS 3-year"', add
label define sample_lbl 200903 `"2007-2009, ACS 3-year"', add
label define sample_lbl 200902 `"2009 PRCS"', add
label define sample_lbl 200901 `"2009 ACS"', add
label define sample_lbl 200804 `"2006-2008, PRCS 3-year"', add
label define sample_lbl 200803 `"2006-2008, ACS 3-year"', add
label define sample_lbl 200802 `"2008 PRCS"', add
label define sample_lbl 200801 `"2008 ACS"', add
label define sample_lbl 200704 `"2005-2007, PRCS 3-year"', add
label define sample_lbl 200703 `"2005-2007, ACS 3-year"', add
label define sample_lbl 200702 `"2007 PRCS"', add
label define sample_lbl 200701 `"2007 ACS"', add
label define sample_lbl 200602 `"2006 PRCS"', add
label define sample_lbl 200601 `"2006 ACS"', add
label define sample_lbl 200502 `"2005 PRCS"', add
label define sample_lbl 200501 `"2005 ACS"', add
label define sample_lbl 200401 `"2004 ACS"', add
label define sample_lbl 200301 `"2003 ACS"', add
label define sample_lbl 200201 `"2002 ACS"', add
label define sample_lbl 200101 `"2001 ACS"', add
label define sample_lbl 200008 `"2000 Puerto Rico 1%"', add
label define sample_lbl 200007 `"2000 1%"', add
label define sample_lbl 200006 `"2000 Puerto Rico 1% sample (old version)"', add
label define sample_lbl 200005 `"2000 Puerto Rico 5%"', add
label define sample_lbl 200004 `"2000 ACS"', add
label define sample_lbl 200003 `"2000 Unweighted 1%"', add
label define sample_lbl 200002 `"2000 1% sample (old version)"', add
label define sample_lbl 200001 `"2000 5%"', add
label define sample_lbl 199007 `"1990 Puerto Rico 1%"', add
label define sample_lbl 199006 `"1990 Puerto Rico 5%"', add
label define sample_lbl 199005 `"1990 Labor Market Area"', add
label define sample_lbl 199004 `"1990 Elderly"', add
label define sample_lbl 199003 `"1990 Unweighted 1%"', add
label define sample_lbl 199002 `"1990 1%"', add
label define sample_lbl 199001 `"1990 5%"', add
label define sample_lbl 198007 `"1980 Puerto Rico 1%"', add
label define sample_lbl 198006 `"1980 Puerto Rico 5%"', add
label define sample_lbl 198005 `"1980 Detailed metro/non-metro"', add
label define sample_lbl 198004 `"1980 Labor Market Area"', add
label define sample_lbl 198003 `"1980 Urban/Rural"', add
label define sample_lbl 198002 `"1980 1%"', add
label define sample_lbl 198001 `"1980 5%"', add
label define sample_lbl 197009 `"1970 Puerto Rico Neighborhood"', add
label define sample_lbl 197008 `"1970 Puerto Rico Municipio"', add
label define sample_lbl 197007 `"1970 Puerto Rico State"', add
label define sample_lbl 197006 `"1970 Form 2 Neighborhood"', add
label define sample_lbl 197005 `"1970 Form 1 Neighborhood"', add
label define sample_lbl 197004 `"1970 Form 2 Metro"', add
label define sample_lbl 197003 `"1970 Form 1 Metro"', add
label define sample_lbl 197002 `"1970 Form 2 State"', add
label define sample_lbl 197001 `"1970 Form 1 State"', add
label define sample_lbl 196002 `"1960 5%"', add
label define sample_lbl 196001 `"1960 1%"', add
label define sample_lbl 195001 `"1950 1%"', add
label define sample_lbl 194002 `"1940 100% database"', add
label define sample_lbl 194001 `"1940 1%"', add
label define sample_lbl 193004 `"1930 100% database"', add
label define sample_lbl 193003 `"1930 Puerto Rico"', add
label define sample_lbl 193002 `"1930 5%"', add
label define sample_lbl 193001 `"1930 1%"', add
label define sample_lbl 192003 `"1920 100% database"', add
label define sample_lbl 192002 `"1920 Puerto Rico sample"', add
label define sample_lbl 192001 `"1920 1%"', add
label define sample_lbl 191004 `"1910 100% database"', add
label define sample_lbl 191003 `"1910 1.4% sample with oversamples"', add
label define sample_lbl 191002 `"1910 1%"', add
label define sample_lbl 191001 `"1910 Puerto Rico"', add
label define sample_lbl 190004 `"1900 100% database"', add
label define sample_lbl 190003 `"1900 1% sample with oversamples"', add
label define sample_lbl 190002 `"1900 1%"', add
label define sample_lbl 190001 `"1900 5%"', add
label define sample_lbl 188003 `"1880 100% database"', add
label define sample_lbl 188002 `"1880 10%"', add
label define sample_lbl 188001 `"1880 1%"', add
label define sample_lbl 187003 `"1870 100% database"', add
label define sample_lbl 187002 `"1870 1% sample with black oversample"', add
label define sample_lbl 187001 `"1870 1%"', add
label define sample_lbl 186003 `"1860 100% database"', add
label define sample_lbl 186002 `"1860 1% sample with black oversample"', add
label define sample_lbl 186001 `"1860 1%"', add
label define sample_lbl 185002 `"1850 100% database"', add
label define sample_lbl 185001 `"1850 1%"', add
label values sample sample_lbl

label define gq_lbl 0 `"Vacant unit"'
label define gq_lbl 1 `"Households under 1970 definition"', add
label define gq_lbl 2 `"Additional households under 1990 definition"', add
label define gq_lbl 3 `"Group quarters--Institutions"', add
label define gq_lbl 4 `"Other group quarters"', add
label define gq_lbl 5 `"Additional households under 2000 definition"', add
label define gq_lbl 6 `"Fragment"', add
label values gq gq_lbl

label define classwkr_lbl 0 `"N/A"'
label define classwkr_lbl 1 `"Self-employed"', add
label define classwkr_lbl 2 `"Works for wages"', add
label values classwkr classwkr_lbl

label define classwkrd_lbl 00 `"N/A"'
label define classwkrd_lbl 10 `"Self-employed"', add
label define classwkrd_lbl 11 `"Employer"', add
label define classwkrd_lbl 12 `"Working on own account"', add
label define classwkrd_lbl 13 `"Self-employed, not incorporated"', add
label define classwkrd_lbl 14 `"Self-employed, incorporated"', add
label define classwkrd_lbl 20 `"Works for wages"', add
label define classwkrd_lbl 21 `"Works on salary (1920)"', add
label define classwkrd_lbl 22 `"Wage/salary, private"', add
label define classwkrd_lbl 23 `"Wage/salary at non-profit"', add
label define classwkrd_lbl 24 `"Wage/salary, government"', add
label define classwkrd_lbl 25 `"Federal govt employee"', add
label define classwkrd_lbl 26 `"Armed forces"', add
label define classwkrd_lbl 27 `"State govt employee"', add
label define classwkrd_lbl 28 `"Local govt employee"', add
label define classwkrd_lbl 29 `"Unpaid family worker"', add
label define classwkrd_lbl 98 `"Illegible"', add
label values classwkrd classwkrd_lbl

label define occ_lbl 0000 `"0000"'
label define occ_lbl 0001 `"0001"', add
label define occ_lbl 0002 `"0002"', add
label define occ_lbl 0003 `"0003"', add
label define occ_lbl 0004 `"0004"', add
label define occ_lbl 0005 `"0005"', add
label define occ_lbl 0006 `"0006"', add
label define occ_lbl 0007 `"0007"', add
label define occ_lbl 0008 `"0008"', add
label define occ_lbl 0009 `"0009"', add
label define occ_lbl 0010 `"0010"', add
label define occ_lbl 0011 `"0011"', add
label define occ_lbl 0012 `"0012"', add
label define occ_lbl 0013 `"0013"', add
label define occ_lbl 0014 `"0014"', add
label define occ_lbl 0015 `"0015"', add
label define occ_lbl 0016 `"0016"', add
label define occ_lbl 0017 `"0017"', add
label define occ_lbl 0018 `"0018"', add
label define occ_lbl 0019 `"0019"', add
label define occ_lbl 0020 `"0020"', add
label define occ_lbl 0021 `"0021"', add
label define occ_lbl 0022 `"0022"', add
label define occ_lbl 0023 `"0023"', add
label define occ_lbl 0024 `"0024"', add
label define occ_lbl 0025 `"0025"', add
label define occ_lbl 0026 `"0026"', add
label define occ_lbl 0027 `"0027"', add
label define occ_lbl 0028 `"0028"', add
label define occ_lbl 0029 `"0029"', add
label define occ_lbl 0030 `"0030"', add
label define occ_lbl 0031 `"0031"', add
label define occ_lbl 0032 `"0032"', add
label define occ_lbl 0033 `"0033"', add
label define occ_lbl 0034 `"0034"', add
label define occ_lbl 0035 `"0035"', add
label define occ_lbl 0036 `"0036"', add
label define occ_lbl 0037 `"0037"', add
label define occ_lbl 0038 `"0038"', add
label define occ_lbl 0039 `"0039"', add
label define occ_lbl 0040 `"0040"', add
label define occ_lbl 0041 `"0041"', add
label define occ_lbl 0042 `"0042"', add
label define occ_lbl 0043 `"0043"', add
label define occ_lbl 0044 `"0044"', add
label define occ_lbl 0045 `"0045"', add
label define occ_lbl 0046 `"0046"', add
label define occ_lbl 0047 `"0047"', add
label define occ_lbl 0048 `"0048"', add
label define occ_lbl 0049 `"0049"', add
label define occ_lbl 0050 `"0050"', add
label define occ_lbl 0051 `"0051"', add
label define occ_lbl 0052 `"0052"', add
label define occ_lbl 0053 `"0053"', add
label define occ_lbl 0054 `"0054"', add
label define occ_lbl 0055 `"0055"', add
label define occ_lbl 0056 `"0056"', add
label define occ_lbl 0057 `"0057"', add
label define occ_lbl 0058 `"0058"', add
label define occ_lbl 0059 `"0059"', add
label define occ_lbl 0060 `"0060"', add
label define occ_lbl 0061 `"0061"', add
label define occ_lbl 0062 `"0062"', add
label define occ_lbl 0063 `"0063"', add
label define occ_lbl 0064 `"0064"', add
label define occ_lbl 0065 `"0065"', add
label define occ_lbl 0066 `"0066"', add
label define occ_lbl 0067 `"0067"', add
label define occ_lbl 0068 `"0068"', add
label define occ_lbl 0069 `"0069"', add
label define occ_lbl 0070 `"0070"', add
label define occ_lbl 0071 `"0071"', add
label define occ_lbl 0072 `"0072"', add
label define occ_lbl 0073 `"0073"', add
label define occ_lbl 0074 `"0074"', add
label define occ_lbl 0075 `"0075"', add
label define occ_lbl 0076 `"0076"', add
label define occ_lbl 0077 `"0077"', add
label define occ_lbl 0078 `"0078"', add
label define occ_lbl 0079 `"0079"', add
label define occ_lbl 0080 `"0080"', add
label define occ_lbl 0081 `"0081"', add
label define occ_lbl 0082 `"0082"', add
label define occ_lbl 0083 `"0083"', add
label define occ_lbl 0084 `"0084"', add
label define occ_lbl 0085 `"0085"', add
label define occ_lbl 0086 `"0086"', add
label define occ_lbl 0087 `"0087"', add
label define occ_lbl 0088 `"0088"', add
label define occ_lbl 0089 `"0089"', add
label define occ_lbl 0090 `"0090"', add
label define occ_lbl 0091 `"0091"', add
label define occ_lbl 0092 `"0092"', add
label define occ_lbl 0093 `"0093"', add
label define occ_lbl 0094 `"0094"', add
label define occ_lbl 0095 `"0095"', add
label define occ_lbl 0096 `"0096"', add
label define occ_lbl 0097 `"0097"', add
label define occ_lbl 0098 `"0098"', add
label define occ_lbl 0099 `"0099"', add
label define occ_lbl 0100 `"0100"', add
label define occ_lbl 0101 `"0101"', add
label define occ_lbl 0102 `"0102"', add
label define occ_lbl 0103 `"0103"', add
label define occ_lbl 0104 `"0104"', add
label define occ_lbl 0105 `"0105"', add
label define occ_lbl 0106 `"0106"', add
label define occ_lbl 0107 `"0107"', add
label define occ_lbl 0108 `"0108"', add
label define occ_lbl 0109 `"0109"', add
label define occ_lbl 0110 `"0110"', add
label define occ_lbl 0111 `"0111"', add
label define occ_lbl 0112 `"0112"', add
label define occ_lbl 0113 `"0113"', add
label define occ_lbl 0114 `"0114"', add
label define occ_lbl 0115 `"0115"', add
label define occ_lbl 0116 `"0116"', add
label define occ_lbl 0117 `"0117"', add
label define occ_lbl 0118 `"0118"', add
label define occ_lbl 0119 `"0119"', add
label define occ_lbl 0120 `"0120"', add
label define occ_lbl 0121 `"0121"', add
label define occ_lbl 0122 `"0122"', add
label define occ_lbl 0123 `"0123"', add
label define occ_lbl 0124 `"0124"', add
label define occ_lbl 0125 `"0125"', add
label define occ_lbl 0126 `"0126"', add
label define occ_lbl 0127 `"0127"', add
label define occ_lbl 0128 `"0128"', add
label define occ_lbl 0129 `"0129"', add
label define occ_lbl 0130 `"0130"', add
label define occ_lbl 0131 `"0131"', add
label define occ_lbl 0132 `"0132"', add
label define occ_lbl 0133 `"0133"', add
label define occ_lbl 0134 `"0134"', add
label define occ_lbl 0135 `"0135"', add
label define occ_lbl 0136 `"0136"', add
label define occ_lbl 0137 `"0137"', add
label define occ_lbl 0138 `"0138"', add
label define occ_lbl 0139 `"0139"', add
label define occ_lbl 0140 `"0140"', add
label define occ_lbl 0141 `"0141"', add
label define occ_lbl 0142 `"0142"', add
label define occ_lbl 0143 `"0143"', add
label define occ_lbl 0144 `"0144"', add
label define occ_lbl 0145 `"0145"', add
label define occ_lbl 0146 `"0146"', add
label define occ_lbl 0147 `"0147"', add
label define occ_lbl 0148 `"0148"', add
label define occ_lbl 0149 `"0149"', add
label define occ_lbl 0150 `"0150"', add
label define occ_lbl 0151 `"0151"', add
label define occ_lbl 0152 `"0152"', add
label define occ_lbl 0153 `"0153"', add
label define occ_lbl 0154 `"0154"', add
label define occ_lbl 0155 `"0155"', add
label define occ_lbl 0156 `"0156"', add
label define occ_lbl 0157 `"0157"', add
label define occ_lbl 0158 `"0158"', add
label define occ_lbl 0159 `"0159"', add
label define occ_lbl 0160 `"0160"', add
label define occ_lbl 0161 `"0161"', add
label define occ_lbl 0162 `"0162"', add
label define occ_lbl 0163 `"0163"', add
label define occ_lbl 0164 `"0164"', add
label define occ_lbl 0165 `"0165"', add
label define occ_lbl 0166 `"0166"', add
label define occ_lbl 0167 `"0167"', add
label define occ_lbl 0168 `"0168"', add
label define occ_lbl 0169 `"0169"', add
label define occ_lbl 0170 `"0170"', add
label define occ_lbl 0171 `"0171"', add
label define occ_lbl 0172 `"0172"', add
label define occ_lbl 0173 `"0173"', add
label define occ_lbl 0174 `"0174"', add
label define occ_lbl 0175 `"0175"', add
label define occ_lbl 0176 `"0176"', add
label define occ_lbl 0177 `"0177"', add
label define occ_lbl 0178 `"0178"', add
label define occ_lbl 0179 `"0179"', add
label define occ_lbl 0180 `"0180"', add
label define occ_lbl 0181 `"0181"', add
label define occ_lbl 0182 `"0182"', add
label define occ_lbl 0183 `"0183"', add
label define occ_lbl 0184 `"0184"', add
label define occ_lbl 0185 `"0185"', add
label define occ_lbl 0186 `"0186"', add
label define occ_lbl 0187 `"0187"', add
label define occ_lbl 0188 `"0188"', add
label define occ_lbl 0189 `"0189"', add
label define occ_lbl 0190 `"0190"', add
label define occ_lbl 0191 `"0191"', add
label define occ_lbl 0192 `"0192"', add
label define occ_lbl 0193 `"0193"', add
label define occ_lbl 0194 `"0194"', add
label define occ_lbl 0195 `"0195"', add
label define occ_lbl 0196 `"0196"', add
label define occ_lbl 0197 `"0197"', add
label define occ_lbl 0198 `"0198"', add
label define occ_lbl 0199 `"0199"', add
label define occ_lbl 0200 `"0200"', add
label define occ_lbl 0201 `"0201"', add
label define occ_lbl 0202 `"0202"', add
label define occ_lbl 0203 `"0203"', add
label define occ_lbl 0204 `"0204"', add
label define occ_lbl 0205 `"0205"', add
label define occ_lbl 0206 `"0206"', add
label define occ_lbl 0207 `"0207"', add
label define occ_lbl 0208 `"0208"', add
label define occ_lbl 0209 `"0209"', add
label define occ_lbl 0210 `"0210"', add
label define occ_lbl 0211 `"0211"', add
label define occ_lbl 0212 `"0212"', add
label define occ_lbl 0213 `"0213"', add
label define occ_lbl 0214 `"0214"', add
label define occ_lbl 0215 `"0215"', add
label define occ_lbl 0216 `"0216"', add
label define occ_lbl 0217 `"0217"', add
label define occ_lbl 0218 `"0218"', add
label define occ_lbl 0219 `"0219"', add
label define occ_lbl 0220 `"0220"', add
label define occ_lbl 0221 `"0221"', add
label define occ_lbl 0222 `"0222"', add
label define occ_lbl 0223 `"0223"', add
label define occ_lbl 0224 `"0224"', add
label define occ_lbl 0225 `"0225"', add
label define occ_lbl 0226 `"0226"', add
label define occ_lbl 0227 `"0227"', add
label define occ_lbl 0228 `"0228"', add
label define occ_lbl 0229 `"0229"', add
label define occ_lbl 0230 `"0230"', add
label define occ_lbl 0231 `"0231"', add
label define occ_lbl 0232 `"0232"', add
label define occ_lbl 0233 `"0233"', add
label define occ_lbl 0234 `"0234"', add
label define occ_lbl 0235 `"0235"', add
label define occ_lbl 0236 `"0236"', add
label define occ_lbl 0237 `"0237"', add
label define occ_lbl 0238 `"0238"', add
label define occ_lbl 0239 `"0239"', add
label define occ_lbl 0240 `"0240"', add
label define occ_lbl 0241 `"0241"', add
label define occ_lbl 0242 `"0242"', add
label define occ_lbl 0243 `"0243"', add
label define occ_lbl 0244 `"0244"', add
label define occ_lbl 0245 `"0245"', add
label define occ_lbl 0246 `"0246"', add
label define occ_lbl 0247 `"0247"', add
label define occ_lbl 0248 `"0248"', add
label define occ_lbl 0249 `"0249"', add
label define occ_lbl 0250 `"0250"', add
label define occ_lbl 0251 `"0251"', add
label define occ_lbl 0252 `"0252"', add
label define occ_lbl 0253 `"0253"', add
label define occ_lbl 0254 `"0254"', add
label define occ_lbl 0255 `"0255"', add
label define occ_lbl 0256 `"0256"', add
label define occ_lbl 0257 `"0257"', add
label define occ_lbl 0258 `"0258"', add
label define occ_lbl 0259 `"0259"', add
label define occ_lbl 0260 `"0260"', add
label define occ_lbl 0261 `"0261"', add
label define occ_lbl 0262 `"0262"', add
label define occ_lbl 0263 `"0263"', add
label define occ_lbl 0264 `"0264"', add
label define occ_lbl 0265 `"0265"', add
label define occ_lbl 0266 `"0266"', add
label define occ_lbl 0267 `"0267"', add
label define occ_lbl 0268 `"0268"', add
label define occ_lbl 0269 `"0269"', add
label define occ_lbl 0270 `"0270"', add
label define occ_lbl 0271 `"0271"', add
label define occ_lbl 0272 `"0272"', add
label define occ_lbl 0273 `"0273"', add
label define occ_lbl 0274 `"0274"', add
label define occ_lbl 0275 `"0275"', add
label define occ_lbl 0276 `"0276"', add
label define occ_lbl 0277 `"0277"', add
label define occ_lbl 0278 `"0278"', add
label define occ_lbl 0279 `"0279"', add
label define occ_lbl 0280 `"0280"', add
label define occ_lbl 0281 `"0281"', add
label define occ_lbl 0282 `"0282"', add
label define occ_lbl 0283 `"0283"', add
label define occ_lbl 0284 `"0284"', add
label define occ_lbl 0285 `"0285"', add
label define occ_lbl 0286 `"0286"', add
label define occ_lbl 0287 `"0287"', add
label define occ_lbl 0288 `"0288"', add
label define occ_lbl 0289 `"0289"', add
label define occ_lbl 0290 `"0290"', add
label define occ_lbl 0291 `"0291"', add
label define occ_lbl 0292 `"0292"', add
label define occ_lbl 0293 `"0293"', add
label define occ_lbl 0294 `"0294"', add
label define occ_lbl 0295 `"0295"', add
label define occ_lbl 0296 `"0296"', add
label define occ_lbl 0297 `"0297"', add
label define occ_lbl 0298 `"0298"', add
label define occ_lbl 0299 `"0299"', add
label define occ_lbl 0300 `"0300"', add
label define occ_lbl 0301 `"0301"', add
label define occ_lbl 0302 `"0302"', add
label define occ_lbl 0303 `"0303"', add
label define occ_lbl 0304 `"0304"', add
label define occ_lbl 0305 `"0305"', add
label define occ_lbl 0306 `"0306"', add
label define occ_lbl 0307 `"0307"', add
label define occ_lbl 0308 `"0308"', add
label define occ_lbl 0309 `"0309"', add
label define occ_lbl 0310 `"0310"', add
label define occ_lbl 0311 `"0311"', add
label define occ_lbl 0312 `"0312"', add
label define occ_lbl 0313 `"0313"', add
label define occ_lbl 0314 `"0314"', add
label define occ_lbl 0315 `"0315"', add
label define occ_lbl 0316 `"0316"', add
label define occ_lbl 0317 `"0317"', add
label define occ_lbl 0318 `"0318"', add
label define occ_lbl 0319 `"0319"', add
label define occ_lbl 0320 `"0320"', add
label define occ_lbl 0321 `"0321"', add
label define occ_lbl 0322 `"0322"', add
label define occ_lbl 0323 `"0323"', add
label define occ_lbl 0324 `"0324"', add
label define occ_lbl 0325 `"0325"', add
label define occ_lbl 0326 `"0326"', add
label define occ_lbl 0327 `"0327"', add
label define occ_lbl 0328 `"0328"', add
label define occ_lbl 0329 `"0329"', add
label define occ_lbl 0330 `"0330"', add
label define occ_lbl 0331 `"0331"', add
label define occ_lbl 0332 `"0332"', add
label define occ_lbl 0333 `"0333"', add
label define occ_lbl 0334 `"0334"', add
label define occ_lbl 0335 `"0335"', add
label define occ_lbl 0336 `"0336"', add
label define occ_lbl 0337 `"0337"', add
label define occ_lbl 0338 `"0338"', add
label define occ_lbl 0339 `"0339"', add
label define occ_lbl 0340 `"0340"', add
label define occ_lbl 0341 `"0341"', add
label define occ_lbl 0342 `"0342"', add
label define occ_lbl 0343 `"0343"', add
label define occ_lbl 0344 `"0344"', add
label define occ_lbl 0345 `"0345"', add
label define occ_lbl 0346 `"0346"', add
label define occ_lbl 0347 `"0347"', add
label define occ_lbl 0348 `"0348"', add
label define occ_lbl 0349 `"0349"', add
label define occ_lbl 0350 `"0350"', add
label define occ_lbl 0351 `"0351"', add
label define occ_lbl 0352 `"0352"', add
label define occ_lbl 0353 `"0353"', add
label define occ_lbl 0354 `"0354"', add
label define occ_lbl 0355 `"0355"', add
label define occ_lbl 0356 `"0356"', add
label define occ_lbl 0357 `"0357"', add
label define occ_lbl 0358 `"0358"', add
label define occ_lbl 0359 `"0359"', add
label define occ_lbl 0360 `"0360"', add
label define occ_lbl 0361 `"0361"', add
label define occ_lbl 0362 `"0362"', add
label define occ_lbl 0363 `"0363"', add
label define occ_lbl 0364 `"0364"', add
label define occ_lbl 0365 `"0365"', add
label define occ_lbl 0366 `"0366"', add
label define occ_lbl 0367 `"0367"', add
label define occ_lbl 0368 `"0368"', add
label define occ_lbl 0369 `"0369"', add
label define occ_lbl 0370 `"0370"', add
label define occ_lbl 0371 `"0371"', add
label define occ_lbl 0372 `"0372"', add
label define occ_lbl 0373 `"0373"', add
label define occ_lbl 0374 `"0374"', add
label define occ_lbl 0375 `"0375"', add
label define occ_lbl 0376 `"0376"', add
label define occ_lbl 0377 `"0377"', add
label define occ_lbl 0378 `"0378"', add
label define occ_lbl 0379 `"0379"', add
label define occ_lbl 0380 `"0380"', add
label define occ_lbl 0381 `"0381"', add
label define occ_lbl 0382 `"0382"', add
label define occ_lbl 0383 `"0383"', add
label define occ_lbl 0384 `"0384"', add
label define occ_lbl 0385 `"0385"', add
label define occ_lbl 0386 `"0386"', add
label define occ_lbl 0387 `"0387"', add
label define occ_lbl 0388 `"0388"', add
label define occ_lbl 0389 `"0389"', add
label define occ_lbl 0390 `"0390"', add
label define occ_lbl 0391 `"0391"', add
label define occ_lbl 0392 `"0392"', add
label define occ_lbl 0393 `"0393"', add
label define occ_lbl 0394 `"0394"', add
label define occ_lbl 0395 `"0395"', add
label define occ_lbl 0396 `"0396"', add
label define occ_lbl 0397 `"0397"', add
label define occ_lbl 0398 `"0398"', add
label define occ_lbl 0399 `"0399"', add
label define occ_lbl 0400 `"0400"', add
label define occ_lbl 0401 `"0401"', add
label define occ_lbl 0402 `"0402"', add
label define occ_lbl 0403 `"0403"', add
label define occ_lbl 0404 `"0404"', add
label define occ_lbl 0405 `"0405"', add
label define occ_lbl 0406 `"0406"', add
label define occ_lbl 0407 `"0407"', add
label define occ_lbl 0408 `"0408"', add
label define occ_lbl 0409 `"0409"', add
label define occ_lbl 0410 `"0410"', add
label define occ_lbl 0411 `"0411"', add
label define occ_lbl 0412 `"0412"', add
label define occ_lbl 0413 `"0413"', add
label define occ_lbl 0414 `"0414"', add
label define occ_lbl 0415 `"0415"', add
label define occ_lbl 0416 `"0416"', add
label define occ_lbl 0417 `"0417"', add
label define occ_lbl 0418 `"0418"', add
label define occ_lbl 0419 `"0419"', add
label define occ_lbl 0420 `"0420"', add
label define occ_lbl 0421 `"0421"', add
label define occ_lbl 0422 `"0422"', add
label define occ_lbl 0423 `"0423"', add
label define occ_lbl 0424 `"0424"', add
label define occ_lbl 0425 `"0425"', add
label define occ_lbl 0426 `"0426"', add
label define occ_lbl 0427 `"0427"', add
label define occ_lbl 0428 `"0428"', add
label define occ_lbl 0429 `"0429"', add
label define occ_lbl 0430 `"0430"', add
label define occ_lbl 0431 `"0431"', add
label define occ_lbl 0432 `"0432"', add
label define occ_lbl 0433 `"0433"', add
label define occ_lbl 0434 `"0434"', add
label define occ_lbl 0435 `"0435"', add
label define occ_lbl 0436 `"0436"', add
label define occ_lbl 0437 `"0437"', add
label define occ_lbl 0438 `"0438"', add
label define occ_lbl 0439 `"0439"', add
label define occ_lbl 0440 `"0440"', add
label define occ_lbl 0441 `"0441"', add
label define occ_lbl 0442 `"0442"', add
label define occ_lbl 0443 `"0443"', add
label define occ_lbl 0444 `"0444"', add
label define occ_lbl 0445 `"0445"', add
label define occ_lbl 0446 `"0446"', add
label define occ_lbl 0447 `"0447"', add
label define occ_lbl 0448 `"0448"', add
label define occ_lbl 0449 `"0449"', add
label define occ_lbl 0450 `"0450"', add
label define occ_lbl 0451 `"0451"', add
label define occ_lbl 0452 `"0452"', add
label define occ_lbl 0453 `"0453"', add
label define occ_lbl 0454 `"0454"', add
label define occ_lbl 0455 `"0455"', add
label define occ_lbl 0456 `"0456"', add
label define occ_lbl 0457 `"0457"', add
label define occ_lbl 0458 `"0458"', add
label define occ_lbl 0459 `"0459"', add
label define occ_lbl 0460 `"0460"', add
label define occ_lbl 0461 `"0461"', add
label define occ_lbl 0462 `"0462"', add
label define occ_lbl 0463 `"0463"', add
label define occ_lbl 0464 `"0464"', add
label define occ_lbl 0465 `"0465"', add
label define occ_lbl 0466 `"0466"', add
label define occ_lbl 0467 `"0467"', add
label define occ_lbl 0468 `"0468"', add
label define occ_lbl 0469 `"0469"', add
label define occ_lbl 0470 `"0470"', add
label define occ_lbl 0471 `"0471"', add
label define occ_lbl 0472 `"0472"', add
label define occ_lbl 0473 `"0473"', add
label define occ_lbl 0474 `"0474"', add
label define occ_lbl 0475 `"0475"', add
label define occ_lbl 0476 `"0476"', add
label define occ_lbl 0477 `"0477"', add
label define occ_lbl 0478 `"0478"', add
label define occ_lbl 0479 `"0479"', add
label define occ_lbl 0480 `"0480"', add
label define occ_lbl 0481 `"0481"', add
label define occ_lbl 0482 `"0482"', add
label define occ_lbl 0483 `"0483"', add
label define occ_lbl 0484 `"0484"', add
label define occ_lbl 0485 `"0485"', add
label define occ_lbl 0486 `"0486"', add
label define occ_lbl 0487 `"0487"', add
label define occ_lbl 0488 `"0488"', add
label define occ_lbl 0489 `"0489"', add
label define occ_lbl 0490 `"0490"', add
label define occ_lbl 0491 `"0491"', add
label define occ_lbl 0492 `"0492"', add
label define occ_lbl 0493 `"0493"', add
label define occ_lbl 0494 `"0494"', add
label define occ_lbl 0495 `"0495"', add
label define occ_lbl 0496 `"0496"', add
label define occ_lbl 0497 `"0497"', add
label define occ_lbl 0498 `"0498"', add
label define occ_lbl 0499 `"0499"', add
label define occ_lbl 0500 `"0500"', add
label define occ_lbl 0501 `"0501"', add
label define occ_lbl 0502 `"0502"', add
label define occ_lbl 0503 `"0503"', add
label define occ_lbl 0504 `"0504"', add
label define occ_lbl 0505 `"0505"', add
label define occ_lbl 0506 `"0506"', add
label define occ_lbl 0507 `"0507"', add
label define occ_lbl 0508 `"0508"', add
label define occ_lbl 0509 `"0509"', add
label define occ_lbl 0510 `"0510"', add
label define occ_lbl 0511 `"0511"', add
label define occ_lbl 0512 `"0512"', add
label define occ_lbl 0513 `"0513"', add
label define occ_lbl 0514 `"0514"', add
label define occ_lbl 0515 `"0515"', add
label define occ_lbl 0516 `"0516"', add
label define occ_lbl 0517 `"0517"', add
label define occ_lbl 0518 `"0518"', add
label define occ_lbl 0519 `"0519"', add
label define occ_lbl 0520 `"0520"', add
label define occ_lbl 0521 `"0521"', add
label define occ_lbl 0522 `"0522"', add
label define occ_lbl 0523 `"0523"', add
label define occ_lbl 0524 `"0524"', add
label define occ_lbl 0525 `"0525"', add
label define occ_lbl 0526 `"0526"', add
label define occ_lbl 0527 `"0527"', add
label define occ_lbl 0528 `"0528"', add
label define occ_lbl 0529 `"0529"', add
label define occ_lbl 0530 `"0530"', add
label define occ_lbl 0531 `"0531"', add
label define occ_lbl 0532 `"0532"', add
label define occ_lbl 0533 `"0533"', add
label define occ_lbl 0534 `"0534"', add
label define occ_lbl 0535 `"0535"', add
label define occ_lbl 0536 `"0536"', add
label define occ_lbl 0537 `"0537"', add
label define occ_lbl 0538 `"0538"', add
label define occ_lbl 0539 `"0539"', add
label define occ_lbl 0540 `"0540"', add
label define occ_lbl 0541 `"0541"', add
label define occ_lbl 0542 `"0542"', add
label define occ_lbl 0543 `"0543"', add
label define occ_lbl 0544 `"0544"', add
label define occ_lbl 0545 `"0545"', add
label define occ_lbl 0546 `"0546"', add
label define occ_lbl 0547 `"0547"', add
label define occ_lbl 0548 `"0548"', add
label define occ_lbl 0549 `"0549"', add
label define occ_lbl 0550 `"0550"', add
label define occ_lbl 0551 `"0551"', add
label define occ_lbl 0552 `"0552"', add
label define occ_lbl 0553 `"0553"', add
label define occ_lbl 0554 `"0554"', add
label define occ_lbl 0555 `"0555"', add
label define occ_lbl 0556 `"0556"', add
label define occ_lbl 0557 `"0557"', add
label define occ_lbl 0558 `"0558"', add
label define occ_lbl 0559 `"0559"', add
label define occ_lbl 0560 `"0560"', add
label define occ_lbl 0561 `"0561"', add
label define occ_lbl 0562 `"0562"', add
label define occ_lbl 0563 `"0563"', add
label define occ_lbl 0564 `"0564"', add
label define occ_lbl 0565 `"0565"', add
label define occ_lbl 0566 `"0566"', add
label define occ_lbl 0567 `"0567"', add
label define occ_lbl 0568 `"0568"', add
label define occ_lbl 0569 `"0569"', add
label define occ_lbl 0570 `"0570"', add
label define occ_lbl 0571 `"0571"', add
label define occ_lbl 0572 `"0572"', add
label define occ_lbl 0573 `"0573"', add
label define occ_lbl 0574 `"0574"', add
label define occ_lbl 0575 `"0575"', add
label define occ_lbl 0576 `"0576"', add
label define occ_lbl 0577 `"0577"', add
label define occ_lbl 0578 `"0578"', add
label define occ_lbl 0579 `"0579"', add
label define occ_lbl 0580 `"0580"', add
label define occ_lbl 0581 `"0581"', add
label define occ_lbl 0582 `"0582"', add
label define occ_lbl 0583 `"0583"', add
label define occ_lbl 0584 `"0584"', add
label define occ_lbl 0585 `"0585"', add
label define occ_lbl 0586 `"0586"', add
label define occ_lbl 0587 `"0587"', add
label define occ_lbl 0588 `"0588"', add
label define occ_lbl 0589 `"0589"', add
label define occ_lbl 0590 `"0590"', add
label define occ_lbl 0591 `"0591"', add
label define occ_lbl 0592 `"0592"', add
label define occ_lbl 0593 `"0593"', add
label define occ_lbl 0594 `"0594"', add
label define occ_lbl 0595 `"0595"', add
label define occ_lbl 0596 `"0596"', add
label define occ_lbl 0597 `"0597"', add
label define occ_lbl 0598 `"0598"', add
label define occ_lbl 0599 `"0599"', add
label define occ_lbl 0600 `"0600"', add
label define occ_lbl 0601 `"0601"', add
label define occ_lbl 0602 `"0602"', add
label define occ_lbl 0603 `"0603"', add
label define occ_lbl 0604 `"0604"', add
label define occ_lbl 0605 `"0605"', add
label define occ_lbl 0606 `"0606"', add
label define occ_lbl 0607 `"0607"', add
label define occ_lbl 0608 `"0608"', add
label define occ_lbl 0609 `"0609"', add
label define occ_lbl 0610 `"0610"', add
label define occ_lbl 0611 `"0611"', add
label define occ_lbl 0612 `"0612"', add
label define occ_lbl 0613 `"0613"', add
label define occ_lbl 0614 `"0614"', add
label define occ_lbl 0615 `"0615"', add
label define occ_lbl 0616 `"0616"', add
label define occ_lbl 0617 `"0617"', add
label define occ_lbl 0618 `"0618"', add
label define occ_lbl 0619 `"0619"', add
label define occ_lbl 0620 `"0620"', add
label define occ_lbl 0621 `"0621"', add
label define occ_lbl 0622 `"0622"', add
label define occ_lbl 0623 `"0623"', add
label define occ_lbl 0624 `"0624"', add
label define occ_lbl 0625 `"0625"', add
label define occ_lbl 0626 `"0626"', add
label define occ_lbl 0627 `"0627"', add
label define occ_lbl 0628 `"0628"', add
label define occ_lbl 0629 `"0629"', add
label define occ_lbl 0630 `"0630"', add
label define occ_lbl 0631 `"0631"', add
label define occ_lbl 0632 `"0632"', add
label define occ_lbl 0633 `"0633"', add
label define occ_lbl 0634 `"0634"', add
label define occ_lbl 0635 `"0635"', add
label define occ_lbl 0636 `"0636"', add
label define occ_lbl 0637 `"0637"', add
label define occ_lbl 0638 `"0638"', add
label define occ_lbl 0639 `"0639"', add
label define occ_lbl 0640 `"0640"', add
label define occ_lbl 0641 `"0641"', add
label define occ_lbl 0642 `"0642"', add
label define occ_lbl 0643 `"0643"', add
label define occ_lbl 0644 `"0644"', add
label define occ_lbl 0645 `"0645"', add
label define occ_lbl 0646 `"0646"', add
label define occ_lbl 0647 `"0647"', add
label define occ_lbl 0648 `"0648"', add
label define occ_lbl 0649 `"0649"', add
label define occ_lbl 0650 `"0650"', add
label define occ_lbl 0651 `"0651"', add
label define occ_lbl 0652 `"0652"', add
label define occ_lbl 0653 `"0653"', add
label define occ_lbl 0654 `"0654"', add
label define occ_lbl 0655 `"0655"', add
label define occ_lbl 0656 `"0656"', add
label define occ_lbl 0657 `"0657"', add
label define occ_lbl 0658 `"0658"', add
label define occ_lbl 0659 `"0659"', add
label define occ_lbl 0660 `"0660"', add
label define occ_lbl 0661 `"0661"', add
label define occ_lbl 0662 `"0662"', add
label define occ_lbl 0663 `"0663"', add
label define occ_lbl 0664 `"0664"', add
label define occ_lbl 0665 `"0665"', add
label define occ_lbl 0666 `"0666"', add
label define occ_lbl 0667 `"0667"', add
label define occ_lbl 0668 `"0668"', add
label define occ_lbl 0669 `"0669"', add
label define occ_lbl 0670 `"0670"', add
label define occ_lbl 0671 `"0671"', add
label define occ_lbl 0672 `"0672"', add
label define occ_lbl 0673 `"0673"', add
label define occ_lbl 0674 `"0674"', add
label define occ_lbl 0675 `"0675"', add
label define occ_lbl 0676 `"0676"', add
label define occ_lbl 0677 `"0677"', add
label define occ_lbl 0678 `"0678"', add
label define occ_lbl 0679 `"0679"', add
label define occ_lbl 0680 `"0680"', add
label define occ_lbl 0681 `"0681"', add
label define occ_lbl 0682 `"0682"', add
label define occ_lbl 0683 `"0683"', add
label define occ_lbl 0684 `"0684"', add
label define occ_lbl 0685 `"0685"', add
label define occ_lbl 0686 `"0686"', add
label define occ_lbl 0687 `"0687"', add
label define occ_lbl 0688 `"0688"', add
label define occ_lbl 0689 `"0689"', add
label define occ_lbl 0690 `"0690"', add
label define occ_lbl 0691 `"0691"', add
label define occ_lbl 0692 `"0692"', add
label define occ_lbl 0693 `"0693"', add
label define occ_lbl 0694 `"0694"', add
label define occ_lbl 0695 `"0695"', add
label define occ_lbl 0696 `"0696"', add
label define occ_lbl 0697 `"0697"', add
label define occ_lbl 0698 `"0698"', add
label define occ_lbl 0699 `"0699"', add
label define occ_lbl 0700 `"0700"', add
label define occ_lbl 0701 `"0701"', add
label define occ_lbl 0702 `"0702"', add
label define occ_lbl 0703 `"0703"', add
label define occ_lbl 0704 `"0704"', add
label define occ_lbl 0705 `"0705"', add
label define occ_lbl 0706 `"0706"', add
label define occ_lbl 0707 `"0707"', add
label define occ_lbl 0708 `"0708"', add
label define occ_lbl 0709 `"0709"', add
label define occ_lbl 0710 `"0710"', add
label define occ_lbl 0711 `"0711"', add
label define occ_lbl 0712 `"0712"', add
label define occ_lbl 0713 `"0713"', add
label define occ_lbl 0714 `"0714"', add
label define occ_lbl 0715 `"0715"', add
label define occ_lbl 0716 `"0716"', add
label define occ_lbl 0717 `"0717"', add
label define occ_lbl 0718 `"0718"', add
label define occ_lbl 0719 `"0719"', add
label define occ_lbl 0720 `"0720"', add
label define occ_lbl 0721 `"0721"', add
label define occ_lbl 0722 `"0722"', add
label define occ_lbl 0723 `"0723"', add
label define occ_lbl 0724 `"0724"', add
label define occ_lbl 0725 `"0725"', add
label define occ_lbl 0726 `"0726"', add
label define occ_lbl 0727 `"0727"', add
label define occ_lbl 0728 `"0728"', add
label define occ_lbl 0729 `"0729"', add
label define occ_lbl 0730 `"0730"', add
label define occ_lbl 0731 `"0731"', add
label define occ_lbl 0732 `"0732"', add
label define occ_lbl 0733 `"0733"', add
label define occ_lbl 0734 `"0734"', add
label define occ_lbl 0735 `"0735"', add
label define occ_lbl 0736 `"0736"', add
label define occ_lbl 0737 `"0737"', add
label define occ_lbl 0738 `"0738"', add
label define occ_lbl 0739 `"0739"', add
label define occ_lbl 0740 `"0740"', add
label define occ_lbl 0741 `"0741"', add
label define occ_lbl 0742 `"0742"', add
label define occ_lbl 0743 `"0743"', add
label define occ_lbl 0744 `"0744"', add
label define occ_lbl 0745 `"0745"', add
label define occ_lbl 0746 `"0746"', add
label define occ_lbl 0747 `"0747"', add
label define occ_lbl 0748 `"0748"', add
label define occ_lbl 0749 `"0749"', add
label define occ_lbl 0750 `"0750"', add
label define occ_lbl 0751 `"0751"', add
label define occ_lbl 0752 `"0752"', add
label define occ_lbl 0753 `"0753"', add
label define occ_lbl 0754 `"0754"', add
label define occ_lbl 0755 `"0755"', add
label define occ_lbl 0756 `"0756"', add
label define occ_lbl 0757 `"0757"', add
label define occ_lbl 0758 `"0758"', add
label define occ_lbl 0759 `"0759"', add
label define occ_lbl 0760 `"0760"', add
label define occ_lbl 0761 `"0761"', add
label define occ_lbl 0762 `"0762"', add
label define occ_lbl 0763 `"0763"', add
label define occ_lbl 0764 `"0764"', add
label define occ_lbl 0765 `"0765"', add
label define occ_lbl 0766 `"0766"', add
label define occ_lbl 0767 `"0767"', add
label define occ_lbl 0768 `"0768"', add
label define occ_lbl 0769 `"0769"', add
label define occ_lbl 0770 `"0770"', add
label define occ_lbl 0771 `"0771"', add
label define occ_lbl 0772 `"0772"', add
label define occ_lbl 0773 `"0773"', add
label define occ_lbl 0774 `"0774"', add
label define occ_lbl 0775 `"0775"', add
label define occ_lbl 0776 `"0776"', add
label define occ_lbl 0777 `"0777"', add
label define occ_lbl 0778 `"0778"', add
label define occ_lbl 0779 `"0779"', add
label define occ_lbl 0780 `"0780"', add
label define occ_lbl 0781 `"0781"', add
label define occ_lbl 0782 `"0782"', add
label define occ_lbl 0783 `"0783"', add
label define occ_lbl 0784 `"0784"', add
label define occ_lbl 0785 `"0785"', add
label define occ_lbl 0786 `"0786"', add
label define occ_lbl 0787 `"0787"', add
label define occ_lbl 0788 `"0788"', add
label define occ_lbl 0789 `"0789"', add
label define occ_lbl 0790 `"0790"', add
label define occ_lbl 0791 `"0791"', add
label define occ_lbl 0792 `"0792"', add
label define occ_lbl 0793 `"0793"', add
label define occ_lbl 0794 `"0794"', add
label define occ_lbl 0795 `"0795"', add
label define occ_lbl 0796 `"0796"', add
label define occ_lbl 0797 `"0797"', add
label define occ_lbl 0798 `"0798"', add
label define occ_lbl 0799 `"0799"', add
label define occ_lbl 0800 `"0800"', add
label define occ_lbl 0801 `"0801"', add
label define occ_lbl 0802 `"0802"', add
label define occ_lbl 0803 `"0803"', add
label define occ_lbl 0804 `"0804"', add
label define occ_lbl 0805 `"0805"', add
label define occ_lbl 0806 `"0806"', add
label define occ_lbl 0807 `"0807"', add
label define occ_lbl 0808 `"0808"', add
label define occ_lbl 0809 `"0809"', add
label define occ_lbl 0810 `"0810"', add
label define occ_lbl 0811 `"0811"', add
label define occ_lbl 0812 `"0812"', add
label define occ_lbl 0813 `"0813"', add
label define occ_lbl 0814 `"0814"', add
label define occ_lbl 0815 `"0815"', add
label define occ_lbl 0816 `"0816"', add
label define occ_lbl 0817 `"0817"', add
label define occ_lbl 0818 `"0818"', add
label define occ_lbl 0819 `"0819"', add
label define occ_lbl 0820 `"0820"', add
label define occ_lbl 0821 `"0821"', add
label define occ_lbl 0822 `"0822"', add
label define occ_lbl 0823 `"0823"', add
label define occ_lbl 0824 `"0824"', add
label define occ_lbl 0825 `"0825"', add
label define occ_lbl 0826 `"0826"', add
label define occ_lbl 0827 `"0827"', add
label define occ_lbl 0828 `"0828"', add
label define occ_lbl 0829 `"0829"', add
label define occ_lbl 0830 `"0830"', add
label define occ_lbl 0831 `"0831"', add
label define occ_lbl 0832 `"0832"', add
label define occ_lbl 0833 `"0833"', add
label define occ_lbl 0834 `"0834"', add
label define occ_lbl 0835 `"0835"', add
label define occ_lbl 0836 `"0836"', add
label define occ_lbl 0837 `"0837"', add
label define occ_lbl 0838 `"0838"', add
label define occ_lbl 0839 `"0839"', add
label define occ_lbl 0840 `"0840"', add
label define occ_lbl 0841 `"0841"', add
label define occ_lbl 0842 `"0842"', add
label define occ_lbl 0843 `"0843"', add
label define occ_lbl 0844 `"0844"', add
label define occ_lbl 0845 `"0845"', add
label define occ_lbl 0846 `"0846"', add
label define occ_lbl 0847 `"0847"', add
label define occ_lbl 0848 `"0848"', add
label define occ_lbl 0849 `"0849"', add
label define occ_lbl 0850 `"0850"', add
label define occ_lbl 0851 `"0851"', add
label define occ_lbl 0852 `"0852"', add
label define occ_lbl 0853 `"0853"', add
label define occ_lbl 0854 `"0854"', add
label define occ_lbl 0855 `"0855"', add
label define occ_lbl 0856 `"0856"', add
label define occ_lbl 0857 `"0857"', add
label define occ_lbl 0858 `"0858"', add
label define occ_lbl 0859 `"0859"', add
label define occ_lbl 0860 `"0860"', add
label define occ_lbl 0861 `"0861"', add
label define occ_lbl 0862 `"0862"', add
label define occ_lbl 0863 `"0863"', add
label define occ_lbl 0864 `"0864"', add
label define occ_lbl 0865 `"0865"', add
label define occ_lbl 0866 `"0866"', add
label define occ_lbl 0867 `"0867"', add
label define occ_lbl 0868 `"0868"', add
label define occ_lbl 0869 `"0869"', add
label define occ_lbl 0870 `"0870"', add
label define occ_lbl 0871 `"0871"', add
label define occ_lbl 0872 `"0872"', add
label define occ_lbl 0873 `"0873"', add
label define occ_lbl 0874 `"0874"', add
label define occ_lbl 0875 `"0875"', add
label define occ_lbl 0876 `"0876"', add
label define occ_lbl 0877 `"0877"', add
label define occ_lbl 0878 `"0878"', add
label define occ_lbl 0879 `"0879"', add
label define occ_lbl 0880 `"0880"', add
label define occ_lbl 0881 `"0881"', add
label define occ_lbl 0882 `"0882"', add
label define occ_lbl 0883 `"0883"', add
label define occ_lbl 0884 `"0884"', add
label define occ_lbl 0885 `"0885"', add
label define occ_lbl 0886 `"0886"', add
label define occ_lbl 0887 `"0887"', add
label define occ_lbl 0888 `"0888"', add
label define occ_lbl 0889 `"0889"', add
label define occ_lbl 0890 `"0890"', add
label define occ_lbl 0891 `"0891"', add
label define occ_lbl 0892 `"0892"', add
label define occ_lbl 0893 `"0893"', add
label define occ_lbl 0894 `"0894"', add
label define occ_lbl 0895 `"0895"', add
label define occ_lbl 0896 `"0896"', add
label define occ_lbl 0897 `"0897"', add
label define occ_lbl 0898 `"0898"', add
label define occ_lbl 0899 `"0899"', add
label define occ_lbl 0900 `"0900"', add
label define occ_lbl 0901 `"0901"', add
label define occ_lbl 0902 `"0902"', add
label define occ_lbl 0903 `"0903"', add
label define occ_lbl 0904 `"0904"', add
label define occ_lbl 0905 `"0905"', add
label define occ_lbl 0906 `"0906"', add
label define occ_lbl 0907 `"0907"', add
label define occ_lbl 0908 `"0908"', add
label define occ_lbl 0909 `"0909"', add
label define occ_lbl 0910 `"0910"', add
label define occ_lbl 0911 `"0911"', add
label define occ_lbl 0912 `"0912"', add
label define occ_lbl 0913 `"0913"', add
label define occ_lbl 0914 `"0914"', add
label define occ_lbl 0915 `"0915"', add
label define occ_lbl 0916 `"0916"', add
label define occ_lbl 0917 `"0917"', add
label define occ_lbl 0918 `"0918"', add
label define occ_lbl 0919 `"0919"', add
label define occ_lbl 0920 `"0920"', add
label define occ_lbl 0921 `"0921"', add
label define occ_lbl 0922 `"0922"', add
label define occ_lbl 0923 `"0923"', add
label define occ_lbl 0924 `"0924"', add
label define occ_lbl 0925 `"0925"', add
label define occ_lbl 0926 `"0926"', add
label define occ_lbl 0927 `"0927"', add
label define occ_lbl 0928 `"0928"', add
label define occ_lbl 0929 `"0929"', add
label define occ_lbl 0930 `"0930"', add
label define occ_lbl 0931 `"0931"', add
label define occ_lbl 0932 `"0932"', add
label define occ_lbl 0933 `"0933"', add
label define occ_lbl 0934 `"0934"', add
label define occ_lbl 0935 `"0935"', add
label define occ_lbl 0936 `"0936"', add
label define occ_lbl 0937 `"0937"', add
label define occ_lbl 0938 `"0938"', add
label define occ_lbl 0939 `"0939"', add
label define occ_lbl 0940 `"0940"', add
label define occ_lbl 0941 `"0941"', add
label define occ_lbl 0942 `"0942"', add
label define occ_lbl 0943 `"0943"', add
label define occ_lbl 0944 `"0944"', add
label define occ_lbl 0945 `"0945"', add
label define occ_lbl 0946 `"0946"', add
label define occ_lbl 0947 `"0947"', add
label define occ_lbl 0948 `"0948"', add
label define occ_lbl 0949 `"0949"', add
label define occ_lbl 0950 `"0950"', add
label define occ_lbl 0951 `"0951"', add
label define occ_lbl 0952 `"0952"', add
label define occ_lbl 0953 `"0953"', add
label define occ_lbl 0954 `"0954"', add
label define occ_lbl 0955 `"0955"', add
label define occ_lbl 0956 `"0956"', add
label define occ_lbl 0957 `"0957"', add
label define occ_lbl 0958 `"0958"', add
label define occ_lbl 0959 `"0959"', add
label define occ_lbl 0960 `"0960"', add
label define occ_lbl 0961 `"0961"', add
label define occ_lbl 0962 `"0962"', add
label define occ_lbl 0963 `"0963"', add
label define occ_lbl 0964 `"0964"', add
label define occ_lbl 0965 `"0965"', add
label define occ_lbl 0966 `"0966"', add
label define occ_lbl 0967 `"0967"', add
label define occ_lbl 0968 `"0968"', add
label define occ_lbl 0969 `"0969"', add
label define occ_lbl 0970 `"0970"', add
label define occ_lbl 0971 `"0971"', add
label define occ_lbl 0972 `"0972"', add
label define occ_lbl 0973 `"0973"', add
label define occ_lbl 0974 `"0974"', add
label define occ_lbl 0975 `"0975"', add
label define occ_lbl 0976 `"0976"', add
label define occ_lbl 0977 `"0977"', add
label define occ_lbl 0978 `"0978"', add
label define occ_lbl 0979 `"0979"', add
label define occ_lbl 0980 `"0980"', add
label define occ_lbl 0981 `"0981"', add
label define occ_lbl 0982 `"0982"', add
label define occ_lbl 0983 `"0983"', add
label define occ_lbl 0984 `"0984"', add
label define occ_lbl 0985 `"0985"', add
label define occ_lbl 0986 `"0986"', add
label define occ_lbl 0987 `"0987"', add
label define occ_lbl 0988 `"0988"', add
label define occ_lbl 0989 `"0989"', add
label define occ_lbl 0990 `"0990"', add
label define occ_lbl 0991 `"0991"', add
label define occ_lbl 0992 `"0992"', add
label define occ_lbl 0993 `"0993"', add
label define occ_lbl 0994 `"0994"', add
label define occ_lbl 0995 `"0995"', add
label define occ_lbl 0996 `"0996"', add
label define occ_lbl 0997 `"0997"', add
label define occ_lbl 0998 `"0998"', add
label define occ_lbl 0999 `"0999"', add
label values occ occ_lbl

label define occ1950_lbl 000 `"Accountants and auditors"'
label define occ1950_lbl 001 `"Actors and actresses"', add
label define occ1950_lbl 002 `"Airplane pilots and navigators"', add
label define occ1950_lbl 003 `"Architects"', add
label define occ1950_lbl 004 `"Artists and art teachers"', add
label define occ1950_lbl 005 `"Athletes"', add
label define occ1950_lbl 006 `"Authors"', add
label define occ1950_lbl 007 `"Chemists"', add
label define occ1950_lbl 008 `"Chiropractors"', add
label define occ1950_lbl 009 `"Clergymen"', add
label define occ1950_lbl 010 `"College presidents and deans"', add
label define occ1950_lbl 012 `"Agricultural sciences-Professors and instructors"', add
label define occ1950_lbl 013 `"Biological sciences-Professors and instructors"', add
label define occ1950_lbl 014 `"Chemistry-Professors and instructors"', add
label define occ1950_lbl 015 `"Economics-Professors and instructors"', add
label define occ1950_lbl 016 `"Engineering-Professors and instructors"', add
label define occ1950_lbl 017 `"Geology and geophysics-Professors and instructors"', add
label define occ1950_lbl 018 `"Mathematics-Professors and instructors"', add
label define occ1950_lbl 019 `"Medical Sciences-Professors and instructors"', add
label define occ1950_lbl 023 `"Physics-Professors and instructors"', add
label define occ1950_lbl 024 `"Psychology-Professors and instructors"', add
label define occ1950_lbl 025 `"Statistics-Professors and instructors"', add
label define occ1950_lbl 026 `"Natural science (nec)-Professors and instructors"', add
label define occ1950_lbl 027 `"Social sciences (nec)-Professors and instructors"', add
label define occ1950_lbl 028 `"Non-scientific subjects-Professors and instructors"', add
label define occ1950_lbl 029 `"Subject not specified-Professors and instructors"', add
label define occ1950_lbl 031 `"Dancers and dancing teachers"', add
label define occ1950_lbl 032 `"Dentists"', add
label define occ1950_lbl 033 `"Designers"', add
label define occ1950_lbl 034 `"Dietitians and nutritionists"', add
label define occ1950_lbl 035 `"Draftsmen"', add
label define occ1950_lbl 036 `"Editors and reporters"', add
label define occ1950_lbl 041 `"Aeronautical-Engineers"', add
label define occ1950_lbl 042 `"Chemical-Engineers"', add
label define occ1950_lbl 043 `"Civil-Engineers"', add
label define occ1950_lbl 044 `"Electrical-Engineers"', add
label define occ1950_lbl 045 `"Industrial-Engineers"', add
label define occ1950_lbl 046 `"Mechanical-Engineers"', add
label define occ1950_lbl 047 `"Metallurgical, metallurgists-Engineers"', add
label define occ1950_lbl 048 `"Mining-Engineers"', add
label define occ1950_lbl 049 `"Engineers (nec)"', add
label define occ1950_lbl 051 `"Entertainers (nec)"', add
label define occ1950_lbl 052 `"Farm and home management advisors"', add
label define occ1950_lbl 053 `"Foresters and conservationists"', add
label define occ1950_lbl 054 `"Funeral directors and embalmers"', add
label define occ1950_lbl 055 `"Lawyers and judges"', add
label define occ1950_lbl 056 `"Librarians"', add
label define occ1950_lbl 057 `"Musicians and music teachers"', add
label define occ1950_lbl 058 `"Nurses, professional"', add
label define occ1950_lbl 059 `"Nurses, student professional"', add
label define occ1950_lbl 061 `"Agricultural scientists"', add
label define occ1950_lbl 062 `"Biological scientists"', add
label define occ1950_lbl 063 `"Geologists and geophysicists"', add
label define occ1950_lbl 067 `"Mathematicians"', add
label define occ1950_lbl 068 `"Physicists"', add
label define occ1950_lbl 069 `"Misc. natural scientists"', add
label define occ1950_lbl 070 `"Optometrists"', add
label define occ1950_lbl 071 `"Osteopaths"', add
label define occ1950_lbl 072 `"Personnel and labor relations workers"', add
label define occ1950_lbl 073 `"Pharmacists"', add
label define occ1950_lbl 074 `"Photographers"', add
label define occ1950_lbl 075 `"Physicians and surgeons"', add
label define occ1950_lbl 076 `"Radio operators"', add
label define occ1950_lbl 077 `"Recreation and group workers"', add
label define occ1950_lbl 078 `"Religious workers"', add
label define occ1950_lbl 079 `"Social and welfare workers, except group"', add
label define occ1950_lbl 081 `"Economists"', add
label define occ1950_lbl 082 `"Psychologists"', add
label define occ1950_lbl 083 `"Statisticians and actuaries"', add
label define occ1950_lbl 084 `"Misc social scientists"', add
label define occ1950_lbl 091 `"Sports instructors and officials"', add
label define occ1950_lbl 092 `"Surveyors"', add
label define occ1950_lbl 093 `"Teachers (n.e.c.)"', add
label define occ1950_lbl 094 `"Medical and dental-technicians"', add
label define occ1950_lbl 095 `"Testing-technicians"', add
label define occ1950_lbl 096 `"Technicians (nec)"', add
label define occ1950_lbl 097 `"Therapists and healers (nec)"', add
label define occ1950_lbl 098 `"Veterinarians"', add
label define occ1950_lbl 099 `"Professional, technical and kindred workers (nec)"', add
label define occ1950_lbl 100 `"Farmers (owners and tenants)"', add
label define occ1950_lbl 123 `"Farm managers"', add
label define occ1950_lbl 200 `"Buyers and dept heads, store"', add
label define occ1950_lbl 201 `"Buyers and shippers, farm products"', add
label define occ1950_lbl 203 `"Conductors, railroad"', add
label define occ1950_lbl 204 `"Credit men"', add
label define occ1950_lbl 205 `"Floormen and floor managers, store"', add
label define occ1950_lbl 210 `"Inspectors, public administration"', add
label define occ1950_lbl 230 `"Managers and superintendants, building"', add
label define occ1950_lbl 240 `"Officers, pilots, pursers and engineers, ship"', add
label define occ1950_lbl 250 `"Officials and administratators (nec), public administration"', add
label define occ1950_lbl 260 `"Officials, lodge, society, union, etc."', add
label define occ1950_lbl 270 `"Postmasters"', add
label define occ1950_lbl 280 `"Purchasing agents and buyers (nec)"', add
label define occ1950_lbl 290 `"Managers, officials, and proprietors (nec)"', add
label define occ1950_lbl 300 `"Agents (nec)"', add
label define occ1950_lbl 301 `"Attendants and assistants, library"', add
label define occ1950_lbl 302 `"Attendants, physicians and dentists office"', add
label define occ1950_lbl 304 `"Baggagemen, transportation"', add
label define occ1950_lbl 305 `"Bank tellers"', add
label define occ1950_lbl 310 `"Bookkeepers"', add
label define occ1950_lbl 320 `"Cashiers"', add
label define occ1950_lbl 321 `"Collectors, bill and account"', add
label define occ1950_lbl 322 `"Dispatchers and starters, vehicle"', add
label define occ1950_lbl 325 `"Express messengers and railway mail clerks"', add
label define occ1950_lbl 335 `"Mail carriers"', add
label define occ1950_lbl 340 `"Messengers and office boys"', add
label define occ1950_lbl 341 `"Office machine operators"', add
label define occ1950_lbl 342 `"Shipping and receiving clerks"', add
label define occ1950_lbl 350 `"Stenographers, typists, and secretaries"', add
label define occ1950_lbl 360 `"Telegraph messengers"', add
label define occ1950_lbl 365 `"Telegraph operators"', add
label define occ1950_lbl 370 `"Telephone operators"', add
label define occ1950_lbl 380 `"Ticket, station, and express agents"', add
label define occ1950_lbl 390 `"Clerical and kindred workers (n.e.c.)"', add
label define occ1950_lbl 400 `"Advertising agents and salesmen"', add
label define occ1950_lbl 410 `"Auctioneers"', add
label define occ1950_lbl 420 `"Demonstrators"', add
label define occ1950_lbl 430 `"Hucksters and peddlers"', add
label define occ1950_lbl 450 `"Insurance agents and brokers"', add
label define occ1950_lbl 460 `"Newsboys"', add
label define occ1950_lbl 470 `"Real estate agents and brokers"', add
label define occ1950_lbl 480 `"Stock and bond salesmen"', add
label define occ1950_lbl 490 `"Salesmen and sales clerks (nec)"', add
label define occ1950_lbl 500 `"Bakers"', add
label define occ1950_lbl 501 `"Blacksmiths"', add
label define occ1950_lbl 502 `"Bookbinders"', add
label define occ1950_lbl 503 `"Boilermakers"', add
label define occ1950_lbl 504 `"Brickmasons,stonemasons, and tile setters"', add
label define occ1950_lbl 505 `"Cabinetmakers"', add
label define occ1950_lbl 510 `"Carpenters"', add
label define occ1950_lbl 511 `"Cement and concrete finishers"', add
label define occ1950_lbl 512 `"Compositors and typesetters"', add
label define occ1950_lbl 513 `"Cranemen,derrickmen, and hoistmen"', add
label define occ1950_lbl 514 `"Decorators and window dressers"', add
label define occ1950_lbl 515 `"Electricians"', add
label define occ1950_lbl 520 `"Electrotypers and stereotypers"', add
label define occ1950_lbl 521 `"Engravers, except photoengravers"', add
label define occ1950_lbl 522 `"Excavating, grading, and road machinery operators"', add
label define occ1950_lbl 523 `"Foremen (nec)"', add
label define occ1950_lbl 524 `"Forgemen and hammermen"', add
label define occ1950_lbl 525 `"Furriers"', add
label define occ1950_lbl 530 `"Glaziers"', add
label define occ1950_lbl 531 `"Heat treaters, annealers, temperers"', add
label define occ1950_lbl 532 `"Inspectors, scalers, and graders log and lumber"', add
label define occ1950_lbl 533 `"Inspectors (nec)"', add
label define occ1950_lbl 534 `"Jewelers, watchmakers, goldsmiths, and silversmiths"', add
label define occ1950_lbl 535 `"Job setters, metal"', add
label define occ1950_lbl 540 `"Linemen and servicemen, telegraph, telephone, and power"', add
label define occ1950_lbl 541 `"Locomotive engineers"', add
label define occ1950_lbl 542 `"Locomotive firemen"', add
label define occ1950_lbl 543 `"Loom fixers"', add
label define occ1950_lbl 544 `"Machinists"', add
label define occ1950_lbl 545 `"Airplane-mechanics and repairmen"', add
label define occ1950_lbl 550 `"Automobile-mechanics and repairmen"', add
label define occ1950_lbl 551 `"Office machine-mechanics and repairmen"', add
label define occ1950_lbl 552 `"Radio and television-mechanics and repairmen"', add
label define occ1950_lbl 553 `"Railroad and car shop-mechanics and repairmen"', add
label define occ1950_lbl 554 `"Mechanics and repairmen (nec)"', add
label define occ1950_lbl 555 `"Millers, grain, flour, feed, etc"', add
label define occ1950_lbl 560 `"Millwrights"', add
label define occ1950_lbl 561 `"Molders, metal"', add
label define occ1950_lbl 562 `"Motion picture projectionists"', add
label define occ1950_lbl 563 `"Opticians and lens grinders and polishers"', add
label define occ1950_lbl 564 `"Painters, construction and maintenance"', add
label define occ1950_lbl 565 `"Paperhangers"', add
label define occ1950_lbl 570 `"Pattern and model makers, except paper"', add
label define occ1950_lbl 571 `"Photoengravers and lithographers"', add
label define occ1950_lbl 572 `"Piano and organ tuners and repairmen"', add
label define occ1950_lbl 573 `"Plasterers"', add
label define occ1950_lbl 574 `"Plumbers and pipe fitters"', add
label define occ1950_lbl 575 `"Pressmen and plate printers, printing"', add
label define occ1950_lbl 580 `"Rollers and roll hands, metal"', add
label define occ1950_lbl 581 `"Roofers and slaters"', add
label define occ1950_lbl 582 `"Shoemakers and repairers, except factory"', add
label define occ1950_lbl 583 `"Stationary engineers"', add
label define occ1950_lbl 584 `"Stone cutters and stone carvers"', add
label define occ1950_lbl 585 `"Structural metal workers"', add
label define occ1950_lbl 590 `"Tailors and tailoresses"', add
label define occ1950_lbl 591 `"Tinsmiths, coppersmiths, and sheet metal workers"', add
label define occ1950_lbl 592 `"Tool makers, and die makers and setters"', add
label define occ1950_lbl 593 `"Upholsterers"', add
label define occ1950_lbl 594 `"Craftsmen and kindred workers (nec)"', add
label define occ1950_lbl 595 `"Members of the armed services"', add
label define occ1950_lbl 600 `"Auto mechanics apprentice"', add
label define occ1950_lbl 601 `"Bricklayers and masons apprentice"', add
label define occ1950_lbl 602 `"Carpenters apprentice"', add
label define occ1950_lbl 603 `"Electricians apprentice"', add
label define occ1950_lbl 604 `"Machinists and toolmakers apprentice"', add
label define occ1950_lbl 605 `"Mechanics, except auto apprentice"', add
label define occ1950_lbl 610 `"Plumbers and pipe fitters apprentice"', add
label define occ1950_lbl 611 `"Apprentices, building trades (nec)"', add
label define occ1950_lbl 612 `"Apprentices, metalworking trades (nec)"', add
label define occ1950_lbl 613 `"Apprentices, printing  trades"', add
label define occ1950_lbl 614 `"Apprentices, other specified trades"', add
label define occ1950_lbl 615 `"Apprentices, trade not specified"', add
label define occ1950_lbl 620 `"Asbestos and insulation workers"', add
label define occ1950_lbl 621 `"Attendants, auto service and parking"', add
label define occ1950_lbl 622 `"Blasters and powdermen"', add
label define occ1950_lbl 623 `"Boatmen, canalmen, and lock keepers"', add
label define occ1950_lbl 624 `"Brakemen, railroad"', add
label define occ1950_lbl 625 `"Bus drivers"', add
label define occ1950_lbl 630 `"Chainmen, rodmen, and axmen, surveying"', add
label define occ1950_lbl 631 `"Conductors, bus and street railway"', add
label define occ1950_lbl 632 `"Deliverymen and routemen"', add
label define occ1950_lbl 633 `"Dressmakers and seamstresses, except factory"', add
label define occ1950_lbl 634 `"Dyers"', add
label define occ1950_lbl 635 `"Filers, grinders, and polishers, metal"', add
label define occ1950_lbl 640 `"Fruit, nut, and vegetable graders, and packers, except facto"', add
label define occ1950_lbl 641 `"Furnacemen, smeltermen and pourers"', add
label define occ1950_lbl 642 `"Heaters, metal"', add
label define occ1950_lbl 643 `"Laundry and dry cleaning Operatives"', add
label define occ1950_lbl 644 `"Meat cutters, except slaughter and packing house"', add
label define occ1950_lbl 645 `"Milliners"', add
label define occ1950_lbl 650 `"Mine operatives and laborers"', add
label define occ1950_lbl 660 `"Motormen, mine, factory, logging camp, etc"', add
label define occ1950_lbl 661 `"Motormen, street, subway, and elevated railway"', add
label define occ1950_lbl 662 `"Oilers and greaser, except auto"', add
label define occ1950_lbl 670 `"Painters, except construction or maintenance"', add
label define occ1950_lbl 671 `"Photographic process workers"', add
label define occ1950_lbl 672 `"Power station operators"', add
label define occ1950_lbl 673 `"Sailors and deck hands"', add
label define occ1950_lbl 674 `"Sawyers"', add
label define occ1950_lbl 675 `"Spinners, textile"', add
label define occ1950_lbl 680 `"Stationary firemen"', add
label define occ1950_lbl 681 `"Switchmen, railroad"', add
label define occ1950_lbl 682 `"Taxicab drivers and chauffeurs"', add
label define occ1950_lbl 683 `"Truck and tractor drivers"', add
label define occ1950_lbl 684 `"Weavers, textile"', add
label define occ1950_lbl 685 `"Welders and flame cutters"', add
label define occ1950_lbl 690 `"Operative and kindred workers (nec)"', add
label define occ1950_lbl 700 `"Housekeepers, private household"', add
label define occ1950_lbl 710 `"Laundresses, private household"', add
label define occ1950_lbl 720 `"Private household workers (nec)"', add
label define occ1950_lbl 730 `"Attendants, hospital and other institution"', add
label define occ1950_lbl 731 `"Attendants, professional and personal service (nec)"', add
label define occ1950_lbl 732 `"Attendants, recreation and amusement"', add
label define occ1950_lbl 740 `"Barbers, beauticians, and manicurists"', add
label define occ1950_lbl 750 `"Bartenders"', add
label define occ1950_lbl 751 `"Bootblacks"', add
label define occ1950_lbl 752 `"Boarding and lodging house keepers"', add
label define occ1950_lbl 753 `"Charwomen and cleaners"', add
label define occ1950_lbl 754 `"Cooks, except private household"', add
label define occ1950_lbl 760 `"Counter and fountain workers"', add
label define occ1950_lbl 761 `"Elevator operators"', add
label define occ1950_lbl 762 `"Firemen, fire protection"', add
label define occ1950_lbl 763 `"Guards, watchmen, and doorkeepers"', add
label define occ1950_lbl 764 `"Housekeepers and stewards, except private household"', add
label define occ1950_lbl 770 `"Janitors and sextons"', add
label define occ1950_lbl 771 `"Marshals and constables"', add
label define occ1950_lbl 772 `"Midwives"', add
label define occ1950_lbl 773 `"Policemen and detectives"', add
label define occ1950_lbl 780 `"Porters"', add
label define occ1950_lbl 781 `"Practical nurses"', add
label define occ1950_lbl 782 `"Sheriffs and bailiffs"', add
label define occ1950_lbl 783 `"Ushers, recreation and amusement"', add
label define occ1950_lbl 784 `"Waiters and waitresses"', add
label define occ1950_lbl 785 `"Watchmen (crossing) and bridge tenders"', add
label define occ1950_lbl 790 `"Service workers, except private household (nec)"', add
label define occ1950_lbl 810 `"Farm foremen"', add
label define occ1950_lbl 820 `"Farm laborers, wage workers"', add
label define occ1950_lbl 830 `"Farm laborers, unpaid family workers"', add
label define occ1950_lbl 840 `"Farm service laborers, self-employed"', add
label define occ1950_lbl 910 `"Fishermen and oystermen"', add
label define occ1950_lbl 920 `"Garage laborers and car washers and greasers"', add
label define occ1950_lbl 930 `"Gardeners, except farm and groundskeepers"', add
label define occ1950_lbl 940 `"Longshoremen and stevedores"', add
label define occ1950_lbl 950 `"Lumbermen, raftsmen, and woodchoppers"', add
label define occ1950_lbl 960 `"Teamsters"', add
label define occ1950_lbl 970 `"Laborers (nec)"', add
label define occ1950_lbl 979 `"Not yet classified"', add
label define occ1950_lbl 980 `"Keeps house/housekeeping at home/housewife"', add
label define occ1950_lbl 981 `"Imputed keeping house (1850-1900)"', add
label define occ1950_lbl 982 `"Helping at home/helps parents/housework"', add
label define occ1950_lbl 983 `"At school/student"', add
label define occ1950_lbl 984 `"Retired"', add
label define occ1950_lbl 985 `"Unemployed/without occupation"', add
label define occ1950_lbl 986 `"Invalid/disabled w/ no occupation reported"', add
label define occ1950_lbl 987 `"Inmate"', add
label define occ1950_lbl 990 `"New Worker"', add
label define occ1950_lbl 991 `"Gentleman/lady/at leisure"', add
label define occ1950_lbl 995 `"Other non-occupation"', add
label define occ1950_lbl 997 `"Occupation missing/unknown"', add
label define occ1950_lbl 999 `"N/A (blank)"', add
label values occ1950 occ1950_lbl

label define occ1990_lbl 003 `"Legislators"'
label define occ1990_lbl 004 `"Chief executives and public administrators"', add
label define occ1990_lbl 007 `"Financial managers"', add
label define occ1990_lbl 008 `"Human resources and labor relations managers"', add
label define occ1990_lbl 013 `"Managers and specialists in marketing, advertising, and public relations"', add
label define occ1990_lbl 014 `"Managers in education and related fields"', add
label define occ1990_lbl 015 `"Managers of medicine and health occupations"', add
label define occ1990_lbl 016 `"Postmasters and mail superintendents"', add
label define occ1990_lbl 017 `"Managers of food-serving and lodging establishments"', add
label define occ1990_lbl 018 `"Managers of properties and real estate"', add
label define occ1990_lbl 019 `"Funeral directors"', add
label define occ1990_lbl 021 `"Managers of service organizations, n.e.c."', add
label define occ1990_lbl 022 `"Managers and administrators, n.e.c."', add
label define occ1990_lbl 023 `"Accountants and auditors"', add
label define occ1990_lbl 024 `"Insurance underwriters"', add
label define occ1990_lbl 025 `"Other financial specialists"', add
label define occ1990_lbl 026 `"Management analysts"', add
label define occ1990_lbl 027 `"Personnel, HR, training, and labor relations specialists"', add
label define occ1990_lbl 028 `"Purchasing agents and buyers, of farm products"', add
label define occ1990_lbl 029 `"Buyers, wholesale and retail trade"', add
label define occ1990_lbl 033 `"Purchasing managers, agents and buyers, n.e.c."', add
label define occ1990_lbl 034 `"Business and promotion agents"', add
label define occ1990_lbl 035 `"Construction inspectors"', add
label define occ1990_lbl 036 `"Inspectors and compliance officers, outside construction"', add
label define occ1990_lbl 037 `"Management support occupations"', add
label define occ1990_lbl 043 `"Architects"', add
label define occ1990_lbl 044 `"Aerospace engineer"', add
label define occ1990_lbl 045 `"Metallurgical and materials engineers, variously phrased"', add
label define occ1990_lbl 047 `"Petroleum, mining, and geological engineers"', add
label define occ1990_lbl 048 `"Chemical engineers"', add
label define occ1990_lbl 053 `"Civil engineers"', add
label define occ1990_lbl 055 `"Electrical engineer"', add
label define occ1990_lbl 056 `"Industrial engineers"', add
label define occ1990_lbl 057 `"Mechanical engineers"', add
label define occ1990_lbl 059 `"Not-elsewhere-classified engineers"', add
label define occ1990_lbl 064 `"Computer systems analysts and computer scientists"', add
label define occ1990_lbl 065 `"Operations and systems researchers and analysts"', add
label define occ1990_lbl 066 `"Actuaries"', add
label define occ1990_lbl 067 `"Statisticians"', add
label define occ1990_lbl 068 `"Mathematicians and mathematical scientists"', add
label define occ1990_lbl 069 `"Physicists and astronomers"', add
label define occ1990_lbl 073 `"Chemists"', add
label define occ1990_lbl 074 `"Atmospheric and space scientists"', add
label define occ1990_lbl 075 `"Geologists"', add
label define occ1990_lbl 076 `"Physical scientists, n.e.c."', add
label define occ1990_lbl 077 `"Agricultural and food scientists"', add
label define occ1990_lbl 078 `"Biological scientists"', add
label define occ1990_lbl 079 `"Foresters and conservation scientists"', add
label define occ1990_lbl 083 `"Medical scientists"', add
label define occ1990_lbl 084 `"Physicians"', add
label define occ1990_lbl 085 `"Dentists"', add
label define occ1990_lbl 086 `"Veterinarians"', add
label define occ1990_lbl 087 `"Optometrists"', add
label define occ1990_lbl 088 `"Podiatrists"', add
label define occ1990_lbl 089 `"Other health and therapy"', add
label define occ1990_lbl 095 `"Registered nurses"', add
label define occ1990_lbl 096 `"Pharmacists"', add
label define occ1990_lbl 097 `"Dietitians and nutritionists"', add
label define occ1990_lbl 098 `"Respiratory therapists"', add
label define occ1990_lbl 099 `"Occupational therapists"', add
label define occ1990_lbl 103 `"Physical therapists"', add
label define occ1990_lbl 104 `"Speech therapists"', add
label define occ1990_lbl 105 `"Therapists, n.e.c."', add
label define occ1990_lbl 106 `"Physicians' assistants"', add
label define occ1990_lbl 113 `"Earth, environmental, and marine science instructors"', add
label define occ1990_lbl 114 `"Biological science instructors"', add
label define occ1990_lbl 115 `"Chemistry instructors"', add
label define occ1990_lbl 116 `"Physics instructors"', add
label define occ1990_lbl 118 `"Psychology instructors"', add
label define occ1990_lbl 119 `"Economics instructors"', add
label define occ1990_lbl 123 `"History instructors"', add
label define occ1990_lbl 125 `"Sociology instructors"', add
label define occ1990_lbl 127 `"Engineering instructors"', add
label define occ1990_lbl 128 `"Math instructors"', add
label define occ1990_lbl 139 `"Education instructors"', add
label define occ1990_lbl 145 `"Law instructors"', add
label define occ1990_lbl 147 `"Theology instructors"', add
label define occ1990_lbl 149 `"Home economics instructors"', add
label define occ1990_lbl 150 `"Humanities profs/instructors, college, nec"', add
label define occ1990_lbl 154 `"Subject instructors (HS/college)"', add
label define occ1990_lbl 155 `"Kindergarten and earlier school teachers"', add
label define occ1990_lbl 156 `"Primary school teachers"', add
label define occ1990_lbl 157 `"Secondary school teachers"', add
label define occ1990_lbl 158 `"Special education teachers"', add
label define occ1990_lbl 159 `"Teachers , n.e.c."', add
label define occ1990_lbl 163 `"Vocational and educational counselors"', add
label define occ1990_lbl 164 `"Librarians"', add
label define occ1990_lbl 165 `"Archivists and curators"', add
label define occ1990_lbl 166 `"Economists, market researchers, and survey researchers"', add
label define occ1990_lbl 167 `"Psychologists"', add
label define occ1990_lbl 168 `"Sociologists"', add
label define occ1990_lbl 169 `"Social scientists, n.e.c."', add
label define occ1990_lbl 173 `"Urban and regional planners"', add
label define occ1990_lbl 174 `"Social workers"', add
label define occ1990_lbl 175 `"Recreation workers"', add
label define occ1990_lbl 176 `"Clergy and religious workers"', add
label define occ1990_lbl 178 `"Lawyers"', add
label define occ1990_lbl 179 `"Judges"', add
label define occ1990_lbl 183 `"Writers and authors"', add
label define occ1990_lbl 184 `"Technical writers"', add
label define occ1990_lbl 185 `"Designers"', add
label define occ1990_lbl 186 `"Musician or composer"', add
label define occ1990_lbl 187 `"Actors, directors, producers"', add
label define occ1990_lbl 188 `"Art makers: painters, sculptors, craft-artists, and print-makers"', add
label define occ1990_lbl 189 `"Photographers"', add
label define occ1990_lbl 193 `"Dancers"', add
label define occ1990_lbl 194 `"Art/entertainment performers and related"', add
label define occ1990_lbl 195 `"Editors and reporters"', add
label define occ1990_lbl 198 `"Announcers"', add
label define occ1990_lbl 199 `"Athletes, sports instructors, and officials"', add
label define occ1990_lbl 200 `"Professionals, n.e.c."', add
label define occ1990_lbl 203 `"Clinical laboratory technologies and technicians"', add
label define occ1990_lbl 204 `"Dental hygenists"', add
label define occ1990_lbl 205 `"Health record tech specialists"', add
label define occ1990_lbl 206 `"Radiologic tech specialists"', add
label define occ1990_lbl 207 `"Licensed practical nurses"', add
label define occ1990_lbl 208 `"Health technologists and technicians, n.e.c."', add
label define occ1990_lbl 213 `"Electrical and electronic (engineering) technicians"', add
label define occ1990_lbl 214 `"Engineering technicians, n.e.c."', add
label define occ1990_lbl 215 `"Mechanical engineering technicians"', add
label define occ1990_lbl 217 `"Drafters"', add
label define occ1990_lbl 218 `"Surveyors, cartographers, mapping scientists and technicians"', add
label define occ1990_lbl 223 `"Biological technicians"', add
label define occ1990_lbl 224 `"Chemical technicians"', add
label define occ1990_lbl 225 `"Other science technicians"', add
label define occ1990_lbl 226 `"Airplane pilots and navigators"', add
label define occ1990_lbl 227 `"Air traffic controllers"', add
label define occ1990_lbl 228 `"Broadcast equipment operators"', add
label define occ1990_lbl 229 `"Computer software developers"', add
label define occ1990_lbl 233 `"Programmers of numerically controlled machine tools"', add
label define occ1990_lbl 234 `"Legal assistants, paralegals, legal support, etc"', add
label define occ1990_lbl 235 `"Technicians, n.e.c."', add
label define occ1990_lbl 243 `"Supervisors and proprietors of sales jobs"', add
label define occ1990_lbl 253 `"Insurance sales occupations"', add
label define occ1990_lbl 254 `"Real estate sales occupations"', add
label define occ1990_lbl 255 `"Financial services sales occupations"', add
label define occ1990_lbl 256 `"Advertising and related sales jobs"', add
label define occ1990_lbl 258 `"Sales engineers"', add
label define occ1990_lbl 274 `"Salespersons, n.e.c."', add
label define occ1990_lbl 275 `"Retail sales clerks"', add
label define occ1990_lbl 276 `"Cashiers"', add
label define occ1990_lbl 277 `"Door-to-door sales, street sales, and news vendors"', add
label define occ1990_lbl 283 `"Sales demonstrators / promoters / models"', add
label define occ1990_lbl 303 `"Office supervisors"', add
label define occ1990_lbl 308 `"Computer and peripheral equipment operators"', add
label define occ1990_lbl 313 `"Secretaries"', add
label define occ1990_lbl 314 `"Stenographers"', add
label define occ1990_lbl 315 `"Typists"', add
label define occ1990_lbl 316 `"Interviewers, enumerators, and surveyors"', add
label define occ1990_lbl 317 `"Hotel clerks"', add
label define occ1990_lbl 318 `"Transportation ticket and reservation agents"', add
label define occ1990_lbl 319 `"Receptionists"', add
label define occ1990_lbl 323 `"Information clerks, nec"', add
label define occ1990_lbl 326 `"Correspondence and order clerks"', add
label define occ1990_lbl 328 `"Human resources clerks, except payroll and timekeeping"', add
label define occ1990_lbl 329 `"Library assistants"', add
label define occ1990_lbl 335 `"File clerks"', add
label define occ1990_lbl 336 `"Records clerks"', add
label define occ1990_lbl 337 `"Bookkeepers and accounting and auditing clerks"', add
label define occ1990_lbl 338 `"Payroll and timekeeping clerks"', add
label define occ1990_lbl 343 `"Cost and rate clerks (financial records processing)"', add
label define occ1990_lbl 344 `"Billing clerks and related financial records processing"', add
label define occ1990_lbl 345 `"Duplication machine operators / office machine operators"', add
label define occ1990_lbl 346 `"Mail and paper handlers"', add
label define occ1990_lbl 347 `"Office machine operators, n.e.c."', add
label define occ1990_lbl 348 `"Telephone operators"', add
label define occ1990_lbl 349 `"Other telecom operators"', add
label define occ1990_lbl 354 `"Postal clerks, excluding mail carriers"', add
label define occ1990_lbl 355 `"Mail carriers for postal service"', add
label define occ1990_lbl 356 `"Mail clerks, outside of post office"', add
label define occ1990_lbl 357 `"Messengers"', add
label define occ1990_lbl 359 `"Dispatchers"', add
label define occ1990_lbl 361 `"Inspectors, n.e.c."', add
label define occ1990_lbl 364 `"Shipping and receiving clerks"', add
label define occ1990_lbl 365 `"Stock and inventory clerks"', add
label define occ1990_lbl 366 `"Meter readers"', add
label define occ1990_lbl 368 `"Weighers, measurers, and checkers"', add
label define occ1990_lbl 373 `"Material recording, scheduling, production, planning, and expediting clerks"', add
label define occ1990_lbl 375 `"Insurance adjusters, examiners, and investigators"', add
label define occ1990_lbl 376 `"Customer service reps, investigators and adjusters, except insurance"', add
label define occ1990_lbl 377 `"Eligibility clerks for government programs; social welfare"', add
label define occ1990_lbl 378 `"Bill and account collectors"', add
label define occ1990_lbl 379 `"General office clerks"', add
label define occ1990_lbl 383 `"Bank tellers"', add
label define occ1990_lbl 384 `"Proofreaders"', add
label define occ1990_lbl 385 `"Data entry keyers"', add
label define occ1990_lbl 386 `"Statistical clerks"', add
label define occ1990_lbl 387 `"Teacher's aides"', add
label define occ1990_lbl 389 `"Administrative support jobs, n.e.c."', add
label define occ1990_lbl 405 `"Housekeepers, maids, butlers, stewards, and lodging quarters cleaners"', add
label define occ1990_lbl 407 `"Private household cleaners and servants"', add
label define occ1990_lbl 415 `"Supervisors of guards"', add
label define occ1990_lbl 417 `"Fire fighting, prevention, and inspection"', add
label define occ1990_lbl 418 `"Police, detectives, and private investigators"', add
label define occ1990_lbl 423 `"Other law enforcement: sheriffs, bailiffs, correctional institution officers"', add
label define occ1990_lbl 425 `"Crossing guards and bridge tenders"', add
label define occ1990_lbl 426 `"Guards, watchmen, doorkeepers"', add
label define occ1990_lbl 427 `"Protective services, n.e.c."', add
label define occ1990_lbl 434 `"Bartenders"', add
label define occ1990_lbl 435 `"Waiter/waitress"', add
label define occ1990_lbl 436 `"Cooks, variously defined"', add
label define occ1990_lbl 438 `"Food counter and fountain workers"', add
label define occ1990_lbl 439 `"Kitchen workers"', add
label define occ1990_lbl 443 `"Waiter's assistant"', add
label define occ1990_lbl 444 `"Misc food prep workers"', add
label define occ1990_lbl 445 `"Dental assistants"', add
label define occ1990_lbl 446 `"Health aides, except nursing"', add
label define occ1990_lbl 447 `"Nursing aides, orderlies, and attendants"', add
label define occ1990_lbl 448 `"Supervisors of cleaning and building service"', add
label define occ1990_lbl 453 `"Janitors"', add
label define occ1990_lbl 454 `"Elevator operators"', add
label define occ1990_lbl 455 `"Pest control occupations"', add
label define occ1990_lbl 456 `"Supervisors of personal service jobs, n.e.c."', add
label define occ1990_lbl 457 `"Barbers"', add
label define occ1990_lbl 458 `"Hairdressers and cosmetologists"', add
label define occ1990_lbl 459 `"Recreation facility attendants"', add
label define occ1990_lbl 461 `"Guides"', add
label define occ1990_lbl 462 `"Ushers"', add
label define occ1990_lbl 463 `"Public transportation attendants and inspectors"', add
label define occ1990_lbl 464 `"Baggage porters"', add
label define occ1990_lbl 465 `"Welfare service aides"', add
label define occ1990_lbl 468 `"Child care workers"', add
label define occ1990_lbl 469 `"Personal service occupations, nec"', add
label define occ1990_lbl 473 `"Farmers (owners and tenants)"', add
label define occ1990_lbl 474 `"Horticultural specialty farmers"', add
label define occ1990_lbl 475 `"Farm managers, except for horticultural farms"', add
label define occ1990_lbl 476 `"Managers of horticultural specialty farms"', add
label define occ1990_lbl 479 `"Farm workers"', add
label define occ1990_lbl 483 `"Marine life cultivation workers"', add
label define occ1990_lbl 484 `"Nursery farming workers"', add
label define occ1990_lbl 485 `"Supervisors of agricultural occupations"', add
label define occ1990_lbl 486 `"Gardeners and groundskeepers"', add
label define occ1990_lbl 487 `"Animal caretakers except on farms"', add
label define occ1990_lbl 488 `"Graders and sorters of agricultural products"', add
label define occ1990_lbl 489 `"Inspectors of agricultural products"', add
label define occ1990_lbl 496 `"Timber, logging, and forestry workers"', add
label define occ1990_lbl 498 `"Fishers, hunters, and kindred"', add
label define occ1990_lbl 503 `"Supervisors of mechanics and repairers"', add
label define occ1990_lbl 505 `"Automobile mechanics"', add
label define occ1990_lbl 507 `"Bus, truck, and stationary engine mechanics"', add
label define occ1990_lbl 508 `"Aircraft mechanics"', add
label define occ1990_lbl 509 `"Small engine repairers"', add
label define occ1990_lbl 514 `"Auto body repairers"', add
label define occ1990_lbl 516 `"Heavy equipment and farm equipment mechanics"', add
label define occ1990_lbl 518 `"Industrial machinery repairers"', add
label define occ1990_lbl 519 `"Machinery maintenance occupations"', add
label define occ1990_lbl 523 `"Repairers of industrial electrical equipment"', add
label define occ1990_lbl 525 `"Repairers of data processing equipment"', add
label define occ1990_lbl 526 `"Repairers of household appliances and power tools"', add
label define occ1990_lbl 527 `"Telecom and line installers and repairers"', add
label define occ1990_lbl 533 `"Repairers of electrical equipment, n.e.c."', add
label define occ1990_lbl 534 `"Heating, air conditioning, and refigeration mechanics"', add
label define occ1990_lbl 535 `"Precision makers, repairers, and smiths"', add
label define occ1990_lbl 536 `"Locksmiths and safe repairers"', add
label define occ1990_lbl 538 `"Office machine repairers and mechanics"', add
label define occ1990_lbl 539 `"Repairers of mechanical controls and valves"', add
label define occ1990_lbl 543 `"Elevator installers and repairers"', add
label define occ1990_lbl 544 `"Millwrights"', add
label define occ1990_lbl 549 `"Mechanics and repairers, n.e.c."', add
label define occ1990_lbl 558 `"Supervisors of construction work"', add
label define occ1990_lbl 563 `"Masons, tilers, and carpet installers"', add
label define occ1990_lbl 567 `"Carpenters"', add
label define occ1990_lbl 573 `"Drywall installers"', add
label define occ1990_lbl 575 `"Electricians"', add
label define occ1990_lbl 577 `"Electric power installers and repairers"', add
label define occ1990_lbl 579 `"Painters, construction and maintenance"', add
label define occ1990_lbl 583 `"Paperhangers"', add
label define occ1990_lbl 584 `"Plasterers"', add
label define occ1990_lbl 585 `"Plumbers, pipe fitters, and steamfitters"', add
label define occ1990_lbl 588 `"Concrete and cement workers"', add
label define occ1990_lbl 589 `"Glaziers"', add
label define occ1990_lbl 593 `"Insulation workers"', add
label define occ1990_lbl 594 `"Paving, surfacing, and tamping equipment operators"', add
label define occ1990_lbl 595 `"Roofers and slaters"', add
label define occ1990_lbl 596 `"Sheet metal duct installers"', add
label define occ1990_lbl 597 `"Structural metal workers"', add
label define occ1990_lbl 598 `"Drillers of earth"', add
label define occ1990_lbl 599 `"Construction trades, n.e.c."', add
label define occ1990_lbl 614 `"Drillers of oil wells"', add
label define occ1990_lbl 615 `"Explosives workers"', add
label define occ1990_lbl 616 `"Miners"', add
label define occ1990_lbl 617 `"Other mining occupations"', add
label define occ1990_lbl 628 `"Production supervisors or foremen"', add
label define occ1990_lbl 634 `"Tool and die makers and die setters"', add
label define occ1990_lbl 637 `"Machinists"', add
label define occ1990_lbl 643 `"Boilermakers"', add
label define occ1990_lbl 644 `"Precision grinders and filers"', add
label define occ1990_lbl 645 `"Patternmakers and model makers"', add
label define occ1990_lbl 646 `"Lay-out workers"', add
label define occ1990_lbl 649 `"Engravers"', add
label define occ1990_lbl 653 `"Tinsmiths, coppersmiths, and sheet metal workers"', add
label define occ1990_lbl 657 `"Cabinetmakers and bench carpenters"', add
label define occ1990_lbl 658 `"Furniture and wood finishers"', add
label define occ1990_lbl 659 `"Other precision woodworkers"', add
label define occ1990_lbl 666 `"Dressmakers and seamstresses"', add
label define occ1990_lbl 667 `"Tailors"', add
label define occ1990_lbl 668 `"Upholsterers"', add
label define occ1990_lbl 669 `"Shoe repairers"', add
label define occ1990_lbl 674 `"Other precision apparel and fabric workers"', add
label define occ1990_lbl 675 `"Hand molders and shapers, except jewelers"', add
label define occ1990_lbl 677 `"Optical goods workers"', add
label define occ1990_lbl 678 `"Dental laboratory and medical appliance technicians"', add
label define occ1990_lbl 679 `"Bookbinders"', add
label define occ1990_lbl 684 `"Other precision and craft workers"', add
label define occ1990_lbl 686 `"Butchers and meat cutters"', add
label define occ1990_lbl 687 `"Bakers"', add
label define occ1990_lbl 688 `"Batch food makers"', add
label define occ1990_lbl 693 `"Adjusters and calibrators"', add
label define occ1990_lbl 694 `"Water and sewage treatment plant operators"', add
label define occ1990_lbl 695 `"Power plant operators"', add
label define occ1990_lbl 696 `"Plant and system operators, stationary engineers"', add
label define occ1990_lbl 699 `"Other plant and system operators"', add
label define occ1990_lbl 703 `"Lathe, milling, and turning machine operatives"', add
label define occ1990_lbl 706 `"Punching and stamping press operatives"', add
label define occ1990_lbl 707 `"Rollers, roll hands, and finishers of metal"', add
label define occ1990_lbl 708 `"Drilling and boring machine operators"', add
label define occ1990_lbl 709 `"Grinding, abrading, buffing, and polishing workers"', add
label define occ1990_lbl 713 `"Forge and hammer operators"', add
label define occ1990_lbl 717 `"Fabricating machine operators, n.e.c."', add
label define occ1990_lbl 719 `"Molders, and casting machine operators"', add
label define occ1990_lbl 723 `"Metal platers"', add
label define occ1990_lbl 724 `"Heat treating equipment operators"', add
label define occ1990_lbl 726 `"Wood lathe, routing, and planing machine operators"', add
label define occ1990_lbl 727 `"Sawing machine operators and sawyers"', add
label define occ1990_lbl 728 `"Shaping and joining machine operator (woodworking)"', add
label define occ1990_lbl 729 `"Nail and tacking machine operators  (woodworking)"', add
label define occ1990_lbl 733 `"Other woodworking machine operators"', add
label define occ1990_lbl 734 `"Printing machine operators, n.e.c."', add
label define occ1990_lbl 735 `"Photoengravers and lithographers"', add
label define occ1990_lbl 736 `"Typesetters and compositors"', add
label define occ1990_lbl 738 `"Winding and twisting textile/apparel operatives"', add
label define occ1990_lbl 739 `"Knitters, loopers, and toppers textile operatives"', add
label define occ1990_lbl 743 `"Textile cutting machine operators"', add
label define occ1990_lbl 744 `"Textile sewing machine operators"', add
label define occ1990_lbl 745 `"Shoemaking machine operators"', add
label define occ1990_lbl 747 `"Pressing machine operators (clothing)"', add
label define occ1990_lbl 748 `"Laundry workers"', add
label define occ1990_lbl 749 `"Misc textile machine operators"', add
label define occ1990_lbl 753 `"Cementing and gluing maching operators"', add
label define occ1990_lbl 754 `"Packers, fillers, and wrappers"', add
label define occ1990_lbl 755 `"Extruding and forming machine operators"', add
label define occ1990_lbl 756 `"Mixing and blending machine operatives"', add
label define occ1990_lbl 757 `"Separating, filtering, and clarifying machine operators"', add
label define occ1990_lbl 759 `"Painting machine operators"', add
label define occ1990_lbl 763 `"Roasting and baking machine operators (food)"', add
label define occ1990_lbl 764 `"Washing, cleaning, and pickling machine operators"', add
label define occ1990_lbl 765 `"Paper folding machine operators"', add
label define occ1990_lbl 766 `"Furnace, kiln, and oven operators, apart from food"', add
label define occ1990_lbl 768 `"Crushing and grinding machine operators"', add
label define occ1990_lbl 769 `"Slicing and cutting machine operators"', add
label define occ1990_lbl 773 `"Motion picture projectionists"', add
label define occ1990_lbl 774 `"Photographic process workers"', add
label define occ1990_lbl 779 `"Machine operators, n.e.c."', add
label define occ1990_lbl 783 `"Welders and metal cutters"', add
label define occ1990_lbl 784 `"Solderers"', add
label define occ1990_lbl 785 `"Assemblers of electrical equipment"', add
label define occ1990_lbl 789 `"Hand painting, coating, and decorating occupations"', add
label define occ1990_lbl 796 `"Production checkers and inspectors"', add
label define occ1990_lbl 799 `"Graders and sorters in manufacturing"', add
label define occ1990_lbl 803 `"Supervisors of motor vehicle transportation"', add
label define occ1990_lbl 804 `"Truck, delivery, and tractor drivers"', add
label define occ1990_lbl 808 `"Bus drivers"', add
label define occ1990_lbl 809 `"Taxi cab drivers and chauffeurs"', add
label define occ1990_lbl 813 `"Parking lot attendants"', add
label define occ1990_lbl 823 `"Railroad conductors and yardmasters"', add
label define occ1990_lbl 824 `"Locomotive operators (engineers and firemen)"', add
label define occ1990_lbl 825 `"Railroad brake, coupler, and switch operators"', add
label define occ1990_lbl 829 `"Ship crews and marine engineers"', add
label define occ1990_lbl 834 `"Water transport infrastructure tenders and crossing guards"', add
label define occ1990_lbl 844 `"Operating engineers of construction equipment"', add
label define occ1990_lbl 848 `"Crane, derrick, winch, and hoist operators"', add
label define occ1990_lbl 853 `"Excavating and loading machine operators"', add
label define occ1990_lbl 859 `"Misc material moving occupations"', add
label define occ1990_lbl 865 `"Helpers, constructions"', add
label define occ1990_lbl 866 `"Helpers, surveyors"', add
label define occ1990_lbl 869 `"Construction laborers"', add
label define occ1990_lbl 874 `"Production helpers"', add
label define occ1990_lbl 875 `"Garbage and recyclable material collectors"', add
label define occ1990_lbl 876 `"Materials movers: stevedores and longshore workers"', add
label define occ1990_lbl 877 `"Stock handlers"', add
label define occ1990_lbl 878 `"Machine feeders and offbearers"', add
label define occ1990_lbl 883 `"Freight, stock, and materials handlers"', add
label define occ1990_lbl 885 `"Garage and service station related occupations"', add
label define occ1990_lbl 887 `"Vehicle washers and equipment cleaners"', add
label define occ1990_lbl 888 `"Packers and packagers by hand"', add
label define occ1990_lbl 889 `"Laborers outside construction"', add
label define occ1990_lbl 905 `"Military"', add
label define occ1990_lbl 991 `"Unemployed"', add
label define occ1990_lbl 999 `"Unknown"', add
label values occ1990 occ1990_lbl

label define ind_lbl 0000 `"0000"'
label define ind_lbl 0001 `"0001"', add
label define ind_lbl 0002 `"0002"', add
label define ind_lbl 0003 `"0003"', add
label define ind_lbl 0004 `"0004"', add
label define ind_lbl 0005 `"0005"', add
label define ind_lbl 0006 `"0006"', add
label define ind_lbl 0007 `"0007"', add
label define ind_lbl 0008 `"0008"', add
label define ind_lbl 0009 `"0009"', add
label define ind_lbl 0010 `"0010"', add
label define ind_lbl 0011 `"0011"', add
label define ind_lbl 0012 `"0012"', add
label define ind_lbl 0013 `"0013"', add
label define ind_lbl 0014 `"0014"', add
label define ind_lbl 0015 `"0015"', add
label define ind_lbl 0016 `"0016"', add
label define ind_lbl 0017 `"0017"', add
label define ind_lbl 0018 `"0018"', add
label define ind_lbl 0019 `"0019"', add
label define ind_lbl 0020 `"0020"', add
label define ind_lbl 0021 `"0021"', add
label define ind_lbl 0022 `"0022"', add
label define ind_lbl 0023 `"0023"', add
label define ind_lbl 0024 `"0024"', add
label define ind_lbl 0025 `"0025"', add
label define ind_lbl 0026 `"0026"', add
label define ind_lbl 0027 `"0027"', add
label define ind_lbl 0028 `"0028"', add
label define ind_lbl 0029 `"0029"', add
label define ind_lbl 0030 `"0030"', add
label define ind_lbl 0031 `"0031"', add
label define ind_lbl 0032 `"0032"', add
label define ind_lbl 0033 `"0033"', add
label define ind_lbl 0034 `"0034"', add
label define ind_lbl 0035 `"0035"', add
label define ind_lbl 0036 `"0036"', add
label define ind_lbl 0037 `"0037"', add
label define ind_lbl 0038 `"0038"', add
label define ind_lbl 0039 `"0039"', add
label define ind_lbl 0040 `"0040"', add
label define ind_lbl 0041 `"0041"', add
label define ind_lbl 0042 `"0042"', add
label define ind_lbl 0043 `"0043"', add
label define ind_lbl 0044 `"0044"', add
label define ind_lbl 0045 `"0045"', add
label define ind_lbl 0046 `"0046"', add
label define ind_lbl 0047 `"0047"', add
label define ind_lbl 0048 `"0048"', add
label define ind_lbl 0049 `"0049"', add
label define ind_lbl 0050 `"0050"', add
label define ind_lbl 0051 `"0051"', add
label define ind_lbl 0052 `"0052"', add
label define ind_lbl 0053 `"0053"', add
label define ind_lbl 0054 `"0054"', add
label define ind_lbl 0055 `"0055"', add
label define ind_lbl 0056 `"0056"', add
label define ind_lbl 0057 `"0057"', add
label define ind_lbl 0058 `"0058"', add
label define ind_lbl 0059 `"0059"', add
label define ind_lbl 0060 `"0060"', add
label define ind_lbl 0061 `"0061"', add
label define ind_lbl 0062 `"0062"', add
label define ind_lbl 0063 `"0063"', add
label define ind_lbl 0064 `"0064"', add
label define ind_lbl 0065 `"0065"', add
label define ind_lbl 0066 `"0066"', add
label define ind_lbl 0067 `"0067"', add
label define ind_lbl 0068 `"0068"', add
label define ind_lbl 0069 `"0069"', add
label define ind_lbl 0070 `"0070"', add
label define ind_lbl 0071 `"0071"', add
label define ind_lbl 0072 `"0072"', add
label define ind_lbl 0073 `"0073"', add
label define ind_lbl 0074 `"0074"', add
label define ind_lbl 0075 `"0075"', add
label define ind_lbl 0076 `"0076"', add
label define ind_lbl 0077 `"0077"', add
label define ind_lbl 0078 `"0078"', add
label define ind_lbl 0079 `"0079"', add
label define ind_lbl 0080 `"0080"', add
label define ind_lbl 0081 `"0081"', add
label define ind_lbl 0082 `"0082"', add
label define ind_lbl 0083 `"0083"', add
label define ind_lbl 0084 `"0084"', add
label define ind_lbl 0085 `"0085"', add
label define ind_lbl 0086 `"0086"', add
label define ind_lbl 0087 `"0087"', add
label define ind_lbl 0088 `"0088"', add
label define ind_lbl 0089 `"0089"', add
label define ind_lbl 0090 `"0090"', add
label define ind_lbl 0091 `"0091"', add
label define ind_lbl 0092 `"0092"', add
label define ind_lbl 0093 `"0093"', add
label define ind_lbl 0094 `"0094"', add
label define ind_lbl 0095 `"0095"', add
label define ind_lbl 0096 `"0096"', add
label define ind_lbl 0097 `"0097"', add
label define ind_lbl 0098 `"0098"', add
label define ind_lbl 0099 `"0099"', add
label define ind_lbl 0100 `"0100"', add
label define ind_lbl 0101 `"0101"', add
label define ind_lbl 0102 `"0102"', add
label define ind_lbl 0103 `"0103"', add
label define ind_lbl 0104 `"0104"', add
label define ind_lbl 0105 `"0105"', add
label define ind_lbl 0106 `"0106"', add
label define ind_lbl 0107 `"0107"', add
label define ind_lbl 0108 `"0108"', add
label define ind_lbl 0109 `"0109"', add
label define ind_lbl 0110 `"0110"', add
label define ind_lbl 0111 `"0111"', add
label define ind_lbl 0112 `"0112"', add
label define ind_lbl 0113 `"0113"', add
label define ind_lbl 0114 `"0114"', add
label define ind_lbl 0115 `"0115"', add
label define ind_lbl 0116 `"0116"', add
label define ind_lbl 0117 `"0117"', add
label define ind_lbl 0118 `"0118"', add
label define ind_lbl 0119 `"0119"', add
label define ind_lbl 0120 `"0120"', add
label define ind_lbl 0121 `"0121"', add
label define ind_lbl 0122 `"0122"', add
label define ind_lbl 0123 `"0123"', add
label define ind_lbl 0124 `"0124"', add
label define ind_lbl 0125 `"0125"', add
label define ind_lbl 0126 `"0126"', add
label define ind_lbl 0127 `"0127"', add
label define ind_lbl 0128 `"0128"', add
label define ind_lbl 0129 `"0129"', add
label define ind_lbl 0130 `"0130"', add
label define ind_lbl 0131 `"0131"', add
label define ind_lbl 0137 `"0137"', add
label define ind_lbl 0138 `"0138"', add
label define ind_lbl 0139 `"0139"', add
label define ind_lbl 0146 `"0146"', add
label define ind_lbl 0147 `"0147"', add
label define ind_lbl 0148 `"0148"', add
label define ind_lbl 0149 `"0149"', add
label define ind_lbl 0157 `"0157"', add
label define ind_lbl 0158 `"0158"', add
label define ind_lbl 0159 `"0159"', add
label define ind_lbl 0166 `"0166"', add
label define ind_lbl 0167 `"0167"', add
label define ind_lbl 0168 `"0168"', add
label define ind_lbl 0169 `"0169"', add
label define ind_lbl 0176 `"0176"', add
label define ind_lbl 0177 `"0177"', add
label define ind_lbl 0178 `"0178"', add
label define ind_lbl 0179 `"0179"', add
label define ind_lbl 0186 `"0186"', add
label define ind_lbl 0187 `"0187"', add
label define ind_lbl 0188 `"0188"', add
label define ind_lbl 0197 `"0197"', add
label define ind_lbl 0198 `"0198"', add
label define ind_lbl 0199 `"0199"', add
label define ind_lbl 0206 `"0206"', add
label define ind_lbl 0207 `"0207"', add
label define ind_lbl 0208 `"0208"', add
label define ind_lbl 0209 `"0209"', add
label define ind_lbl 0219 `"0219"', add
label define ind_lbl 0227 `"0227"', add
label define ind_lbl 0228 `"0228"', add
label define ind_lbl 0229 `"0229"', add
label define ind_lbl 0236 `"0236"', add
label define ind_lbl 0237 `"0237"', add
label define ind_lbl 0238 `"0238"', add
label define ind_lbl 0239 `"0239"', add
label define ind_lbl 0246 `"0246"', add
label define ind_lbl 0247 `"0247"', add
label define ind_lbl 0248 `"0248"', add
label define ind_lbl 0249 `"0249"', add
label define ind_lbl 0257 `"0257"', add
label define ind_lbl 0258 `"0258"', add
label define ind_lbl 0259 `"0259"', add
label define ind_lbl 0267 `"0267"', add
label define ind_lbl 0268 `"0268"', add
label define ind_lbl 0269 `"0269"', add
label define ind_lbl 0278 `"0278"', add
label define ind_lbl 0279 `"0279"', add
label define ind_lbl 0287 `"0287"', add
label define ind_lbl 0288 `"0288"', add
label define ind_lbl 0289 `"0289"', add
label define ind_lbl 0293 `"0293"', add
label define ind_lbl 0297 `"0297"', add
label define ind_lbl 0298 `"0298"', add
label define ind_lbl 0299 `"0299"', add
label define ind_lbl 0307 `"0307"', add
label define ind_lbl 0308 `"0308"', add
label define ind_lbl 0309 `"0309"', add
label define ind_lbl 0317 `"0317"', add
label define ind_lbl 0318 `"0318"', add
label define ind_lbl 0319 `"0319"', add
label define ind_lbl 0327 `"0327"', add
label define ind_lbl 0328 `"0328"', add
label define ind_lbl 0329 `"0329"', add
label define ind_lbl 0337 `"0337"', add
label define ind_lbl 0338 `"0338"', add
label define ind_lbl 0339 `"0339"', add
label define ind_lbl 0346 `"0346"', add
label define ind_lbl 0347 `"0347"', add
label define ind_lbl 0348 `"0348"', add
label define ind_lbl 0349 `"0349"', add
label define ind_lbl 0357 `"0357"', add
label define ind_lbl 0358 `"0358"', add
label define ind_lbl 0359 `"0359"', add
label define ind_lbl 0367 `"0367"', add
label define ind_lbl 0368 `"0368"', add
label define ind_lbl 0369 `"0369"', add
label define ind_lbl 0377 `"0377"', add
label define ind_lbl 0378 `"0378"', add
label define ind_lbl 0379 `"0379"', add
label define ind_lbl 0387 `"0387"', add
label define ind_lbl 0388 `"0388"', add
label define ind_lbl 0389 `"0389"', add
label define ind_lbl 0397 `"0397"', add
label define ind_lbl 0398 `"0398"', add
label define ind_lbl 0399 `"0399"', add
label define ind_lbl 0407 `"0407"', add
label define ind_lbl 0408 `"0408"', add
label define ind_lbl 0409 `"0409"', add
label define ind_lbl 0417 `"0417"', add
label define ind_lbl 0418 `"0418"', add
label define ind_lbl 0419 `"0419"', add
label define ind_lbl 0427 `"0427"', add
label define ind_lbl 0428 `"0428"', add
label define ind_lbl 0429 `"0429"', add
label define ind_lbl 0447 `"0447"', add
label define ind_lbl 0448 `"0448"', add
label define ind_lbl 0449 `"0449"', add
label define ind_lbl 0467 `"0467"', add
label define ind_lbl 0468 `"0468"', add
label define ind_lbl 0469 `"0469"', add
label define ind_lbl 0477 `"0477"', add
label define ind_lbl 0478 `"0478"', add
label define ind_lbl 0479 `"0479"', add
label define ind_lbl 0499 `"0499"', add
label define ind_lbl 0507 `"0507"', add
label define ind_lbl 0508 `"0508"', add
label define ind_lbl 0509 `"0509"', add
label define ind_lbl 0527 `"0527"', add
label define ind_lbl 0528 `"0528"', add
label define ind_lbl 0529 `"0529"', add
label define ind_lbl 0536 `"0536"', add
label define ind_lbl 0537 `"0537"', add
label define ind_lbl 0538 `"0538"', add
label define ind_lbl 0539 `"0539"', add
label define ind_lbl 0557 `"0557"', add
label define ind_lbl 0558 `"0558"', add
label define ind_lbl 0559 `"0559"', add
label define ind_lbl 0566 `"0566"', add
label define ind_lbl 0567 `"0567"', add
label define ind_lbl 0568 `"0568"', add
label define ind_lbl 0569 `"0569"', add
label define ind_lbl 0587 `"0587"', add
label define ind_lbl 0588 `"0588"', add
label define ind_lbl 0599 `"0599"', add
label define ind_lbl 0607 `"0607"', add
label define ind_lbl 0608 `"0608"', add
label define ind_lbl 0609 `"0609"', add
label define ind_lbl 0617 `"0617"', add
label define ind_lbl 0618 `"0618"', add
label define ind_lbl 0619 `"0619"', add
label define ind_lbl 0626 `"0626"', add
label define ind_lbl 0627 `"0627"', add
label define ind_lbl 0628 `"0628"', add
label define ind_lbl 0629 `"0629"', add
label define ind_lbl 0636 `"0636"', add
label define ind_lbl 0637 `"0637"', add
label define ind_lbl 0638 `"0638"', add
label define ind_lbl 0639 `"0639"', add
label define ind_lbl 0646 `"0646"', add
label define ind_lbl 0647 `"0647"', add
label define ind_lbl 0648 `"0648"', add
label define ind_lbl 0649 `"0649"', add
label define ind_lbl 0657 `"0657"', add
label define ind_lbl 0658 `"0658"', add
label define ind_lbl 0667 `"0667"', add
label define ind_lbl 0668 `"0668"', add
label define ind_lbl 0669 `"0669"', add
label define ind_lbl 0676 `"0676"', add
label define ind_lbl 0677 `"0677"', add
label define ind_lbl 0678 `"0678"', add
label define ind_lbl 0679 `"0679"', add
label define ind_lbl 0687 `"0687"', add
label define ind_lbl 0688 `"0688"', add
label define ind_lbl 0689 `"0689"', add
label define ind_lbl 0696 `"0696"', add
label define ind_lbl 0697 `"0697"', add
label define ind_lbl 0698 `"0698"', add
label define ind_lbl 0699 `"0699"', add
label define ind_lbl 0706 `"0706"', add
label define ind_lbl 0707 `"0707"', add
label define ind_lbl 0708 `"0708"', add
label define ind_lbl 0709 `"0709"', add
label define ind_lbl 0717 `"0717"', add
label define ind_lbl 0718 `"0718"', add
label define ind_lbl 0719 `"0719"', add
label define ind_lbl 0727 `"0727"', add
label define ind_lbl 0728 `"0728"', add
label define ind_lbl 0729 `"0729"', add
label define ind_lbl 0736 `"0736"', add
label define ind_lbl 0737 `"0737"', add
label define ind_lbl 0738 `"0738"', add
label define ind_lbl 0739 `"0739"', add
label define ind_lbl 0747 `"0747"', add
label define ind_lbl 0748 `"0748"', add
label define ind_lbl 0749 `"0749"', add
label define ind_lbl 0756 `"0756"', add
label define ind_lbl 0757 `"0757"', add
label define ind_lbl 0758 `"0758"', add
label define ind_lbl 0759 `"0759"', add
label define ind_lbl 0766 `"0766"', add
label define ind_lbl 0767 `"0767"', add
label define ind_lbl 0769 `"0769"', add
label define ind_lbl 0776 `"0776"', add
label define ind_lbl 0777 `"0777"', add
label define ind_lbl 0778 `"0778"', add
label define ind_lbl 0779 `"0779"', add
label define ind_lbl 0786 `"0786"', add
label define ind_lbl 0787 `"0787"', add
label define ind_lbl 0788 `"0788"', add
label define ind_lbl 0789 `"0789"', add
label define ind_lbl 0797 `"0797"', add
label define ind_lbl 0798 `"0798"', add
label define ind_lbl 0799 `"0799"', add
label define ind_lbl 0807 `"0807"', add
label define ind_lbl 0808 `"0808"', add
label define ind_lbl 0809 `"0809"', add
label define ind_lbl 0817 `"0817"', add
label define ind_lbl 0826 `"0826"', add
label define ind_lbl 0828 `"0828"', add
label define ind_lbl 0829 `"0829"', add
label define ind_lbl 0837 `"0837"', add
label define ind_lbl 0838 `"0838"', add
label define ind_lbl 0839 `"0839"', add
label define ind_lbl 0847 `"0847"', add
label define ind_lbl 0848 `"0848"', add
label define ind_lbl 0849 `"0849"', add
label define ind_lbl 0856 `"0856"', add
label define ind_lbl 0857 `"0857"', add
label define ind_lbl 0858 `"0858"', add
label define ind_lbl 0859 `"0859"', add
label define ind_lbl 0867 `"0867"', add
label define ind_lbl 0868 `"0868"', add
label define ind_lbl 0869 `"0869"', add
label define ind_lbl 0876 `"0876"', add
label define ind_lbl 0877 `"0877"', add
label define ind_lbl 0878 `"0878"', add
label define ind_lbl 0879 `"0879"', add
label define ind_lbl 0887 `"0887"', add
label define ind_lbl 0888 `"0888"', add
label define ind_lbl 0889 `"0889"', add
label define ind_lbl 0897 `"0897"', add
label define ind_lbl 0899 `"0899"', add
label define ind_lbl 0907 `"0907"', add
label define ind_lbl 0917 `"0917"', add
label define ind_lbl 0927 `"0927"', add
label define ind_lbl 0937 `"0937"', add
label define ind_lbl 0947 `"0947"', add
label define ind_lbl 0995 `"0995"', add
label define ind_lbl 0996 `"0996"', add
label define ind_lbl 0997 `"0997"', add
label define ind_lbl 0998 `"0998"', add
label define ind_lbl 0999 `"0999"', add
label values ind ind_lbl

label define ind1950_lbl 000 `"N/A or none reported"'
label define ind1950_lbl 105 `"Agriculture"', add
label define ind1950_lbl 116 `"Forestry"', add
label define ind1950_lbl 126 `"Fisheries"', add
label define ind1950_lbl 206 `"Metal mining"', add
label define ind1950_lbl 216 `"Coal mining"', add
label define ind1950_lbl 226 `"Crude petroleum and natural gas extraction"', add
label define ind1950_lbl 236 `"Nonmettalic  mining and quarrying, except fuel"', add
label define ind1950_lbl 239 `"Mining, not specified"', add
label define ind1950_lbl 246 `"Construction"', add
label define ind1950_lbl 306 `"Logging"', add
label define ind1950_lbl 307 `"Sawmills, planing mills, and mill work"', add
label define ind1950_lbl 308 `"Misc wood products"', add
label define ind1950_lbl 309 `"Furniture and fixtures"', add
label define ind1950_lbl 316 `"Glass and glass products"', add
label define ind1950_lbl 317 `"Cement, concrete, gypsum and plaster products"', add
label define ind1950_lbl 318 `"Structural clay products"', add
label define ind1950_lbl 319 `"Pottery and related prods"', add
label define ind1950_lbl 326 `"Misc nonmetallic mineral and stone products"', add
label define ind1950_lbl 336 `"Blast furnaces, steel works, and rolling mills"', add
label define ind1950_lbl 337 `"Other primary iron and steel industries"', add
label define ind1950_lbl 338 `"Primary nonferrous industries"', add
label define ind1950_lbl 346 `"Fabricated steel products"', add
label define ind1950_lbl 347 `"Fabricated nonferrous metal products"', add
label define ind1950_lbl 348 `"Not specified metal industries"', add
label define ind1950_lbl 356 `"Agricultural machinery and tractors"', add
label define ind1950_lbl 357 `"Office and store machines"', add
label define ind1950_lbl 358 `"Misc machinery"', add
label define ind1950_lbl 367 `"Electrical machinery, equipment and supplies"', add
label define ind1950_lbl 376 `"Motor vehicles and motor vehicle equipment"', add
label define ind1950_lbl 377 `"Aircraft and parts"', add
label define ind1950_lbl 378 `"Ship and boat building and repairing"', add
label define ind1950_lbl 379 `"Railroad and misc transportation equipment"', add
label define ind1950_lbl 386 `"Professional equipment"', add
label define ind1950_lbl 387 `"Photographic equipment and supplies"', add
label define ind1950_lbl 388 `"Watches, clocks, and clockwork-operated devices"', add
label define ind1950_lbl 399 `"Misc manufacturing industries"', add
label define ind1950_lbl 406 `"Meat products"', add
label define ind1950_lbl 407 `"Dairy products"', add
label define ind1950_lbl 408 `"Canning and preserving fruits, vegetables, and seafoods"', add
label define ind1950_lbl 409 `"Grain-mill products"', add
label define ind1950_lbl 416 `"Bakery products"', add
label define ind1950_lbl 417 `"Confectionery and related products"', add
label define ind1950_lbl 418 `"Beverage industries"', add
label define ind1950_lbl 419 `"Misc food preparations and kindred products"', add
label define ind1950_lbl 426 `"Not specified food industries"', add
label define ind1950_lbl 429 `"Tobacco manufactures"', add
label define ind1950_lbl 436 `"Knitting mills"', add
label define ind1950_lbl 437 `"Dyeing and finishing textiles, except knit goods"', add
label define ind1950_lbl 438 `"Carpets, rugs, and other floor coverings"', add
label define ind1950_lbl 439 `"Yarn, thread, and fabric"', add
label define ind1950_lbl 446 `"Misc textile mill products"', add
label define ind1950_lbl 448 `"Apparel and accessories"', add
label define ind1950_lbl 449 `"Misc fabricated textile products"', add
label define ind1950_lbl 456 `"Pulp, paper, and paper-board mills"', add
label define ind1950_lbl 457 `"Paperboard containers and boxes"', add
label define ind1950_lbl 458 `"Misc paper and pulp products"', add
label define ind1950_lbl 459 `"Printing, publishing, and allied industries"', add
label define ind1950_lbl 466 `"Synthetic fibers"', add
label define ind1950_lbl 467 `"Drugs and medicines"', add
label define ind1950_lbl 468 `"Paints, varnishes, and related products"', add
label define ind1950_lbl 469 `"Misc chemicals and allied products"', add
label define ind1950_lbl 476 `"Petroleum refining"', add
label define ind1950_lbl 477 `"Misc petroleum and coal products"', add
label define ind1950_lbl 478 `"Rubber products"', add
label define ind1950_lbl 487 `"Leather: tanned, curried, and finished"', add
label define ind1950_lbl 488 `"Footwear, except rubber"', add
label define ind1950_lbl 489 `"Leather products, except footwear"', add
label define ind1950_lbl 499 `"Not specified manufacturing industries"', add
label define ind1950_lbl 506 `"Railroads and railway"', add
label define ind1950_lbl 516 `"Street railways and bus lines"', add
label define ind1950_lbl 526 `"Trucking service"', add
label define ind1950_lbl 527 `"Warehousing and storage"', add
label define ind1950_lbl 536 `"Taxicab service"', add
label define ind1950_lbl 546 `"Water transportation"', add
label define ind1950_lbl 556 `"Air transportation"', add
label define ind1950_lbl 567 `"Petroleum and gasoline pipe lines"', add
label define ind1950_lbl 568 `"Services incidental to transportation"', add
label define ind1950_lbl 578 `"Telephone"', add
label define ind1950_lbl 579 `"Telegraph"', add
label define ind1950_lbl 586 `"Electric light and power"', add
label define ind1950_lbl 587 `"Gas and steam supply systems"', add
label define ind1950_lbl 588 `"Electric-gas utilities"', add
label define ind1950_lbl 596 `"Water supply"', add
label define ind1950_lbl 597 `"Sanitary services"', add
label define ind1950_lbl 598 `"Other and not specified utilities"', add
label define ind1950_lbl 606 `"Motor vehicles and equipment"', add
label define ind1950_lbl 607 `"Drugs, chemicals, and allied products"', add
label define ind1950_lbl 608 `"Dry goods apparel"', add
label define ind1950_lbl 609 `"Food and related products"', add
label define ind1950_lbl 616 `"Electrical goods, hardware, and plumbing equipment"', add
label define ind1950_lbl 617 `"Machinery, equipment, and supplies"', add
label define ind1950_lbl 618 `"Petroleum products"', add
label define ind1950_lbl 619 `"Farm prods--raw materials"', add
label define ind1950_lbl 626 `"Misc wholesale trade"', add
label define ind1950_lbl 627 `"Not specified wholesale trade"', add
label define ind1950_lbl 636 `"Food stores, except dairy"', add
label define ind1950_lbl 637 `"Dairy prods stores and milk retailing"', add
label define ind1950_lbl 646 `"General merchandise"', add
label define ind1950_lbl 647 `"Five and ten cent stores"', add
label define ind1950_lbl 656 `"Apparel and accessories stores, except shoe"', add
label define ind1950_lbl 657 `"Shoe stores"', add
label define ind1950_lbl 658 `"Furniture and house furnishings stores"', add
label define ind1950_lbl 659 `"Household appliance and radio stores"', add
label define ind1950_lbl 667 `"Motor vehicles and accessories retailing"', add
label define ind1950_lbl 668 `"Gasoline service stations"', add
label define ind1950_lbl 669 `"Drug stores"', add
label define ind1950_lbl 679 `"Eating and drinking  places"', add
label define ind1950_lbl 686 `"Hardware and farm implement stores"', add
label define ind1950_lbl 687 `"Lumber and building material retailing"', add
label define ind1950_lbl 688 `"Liquor stores"', add
label define ind1950_lbl 689 `"Retail florists"', add
label define ind1950_lbl 696 `"Jewelry stores"', add
label define ind1950_lbl 697 `"Fuel and ice retailing"', add
label define ind1950_lbl 698 `"Misc retail stores"', add
label define ind1950_lbl 699 `"Not specified retail trade"', add
label define ind1950_lbl 716 `"Banking and credit"', add
label define ind1950_lbl 726 `"Security and commodity brokerage and invest companies"', add
label define ind1950_lbl 736 `"Insurance"', add
label define ind1950_lbl 746 `"Real estate"', add
label define ind1950_lbl 756 `"Real estate-insurance-law  offices"', add
label define ind1950_lbl 806 `"Advertising"', add
label define ind1950_lbl 807 `"Accounting, auditing, and bookkeeping services"', add
label define ind1950_lbl 808 `"Misc business services"', add
label define ind1950_lbl 816 `"Auto repair services and garages"', add
label define ind1950_lbl 817 `"Misc repair services"', add
label define ind1950_lbl 826 `"Private households"', add
label define ind1950_lbl 836 `"Hotels and lodging places"', add
label define ind1950_lbl 846 `"Laundering, cleaning, and dyeing"', add
label define ind1950_lbl 847 `"Dressmaking shops"', add
label define ind1950_lbl 848 `"Shoe repair shops"', add
label define ind1950_lbl 849 `"Misc personal services"', add
label define ind1950_lbl 856 `"Radio broadcasting and television"', add
label define ind1950_lbl 857 `"Theaters and motion pictures"', add
label define ind1950_lbl 858 `"Bowling alleys, and billiard and pool parlors"', add
label define ind1950_lbl 859 `"Misc entertainment and recreation services"', add
label define ind1950_lbl 868 `"Medical and other health services, except hospitals"', add
label define ind1950_lbl 869 `"Hospitals"', add
label define ind1950_lbl 879 `"Legal services"', add
label define ind1950_lbl 888 `"Educational services"', add
label define ind1950_lbl 896 `"Welfare and religious services"', add
label define ind1950_lbl 897 `"Nonprofit membership organizs."', add
label define ind1950_lbl 898 `"Engineering and architectural services"', add
label define ind1950_lbl 899 `"Misc professional and related"', add
label define ind1950_lbl 906 `"Postal service"', add
label define ind1950_lbl 916 `"Federal public administration"', add
label define ind1950_lbl 926 `"State public administration"', add
label define ind1950_lbl 936 `"Local public administration"', add
label define ind1950_lbl 946 `"Public Administration, level not specified"', add
label define ind1950_lbl 976 `"Common or general laborer"', add
label define ind1950_lbl 979 `"Not yet specified"', add
label define ind1950_lbl 980 `"Unpaid domestic work"', add
label define ind1950_lbl 982 `"Housework at home"', add
label define ind1950_lbl 983 `"School response (students, etc.)"', add
label define ind1950_lbl 984 `"Retired"', add
label define ind1950_lbl 986 `"Sick/disabled"', add
label define ind1950_lbl 987 `"Institution response"', add
label define ind1950_lbl 991 `"Lady/Man of leisure"', add
label define ind1950_lbl 995 `"Non-industrial response"', add
label define ind1950_lbl 997 `"Nonclassifiable"', add
label define ind1950_lbl 998 `"Industry not reported"', add
label define ind1950_lbl 999 `"Blank or blank equivalent"', add
label values ind1950 ind1950_lbl

label define occscore_lbl 00 `"00"'
label define occscore_lbl 03 `"03"', add
label define occscore_lbl 04 `"04"', add
label define occscore_lbl 05 `"05"', add
label define occscore_lbl 06 `"06"', add
label define occscore_lbl 07 `"07"', add
label define occscore_lbl 08 `"08"', add
label define occscore_lbl 09 `"09"', add
label define occscore_lbl 10 `"10"', add
label define occscore_lbl 11 `"11"', add
label define occscore_lbl 12 `"12"', add
label define occscore_lbl 13 `"13"', add
label define occscore_lbl 14 `"14"', add
label define occscore_lbl 15 `"15"', add
label define occscore_lbl 16 `"16"', add
label define occscore_lbl 17 `"17"', add
label define occscore_lbl 18 `"18"', add
label define occscore_lbl 19 `"19"', add
label define occscore_lbl 20 `"20"', add
label define occscore_lbl 21 `"21"', add
label define occscore_lbl 22 `"22"', add
label define occscore_lbl 23 `"23"', add
label define occscore_lbl 24 `"24"', add
label define occscore_lbl 25 `"25"', add
label define occscore_lbl 26 `"26"', add
label define occscore_lbl 27 `"27"', add
label define occscore_lbl 28 `"28"', add
label define occscore_lbl 29 `"29"', add
label define occscore_lbl 30 `"30"', add
label define occscore_lbl 31 `"31"', add
label define occscore_lbl 32 `"32"', add
label define occscore_lbl 33 `"33"', add
label define occscore_lbl 34 `"34"', add
label define occscore_lbl 35 `"35"', add
label define occscore_lbl 36 `"36"', add
label define occscore_lbl 37 `"37"', add
label define occscore_lbl 38 `"38"', add
label define occscore_lbl 39 `"39"', add
label define occscore_lbl 40 `"40"', add
label define occscore_lbl 41 `"41"', add
label define occscore_lbl 42 `"42"', add
label define occscore_lbl 43 `"43"', add
label define occscore_lbl 44 `"44"', add
label define occscore_lbl 45 `"45"', add
label define occscore_lbl 46 `"46"', add
label define occscore_lbl 47 `"47"', add
label define occscore_lbl 48 `"48"', add
label define occscore_lbl 49 `"49"', add
label define occscore_lbl 50 `"50"', add
label define occscore_lbl 52 `"52"', add
label define occscore_lbl 54 `"54"', add
label define occscore_lbl 58 `"58"', add
label define occscore_lbl 60 `"60"', add
label define occscore_lbl 61 `"61"', add
label define occscore_lbl 62 `"62"', add
label define occscore_lbl 63 `"63"', add
label define occscore_lbl 79 `"79"', add
label define occscore_lbl 80 `"80"', add
label values occscore occscore_lbl

label define hwsei_lbl 0713 `"0713"'
label define hwsei_lbl 0956 `"0956"', add
label define hwsei_lbl 1051 `"1051"', add
label define hwsei_lbl 1267 `"1267"', add
label define hwsei_lbl 1303 `"1303"', add
label define hwsei_lbl 1338 `"1338"', add
label define hwsei_lbl 1388 `"1388"', add
label define hwsei_lbl 1402 `"1402"', add
label define hwsei_lbl 1492 `"1492"', add
label define hwsei_lbl 1554 `"1554"', add
label define hwsei_lbl 1559 `"1559"', add
label define hwsei_lbl 1575 `"1575"', add
label define hwsei_lbl 1578 `"1578"', add
label define hwsei_lbl 1613 `"1613"', add
label define hwsei_lbl 1629 `"1629"', add
label define hwsei_lbl 1685 `"1685"', add
label define hwsei_lbl 1725 `"1725"', add
label define hwsei_lbl 1738 `"1738"', add
label define hwsei_lbl 1779 `"1779"', add
label define hwsei_lbl 1782 `"1782"', add
label define hwsei_lbl 1802 `"1802"', add
label define hwsei_lbl 1829 `"1829"', add
label define hwsei_lbl 1832 `"1832"', add
label define hwsei_lbl 1874 `"1874"', add
label define hwsei_lbl 1884 `"1884"', add
label define hwsei_lbl 1900 `"1900"', add
label define hwsei_lbl 1917 `"1917"', add
label define hwsei_lbl 1930 `"1930"', add
label define hwsei_lbl 1941 `"1941"', add
label define hwsei_lbl 1956 `"1956"', add
label define hwsei_lbl 1958 `"1958"', add
label define hwsei_lbl 1970 `"1970"', add
label define hwsei_lbl 1972 `"1972"', add
label define hwsei_lbl 2000 `"2000"', add
label define hwsei_lbl 2003 `"2003"', add
label define hwsei_lbl 2020 `"2020"', add
label define hwsei_lbl 2030 `"2030"', add
label define hwsei_lbl 2057 `"2057"', add
label define hwsei_lbl 2094 `"2094"', add
label define hwsei_lbl 2103 `"2103"', add
label define hwsei_lbl 2106 `"2106"', add
label define hwsei_lbl 2130 `"2130"', add
label define hwsei_lbl 2140 `"2140"', add
label define hwsei_lbl 2141 `"2141"', add
label define hwsei_lbl 2146 `"2146"', add
label define hwsei_lbl 2152 `"2152"', add
label define hwsei_lbl 2176 `"2176"', add
label define hwsei_lbl 2188 `"2188"', add
label define hwsei_lbl 2190 `"2190"', add
label define hwsei_lbl 2199 `"2199"', add
label define hwsei_lbl 2210 `"2210"', add
label define hwsei_lbl 2224 `"2224"', add
label define hwsei_lbl 2244 `"2244"', add
label define hwsei_lbl 2254 `"2254"', add
label define hwsei_lbl 2261 `"2261"', add
label define hwsei_lbl 2265 `"2265"', add
label define hwsei_lbl 2290 `"2290"', add
label define hwsei_lbl 2298 `"2298"', add
label define hwsei_lbl 2302 `"2302"', add
label define hwsei_lbl 2305 `"2305"', add
label define hwsei_lbl 2341 `"2341"', add
label define hwsei_lbl 2348 `"2348"', add
label define hwsei_lbl 2352 `"2352"', add
label define hwsei_lbl 2354 `"2354"', add
label define hwsei_lbl 2363 `"2363"', add
label define hwsei_lbl 2365 `"2365"', add
label define hwsei_lbl 2370 `"2370"', add
label define hwsei_lbl 2398 `"2398"', add
label define hwsei_lbl 2408 `"2408"', add
label define hwsei_lbl 2411 `"2411"', add
label define hwsei_lbl 2419 `"2419"', add
label define hwsei_lbl 2426 `"2426"', add
label define hwsei_lbl 2429 `"2429"', add
label define hwsei_lbl 2439 `"2439"', add
label define hwsei_lbl 2448 `"2448"', add
label define hwsei_lbl 2460 `"2460"', add
label define hwsei_lbl 2479 `"2479"', add
label define hwsei_lbl 2486 `"2486"', add
label define hwsei_lbl 2487 `"2487"', add
label define hwsei_lbl 2488 `"2488"', add
label define hwsei_lbl 2495 `"2495"', add
label define hwsei_lbl 2515 `"2515"', add
label define hwsei_lbl 2518 `"2518"', add
label define hwsei_lbl 2519 `"2519"', add
label define hwsei_lbl 2525 `"2525"', add
label define hwsei_lbl 2545 `"2545"', add
label define hwsei_lbl 2546 `"2546"', add
label define hwsei_lbl 2553 `"2553"', add
label define hwsei_lbl 2556 `"2556"', add
label define hwsei_lbl 2560 `"2560"', add
label define hwsei_lbl 2580 `"2580"', add
label define hwsei_lbl 2583 `"2583"', add
label define hwsei_lbl 2602 `"2602"', add
label define hwsei_lbl 2609 `"2609"', add
label define hwsei_lbl 2610 `"2610"', add
label define hwsei_lbl 2616 `"2616"', add
label define hwsei_lbl 2619 `"2619"', add
label define hwsei_lbl 2624 `"2624"', add
label define hwsei_lbl 2628 `"2628"', add
label define hwsei_lbl 2629 `"2629"', add
label define hwsei_lbl 2630 `"2630"', add
label define hwsei_lbl 2631 `"2631"', add
label define hwsei_lbl 2639 `"2639"', add
label define hwsei_lbl 2662 `"2662"', add
label define hwsei_lbl 2668 `"2668"', add
label define hwsei_lbl 2682 `"2682"', add
label define hwsei_lbl 2694 `"2694"', add
label define hwsei_lbl 2707 `"2707"', add
label define hwsei_lbl 2708 `"2708"', add
label define hwsei_lbl 2709 `"2709"', add
label define hwsei_lbl 2712 `"2712"', add
label define hwsei_lbl 2716 `"2716"', add
label define hwsei_lbl 2722 `"2722"', add
label define hwsei_lbl 2728 `"2728"', add
label define hwsei_lbl 2729 `"2729"', add
label define hwsei_lbl 2731 `"2731"', add
label define hwsei_lbl 2737 `"2737"', add
label define hwsei_lbl 2758 `"2758"', add
label define hwsei_lbl 2760 `"2760"', add
label define hwsei_lbl 2767 `"2767"', add
label define hwsei_lbl 2784 `"2784"', add
label define hwsei_lbl 2800 `"2800"', add
label define hwsei_lbl 2812 `"2812"', add
label define hwsei_lbl 2823 `"2823"', add
label define hwsei_lbl 2830 `"2830"', add
label define hwsei_lbl 2843 `"2843"', add
label define hwsei_lbl 2849 `"2849"', add
label define hwsei_lbl 2852 `"2852"', add
label define hwsei_lbl 2865 `"2865"', add
label define hwsei_lbl 2877 `"2877"', add
label define hwsei_lbl 2882 `"2882"', add
label define hwsei_lbl 2887 `"2887"', add
label define hwsei_lbl 2888 `"2888"', add
label define hwsei_lbl 2909 `"2909"', add
label define hwsei_lbl 2913 `"2913"', add
label define hwsei_lbl 2919 `"2919"', add
label define hwsei_lbl 2924 `"2924"', add
label define hwsei_lbl 2928 `"2928"', add
label define hwsei_lbl 2930 `"2930"', add
label define hwsei_lbl 2931 `"2931"', add
label define hwsei_lbl 2968 `"2968"', add
label define hwsei_lbl 2971 `"2971"', add
label define hwsei_lbl 2975 `"2975"', add
label define hwsei_lbl 2981 `"2981"', add
label define hwsei_lbl 3027 `"3027"', add
label define hwsei_lbl 3030 `"3030"', add
label define hwsei_lbl 3035 `"3035"', add
label define hwsei_lbl 3057 `"3057"', add
label define hwsei_lbl 3058 `"3058"', add
label define hwsei_lbl 3061 `"3061"', add
label define hwsei_lbl 3068 `"3068"', add
label define hwsei_lbl 3085 `"3085"', add
label define hwsei_lbl 3106 `"3106"', add
label define hwsei_lbl 3118 `"3118"', add
label define hwsei_lbl 3123 `"3123"', add
label define hwsei_lbl 3127 `"3127"', add
label define hwsei_lbl 3130 `"3130"', add
label define hwsei_lbl 3133 `"3133"', add
label define hwsei_lbl 3136 `"3136"', add
label define hwsei_lbl 3147 `"3147"', add
label define hwsei_lbl 3149 `"3149"', add
label define hwsei_lbl 3162 `"3162"', add
label define hwsei_lbl 3174 `"3174"', add
label define hwsei_lbl 3175 `"3175"', add
label define hwsei_lbl 3176 `"3176"', add
label define hwsei_lbl 3184 `"3184"', add
label define hwsei_lbl 3185 `"3185"', add
label define hwsei_lbl 3186 `"3186"', add
label define hwsei_lbl 3211 `"3211"', add
label define hwsei_lbl 3212 `"3212"', add
label define hwsei_lbl 3247 `"3247"', add
label define hwsei_lbl 3250 `"3250"', add
label define hwsei_lbl 3277 `"3277"', add
label define hwsei_lbl 3282 `"3282"', add
label define hwsei_lbl 3301 `"3301"', add
label define hwsei_lbl 3302 `"3302"', add
label define hwsei_lbl 3307 `"3307"', add
label define hwsei_lbl 3313 `"3313"', add
label define hwsei_lbl 3318 `"3318"', add
label define hwsei_lbl 3339 `"3339"', add
label define hwsei_lbl 3348 `"3348"', add
label define hwsei_lbl 3368 `"3368"', add
label define hwsei_lbl 3380 `"3380"', add
label define hwsei_lbl 3382 `"3382"', add
label define hwsei_lbl 3398 `"3398"', add
label define hwsei_lbl 3399 `"3399"', add
label define hwsei_lbl 3439 `"3439"', add
label define hwsei_lbl 3444 `"3444"', add
label define hwsei_lbl 3457 `"3457"', add
label define hwsei_lbl 3460 `"3460"', add
label define hwsei_lbl 3491 `"3491"', add
label define hwsei_lbl 3496 `"3496"', add
label define hwsei_lbl 3506 `"3506"', add
label define hwsei_lbl 3565 `"3565"', add
label define hwsei_lbl 3578 `"3578"', add
label define hwsei_lbl 3603 `"3603"', add
label define hwsei_lbl 3609 `"3609"', add
label define hwsei_lbl 3619 `"3619"', add
label define hwsei_lbl 3631 `"3631"', add
label define hwsei_lbl 3670 `"3670"', add
label define hwsei_lbl 3672 `"3672"', add
label define hwsei_lbl 3674 `"3674"', add
label define hwsei_lbl 3679 `"3679"', add
label define hwsei_lbl 3693 `"3693"', add
label define hwsei_lbl 3713 `"3713"', add
label define hwsei_lbl 3731 `"3731"', add
label define hwsei_lbl 3732 `"3732"', add
label define hwsei_lbl 3775 `"3775"', add
label define hwsei_lbl 3792 `"3792"', add
label define hwsei_lbl 3797 `"3797"', add
label define hwsei_lbl 3807 `"3807"', add
label define hwsei_lbl 3814 `"3814"', add
label define hwsei_lbl 3827 `"3827"', add
label define hwsei_lbl 3838 `"3838"', add
label define hwsei_lbl 3840 `"3840"', add
label define hwsei_lbl 3851 `"3851"', add
label define hwsei_lbl 3869 `"3869"', add
label define hwsei_lbl 3870 `"3870"', add
label define hwsei_lbl 3896 `"3896"', add
label define hwsei_lbl 3900 `"3900"', add
label define hwsei_lbl 3965 `"3965"', add
label define hwsei_lbl 3980 `"3980"', add
label define hwsei_lbl 4029 `"4029"', add
label define hwsei_lbl 4031 `"4031"', add
label define hwsei_lbl 4040 `"4040"', add
label define hwsei_lbl 4061 `"4061"', add
label define hwsei_lbl 4083 `"4083"', add
label define hwsei_lbl 4091 `"4091"', add
label define hwsei_lbl 4097 `"4097"', add
label define hwsei_lbl 4122 `"4122"', add
label define hwsei_lbl 4157 `"4157"', add
label define hwsei_lbl 4168 `"4168"', add
label define hwsei_lbl 4182 `"4182"', add
label define hwsei_lbl 4189 `"4189"', add
label define hwsei_lbl 4208 `"4208"', add
label define hwsei_lbl 4250 `"4250"', add
label define hwsei_lbl 4260 `"4260"', add
label define hwsei_lbl 4261 `"4261"', add
label define hwsei_lbl 4269 `"4269"', add
label define hwsei_lbl 4304 `"4304"', add
label define hwsei_lbl 4312 `"4312"', add
label define hwsei_lbl 4326 `"4326"', add
label define hwsei_lbl 4335 `"4335"', add
label define hwsei_lbl 4351 `"4351"', add
label define hwsei_lbl 4357 `"4357"', add
label define hwsei_lbl 4406 `"4406"', add
label define hwsei_lbl 4413 `"4413"', add
label define hwsei_lbl 4439 `"4439"', add
label define hwsei_lbl 4440 `"4440"', add
label define hwsei_lbl 4445 `"4445"', add
label define hwsei_lbl 4479 `"4479"', add
label define hwsei_lbl 4520 `"4520"', add
label define hwsei_lbl 4545 `"4545"', add
label define hwsei_lbl 4583 `"4583"', add
label define hwsei_lbl 4607 `"4607"', add
label define hwsei_lbl 4626 `"4626"', add
label define hwsei_lbl 4633 `"4633"', add
label define hwsei_lbl 4645 `"4645"', add
label define hwsei_lbl 4648 `"4648"', add
label define hwsei_lbl 4667 `"4667"', add
label define hwsei_lbl 4671 `"4671"', add
label define hwsei_lbl 4684 `"4684"', add
label define hwsei_lbl 4704 `"4704"', add
label define hwsei_lbl 4723 `"4723"', add
label define hwsei_lbl 4730 `"4730"', add
label define hwsei_lbl 4743 `"4743"', add
label define hwsei_lbl 4745 `"4745"', add
label define hwsei_lbl 4763 `"4763"', add
label define hwsei_lbl 4780 `"4780"', add
label define hwsei_lbl 4786 `"4786"', add
label define hwsei_lbl 4788 `"4788"', add
label define hwsei_lbl 4790 `"4790"', add
label define hwsei_lbl 4834 `"4834"', add
label define hwsei_lbl 4846 `"4846"', add
label define hwsei_lbl 4865 `"4865"', add
label define hwsei_lbl 4868 `"4868"', add
label define hwsei_lbl 4878 `"4878"', add
label define hwsei_lbl 4909 `"4909"', add
label define hwsei_lbl 4930 `"4930"', add
label define hwsei_lbl 4942 `"4942"', add
label define hwsei_lbl 4952 `"4952"', add
label define hwsei_lbl 5001 `"5001"', add
label define hwsei_lbl 5017 `"5017"', add
label define hwsei_lbl 5046 `"5046"', add
label define hwsei_lbl 5086 `"5086"', add
label define hwsei_lbl 5122 `"5122"', add
label define hwsei_lbl 5360 `"5360"', add
label define hwsei_lbl 5379 `"5379"', add
label define hwsei_lbl 5425 `"5425"', add
label define hwsei_lbl 5451 `"5451"', add
label define hwsei_lbl 5456 `"5456"', add
label define hwsei_lbl 5479 `"5479"', add
label define hwsei_lbl 5492 `"5492"', add
label define hwsei_lbl 5529 `"5529"', add
label define hwsei_lbl 5592 `"5592"', add
label define hwsei_lbl 5644 `"5644"', add
label define hwsei_lbl 5649 `"5649"', add
label define hwsei_lbl 5686 `"5686"', add
label define hwsei_lbl 5726 `"5726"', add
label define hwsei_lbl 5727 `"5727"', add
label define hwsei_lbl 5750 `"5750"', add
label define hwsei_lbl 5825 `"5825"', add
label define hwsei_lbl 5826 `"5826"', add
label define hwsei_lbl 5854 `"5854"', add
label define hwsei_lbl 5912 `"5912"', add
label define hwsei_lbl 5983 `"5983"', add
label define hwsei_lbl 6008 `"6008"', add
label define hwsei_lbl 6056 `"6056"', add
label define hwsei_lbl 6107 `"6107"', add
label define hwsei_lbl 6120 `"6120"', add
label define hwsei_lbl 6180 `"6180"', add
label define hwsei_lbl 6199 `"6199"', add
label define hwsei_lbl 6225 `"6225"', add
label define hwsei_lbl 6242 `"6242"', add
label define hwsei_lbl 6245 `"6245"', add
label define hwsei_lbl 6252 `"6252"', add
label define hwsei_lbl 6271 `"6271"', add
label define hwsei_lbl 6381 `"6381"', add
label define hwsei_lbl 6409 `"6409"', add
label define hwsei_lbl 6427 `"6427"', add
label define hwsei_lbl 6456 `"6456"', add
label define hwsei_lbl 6497 `"6497"', add
label define hwsei_lbl 6506 `"6506"', add
label define hwsei_lbl 6575 `"6575"', add
label define hwsei_lbl 6622 `"6622"', add
label define hwsei_lbl 6653 `"6653"', add
label define hwsei_lbl 6655 `"6655"', add
label define hwsei_lbl 6692 `"6692"', add
label define hwsei_lbl 6712 `"6712"', add
label define hwsei_lbl 6752 `"6752"', add
label define hwsei_lbl 6834 `"6834"', add
label define hwsei_lbl 6874 `"6874"', add
label define hwsei_lbl 6877 `"6877"', add
label define hwsei_lbl 6939 `"6939"', add
label define hwsei_lbl 6948 `"6948"', add
label define hwsei_lbl 6992 `"6992"', add
label define hwsei_lbl 7046 `"7046"', add
label define hwsei_lbl 7066 `"7066"', add
label define hwsei_lbl 7086 `"7086"', add
label define hwsei_lbl 7148 `"7148"', add
label define hwsei_lbl 7180 `"7180"', add
label define hwsei_lbl 7323 `"7323"', add
label define hwsei_lbl 7440 `"7440"', add
label define hwsei_lbl 7494 `"7494"', add
label define hwsei_lbl 7550 `"7550"', add
label define hwsei_lbl 7558 `"7558"', add
label define hwsei_lbl 7679 `"7679"', add
label define hwsei_lbl 7708 `"7708"', add
label define hwsei_lbl 7744 `"7744"', add
label define hwsei_lbl 8026 `"8026"', add
label define hwsei_lbl 8053 `"8053"', add
label define hwsei_lbl 0000 `"N/A"', add
label values hwsei hwsei_lbl

label define presgl_lbl 000 `"N/A"'
label define presgl_lbl 093 `"Bootblacks"', add
label define presgl_lbl 122 `"Teamsters"', add
label define presgl_lbl 124 `"Charwomen and cleaners"', add
label define presgl_lbl 141 `"Attendants, professional and personal service (n.e.c.)"', add
label define presgl_lbl 147 `"Attendants, recreation and amusement"', add
label define presgl_lbl 149 `"Ushers, recreation and amusement"', add
label define presgl_lbl 153 `"Counter and fountain workers"', add
label define presgl_lbl 154 `"Newsboys"', add
label define presgl_lbl 161 `"Janitors and sextons"', add
label define presgl_lbl 163 `"Garage laborers and car washers and greasers"', add
label define presgl_lbl 175 `"Laborers (n.e.c.)"', add
label define presgl_lbl 176 `"Laundressses, private household"', add
label define presgl_lbl 182 `"Laundry and dry cleaning operatives"', add
label define presgl_lbl 183 `"Hucksters and peddlers"', add
label define presgl_lbl 184 `"Farm laborers, wage workers"', add
label define presgl_lbl 187 `"Filers, grinders, and polishers, metal"', add
label define presgl_lbl 189 `"Private household workers (n.e.c.)"', add
label define presgl_lbl 191 `"Messengers and office boys"', add
label define presgl_lbl 199 `"Bartenders"', add
label define presgl_lbl 202 `"Porters"', add
label define presgl_lbl 203 `"Waiters and waitresses"', add
label define presgl_lbl 209 `"Elevator operators"', add
label define presgl_lbl 215 `"Fruit, nut, and vegetable graders, and packers, except factory"', add
label define presgl_lbl 216 `"Attendants, auto service and parking"', add
label define presgl_lbl 219 `"Guards, watchmen, and doorkeepers"', add
label define presgl_lbl 220 `"Taxicab drivers and chauffers"', add
label define presgl_lbl 221 `"Boarding and lodging house keepers"', add
label define presgl_lbl 225 `"Gardeners, except farm, and groundskeepers"', add
label define presgl_lbl 232 `"Baggagemen, transportation"', add
label define presgl_lbl 233 `"Midwives"', add
label define presgl_lbl 235 `"Watchmen (crossing) and bridge tenders"', add
label define presgl_lbl 242 `"Oilers and greaser, except auto"', add
label define presgl_lbl 243 `"Paperhangers"', add
label define presgl_lbl 244 `"Longshoremen and stevedores"', add
label define presgl_lbl 249 `"Spinners, textile"', add
label define presgl_lbl 250 `"Dyers"', add
label define presgl_lbl 252 `"Millers, grain, flour, feed, etc."', add
label define presgl_lbl 255 `"Glaziers"', add
label define presgl_lbl 259 `"Collectors, bill and account"', add
label define presgl_lbl 263 `"Mine operatives and laborers"', add
label define presgl_lbl 264 `"Cooks, except private household"', add
label define presgl_lbl 268 `"Farm service laborers, self-employed"', add
label define presgl_lbl 272 `"Motormen, mine, factory, logging camp, etc."', add
label define presgl_lbl 274 `"Floormen and floor managers, store"', add
label define presgl_lbl 277 `"Sawyers"', add
label define presgl_lbl 280 `"Conductors, bus and street railway"', add
label define presgl_lbl 283 `"Demonstrators"', add
label define presgl_lbl 284 `"Asbestos and insulation workers"', add
label define presgl_lbl 290 `"Painters, except construction or maintenance"', add
label define presgl_lbl 292 `"Shipping and receiving clerks"', add
label define presgl_lbl 298 `"Telegraph messengers"', add
label define presgl_lbl 302 `"Fishermen and oystermen"', add
label define presgl_lbl 303 `"Upholsterers"', add
label define presgl_lbl 304 `"Loom fixers"', add
label define presgl_lbl 307 `"Boilermakers"', add
label define presgl_lbl 309 `"Cashiers"', add
label define presgl_lbl 312 `"Roofers and slaters"', add
label define presgl_lbl 313 `"Bookbinders"', add
label define presgl_lbl 316 `"Cement and concrete finishers"', add
label define presgl_lbl 317 `"Dressmakers and seamstresses, except factory"', add
label define presgl_lbl 319 `"Auctioneers"', add
label define presgl_lbl 320 `"Piano and organ tuners and repairmen"', add
label define presgl_lbl 321 `"Blasters and powdermen"', add
label define presgl_lbl 324 `"Bus drivers"', add
label define presgl_lbl 325 `"Stationary firemen"', add
label define presgl_lbl 326 `"Excavating, grading, and road machinery operators"', add
label define presgl_lbl 328 `"Salesmen and sales clerks (n.e.c.)"', add
label define presgl_lbl 329 `"Furnacemen, smeltermen and pourers"', add
label define presgl_lbl 332 `"Plasterers"', add
label define presgl_lbl 334 `"Milliners"', add
label define presgl_lbl 335 `"Dispatchers and starters, vehicle"', add
label define presgl_lbl 337 `"Sailors and deck hands"', add
label define presgl_lbl 339 `"Mechanics and repairmen, office machine"', add
label define presgl_lbl 342 `"Entertainers (n.e.c.)"', add
label define presgl_lbl 347 `"Furriers"', add
label define presgl_lbl 350 `"Mechanics and repairmen, radio and television"', add
label define presgl_lbl 354 `"Ticket, station, and express agents"', add
label define presgl_lbl 355 `"Clerical and kindred workers (n.e.c.)"', add
label define presgl_lbl 357 `"Brickmasons, stonemasons, and tile setters"', add
label define presgl_lbl 359 `"Photographic process workers"', add
label define presgl_lbl 360 `"Rollers and roll hands, metal"', add
label define presgl_lbl 362 `"Locomotive firemen"', add
label define presgl_lbl 363 `"Attendants, hospital and other institution"', add
label define presgl_lbl 364 `"Housekeepers and stewards, except private household"', add
label define presgl_lbl 367 `"Therapists and healers (n.e.c.)"', add
label define presgl_lbl 368 `"Tinsmiths, coppersmiths, and sheet metal workers"', add
label define presgl_lbl 372 `"Mechanics and repairmen, railroad and car shop"', add
label define presgl_lbl 373 `"Jewelers, watchmakers, goldsmiths, and silversmiths"', add
label define presgl_lbl 374 `"Decorators and window dressers"', add
label define presgl_lbl 376 `"Dancers and dancing teachers"', add
label define presgl_lbl 380 `"Compositors and typesetters"', add
label define presgl_lbl 383 `"Managers and superintendents, building"', add
label define presgl_lbl 386 `"Cabinetmakers"', add
label define presgl_lbl 388 `"Cranemen, derrickmen, and hoistmen"', add
label define presgl_lbl 391 `"Molders, metal"', add
label define presgl_lbl 392 `"Linemen and servicemen, telegraph, telephone, and power"', add
label define presgl_lbl 394 `"Chainmen, rodmen, and axmen, surveying"', add
label define presgl_lbl 399 `"Carpenters"', add
label define presgl_lbl 401 `"Welders and flame cutters"', add
label define presgl_lbl 402 `"Pressmen and plate printers, printing"', add
label define presgl_lbl 403 `"Millwrights"', add
label define presgl_lbl 404 `"Telephone operators"', add
label define presgl_lbl 405 `"Photographers"', add
label define presgl_lbl 406 `"Inspectors, public administration"', add
label define presgl_lbl 407 `"Farmers (owners and tenants)"', add
label define presgl_lbl 408 `"Apprentice auto mechanics"', add
label define presgl_lbl 409 `"Buyers and shippers, farm products"', add
label define presgl_lbl 412 `"Engravers, except photoengravers"', add
label define presgl_lbl 413 `"Attendants and assistants, library"', add
label define presgl_lbl 419 `"Practical nurses"', add
label define presgl_lbl 420 `"Tool makers, and die makers and setters"', add
label define presgl_lbl 422 `"Advertising agents and salesmen"', add
label define presgl_lbl 423 `"Mail carriers"', add
label define presgl_lbl 425 `"Agents (n.e.c.)"', add
label define presgl_lbl 428 `"Radio operators"', add
label define presgl_lbl 435 `"Telegraph operators"', add
label define presgl_lbl 437 `"Farm managers"', add
label define presgl_lbl 438 `"Firemen, fire protection"', add
label define presgl_lbl 440 `"Real estate agents and brokers"', add
label define presgl_lbl 445 `"Stenographers, typists, and secretaries"', add
label define presgl_lbl 449 `"Office machine operators"', add
label define presgl_lbl 451 `"Nurses, student professional"', add
label define presgl_lbl 453 `"Foremen (n.e.c.)"', add
label define presgl_lbl 458 `"Marshals and constables"', add
label define presgl_lbl 460 `"Musicians and music teachers"', add
label define presgl_lbl 466 `"Craftsmen and kindred workers (n.e.c.)"', add
label define presgl_lbl 469 `"Insurance agents and brokers"', add
label define presgl_lbl 470 `"Technicians, testing"', add
label define presgl_lbl 476 `"Bookkeepers"', add
label define presgl_lbl 478 `"Attendants, physician's and dentist's office"', add
label define presgl_lbl 479 `"Purchasing agents and buyers (n.e.c.)"', add
label define presgl_lbl 482 `"Mechanics and repairmen, airplane"', add
label define presgl_lbl 483 `"Officials, lodge, society, union, etc."', add
label define presgl_lbl 486 `"Recreation and group workers"', add
label define presgl_lbl 488 `"Credit men"', add
label define presgl_lbl 492 `"Electricians"', add
label define presgl_lbl 495 `"Bank tellers"', add
label define presgl_lbl 500 `"Buyers and department heads, store"', add
label define presgl_lbl 502 `"Technicians (n.e.c.)"', add
label define presgl_lbl 503 `"Managers, officials, and proprietors (n.e.c.)"', add
label define presgl_lbl 506 `"Professional, technical and kindred workers (n.e.c.)"', add
label define presgl_lbl 508 `"Locomotive engineers"', add
label define presgl_lbl 514 `"Athletes"', add
label define presgl_lbl 521 `"Dieticians and nutritionists"', add
label define presgl_lbl 522 `"Funeral directors and embalmers"', add
label define presgl_lbl 524 `"Social and welfare workers, except group"', add
label define presgl_lbl 525 `"Editors and reporters"', add
label define presgl_lbl 532 `"Sports instructors and officials"', add
label define presgl_lbl 533 `"Surveyors"', add
label define presgl_lbl 539 `"Farm and home management advisors"', add
label define presgl_lbl 544 `"Engineers, industrial"', add
label define presgl_lbl 546 `"Librarians"', add
label define presgl_lbl 550 `"Actors and actresses"', add
label define presgl_lbl 554 `"Statisticians and actuaries"', add
label define presgl_lbl 555 `"Religious workers"', add
label define presgl_lbl 558 `"Engineers, metallurgical, metallurgists"', add
label define presgl_lbl 560 `"Personnel and labor relations workers"', add
label define presgl_lbl 561 `"Draftsmen"', add
label define presgl_lbl 562 `"Artists and art teachers"', add
label define presgl_lbl 567 `"Accountants and auditors"', add
label define presgl_lbl 568 `"Economists"', add
label define presgl_lbl 581 `"Postmasters"', add
label define presgl_lbl 582 `"Designers"', add
label define presgl_lbl 596 `"Teachers (n.e.c.)"', add
label define presgl_lbl 597 `"Veterinarians"', add
label define presgl_lbl 598 `"Authors"', add
label define presgl_lbl 599 `"Officers, pilots, pursers and engineers, ship"', add
label define presgl_lbl 600 `"Chiropractors"', add
label define presgl_lbl 604 `"Engineers (n.e.c.)"', add
label define presgl_lbl 606 `"Officials and administrators (n.e.c.), public administration"', add
label define presgl_lbl 607 `"Pharmacists"', add
label define presgl_lbl 610 `"Technicians, medical and dental"', add
label define presgl_lbl 615 `"Nurses, professional"', add
label define presgl_lbl 616 `"Engineers, mining"', add
label define presgl_lbl 619 `"Osteopaths"', add
label define presgl_lbl 620 `"Optometrists"', add
label define presgl_lbl 623 `"Engineers, mechanical"', add
label define presgl_lbl 650 `"Mathematicians"', add
label define presgl_lbl 656 `"Miscellaneous social scientists"', add
label define presgl_lbl 672 `"Geologists and geophysicists"', add
label define presgl_lbl 673 `"Engineers, chemical"', add
label define presgl_lbl 677 `"Biological scientists"', add
label define presgl_lbl 678 `"Engineers, civil"', add
label define presgl_lbl 681 `"Miscellaneous natural scientists"', add
label define presgl_lbl 688 `"Chemists"', add
label define presgl_lbl 690 `"Clergymen"', add
label define presgl_lbl 694 `"Engineers, electrical"', add
label define presgl_lbl 701 `"Airplane pilots and navigators"', add
label define presgl_lbl 705 `"Architects"', add
label define presgl_lbl 711 `"Engineers, aeronautical"', add
label define presgl_lbl 714 `"Psychologists"', add
label define presgl_lbl 736 `"Dentists"', add
label define presgl_lbl 738 `"Physicists"', add
label define presgl_lbl 757 `"Lawyers and judges"', add
label define presgl_lbl 783 `"College presidents and deans"', add
label define presgl_lbl 815 `"Physicians and surgeons"', add
label values presgl presgl_lbl

label define erscor50_lbl 0000 `"0"'
label define erscor50_lbl 0001 `"0.1"', add
label define erscor50_lbl 0002 `"0.2"', add
label define erscor50_lbl 0003 `"0.3"', add
label define erscor50_lbl 0004 `"0.4"', add
label define erscor50_lbl 0005 `"0.5"', add
label define erscor50_lbl 0006 `"0.6"', add
label define erscor50_lbl 0007 `"0.7"', add
label define erscor50_lbl 0008 `"0.8"', add
label define erscor50_lbl 0009 `"0.9"', add
label define erscor50_lbl 0010 `"1"', add
label define erscor50_lbl 0011 `"1.1"', add
label define erscor50_lbl 0012 `"1.2"', add
label define erscor50_lbl 0013 `"1.3"', add
label define erscor50_lbl 0014 `"1.4"', add
label define erscor50_lbl 0015 `"1.5"', add
label define erscor50_lbl 0016 `"1.6"', add
label define erscor50_lbl 0017 `"1.7"', add
label define erscor50_lbl 0018 `"1.8"', add
label define erscor50_lbl 0019 `"1.9"', add
label define erscor50_lbl 0020 `"2"', add
label define erscor50_lbl 0021 `"2.1"', add
label define erscor50_lbl 0022 `"2.2"', add
label define erscor50_lbl 0023 `"2.3"', add
label define erscor50_lbl 0024 `"2.4"', add
label define erscor50_lbl 0025 `"2.5"', add
label define erscor50_lbl 0026 `"2.6"', add
label define erscor50_lbl 0027 `"2.7"', add
label define erscor50_lbl 0028 `"2.8"', add
label define erscor50_lbl 0029 `"2.9"', add
label define erscor50_lbl 0030 `"3"', add
label define erscor50_lbl 0031 `"3.1"', add
label define erscor50_lbl 0032 `"3.2"', add
label define erscor50_lbl 0033 `"3.3"', add
label define erscor50_lbl 0034 `"3.4"', add
label define erscor50_lbl 0035 `"3.5"', add
label define erscor50_lbl 0036 `"3.6"', add
label define erscor50_lbl 0037 `"3.7"', add
label define erscor50_lbl 0038 `"3.8"', add
label define erscor50_lbl 0039 `"3.9"', add
label define erscor50_lbl 0040 `"4"', add
label define erscor50_lbl 0041 `"4.1"', add
label define erscor50_lbl 0042 `"4.2"', add
label define erscor50_lbl 0043 `"4.3"', add
label define erscor50_lbl 0044 `"4.4"', add
label define erscor50_lbl 0045 `"4.5"', add
label define erscor50_lbl 0046 `"4.6"', add
label define erscor50_lbl 0047 `"4.7"', add
label define erscor50_lbl 0048 `"4.8"', add
label define erscor50_lbl 0049 `"4.9"', add
label define erscor50_lbl 0050 `"5"', add
label define erscor50_lbl 0051 `"5.1"', add
label define erscor50_lbl 0052 `"5.2"', add
label define erscor50_lbl 0053 `"5.3"', add
label define erscor50_lbl 0054 `"5.4"', add
label define erscor50_lbl 0055 `"5.5"', add
label define erscor50_lbl 0056 `"5.6"', add
label define erscor50_lbl 0057 `"5.7"', add
label define erscor50_lbl 0058 `"5.8"', add
label define erscor50_lbl 0059 `"5.9"', add
label define erscor50_lbl 0060 `"6"', add
label define erscor50_lbl 0061 `"6.1"', add
label define erscor50_lbl 0062 `"6.2"', add
label define erscor50_lbl 0063 `"6.3"', add
label define erscor50_lbl 0064 `"6.4"', add
label define erscor50_lbl 0065 `"6.5"', add
label define erscor50_lbl 0066 `"6.6"', add
label define erscor50_lbl 0067 `"6.7"', add
label define erscor50_lbl 0068 `"6.8"', add
label define erscor50_lbl 0069 `"6.9"', add
label define erscor50_lbl 0070 `"7"', add
label define erscor50_lbl 0071 `"7.1"', add
label define erscor50_lbl 0072 `"7.2"', add
label define erscor50_lbl 0073 `"7.3"', add
label define erscor50_lbl 0074 `"7.4"', add
label define erscor50_lbl 0075 `"7.5"', add
label define erscor50_lbl 0076 `"7.6"', add
label define erscor50_lbl 0077 `"7.7"', add
label define erscor50_lbl 0078 `"7.8"', add
label define erscor50_lbl 0079 `"7.9"', add
label define erscor50_lbl 0080 `"8"', add
label define erscor50_lbl 0081 `"8.1"', add
label define erscor50_lbl 0082 `"8.2"', add
label define erscor50_lbl 0083 `"8.3"', add
label define erscor50_lbl 0084 `"8.4"', add
label define erscor50_lbl 0085 `"8.5"', add
label define erscor50_lbl 0086 `"8.6"', add
label define erscor50_lbl 0087 `"8.7"', add
label define erscor50_lbl 0088 `"8.8"', add
label define erscor50_lbl 0089 `"8.9"', add
label define erscor50_lbl 0090 `"9"', add
label define erscor50_lbl 0091 `"9.1"', add
label define erscor50_lbl 0092 `"9.2"', add
label define erscor50_lbl 0093 `"9.3"', add
label define erscor50_lbl 0094 `"9.4"', add
label define erscor50_lbl 0095 `"9.5"', add
label define erscor50_lbl 0096 `"9.6"', add
label define erscor50_lbl 0097 `"9.7"', add
label define erscor50_lbl 0098 `"9.8"', add
label define erscor50_lbl 0099 `"9.9"', add
label define erscor50_lbl 0100 `"10"', add
label define erscor50_lbl 0101 `"10.1"', add
label define erscor50_lbl 0102 `"10.2"', add
label define erscor50_lbl 0103 `"10.3"', add
label define erscor50_lbl 0104 `"10.4"', add
label define erscor50_lbl 0105 `"10.5"', add
label define erscor50_lbl 0106 `"10.6"', add
label define erscor50_lbl 0107 `"10.7"', add
label define erscor50_lbl 0108 `"10.8"', add
label define erscor50_lbl 0109 `"10.9"', add
label define erscor50_lbl 0110 `"11"', add
label define erscor50_lbl 0111 `"11.1"', add
label define erscor50_lbl 0112 `"11.2"', add
label define erscor50_lbl 0113 `"11.3"', add
label define erscor50_lbl 0114 `"11.4"', add
label define erscor50_lbl 0115 `"11.5"', add
label define erscor50_lbl 0116 `"11.6"', add
label define erscor50_lbl 0117 `"11.7"', add
label define erscor50_lbl 0118 `"11.8"', add
label define erscor50_lbl 0119 `"11.9"', add
label define erscor50_lbl 0120 `"12"', add
label define erscor50_lbl 0121 `"12.1"', add
label define erscor50_lbl 0122 `"12.2"', add
label define erscor50_lbl 0123 `"12.3"', add
label define erscor50_lbl 0124 `"12.4"', add
label define erscor50_lbl 0125 `"12.5"', add
label define erscor50_lbl 0126 `"12.6"', add
label define erscor50_lbl 0127 `"12.7"', add
label define erscor50_lbl 0128 `"12.8"', add
label define erscor50_lbl 0129 `"12.9"', add
label define erscor50_lbl 0130 `"13"', add
label define erscor50_lbl 0131 `"13.1"', add
label define erscor50_lbl 0132 `"13.2"', add
label define erscor50_lbl 0133 `"13.3"', add
label define erscor50_lbl 0134 `"13.4"', add
label define erscor50_lbl 0135 `"13.5"', add
label define erscor50_lbl 0136 `"13.6"', add
label define erscor50_lbl 0137 `"13.7"', add
label define erscor50_lbl 0138 `"13.8"', add
label define erscor50_lbl 0139 `"13.9"', add
label define erscor50_lbl 0140 `"14"', add
label define erscor50_lbl 0141 `"14.1"', add
label define erscor50_lbl 0142 `"14.2"', add
label define erscor50_lbl 0143 `"14.3"', add
label define erscor50_lbl 0144 `"14.4"', add
label define erscor50_lbl 0145 `"14.5"', add
label define erscor50_lbl 0146 `"14.6"', add
label define erscor50_lbl 0147 `"14.7"', add
label define erscor50_lbl 0148 `"14.8"', add
label define erscor50_lbl 0149 `"14.9"', add
label define erscor50_lbl 0150 `"15"', add
label define erscor50_lbl 0151 `"15.1"', add
label define erscor50_lbl 0152 `"15.2"', add
label define erscor50_lbl 0153 `"15.3"', add
label define erscor50_lbl 0154 `"15.4"', add
label define erscor50_lbl 0155 `"15.5"', add
label define erscor50_lbl 0156 `"15.6"', add
label define erscor50_lbl 0157 `"15.7"', add
label define erscor50_lbl 0158 `"15.8"', add
label define erscor50_lbl 0159 `"15.9"', add
label define erscor50_lbl 0160 `"16"', add
label define erscor50_lbl 0161 `"16.1"', add
label define erscor50_lbl 0162 `"16.2"', add
label define erscor50_lbl 0163 `"16.3"', add
label define erscor50_lbl 0164 `"16.4"', add
label define erscor50_lbl 0165 `"16.5"', add
label define erscor50_lbl 0166 `"16.6"', add
label define erscor50_lbl 0167 `"16.7"', add
label define erscor50_lbl 0168 `"16.8"', add
label define erscor50_lbl 0169 `"16.9"', add
label define erscor50_lbl 0170 `"17"', add
label define erscor50_lbl 0171 `"17.1"', add
label define erscor50_lbl 0172 `"17.2"', add
label define erscor50_lbl 0173 `"17.3"', add
label define erscor50_lbl 0174 `"17.4"', add
label define erscor50_lbl 0175 `"17.5"', add
label define erscor50_lbl 0176 `"17.6"', add
label define erscor50_lbl 0177 `"17.7"', add
label define erscor50_lbl 0178 `"17.8"', add
label define erscor50_lbl 0179 `"17.9"', add
label define erscor50_lbl 0180 `"18"', add
label define erscor50_lbl 0181 `"18.1"', add
label define erscor50_lbl 0182 `"18.2"', add
label define erscor50_lbl 0183 `"18.3"', add
label define erscor50_lbl 0184 `"18.4"', add
label define erscor50_lbl 0185 `"18.5"', add
label define erscor50_lbl 0186 `"18.6"', add
label define erscor50_lbl 0187 `"18.7"', add
label define erscor50_lbl 0188 `"18.8"', add
label define erscor50_lbl 0189 `"18.9"', add
label define erscor50_lbl 0190 `"19"', add
label define erscor50_lbl 0191 `"19.1"', add
label define erscor50_lbl 0192 `"19.2"', add
label define erscor50_lbl 0193 `"19.3"', add
label define erscor50_lbl 0194 `"19.4"', add
label define erscor50_lbl 0195 `"19.5"', add
label define erscor50_lbl 0196 `"19.6"', add
label define erscor50_lbl 0197 `"19.7"', add
label define erscor50_lbl 0198 `"19.8"', add
label define erscor50_lbl 0199 `"19.9"', add
label define erscor50_lbl 0200 `"20"', add
label define erscor50_lbl 0201 `"20.1"', add
label define erscor50_lbl 0202 `"20.2"', add
label define erscor50_lbl 0203 `"20.3"', add
label define erscor50_lbl 0204 `"20.4"', add
label define erscor50_lbl 0205 `"20.5"', add
label define erscor50_lbl 0206 `"20.6"', add
label define erscor50_lbl 0207 `"20.7"', add
label define erscor50_lbl 0208 `"20.8"', add
label define erscor50_lbl 0209 `"20.9"', add
label define erscor50_lbl 0210 `"21"', add
label define erscor50_lbl 0211 `"21.1"', add
label define erscor50_lbl 0212 `"21.2"', add
label define erscor50_lbl 0213 `"21.3"', add
label define erscor50_lbl 0214 `"21.4"', add
label define erscor50_lbl 0215 `"21.5"', add
label define erscor50_lbl 0216 `"21.6"', add
label define erscor50_lbl 0217 `"21.7"', add
label define erscor50_lbl 0218 `"21.8"', add
label define erscor50_lbl 0219 `"21.9"', add
label define erscor50_lbl 0220 `"22"', add
label define erscor50_lbl 0221 `"22.1"', add
label define erscor50_lbl 0222 `"22.2"', add
label define erscor50_lbl 0223 `"22.3"', add
label define erscor50_lbl 0224 `"22.4"', add
label define erscor50_lbl 0225 `"22.5"', add
label define erscor50_lbl 0226 `"22.6"', add
label define erscor50_lbl 0227 `"22.7"', add
label define erscor50_lbl 0228 `"22.8"', add
label define erscor50_lbl 0229 `"22.9"', add
label define erscor50_lbl 0230 `"23"', add
label define erscor50_lbl 0231 `"23.1"', add
label define erscor50_lbl 0232 `"23.2"', add
label define erscor50_lbl 0233 `"23.3"', add
label define erscor50_lbl 0234 `"23.4"', add
label define erscor50_lbl 0235 `"23.5"', add
label define erscor50_lbl 0236 `"23.6"', add
label define erscor50_lbl 0237 `"23.7"', add
label define erscor50_lbl 0238 `"23.8"', add
label define erscor50_lbl 0239 `"23.9"', add
label define erscor50_lbl 0240 `"24"', add
label define erscor50_lbl 0241 `"24.1"', add
label define erscor50_lbl 0242 `"24.2"', add
label define erscor50_lbl 0243 `"24.3"', add
label define erscor50_lbl 0244 `"24.4"', add
label define erscor50_lbl 0245 `"24.5"', add
label define erscor50_lbl 0246 `"24.6"', add
label define erscor50_lbl 0247 `"24.7"', add
label define erscor50_lbl 0248 `"24.8"', add
label define erscor50_lbl 0249 `"24.9"', add
label define erscor50_lbl 0250 `"25"', add
label define erscor50_lbl 0251 `"25.1"', add
label define erscor50_lbl 0252 `"25.2"', add
label define erscor50_lbl 0253 `"25.3"', add
label define erscor50_lbl 0254 `"25.4"', add
label define erscor50_lbl 0255 `"25.5"', add
label define erscor50_lbl 0256 `"25.6"', add
label define erscor50_lbl 0257 `"25.7"', add
label define erscor50_lbl 0258 `"25.8"', add
label define erscor50_lbl 0259 `"25.9"', add
label define erscor50_lbl 0260 `"26"', add
label define erscor50_lbl 0261 `"26.1"', add
label define erscor50_lbl 0262 `"26.2"', add
label define erscor50_lbl 0263 `"26.3"', add
label define erscor50_lbl 0264 `"26.4"', add
label define erscor50_lbl 0265 `"26.5"', add
label define erscor50_lbl 0266 `"26.6"', add
label define erscor50_lbl 0267 `"26.7"', add
label define erscor50_lbl 0268 `"26.8"', add
label define erscor50_lbl 0269 `"26.9"', add
label define erscor50_lbl 0270 `"27"', add
label define erscor50_lbl 0271 `"27.1"', add
label define erscor50_lbl 0272 `"27.2"', add
label define erscor50_lbl 0273 `"27.3"', add
label define erscor50_lbl 0274 `"27.4"', add
label define erscor50_lbl 0275 `"27.5"', add
label define erscor50_lbl 0276 `"27.6"', add
label define erscor50_lbl 0277 `"27.7"', add
label define erscor50_lbl 0278 `"27.8"', add
label define erscor50_lbl 0279 `"27.9"', add
label define erscor50_lbl 0280 `"28"', add
label define erscor50_lbl 0281 `"28.1"', add
label define erscor50_lbl 0282 `"28.2"', add
label define erscor50_lbl 0283 `"28.3"', add
label define erscor50_lbl 0284 `"28.4"', add
label define erscor50_lbl 0285 `"28.5"', add
label define erscor50_lbl 0286 `"28.6"', add
label define erscor50_lbl 0287 `"28.7"', add
label define erscor50_lbl 0288 `"28.8"', add
label define erscor50_lbl 0289 `"28.9"', add
label define erscor50_lbl 0290 `"29"', add
label define erscor50_lbl 0291 `"29.1"', add
label define erscor50_lbl 0292 `"29.2"', add
label define erscor50_lbl 0293 `"29.3"', add
label define erscor50_lbl 0294 `"29.4"', add
label define erscor50_lbl 0295 `"29.5"', add
label define erscor50_lbl 0296 `"29.6"', add
label define erscor50_lbl 0297 `"29.7"', add
label define erscor50_lbl 0298 `"29.8"', add
label define erscor50_lbl 0299 `"29.9"', add
label define erscor50_lbl 0300 `"30"', add
label define erscor50_lbl 0301 `"30.1"', add
label define erscor50_lbl 0302 `"30.2"', add
label define erscor50_lbl 0303 `"30.3"', add
label define erscor50_lbl 0304 `"30.4"', add
label define erscor50_lbl 0305 `"30.5"', add
label define erscor50_lbl 0306 `"30.6"', add
label define erscor50_lbl 0307 `"30.7"', add
label define erscor50_lbl 0308 `"30.8"', add
label define erscor50_lbl 0309 `"30.9"', add
label define erscor50_lbl 0310 `"31"', add
label define erscor50_lbl 0311 `"31.1"', add
label define erscor50_lbl 0312 `"31.2"', add
label define erscor50_lbl 0313 `"31.3"', add
label define erscor50_lbl 0314 `"31.4"', add
label define erscor50_lbl 0315 `"31.5"', add
label define erscor50_lbl 0316 `"31.6"', add
label define erscor50_lbl 0317 `"31.7"', add
label define erscor50_lbl 0318 `"31.8"', add
label define erscor50_lbl 0319 `"31.9"', add
label define erscor50_lbl 0320 `"32"', add
label define erscor50_lbl 0321 `"32.1"', add
label define erscor50_lbl 0322 `"32.2"', add
label define erscor50_lbl 0323 `"32.3"', add
label define erscor50_lbl 0324 `"32.4"', add
label define erscor50_lbl 0325 `"32.5"', add
label define erscor50_lbl 0326 `"32.6"', add
label define erscor50_lbl 0327 `"32.7"', add
label define erscor50_lbl 0328 `"32.8"', add
label define erscor50_lbl 0329 `"32.9"', add
label define erscor50_lbl 0330 `"33"', add
label define erscor50_lbl 0331 `"33.1"', add
label define erscor50_lbl 0332 `"33.2"', add
label define erscor50_lbl 0333 `"33.3"', add
label define erscor50_lbl 0334 `"33.4"', add
label define erscor50_lbl 0335 `"33.5"', add
label define erscor50_lbl 0336 `"33.6"', add
label define erscor50_lbl 0337 `"33.7"', add
label define erscor50_lbl 0338 `"33.8"', add
label define erscor50_lbl 0339 `"33.9"', add
label define erscor50_lbl 0340 `"34"', add
label define erscor50_lbl 0341 `"34.1"', add
label define erscor50_lbl 0342 `"34.2"', add
label define erscor50_lbl 0343 `"34.3"', add
label define erscor50_lbl 0344 `"34.4"', add
label define erscor50_lbl 0345 `"34.5"', add
label define erscor50_lbl 0346 `"34.6"', add
label define erscor50_lbl 0347 `"34.7"', add
label define erscor50_lbl 0348 `"34.8"', add
label define erscor50_lbl 0349 `"34.9"', add
label define erscor50_lbl 0350 `"35"', add
label define erscor50_lbl 0351 `"35.1"', add
label define erscor50_lbl 0352 `"35.2"', add
label define erscor50_lbl 0353 `"35.3"', add
label define erscor50_lbl 0354 `"35.4"', add
label define erscor50_lbl 0355 `"35.5"', add
label define erscor50_lbl 0356 `"35.6"', add
label define erscor50_lbl 0357 `"35.7"', add
label define erscor50_lbl 0358 `"35.8"', add
label define erscor50_lbl 0359 `"35.9"', add
label define erscor50_lbl 0360 `"36"', add
label define erscor50_lbl 0361 `"36.1"', add
label define erscor50_lbl 0362 `"36.2"', add
label define erscor50_lbl 0363 `"36.3"', add
label define erscor50_lbl 0364 `"36.4"', add
label define erscor50_lbl 0365 `"36.5"', add
label define erscor50_lbl 0366 `"36.6"', add
label define erscor50_lbl 0367 `"36.7"', add
label define erscor50_lbl 0368 `"36.8"', add
label define erscor50_lbl 0369 `"36.9"', add
label define erscor50_lbl 0370 `"37"', add
label define erscor50_lbl 0371 `"37.1"', add
label define erscor50_lbl 0372 `"37.2"', add
label define erscor50_lbl 0373 `"37.3"', add
label define erscor50_lbl 0374 `"37.4"', add
label define erscor50_lbl 0375 `"37.5"', add
label define erscor50_lbl 0376 `"37.6"', add
label define erscor50_lbl 0377 `"37.7"', add
label define erscor50_lbl 0378 `"37.8"', add
label define erscor50_lbl 0379 `"37.9"', add
label define erscor50_lbl 0380 `"38"', add
label define erscor50_lbl 0381 `"38.1"', add
label define erscor50_lbl 0382 `"38.2"', add
label define erscor50_lbl 0383 `"38.3"', add
label define erscor50_lbl 0384 `"38.4"', add
label define erscor50_lbl 0385 `"38.5"', add
label define erscor50_lbl 0386 `"38.6"', add
label define erscor50_lbl 0387 `"38.7"', add
label define erscor50_lbl 0388 `"38.8"', add
label define erscor50_lbl 0389 `"38.9"', add
label define erscor50_lbl 0390 `"39"', add
label define erscor50_lbl 0391 `"39.1"', add
label define erscor50_lbl 0392 `"39.2"', add
label define erscor50_lbl 0393 `"39.3"', add
label define erscor50_lbl 0394 `"39.4"', add
label define erscor50_lbl 0395 `"39.5"', add
label define erscor50_lbl 0396 `"39.6"', add
label define erscor50_lbl 0397 `"39.7"', add
label define erscor50_lbl 0398 `"39.8"', add
label define erscor50_lbl 0399 `"39.9"', add
label define erscor50_lbl 0400 `"40"', add
label define erscor50_lbl 0401 `"40.1"', add
label define erscor50_lbl 0402 `"40.2"', add
label define erscor50_lbl 0403 `"40.3"', add
label define erscor50_lbl 0404 `"40.4"', add
label define erscor50_lbl 0405 `"40.5"', add
label define erscor50_lbl 0406 `"40.6"', add
label define erscor50_lbl 0407 `"40.7"', add
label define erscor50_lbl 0408 `"40.8"', add
label define erscor50_lbl 0409 `"40.9"', add
label define erscor50_lbl 0410 `"41"', add
label define erscor50_lbl 0411 `"41.1"', add
label define erscor50_lbl 0412 `"41.2"', add
label define erscor50_lbl 0413 `"41.3"', add
label define erscor50_lbl 0414 `"41.4"', add
label define erscor50_lbl 0415 `"41.5"', add
label define erscor50_lbl 0416 `"41.6"', add
label define erscor50_lbl 0417 `"41.7"', add
label define erscor50_lbl 0418 `"41.8"', add
label define erscor50_lbl 0419 `"41.9"', add
label define erscor50_lbl 0420 `"42"', add
label define erscor50_lbl 0421 `"42.1"', add
label define erscor50_lbl 0422 `"42.2"', add
label define erscor50_lbl 0423 `"42.3"', add
label define erscor50_lbl 0424 `"42.4"', add
label define erscor50_lbl 0425 `"42.5"', add
label define erscor50_lbl 0426 `"42.6"', add
label define erscor50_lbl 0427 `"42.7"', add
label define erscor50_lbl 0428 `"42.8"', add
label define erscor50_lbl 0429 `"42.9"', add
label define erscor50_lbl 0430 `"43"', add
label define erscor50_lbl 0431 `"43.1"', add
label define erscor50_lbl 0432 `"43.2"', add
label define erscor50_lbl 0433 `"43.3"', add
label define erscor50_lbl 0434 `"43.4"', add
label define erscor50_lbl 0435 `"43.5"', add
label define erscor50_lbl 0436 `"43.6"', add
label define erscor50_lbl 0437 `"43.7"', add
label define erscor50_lbl 0438 `"43.8"', add
label define erscor50_lbl 0439 `"43.9"', add
label define erscor50_lbl 0440 `"44"', add
label define erscor50_lbl 0441 `"44.1"', add
label define erscor50_lbl 0442 `"44.2"', add
label define erscor50_lbl 0443 `"44.3"', add
label define erscor50_lbl 0444 `"44.4"', add
label define erscor50_lbl 0445 `"44.5"', add
label define erscor50_lbl 0446 `"44.6"', add
label define erscor50_lbl 0447 `"44.7"', add
label define erscor50_lbl 0448 `"44.8"', add
label define erscor50_lbl 0449 `"44.9"', add
label define erscor50_lbl 0450 `"45"', add
label define erscor50_lbl 0451 `"45.1"', add
label define erscor50_lbl 0452 `"45.2"', add
label define erscor50_lbl 0453 `"45.3"', add
label define erscor50_lbl 0454 `"45.4"', add
label define erscor50_lbl 0455 `"45.5"', add
label define erscor50_lbl 0456 `"45.6"', add
label define erscor50_lbl 0457 `"45.7"', add
label define erscor50_lbl 0458 `"45.8"', add
label define erscor50_lbl 0459 `"45.9"', add
label define erscor50_lbl 0460 `"46"', add
label define erscor50_lbl 0461 `"46.1"', add
label define erscor50_lbl 0462 `"46.2"', add
label define erscor50_lbl 0463 `"46.3"', add
label define erscor50_lbl 0464 `"46.4"', add
label define erscor50_lbl 0465 `"46.5"', add
label define erscor50_lbl 0466 `"46.6"', add
label define erscor50_lbl 0467 `"46.7"', add
label define erscor50_lbl 0468 `"46.8"', add
label define erscor50_lbl 0469 `"46.9"', add
label define erscor50_lbl 0470 `"47"', add
label define erscor50_lbl 0471 `"47.1"', add
label define erscor50_lbl 0472 `"47.2"', add
label define erscor50_lbl 0473 `"47.3"', add
label define erscor50_lbl 0474 `"47.4"', add
label define erscor50_lbl 0475 `"47.5"', add
label define erscor50_lbl 0476 `"47.6"', add
label define erscor50_lbl 0477 `"47.7"', add
label define erscor50_lbl 0478 `"47.8"', add
label define erscor50_lbl 0479 `"47.9"', add
label define erscor50_lbl 0480 `"48"', add
label define erscor50_lbl 0481 `"48.1"', add
label define erscor50_lbl 0482 `"48.2"', add
label define erscor50_lbl 0483 `"48.3"', add
label define erscor50_lbl 0484 `"48.4"', add
label define erscor50_lbl 0485 `"48.5"', add
label define erscor50_lbl 0486 `"48.6"', add
label define erscor50_lbl 0487 `"48.7"', add
label define erscor50_lbl 0488 `"48.8"', add
label define erscor50_lbl 0489 `"48.9"', add
label define erscor50_lbl 0490 `"49"', add
label define erscor50_lbl 0491 `"49.1"', add
label define erscor50_lbl 0492 `"49.2"', add
label define erscor50_lbl 0493 `"49.3"', add
label define erscor50_lbl 0494 `"49.4"', add
label define erscor50_lbl 0495 `"49.5"', add
label define erscor50_lbl 0496 `"49.6"', add
label define erscor50_lbl 0497 `"49.7"', add
label define erscor50_lbl 0498 `"49.8"', add
label define erscor50_lbl 0499 `"49.9"', add
label define erscor50_lbl 0500 `"50"', add
label define erscor50_lbl 0501 `"50.1"', add
label define erscor50_lbl 0502 `"50.2"', add
label define erscor50_lbl 0503 `"50.3"', add
label define erscor50_lbl 0504 `"50.4"', add
label define erscor50_lbl 0505 `"50.5"', add
label define erscor50_lbl 0506 `"50.6"', add
label define erscor50_lbl 0507 `"50.7"', add
label define erscor50_lbl 0508 `"50.8"', add
label define erscor50_lbl 0509 `"50.9"', add
label define erscor50_lbl 0510 `"51"', add
label define erscor50_lbl 0511 `"51.1"', add
label define erscor50_lbl 0512 `"51.2"', add
label define erscor50_lbl 0513 `"51.3"', add
label define erscor50_lbl 0514 `"51.4"', add
label define erscor50_lbl 0515 `"51.5"', add
label define erscor50_lbl 0516 `"51.6"', add
label define erscor50_lbl 0517 `"51.7"', add
label define erscor50_lbl 0518 `"51.8"', add
label define erscor50_lbl 0519 `"51.9"', add
label define erscor50_lbl 0520 `"52"', add
label define erscor50_lbl 0521 `"52.1"', add
label define erscor50_lbl 0522 `"52.2"', add
label define erscor50_lbl 0523 `"52.3"', add
label define erscor50_lbl 0524 `"52.4"', add
label define erscor50_lbl 0525 `"52.5"', add
label define erscor50_lbl 0526 `"52.6"', add
label define erscor50_lbl 0527 `"52.7"', add
label define erscor50_lbl 0528 `"52.8"', add
label define erscor50_lbl 0529 `"52.9"', add
label define erscor50_lbl 0530 `"53"', add
label define erscor50_lbl 0531 `"53.1"', add
label define erscor50_lbl 0532 `"53.2"', add
label define erscor50_lbl 0533 `"53.3"', add
label define erscor50_lbl 0534 `"53.4"', add
label define erscor50_lbl 0535 `"53.5"', add
label define erscor50_lbl 0536 `"53.6"', add
label define erscor50_lbl 0537 `"53.7"', add
label define erscor50_lbl 0538 `"53.8"', add
label define erscor50_lbl 0539 `"53.9"', add
label define erscor50_lbl 0540 `"54"', add
label define erscor50_lbl 0541 `"54.1"', add
label define erscor50_lbl 0542 `"54.2"', add
label define erscor50_lbl 0543 `"54.3"', add
label define erscor50_lbl 0544 `"54.4"', add
label define erscor50_lbl 0545 `"54.5"', add
label define erscor50_lbl 0546 `"54.6"', add
label define erscor50_lbl 0547 `"54.7"', add
label define erscor50_lbl 0548 `"54.8"', add
label define erscor50_lbl 0549 `"54.9"', add
label define erscor50_lbl 0550 `"55"', add
label define erscor50_lbl 0551 `"55.1"', add
label define erscor50_lbl 0552 `"55.2"', add
label define erscor50_lbl 0553 `"55.3"', add
label define erscor50_lbl 0554 `"55.4"', add
label define erscor50_lbl 0555 `"55.5"', add
label define erscor50_lbl 0556 `"55.6"', add
label define erscor50_lbl 0557 `"55.7"', add
label define erscor50_lbl 0558 `"55.8"', add
label define erscor50_lbl 0559 `"55.9"', add
label define erscor50_lbl 0560 `"56"', add
label define erscor50_lbl 0561 `"56.1"', add
label define erscor50_lbl 0562 `"56.2"', add
label define erscor50_lbl 0563 `"56.3"', add
label define erscor50_lbl 0564 `"56.4"', add
label define erscor50_lbl 0565 `"56.5"', add
label define erscor50_lbl 0566 `"56.6"', add
label define erscor50_lbl 0567 `"56.7"', add
label define erscor50_lbl 0568 `"56.8"', add
label define erscor50_lbl 0569 `"56.9"', add
label define erscor50_lbl 0570 `"57"', add
label define erscor50_lbl 0571 `"57.1"', add
label define erscor50_lbl 0572 `"57.2"', add
label define erscor50_lbl 0573 `"57.3"', add
label define erscor50_lbl 0574 `"57.4"', add
label define erscor50_lbl 0575 `"57.5"', add
label define erscor50_lbl 0576 `"57.6"', add
label define erscor50_lbl 0577 `"57.7"', add
label define erscor50_lbl 0578 `"57.8"', add
label define erscor50_lbl 0579 `"57.9"', add
label define erscor50_lbl 0580 `"58"', add
label define erscor50_lbl 0581 `"58.1"', add
label define erscor50_lbl 0582 `"58.2"', add
label define erscor50_lbl 0583 `"58.3"', add
label define erscor50_lbl 0584 `"58.4"', add
label define erscor50_lbl 0585 `"58.5"', add
label define erscor50_lbl 0586 `"58.6"', add
label define erscor50_lbl 0587 `"58.7"', add
label define erscor50_lbl 0588 `"58.8"', add
label define erscor50_lbl 0589 `"58.9"', add
label define erscor50_lbl 0590 `"59"', add
label define erscor50_lbl 0591 `"59.1"', add
label define erscor50_lbl 0592 `"59.2"', add
label define erscor50_lbl 0593 `"59.3"', add
label define erscor50_lbl 0594 `"59.4"', add
label define erscor50_lbl 0595 `"59.5"', add
label define erscor50_lbl 0596 `"59.6"', add
label define erscor50_lbl 0597 `"59.7"', add
label define erscor50_lbl 0598 `"59.8"', add
label define erscor50_lbl 0599 `"59.9"', add
label define erscor50_lbl 0600 `"60"', add
label define erscor50_lbl 0601 `"60.1"', add
label define erscor50_lbl 0602 `"60.2"', add
label define erscor50_lbl 0603 `"60.3"', add
label define erscor50_lbl 0604 `"60.4"', add
label define erscor50_lbl 0605 `"60.5"', add
label define erscor50_lbl 0606 `"60.6"', add
label define erscor50_lbl 0607 `"60.7"', add
label define erscor50_lbl 0608 `"60.8"', add
label define erscor50_lbl 0609 `"60.9"', add
label define erscor50_lbl 0610 `"61"', add
label define erscor50_lbl 0611 `"61.1"', add
label define erscor50_lbl 0612 `"61.2"', add
label define erscor50_lbl 0613 `"61.3"', add
label define erscor50_lbl 0614 `"61.4"', add
label define erscor50_lbl 0615 `"61.5"', add
label define erscor50_lbl 0616 `"61.6"', add
label define erscor50_lbl 0617 `"61.7"', add
label define erscor50_lbl 0618 `"61.8"', add
label define erscor50_lbl 0619 `"61.9"', add
label define erscor50_lbl 0620 `"62"', add
label define erscor50_lbl 0621 `"62.1"', add
label define erscor50_lbl 0622 `"62.2"', add
label define erscor50_lbl 0623 `"62.3"', add
label define erscor50_lbl 0624 `"62.4"', add
label define erscor50_lbl 0625 `"62.5"', add
label define erscor50_lbl 0626 `"62.6"', add
label define erscor50_lbl 0627 `"62.7"', add
label define erscor50_lbl 0628 `"62.8"', add
label define erscor50_lbl 0629 `"62.9"', add
label define erscor50_lbl 0630 `"63"', add
label define erscor50_lbl 0631 `"63.1"', add
label define erscor50_lbl 0632 `"63.2"', add
label define erscor50_lbl 0633 `"63.3"', add
label define erscor50_lbl 0634 `"63.4"', add
label define erscor50_lbl 0635 `"63.5"', add
label define erscor50_lbl 0636 `"63.6"', add
label define erscor50_lbl 0637 `"63.7"', add
label define erscor50_lbl 0638 `"63.8"', add
label define erscor50_lbl 0639 `"63.9"', add
label define erscor50_lbl 0640 `"64"', add
label define erscor50_lbl 0641 `"64.1"', add
label define erscor50_lbl 0642 `"64.2"', add
label define erscor50_lbl 0643 `"64.3"', add
label define erscor50_lbl 0644 `"64.4"', add
label define erscor50_lbl 0645 `"64.5"', add
label define erscor50_lbl 0646 `"64.6"', add
label define erscor50_lbl 0647 `"64.7"', add
label define erscor50_lbl 0648 `"64.8"', add
label define erscor50_lbl 0649 `"64.9"', add
label define erscor50_lbl 0650 `"65"', add
label define erscor50_lbl 0651 `"65.1"', add
label define erscor50_lbl 0652 `"65.2"', add
label define erscor50_lbl 0653 `"65.3"', add
label define erscor50_lbl 0654 `"65.4"', add
label define erscor50_lbl 0655 `"65.5"', add
label define erscor50_lbl 0656 `"65.6"', add
label define erscor50_lbl 0657 `"65.7"', add
label define erscor50_lbl 0658 `"65.8"', add
label define erscor50_lbl 0659 `"65.9"', add
label define erscor50_lbl 0660 `"66"', add
label define erscor50_lbl 0661 `"66.1"', add
label define erscor50_lbl 0662 `"66.2"', add
label define erscor50_lbl 0663 `"66.3"', add
label define erscor50_lbl 0664 `"66.4"', add
label define erscor50_lbl 0665 `"66.5"', add
label define erscor50_lbl 0666 `"66.6"', add
label define erscor50_lbl 0667 `"66.7"', add
label define erscor50_lbl 0668 `"66.8"', add
label define erscor50_lbl 0669 `"66.9"', add
label define erscor50_lbl 0670 `"67"', add
label define erscor50_lbl 0671 `"67.1"', add
label define erscor50_lbl 0672 `"67.2"', add
label define erscor50_lbl 0673 `"67.3"', add
label define erscor50_lbl 0674 `"67.4"', add
label define erscor50_lbl 0675 `"67.5"', add
label define erscor50_lbl 0676 `"67.6"', add
label define erscor50_lbl 0677 `"67.7"', add
label define erscor50_lbl 0678 `"67.8"', add
label define erscor50_lbl 0679 `"67.9"', add
label define erscor50_lbl 0680 `"68"', add
label define erscor50_lbl 0681 `"68.1"', add
label define erscor50_lbl 0682 `"68.2"', add
label define erscor50_lbl 0683 `"68.3"', add
label define erscor50_lbl 0684 `"68.4"', add
label define erscor50_lbl 0685 `"68.5"', add
label define erscor50_lbl 0686 `"68.6"', add
label define erscor50_lbl 0687 `"68.7"', add
label define erscor50_lbl 0688 `"68.8"', add
label define erscor50_lbl 0689 `"68.9"', add
label define erscor50_lbl 0690 `"69"', add
label define erscor50_lbl 0691 `"69.1"', add
label define erscor50_lbl 0692 `"69.2"', add
label define erscor50_lbl 0693 `"69.3"', add
label define erscor50_lbl 0694 `"69.4"', add
label define erscor50_lbl 0695 `"69.5"', add
label define erscor50_lbl 0696 `"69.6"', add
label define erscor50_lbl 0697 `"69.7"', add
label define erscor50_lbl 0698 `"69.8"', add
label define erscor50_lbl 0699 `"69.9"', add
label define erscor50_lbl 0700 `"70"', add
label define erscor50_lbl 0701 `"70.1"', add
label define erscor50_lbl 0702 `"70.2"', add
label define erscor50_lbl 0703 `"70.3"', add
label define erscor50_lbl 0704 `"70.4"', add
label define erscor50_lbl 0705 `"70.5"', add
label define erscor50_lbl 0706 `"70.6"', add
label define erscor50_lbl 0707 `"70.7"', add
label define erscor50_lbl 0708 `"70.8"', add
label define erscor50_lbl 0709 `"70.9"', add
label define erscor50_lbl 0710 `"71"', add
label define erscor50_lbl 0711 `"71.1"', add
label define erscor50_lbl 0712 `"71.2"', add
label define erscor50_lbl 0713 `"71.3"', add
label define erscor50_lbl 0714 `"71.4"', add
label define erscor50_lbl 0715 `"71.5"', add
label define erscor50_lbl 0716 `"71.6"', add
label define erscor50_lbl 0717 `"71.7"', add
label define erscor50_lbl 0718 `"71.8"', add
label define erscor50_lbl 0719 `"71.9"', add
label define erscor50_lbl 0720 `"72"', add
label define erscor50_lbl 0721 `"72.1"', add
label define erscor50_lbl 0722 `"72.2"', add
label define erscor50_lbl 0723 `"72.3"', add
label define erscor50_lbl 0724 `"72.4"', add
label define erscor50_lbl 0725 `"72.5"', add
label define erscor50_lbl 0726 `"72.6"', add
label define erscor50_lbl 0727 `"72.7"', add
label define erscor50_lbl 0728 `"72.8"', add
label define erscor50_lbl 0729 `"72.9"', add
label define erscor50_lbl 0730 `"73"', add
label define erscor50_lbl 0731 `"73.1"', add
label define erscor50_lbl 0732 `"73.2"', add
label define erscor50_lbl 0733 `"73.3"', add
label define erscor50_lbl 0734 `"73.4"', add
label define erscor50_lbl 0735 `"73.5"', add
label define erscor50_lbl 0736 `"73.6"', add
label define erscor50_lbl 0737 `"73.7"', add
label define erscor50_lbl 0738 `"73.8"', add
label define erscor50_lbl 0739 `"73.9"', add
label define erscor50_lbl 0740 `"74"', add
label define erscor50_lbl 0741 `"74.1"', add
label define erscor50_lbl 0742 `"74.2"', add
label define erscor50_lbl 0743 `"74.3"', add
label define erscor50_lbl 0744 `"74.4"', add
label define erscor50_lbl 0745 `"74.5"', add
label define erscor50_lbl 0746 `"74.6"', add
label define erscor50_lbl 0747 `"74.7"', add
label define erscor50_lbl 0748 `"74.8"', add
label define erscor50_lbl 0749 `"74.9"', add
label define erscor50_lbl 0750 `"75"', add
label define erscor50_lbl 0751 `"75.1"', add
label define erscor50_lbl 0752 `"75.2"', add
label define erscor50_lbl 0753 `"75.3"', add
label define erscor50_lbl 0754 `"75.4"', add
label define erscor50_lbl 0755 `"75.5"', add
label define erscor50_lbl 0756 `"75.6"', add
label define erscor50_lbl 0757 `"75.7"', add
label define erscor50_lbl 0758 `"75.8"', add
label define erscor50_lbl 0759 `"75.9"', add
label define erscor50_lbl 0760 `"76"', add
label define erscor50_lbl 0761 `"76.1"', add
label define erscor50_lbl 0762 `"76.2"', add
label define erscor50_lbl 0763 `"76.3"', add
label define erscor50_lbl 0764 `"76.4"', add
label define erscor50_lbl 0765 `"76.5"', add
label define erscor50_lbl 0766 `"76.6"', add
label define erscor50_lbl 0767 `"76.7"', add
label define erscor50_lbl 0768 `"76.8"', add
label define erscor50_lbl 0769 `"76.9"', add
label define erscor50_lbl 0770 `"77"', add
label define erscor50_lbl 0771 `"77.1"', add
label define erscor50_lbl 0772 `"77.2"', add
label define erscor50_lbl 0773 `"77.3"', add
label define erscor50_lbl 0774 `"77.4"', add
label define erscor50_lbl 0775 `"77.5"', add
label define erscor50_lbl 0776 `"77.6"', add
label define erscor50_lbl 0777 `"77.7"', add
label define erscor50_lbl 0778 `"77.8"', add
label define erscor50_lbl 0779 `"77.9"', add
label define erscor50_lbl 0780 `"78"', add
label define erscor50_lbl 0781 `"78.1"', add
label define erscor50_lbl 0782 `"78.2"', add
label define erscor50_lbl 0783 `"78.3"', add
label define erscor50_lbl 0784 `"78.4"', add
label define erscor50_lbl 0785 `"78.5"', add
label define erscor50_lbl 0786 `"78.6"', add
label define erscor50_lbl 0787 `"78.7"', add
label define erscor50_lbl 0788 `"78.8"', add
label define erscor50_lbl 0789 `"78.9"', add
label define erscor50_lbl 0790 `"79"', add
label define erscor50_lbl 0791 `"79.1"', add
label define erscor50_lbl 0792 `"79.2"', add
label define erscor50_lbl 0793 `"79.3"', add
label define erscor50_lbl 0794 `"79.4"', add
label define erscor50_lbl 0795 `"79.5"', add
label define erscor50_lbl 0796 `"79.6"', add
label define erscor50_lbl 0797 `"79.7"', add
label define erscor50_lbl 0798 `"79.8"', add
label define erscor50_lbl 0799 `"79.9"', add
label define erscor50_lbl 0800 `"80"', add
label define erscor50_lbl 0801 `"80.1"', add
label define erscor50_lbl 0802 `"80.2"', add
label define erscor50_lbl 0803 `"80.3"', add
label define erscor50_lbl 0804 `"80.4"', add
label define erscor50_lbl 0805 `"80.5"', add
label define erscor50_lbl 0806 `"80.6"', add
label define erscor50_lbl 0807 `"80.7"', add
label define erscor50_lbl 0808 `"80.8"', add
label define erscor50_lbl 0809 `"80.9"', add
label define erscor50_lbl 0810 `"81"', add
label define erscor50_lbl 0811 `"81.1"', add
label define erscor50_lbl 0812 `"81.2"', add
label define erscor50_lbl 0813 `"81.3"', add
label define erscor50_lbl 0814 `"81.4"', add
label define erscor50_lbl 0815 `"81.5"', add
label define erscor50_lbl 0816 `"81.6"', add
label define erscor50_lbl 0817 `"81.7"', add
label define erscor50_lbl 0818 `"81.8"', add
label define erscor50_lbl 0819 `"81.9"', add
label define erscor50_lbl 0820 `"82"', add
label define erscor50_lbl 0821 `"82.1"', add
label define erscor50_lbl 0822 `"82.2"', add
label define erscor50_lbl 0823 `"82.3"', add
label define erscor50_lbl 0824 `"82.4"', add
label define erscor50_lbl 0825 `"82.5"', add
label define erscor50_lbl 0826 `"82.6"', add
label define erscor50_lbl 0827 `"82.7"', add
label define erscor50_lbl 0828 `"82.8"', add
label define erscor50_lbl 0829 `"82.9"', add
label define erscor50_lbl 0830 `"83"', add
label define erscor50_lbl 0831 `"83.1"', add
label define erscor50_lbl 0832 `"83.2"', add
label define erscor50_lbl 0833 `"83.3"', add
label define erscor50_lbl 0834 `"83.4"', add
label define erscor50_lbl 0835 `"83.5"', add
label define erscor50_lbl 0836 `"83.6"', add
label define erscor50_lbl 0837 `"83.7"', add
label define erscor50_lbl 0838 `"83.8"', add
label define erscor50_lbl 0839 `"83.9"', add
label define erscor50_lbl 0840 `"84"', add
label define erscor50_lbl 0841 `"84.1"', add
label define erscor50_lbl 0842 `"84.2"', add
label define erscor50_lbl 0843 `"84.3"', add
label define erscor50_lbl 0844 `"84.4"', add
label define erscor50_lbl 0845 `"84.5"', add
label define erscor50_lbl 0846 `"84.6"', add
label define erscor50_lbl 0847 `"84.7"', add
label define erscor50_lbl 0848 `"84.8"', add
label define erscor50_lbl 0849 `"84.9"', add
label define erscor50_lbl 0850 `"85"', add
label define erscor50_lbl 0851 `"85.1"', add
label define erscor50_lbl 0852 `"85.2"', add
label define erscor50_lbl 0853 `"85.3"', add
label define erscor50_lbl 0854 `"85.4"', add
label define erscor50_lbl 0855 `"85.5"', add
label define erscor50_lbl 0856 `"85.6"', add
label define erscor50_lbl 0857 `"85.7"', add
label define erscor50_lbl 0858 `"85.8"', add
label define erscor50_lbl 0859 `"85.9"', add
label define erscor50_lbl 0860 `"86"', add
label define erscor50_lbl 0861 `"86.1"', add
label define erscor50_lbl 0862 `"86.2"', add
label define erscor50_lbl 0863 `"86.3"', add
label define erscor50_lbl 0864 `"86.4"', add
label define erscor50_lbl 0865 `"86.5"', add
label define erscor50_lbl 0866 `"86.6"', add
label define erscor50_lbl 0867 `"86.7"', add
label define erscor50_lbl 0868 `"86.8"', add
label define erscor50_lbl 0869 `"86.9"', add
label define erscor50_lbl 0870 `"87"', add
label define erscor50_lbl 0871 `"87.1"', add
label define erscor50_lbl 0872 `"87.2"', add
label define erscor50_lbl 0873 `"87.3"', add
label define erscor50_lbl 0874 `"87.4"', add
label define erscor50_lbl 0875 `"87.5"', add
label define erscor50_lbl 0876 `"87.6"', add
label define erscor50_lbl 0877 `"87.7"', add
label define erscor50_lbl 0878 `"87.8"', add
label define erscor50_lbl 0879 `"87.9"', add
label define erscor50_lbl 0880 `"88"', add
label define erscor50_lbl 0881 `"88.1"', add
label define erscor50_lbl 0882 `"88.2"', add
label define erscor50_lbl 0883 `"88.3"', add
label define erscor50_lbl 0884 `"88.4"', add
label define erscor50_lbl 0885 `"88.5"', add
label define erscor50_lbl 0886 `"88.6"', add
label define erscor50_lbl 0887 `"88.7"', add
label define erscor50_lbl 0888 `"88.8"', add
label define erscor50_lbl 0889 `"88.9"', add
label define erscor50_lbl 0890 `"89"', add
label define erscor50_lbl 0891 `"89.1"', add
label define erscor50_lbl 0892 `"89.2"', add
label define erscor50_lbl 0893 `"89.3"', add
label define erscor50_lbl 0894 `"89.4"', add
label define erscor50_lbl 0895 `"89.5"', add
label define erscor50_lbl 0896 `"89.6"', add
label define erscor50_lbl 0897 `"89.7"', add
label define erscor50_lbl 0898 `"89.8"', add
label define erscor50_lbl 0899 `"89.9"', add
label define erscor50_lbl 0900 `"90"', add
label define erscor50_lbl 0901 `"90.1"', add
label define erscor50_lbl 0902 `"90.2"', add
label define erscor50_lbl 0903 `"90.3"', add
label define erscor50_lbl 0904 `"90.4"', add
label define erscor50_lbl 0905 `"90.5"', add
label define erscor50_lbl 0906 `"90.6"', add
label define erscor50_lbl 0907 `"90.7"', add
label define erscor50_lbl 0908 `"90.8"', add
label define erscor50_lbl 0909 `"90.9"', add
label define erscor50_lbl 0910 `"91"', add
label define erscor50_lbl 0911 `"91.1"', add
label define erscor50_lbl 0912 `"91.2"', add
label define erscor50_lbl 0913 `"91.3"', add
label define erscor50_lbl 0914 `"91.4"', add
label define erscor50_lbl 0915 `"91.5"', add
label define erscor50_lbl 0916 `"91.6"', add
label define erscor50_lbl 0917 `"91.7"', add
label define erscor50_lbl 0918 `"91.8"', add
label define erscor50_lbl 0919 `"91.9"', add
label define erscor50_lbl 0920 `"92"', add
label define erscor50_lbl 0921 `"92.1"', add
label define erscor50_lbl 0922 `"92.2"', add
label define erscor50_lbl 0923 `"92.3"', add
label define erscor50_lbl 0924 `"92.4"', add
label define erscor50_lbl 0925 `"92.5"', add
label define erscor50_lbl 0926 `"92.6"', add
label define erscor50_lbl 0927 `"92.7"', add
label define erscor50_lbl 0928 `"92.8"', add
label define erscor50_lbl 0929 `"92.9"', add
label define erscor50_lbl 0930 `"93"', add
label define erscor50_lbl 0931 `"93.1"', add
label define erscor50_lbl 0932 `"93.2"', add
label define erscor50_lbl 0933 `"93.3"', add
label define erscor50_lbl 0934 `"93.4"', add
label define erscor50_lbl 0935 `"93.5"', add
label define erscor50_lbl 0936 `"93.6"', add
label define erscor50_lbl 0937 `"93.7"', add
label define erscor50_lbl 0938 `"93.8"', add
label define erscor50_lbl 0939 `"93.9"', add
label define erscor50_lbl 0940 `"94"', add
label define erscor50_lbl 0941 `"94.1"', add
label define erscor50_lbl 0942 `"94.2"', add
label define erscor50_lbl 0943 `"94.3"', add
label define erscor50_lbl 0944 `"94.4"', add
label define erscor50_lbl 0945 `"94.5"', add
label define erscor50_lbl 0946 `"94.6"', add
label define erscor50_lbl 0947 `"94.7"', add
label define erscor50_lbl 0948 `"94.8"', add
label define erscor50_lbl 0949 `"94.9"', add
label define erscor50_lbl 0950 `"95"', add
label define erscor50_lbl 0951 `"95.1"', add
label define erscor50_lbl 0952 `"95.2"', add
label define erscor50_lbl 0953 `"95.3"', add
label define erscor50_lbl 0954 `"95.4"', add
label define erscor50_lbl 0955 `"95.5"', add
label define erscor50_lbl 0956 `"95.6"', add
label define erscor50_lbl 0957 `"95.7"', add
label define erscor50_lbl 0958 `"95.8"', add
label define erscor50_lbl 0959 `"95.9"', add
label define erscor50_lbl 0960 `"96"', add
label define erscor50_lbl 0961 `"96.1"', add
label define erscor50_lbl 0962 `"96.2"', add
label define erscor50_lbl 0963 `"96.3"', add
label define erscor50_lbl 0964 `"96.4"', add
label define erscor50_lbl 0965 `"96.5"', add
label define erscor50_lbl 0966 `"96.6"', add
label define erscor50_lbl 0967 `"96.7"', add
label define erscor50_lbl 0968 `"96.8"', add
label define erscor50_lbl 0969 `"96.9"', add
label define erscor50_lbl 0970 `"97"', add
label define erscor50_lbl 0971 `"97.1"', add
label define erscor50_lbl 0972 `"97.2"', add
label define erscor50_lbl 0973 `"97.3"', add
label define erscor50_lbl 0974 `"97.4"', add
label define erscor50_lbl 0975 `"97.5"', add
label define erscor50_lbl 0976 `"97.6"', add
label define erscor50_lbl 0977 `"97.7"', add
label define erscor50_lbl 0978 `"97.8"', add
label define erscor50_lbl 0979 `"97.9"', add
label define erscor50_lbl 0980 `"98"', add
label define erscor50_lbl 0981 `"98.1"', add
label define erscor50_lbl 0982 `"98.2"', add
label define erscor50_lbl 0983 `"98.3"', add
label define erscor50_lbl 0984 `"98.4"', add
label define erscor50_lbl 0985 `"98.5"', add
label define erscor50_lbl 0986 `"98.6"', add
label define erscor50_lbl 0987 `"98.7"', add
label define erscor50_lbl 0988 `"98.8"', add
label define erscor50_lbl 0989 `"98.9"', add
label define erscor50_lbl 0990 `"99"', add
label define erscor50_lbl 0991 `"99.1"', add
label define erscor50_lbl 0992 `"99.2"', add
label define erscor50_lbl 0993 `"99.3"', add
label define erscor50_lbl 0994 `"99.4"', add
label define erscor50_lbl 0995 `"99.5"', add
label define erscor50_lbl 0996 `"99.6"', add
label define erscor50_lbl 0997 `"99.7"', add
label define erscor50_lbl 0998 `"99.8"', add
label define erscor50_lbl 0999 `"99.9"', add
label define erscor50_lbl 1000 `"100"', add
label define erscor50_lbl 9999 `"N/A"', add
label values erscor50 erscor50_lbl

label define edscor50_lbl 0000 `"0"'
label define edscor50_lbl 0001 `"0.1"', add
label define edscor50_lbl 0002 `"0.2"', add
label define edscor50_lbl 0003 `"0.3"', add
label define edscor50_lbl 0004 `"0.4"', add
label define edscor50_lbl 0005 `"0.5"', add
label define edscor50_lbl 0006 `"0.6"', add
label define edscor50_lbl 0007 `"0.7"', add
label define edscor50_lbl 0008 `"0.8"', add
label define edscor50_lbl 0009 `"0.9"', add
label define edscor50_lbl 0010 `"1"', add
label define edscor50_lbl 0011 `"1.1"', add
label define edscor50_lbl 0012 `"1.2"', add
label define edscor50_lbl 0013 `"1.3"', add
label define edscor50_lbl 0014 `"1.4"', add
label define edscor50_lbl 0015 `"1.5"', add
label define edscor50_lbl 0016 `"1.6"', add
label define edscor50_lbl 0017 `"1.7"', add
label define edscor50_lbl 0018 `"1.8"', add
label define edscor50_lbl 0019 `"1.9"', add
label define edscor50_lbl 0020 `"2"', add
label define edscor50_lbl 0021 `"2.1"', add
label define edscor50_lbl 0022 `"2.2"', add
label define edscor50_lbl 0023 `"2.3"', add
label define edscor50_lbl 0024 `"2.4"', add
label define edscor50_lbl 0025 `"2.5"', add
label define edscor50_lbl 0026 `"2.6"', add
label define edscor50_lbl 0027 `"2.7"', add
label define edscor50_lbl 0028 `"2.8"', add
label define edscor50_lbl 0029 `"2.9"', add
label define edscor50_lbl 0030 `"3"', add
label define edscor50_lbl 0031 `"3.1"', add
label define edscor50_lbl 0032 `"3.2"', add
label define edscor50_lbl 0033 `"3.3"', add
label define edscor50_lbl 0034 `"3.4"', add
label define edscor50_lbl 0035 `"3.5"', add
label define edscor50_lbl 0036 `"3.6"', add
label define edscor50_lbl 0037 `"3.7"', add
label define edscor50_lbl 0038 `"3.8"', add
label define edscor50_lbl 0039 `"3.9"', add
label define edscor50_lbl 0040 `"4"', add
label define edscor50_lbl 0041 `"4.1"', add
label define edscor50_lbl 0042 `"4.2"', add
label define edscor50_lbl 0043 `"4.3"', add
label define edscor50_lbl 0044 `"4.4"', add
label define edscor50_lbl 0045 `"4.5"', add
label define edscor50_lbl 0046 `"4.6"', add
label define edscor50_lbl 0047 `"4.7"', add
label define edscor50_lbl 0048 `"4.8"', add
label define edscor50_lbl 0049 `"4.9"', add
label define edscor50_lbl 0050 `"5"', add
label define edscor50_lbl 0051 `"5.1"', add
label define edscor50_lbl 0052 `"5.2"', add
label define edscor50_lbl 0053 `"5.3"', add
label define edscor50_lbl 0054 `"5.4"', add
label define edscor50_lbl 0055 `"5.5"', add
label define edscor50_lbl 0056 `"5.6"', add
label define edscor50_lbl 0057 `"5.7"', add
label define edscor50_lbl 0058 `"5.8"', add
label define edscor50_lbl 0059 `"5.9"', add
label define edscor50_lbl 0060 `"6"', add
label define edscor50_lbl 0061 `"6.1"', add
label define edscor50_lbl 0062 `"6.2"', add
label define edscor50_lbl 0063 `"6.3"', add
label define edscor50_lbl 0064 `"6.4"', add
label define edscor50_lbl 0065 `"6.5"', add
label define edscor50_lbl 0066 `"6.6"', add
label define edscor50_lbl 0067 `"6.7"', add
label define edscor50_lbl 0068 `"6.8"', add
label define edscor50_lbl 0069 `"6.9"', add
label define edscor50_lbl 0070 `"7"', add
label define edscor50_lbl 0071 `"7.1"', add
label define edscor50_lbl 0072 `"7.2"', add
label define edscor50_lbl 0073 `"7.3"', add
label define edscor50_lbl 0074 `"7.4"', add
label define edscor50_lbl 0075 `"7.5"', add
label define edscor50_lbl 0076 `"7.6"', add
label define edscor50_lbl 0077 `"7.7"', add
label define edscor50_lbl 0078 `"7.8"', add
label define edscor50_lbl 0079 `"7.9"', add
label define edscor50_lbl 0080 `"8"', add
label define edscor50_lbl 0081 `"8.1"', add
label define edscor50_lbl 0082 `"8.2"', add
label define edscor50_lbl 0083 `"8.3"', add
label define edscor50_lbl 0084 `"8.4"', add
label define edscor50_lbl 0085 `"8.5"', add
label define edscor50_lbl 0086 `"8.6"', add
label define edscor50_lbl 0087 `"8.7"', add
label define edscor50_lbl 0088 `"8.8"', add
label define edscor50_lbl 0089 `"8.9"', add
label define edscor50_lbl 0090 `"9"', add
label define edscor50_lbl 0091 `"9.1"', add
label define edscor50_lbl 0092 `"9.2"', add
label define edscor50_lbl 0093 `"9.3"', add
label define edscor50_lbl 0094 `"9.4"', add
label define edscor50_lbl 0095 `"9.5"', add
label define edscor50_lbl 0096 `"9.6"', add
label define edscor50_lbl 0097 `"9.7"', add
label define edscor50_lbl 0098 `"9.8"', add
label define edscor50_lbl 0099 `"9.9"', add
label define edscor50_lbl 0100 `"10"', add
label define edscor50_lbl 0101 `"10.1"', add
label define edscor50_lbl 0102 `"10.2"', add
label define edscor50_lbl 0103 `"10.3"', add
label define edscor50_lbl 0104 `"10.4"', add
label define edscor50_lbl 0105 `"10.5"', add
label define edscor50_lbl 0106 `"10.6"', add
label define edscor50_lbl 0107 `"10.7"', add
label define edscor50_lbl 0108 `"10.8"', add
label define edscor50_lbl 0109 `"10.9"', add
label define edscor50_lbl 0110 `"11"', add
label define edscor50_lbl 0111 `"11.1"', add
label define edscor50_lbl 0112 `"11.2"', add
label define edscor50_lbl 0113 `"11.3"', add
label define edscor50_lbl 0114 `"11.4"', add
label define edscor50_lbl 0115 `"11.5"', add
label define edscor50_lbl 0116 `"11.6"', add
label define edscor50_lbl 0117 `"11.7"', add
label define edscor50_lbl 0118 `"11.8"', add
label define edscor50_lbl 0119 `"11.9"', add
label define edscor50_lbl 0120 `"12"', add
label define edscor50_lbl 0121 `"12.1"', add
label define edscor50_lbl 0122 `"12.2"', add
label define edscor50_lbl 0123 `"12.3"', add
label define edscor50_lbl 0124 `"12.4"', add
label define edscor50_lbl 0125 `"12.5"', add
label define edscor50_lbl 0126 `"12.6"', add
label define edscor50_lbl 0127 `"12.7"', add
label define edscor50_lbl 0128 `"12.8"', add
label define edscor50_lbl 0129 `"12.9"', add
label define edscor50_lbl 0130 `"13"', add
label define edscor50_lbl 0131 `"13.1"', add
label define edscor50_lbl 0132 `"13.2"', add
label define edscor50_lbl 0133 `"13.3"', add
label define edscor50_lbl 0134 `"13.4"', add
label define edscor50_lbl 0135 `"13.5"', add
label define edscor50_lbl 0136 `"13.6"', add
label define edscor50_lbl 0137 `"13.7"', add
label define edscor50_lbl 0138 `"13.8"', add
label define edscor50_lbl 0139 `"13.9"', add
label define edscor50_lbl 0140 `"14"', add
label define edscor50_lbl 0141 `"14.1"', add
label define edscor50_lbl 0142 `"14.2"', add
label define edscor50_lbl 0143 `"14.3"', add
label define edscor50_lbl 0144 `"14.4"', add
label define edscor50_lbl 0145 `"14.5"', add
label define edscor50_lbl 0146 `"14.6"', add
label define edscor50_lbl 0147 `"14.7"', add
label define edscor50_lbl 0148 `"14.8"', add
label define edscor50_lbl 0149 `"14.9"', add
label define edscor50_lbl 0150 `"15"', add
label define edscor50_lbl 0151 `"15.1"', add
label define edscor50_lbl 0152 `"15.2"', add
label define edscor50_lbl 0153 `"15.3"', add
label define edscor50_lbl 0154 `"15.4"', add
label define edscor50_lbl 0155 `"15.5"', add
label define edscor50_lbl 0156 `"15.6"', add
label define edscor50_lbl 0157 `"15.7"', add
label define edscor50_lbl 0158 `"15.8"', add
label define edscor50_lbl 0159 `"15.9"', add
label define edscor50_lbl 0160 `"16"', add
label define edscor50_lbl 0161 `"16.1"', add
label define edscor50_lbl 0162 `"16.2"', add
label define edscor50_lbl 0163 `"16.3"', add
label define edscor50_lbl 0164 `"16.4"', add
label define edscor50_lbl 0165 `"16.5"', add
label define edscor50_lbl 0166 `"16.6"', add
label define edscor50_lbl 0167 `"16.7"', add
label define edscor50_lbl 0168 `"16.8"', add
label define edscor50_lbl 0169 `"16.9"', add
label define edscor50_lbl 0170 `"17"', add
label define edscor50_lbl 0171 `"17.1"', add
label define edscor50_lbl 0172 `"17.2"', add
label define edscor50_lbl 0173 `"17.3"', add
label define edscor50_lbl 0174 `"17.4"', add
label define edscor50_lbl 0175 `"17.5"', add
label define edscor50_lbl 0176 `"17.6"', add
label define edscor50_lbl 0177 `"17.7"', add
label define edscor50_lbl 0178 `"17.8"', add
label define edscor50_lbl 0179 `"17.9"', add
label define edscor50_lbl 0180 `"18"', add
label define edscor50_lbl 0181 `"18.1"', add
label define edscor50_lbl 0182 `"18.2"', add
label define edscor50_lbl 0183 `"18.3"', add
label define edscor50_lbl 0184 `"18.4"', add
label define edscor50_lbl 0185 `"18.5"', add
label define edscor50_lbl 0186 `"18.6"', add
label define edscor50_lbl 0187 `"18.7"', add
label define edscor50_lbl 0188 `"18.8"', add
label define edscor50_lbl 0189 `"18.9"', add
label define edscor50_lbl 0190 `"19"', add
label define edscor50_lbl 0191 `"19.1"', add
label define edscor50_lbl 0192 `"19.2"', add
label define edscor50_lbl 0193 `"19.3"', add
label define edscor50_lbl 0194 `"19.4"', add
label define edscor50_lbl 0195 `"19.5"', add
label define edscor50_lbl 0196 `"19.6"', add
label define edscor50_lbl 0197 `"19.7"', add
label define edscor50_lbl 0198 `"19.8"', add
label define edscor50_lbl 0199 `"19.9"', add
label define edscor50_lbl 0200 `"20"', add
label define edscor50_lbl 0201 `"20.1"', add
label define edscor50_lbl 0202 `"20.2"', add
label define edscor50_lbl 0203 `"20.3"', add
label define edscor50_lbl 0204 `"20.4"', add
label define edscor50_lbl 0205 `"20.5"', add
label define edscor50_lbl 0206 `"20.6"', add
label define edscor50_lbl 0207 `"20.7"', add
label define edscor50_lbl 0208 `"20.8"', add
label define edscor50_lbl 0209 `"20.9"', add
label define edscor50_lbl 0210 `"21"', add
label define edscor50_lbl 0211 `"21.1"', add
label define edscor50_lbl 0212 `"21.2"', add
label define edscor50_lbl 0213 `"21.3"', add
label define edscor50_lbl 0214 `"21.4"', add
label define edscor50_lbl 0215 `"21.5"', add
label define edscor50_lbl 0216 `"21.6"', add
label define edscor50_lbl 0217 `"21.7"', add
label define edscor50_lbl 0218 `"21.8"', add
label define edscor50_lbl 0219 `"21.9"', add
label define edscor50_lbl 0220 `"22"', add
label define edscor50_lbl 0221 `"22.1"', add
label define edscor50_lbl 0222 `"22.2"', add
label define edscor50_lbl 0223 `"22.3"', add
label define edscor50_lbl 0224 `"22.4"', add
label define edscor50_lbl 0225 `"22.5"', add
label define edscor50_lbl 0226 `"22.6"', add
label define edscor50_lbl 0227 `"22.7"', add
label define edscor50_lbl 0228 `"22.8"', add
label define edscor50_lbl 0229 `"22.9"', add
label define edscor50_lbl 0230 `"23"', add
label define edscor50_lbl 0231 `"23.1"', add
label define edscor50_lbl 0232 `"23.2"', add
label define edscor50_lbl 0233 `"23.3"', add
label define edscor50_lbl 0234 `"23.4"', add
label define edscor50_lbl 0235 `"23.5"', add
label define edscor50_lbl 0236 `"23.6"', add
label define edscor50_lbl 0237 `"23.7"', add
label define edscor50_lbl 0238 `"23.8"', add
label define edscor50_lbl 0239 `"23.9"', add
label define edscor50_lbl 0240 `"24"', add
label define edscor50_lbl 0241 `"24.1"', add
label define edscor50_lbl 0242 `"24.2"', add
label define edscor50_lbl 0243 `"24.3"', add
label define edscor50_lbl 0244 `"24.4"', add
label define edscor50_lbl 0245 `"24.5"', add
label define edscor50_lbl 0246 `"24.6"', add
label define edscor50_lbl 0247 `"24.7"', add
label define edscor50_lbl 0248 `"24.8"', add
label define edscor50_lbl 0249 `"24.9"', add
label define edscor50_lbl 0250 `"25"', add
label define edscor50_lbl 0251 `"25.1"', add
label define edscor50_lbl 0252 `"25.2"', add
label define edscor50_lbl 0253 `"25.3"', add
label define edscor50_lbl 0254 `"25.4"', add
label define edscor50_lbl 0255 `"25.5"', add
label define edscor50_lbl 0256 `"25.6"', add
label define edscor50_lbl 0257 `"25.7"', add
label define edscor50_lbl 0258 `"25.8"', add
label define edscor50_lbl 0259 `"25.9"', add
label define edscor50_lbl 0260 `"26"', add
label define edscor50_lbl 0261 `"26.1"', add
label define edscor50_lbl 0262 `"26.2"', add
label define edscor50_lbl 0263 `"26.3"', add
label define edscor50_lbl 0264 `"26.4"', add
label define edscor50_lbl 0265 `"26.5"', add
label define edscor50_lbl 0266 `"26.6"', add
label define edscor50_lbl 0267 `"26.7"', add
label define edscor50_lbl 0268 `"26.8"', add
label define edscor50_lbl 0269 `"26.9"', add
label define edscor50_lbl 0270 `"27"', add
label define edscor50_lbl 0271 `"27.1"', add
label define edscor50_lbl 0272 `"27.2"', add
label define edscor50_lbl 0273 `"27.3"', add
label define edscor50_lbl 0274 `"27.4"', add
label define edscor50_lbl 0275 `"27.5"', add
label define edscor50_lbl 0276 `"27.6"', add
label define edscor50_lbl 0277 `"27.7"', add
label define edscor50_lbl 0278 `"27.8"', add
label define edscor50_lbl 0279 `"27.9"', add
label define edscor50_lbl 0280 `"28"', add
label define edscor50_lbl 0281 `"28.1"', add
label define edscor50_lbl 0282 `"28.2"', add
label define edscor50_lbl 0283 `"28.3"', add
label define edscor50_lbl 0284 `"28.4"', add
label define edscor50_lbl 0285 `"28.5"', add
label define edscor50_lbl 0286 `"28.6"', add
label define edscor50_lbl 0287 `"28.7"', add
label define edscor50_lbl 0288 `"28.8"', add
label define edscor50_lbl 0289 `"28.9"', add
label define edscor50_lbl 0290 `"29"', add
label define edscor50_lbl 0291 `"29.1"', add
label define edscor50_lbl 0292 `"29.2"', add
label define edscor50_lbl 0293 `"29.3"', add
label define edscor50_lbl 0294 `"29.4"', add
label define edscor50_lbl 0295 `"29.5"', add
label define edscor50_lbl 0296 `"29.6"', add
label define edscor50_lbl 0297 `"29.7"', add
label define edscor50_lbl 0298 `"29.8"', add
label define edscor50_lbl 0299 `"29.9"', add
label define edscor50_lbl 0300 `"30"', add
label define edscor50_lbl 0301 `"30.1"', add
label define edscor50_lbl 0302 `"30.2"', add
label define edscor50_lbl 0303 `"30.3"', add
label define edscor50_lbl 0304 `"30.4"', add
label define edscor50_lbl 0305 `"30.5"', add
label define edscor50_lbl 0306 `"30.6"', add
label define edscor50_lbl 0307 `"30.7"', add
label define edscor50_lbl 0308 `"30.8"', add
label define edscor50_lbl 0309 `"30.9"', add
label define edscor50_lbl 0310 `"31"', add
label define edscor50_lbl 0311 `"31.1"', add
label define edscor50_lbl 0312 `"31.2"', add
label define edscor50_lbl 0313 `"31.3"', add
label define edscor50_lbl 0314 `"31.4"', add
label define edscor50_lbl 0315 `"31.5"', add
label define edscor50_lbl 0316 `"31.6"', add
label define edscor50_lbl 0317 `"31.7"', add
label define edscor50_lbl 0318 `"31.8"', add
label define edscor50_lbl 0319 `"31.9"', add
label define edscor50_lbl 0320 `"32"', add
label define edscor50_lbl 0321 `"32.1"', add
label define edscor50_lbl 0322 `"32.2"', add
label define edscor50_lbl 0323 `"32.3"', add
label define edscor50_lbl 0324 `"32.4"', add
label define edscor50_lbl 0325 `"32.5"', add
label define edscor50_lbl 0326 `"32.6"', add
label define edscor50_lbl 0327 `"32.7"', add
label define edscor50_lbl 0328 `"32.8"', add
label define edscor50_lbl 0329 `"32.9"', add
label define edscor50_lbl 0330 `"33"', add
label define edscor50_lbl 0331 `"33.1"', add
label define edscor50_lbl 0332 `"33.2"', add
label define edscor50_lbl 0333 `"33.3"', add
label define edscor50_lbl 0334 `"33.4"', add
label define edscor50_lbl 0335 `"33.5"', add
label define edscor50_lbl 0336 `"33.6"', add
label define edscor50_lbl 0337 `"33.7"', add
label define edscor50_lbl 0338 `"33.8"', add
label define edscor50_lbl 0339 `"33.9"', add
label define edscor50_lbl 0340 `"34"', add
label define edscor50_lbl 0341 `"34.1"', add
label define edscor50_lbl 0342 `"34.2"', add
label define edscor50_lbl 0343 `"34.3"', add
label define edscor50_lbl 0344 `"34.4"', add
label define edscor50_lbl 0345 `"34.5"', add
label define edscor50_lbl 0346 `"34.6"', add
label define edscor50_lbl 0347 `"34.7"', add
label define edscor50_lbl 0348 `"34.8"', add
label define edscor50_lbl 0349 `"34.9"', add
label define edscor50_lbl 0350 `"35"', add
label define edscor50_lbl 0351 `"35.1"', add
label define edscor50_lbl 0352 `"35.2"', add
label define edscor50_lbl 0353 `"35.3"', add
label define edscor50_lbl 0354 `"35.4"', add
label define edscor50_lbl 0355 `"35.5"', add
label define edscor50_lbl 0356 `"35.6"', add
label define edscor50_lbl 0357 `"35.7"', add
label define edscor50_lbl 0358 `"35.8"', add
label define edscor50_lbl 0359 `"35.9"', add
label define edscor50_lbl 0360 `"36"', add
label define edscor50_lbl 0361 `"36.1"', add
label define edscor50_lbl 0362 `"36.2"', add
label define edscor50_lbl 0363 `"36.3"', add
label define edscor50_lbl 0364 `"36.4"', add
label define edscor50_lbl 0365 `"36.5"', add
label define edscor50_lbl 0366 `"36.6"', add
label define edscor50_lbl 0367 `"36.7"', add
label define edscor50_lbl 0368 `"36.8"', add
label define edscor50_lbl 0369 `"36.9"', add
label define edscor50_lbl 0370 `"37"', add
label define edscor50_lbl 0371 `"37.1"', add
label define edscor50_lbl 0372 `"37.2"', add
label define edscor50_lbl 0373 `"37.3"', add
label define edscor50_lbl 0374 `"37.4"', add
label define edscor50_lbl 0375 `"37.5"', add
label define edscor50_lbl 0376 `"37.6"', add
label define edscor50_lbl 0377 `"37.7"', add
label define edscor50_lbl 0378 `"37.8"', add
label define edscor50_lbl 0379 `"37.9"', add
label define edscor50_lbl 0380 `"38"', add
label define edscor50_lbl 0381 `"38.1"', add
label define edscor50_lbl 0382 `"38.2"', add
label define edscor50_lbl 0383 `"38.3"', add
label define edscor50_lbl 0384 `"38.4"', add
label define edscor50_lbl 0385 `"38.5"', add
label define edscor50_lbl 0386 `"38.6"', add
label define edscor50_lbl 0387 `"38.7"', add
label define edscor50_lbl 0388 `"38.8"', add
label define edscor50_lbl 0389 `"38.9"', add
label define edscor50_lbl 0390 `"39"', add
label define edscor50_lbl 0391 `"39.1"', add
label define edscor50_lbl 0392 `"39.2"', add
label define edscor50_lbl 0393 `"39.3"', add
label define edscor50_lbl 0394 `"39.4"', add
label define edscor50_lbl 0395 `"39.5"', add
label define edscor50_lbl 0396 `"39.6"', add
label define edscor50_lbl 0397 `"39.7"', add
label define edscor50_lbl 0398 `"39.8"', add
label define edscor50_lbl 0399 `"39.9"', add
label define edscor50_lbl 0400 `"40"', add
label define edscor50_lbl 0401 `"40.1"', add
label define edscor50_lbl 0402 `"40.2"', add
label define edscor50_lbl 0403 `"40.3"', add
label define edscor50_lbl 0404 `"40.4"', add
label define edscor50_lbl 0405 `"40.5"', add
label define edscor50_lbl 0406 `"40.6"', add
label define edscor50_lbl 0407 `"40.7"', add
label define edscor50_lbl 0408 `"40.8"', add
label define edscor50_lbl 0409 `"40.9"', add
label define edscor50_lbl 0410 `"41"', add
label define edscor50_lbl 0411 `"41.1"', add
label define edscor50_lbl 0412 `"41.2"', add
label define edscor50_lbl 0413 `"41.3"', add
label define edscor50_lbl 0414 `"41.4"', add
label define edscor50_lbl 0415 `"41.5"', add
label define edscor50_lbl 0416 `"41.6"', add
label define edscor50_lbl 0417 `"41.7"', add
label define edscor50_lbl 0418 `"41.8"', add
label define edscor50_lbl 0419 `"41.9"', add
label define edscor50_lbl 0420 `"42"', add
label define edscor50_lbl 0421 `"42.1"', add
label define edscor50_lbl 0422 `"42.2"', add
label define edscor50_lbl 0423 `"42.3"', add
label define edscor50_lbl 0424 `"42.4"', add
label define edscor50_lbl 0425 `"42.5"', add
label define edscor50_lbl 0426 `"42.6"', add
label define edscor50_lbl 0427 `"42.7"', add
label define edscor50_lbl 0428 `"42.8"', add
label define edscor50_lbl 0429 `"42.9"', add
label define edscor50_lbl 0430 `"43"', add
label define edscor50_lbl 0431 `"43.1"', add
label define edscor50_lbl 0432 `"43.2"', add
label define edscor50_lbl 0433 `"43.3"', add
label define edscor50_lbl 0434 `"43.4"', add
label define edscor50_lbl 0435 `"43.5"', add
label define edscor50_lbl 0436 `"43.6"', add
label define edscor50_lbl 0437 `"43.7"', add
label define edscor50_lbl 0438 `"43.8"', add
label define edscor50_lbl 0439 `"43.9"', add
label define edscor50_lbl 0440 `"44"', add
label define edscor50_lbl 0441 `"44.1"', add
label define edscor50_lbl 0442 `"44.2"', add
label define edscor50_lbl 0443 `"44.3"', add
label define edscor50_lbl 0444 `"44.4"', add
label define edscor50_lbl 0445 `"44.5"', add
label define edscor50_lbl 0446 `"44.6"', add
label define edscor50_lbl 0447 `"44.7"', add
label define edscor50_lbl 0448 `"44.8"', add
label define edscor50_lbl 0449 `"44.9"', add
label define edscor50_lbl 0450 `"45"', add
label define edscor50_lbl 0451 `"45.1"', add
label define edscor50_lbl 0452 `"45.2"', add
label define edscor50_lbl 0453 `"45.3"', add
label define edscor50_lbl 0454 `"45.4"', add
label define edscor50_lbl 0455 `"45.5"', add
label define edscor50_lbl 0456 `"45.6"', add
label define edscor50_lbl 0457 `"45.7"', add
label define edscor50_lbl 0458 `"45.8"', add
label define edscor50_lbl 0459 `"45.9"', add
label define edscor50_lbl 0460 `"46"', add
label define edscor50_lbl 0461 `"46.1"', add
label define edscor50_lbl 0462 `"46.2"', add
label define edscor50_lbl 0463 `"46.3"', add
label define edscor50_lbl 0464 `"46.4"', add
label define edscor50_lbl 0465 `"46.5"', add
label define edscor50_lbl 0466 `"46.6"', add
label define edscor50_lbl 0467 `"46.7"', add
label define edscor50_lbl 0468 `"46.8"', add
label define edscor50_lbl 0469 `"46.9"', add
label define edscor50_lbl 0470 `"47"', add
label define edscor50_lbl 0471 `"47.1"', add
label define edscor50_lbl 0472 `"47.2"', add
label define edscor50_lbl 0473 `"47.3"', add
label define edscor50_lbl 0474 `"47.4"', add
label define edscor50_lbl 0475 `"47.5"', add
label define edscor50_lbl 0476 `"47.6"', add
label define edscor50_lbl 0477 `"47.7"', add
label define edscor50_lbl 0478 `"47.8"', add
label define edscor50_lbl 0479 `"47.9"', add
label define edscor50_lbl 0480 `"48"', add
label define edscor50_lbl 0481 `"48.1"', add
label define edscor50_lbl 0482 `"48.2"', add
label define edscor50_lbl 0483 `"48.3"', add
label define edscor50_lbl 0484 `"48.4"', add
label define edscor50_lbl 0485 `"48.5"', add
label define edscor50_lbl 0486 `"48.6"', add
label define edscor50_lbl 0487 `"48.7"', add
label define edscor50_lbl 0488 `"48.8"', add
label define edscor50_lbl 0489 `"48.9"', add
label define edscor50_lbl 0490 `"49"', add
label define edscor50_lbl 0491 `"49.1"', add
label define edscor50_lbl 0492 `"49.2"', add
label define edscor50_lbl 0493 `"49.3"', add
label define edscor50_lbl 0494 `"49.4"', add
label define edscor50_lbl 0495 `"49.5"', add
label define edscor50_lbl 0496 `"49.6"', add
label define edscor50_lbl 0497 `"49.7"', add
label define edscor50_lbl 0498 `"49.8"', add
label define edscor50_lbl 0499 `"49.9"', add
label define edscor50_lbl 0500 `"50"', add
label define edscor50_lbl 0501 `"50.1"', add
label define edscor50_lbl 0502 `"50.2"', add
label define edscor50_lbl 0503 `"50.3"', add
label define edscor50_lbl 0504 `"50.4"', add
label define edscor50_lbl 0505 `"50.5"', add
label define edscor50_lbl 0506 `"50.6"', add
label define edscor50_lbl 0507 `"50.7"', add
label define edscor50_lbl 0508 `"50.8"', add
label define edscor50_lbl 0509 `"50.9"', add
label define edscor50_lbl 0510 `"51"', add
label define edscor50_lbl 0511 `"51.1"', add
label define edscor50_lbl 0512 `"51.2"', add
label define edscor50_lbl 0513 `"51.3"', add
label define edscor50_lbl 0514 `"51.4"', add
label define edscor50_lbl 0515 `"51.5"', add
label define edscor50_lbl 0516 `"51.6"', add
label define edscor50_lbl 0517 `"51.7"', add
label define edscor50_lbl 0518 `"51.8"', add
label define edscor50_lbl 0519 `"51.9"', add
label define edscor50_lbl 0520 `"52"', add
label define edscor50_lbl 0521 `"52.1"', add
label define edscor50_lbl 0522 `"52.2"', add
label define edscor50_lbl 0523 `"52.3"', add
label define edscor50_lbl 0524 `"52.4"', add
label define edscor50_lbl 0525 `"52.5"', add
label define edscor50_lbl 0526 `"52.6"', add
label define edscor50_lbl 0527 `"52.7"', add
label define edscor50_lbl 0528 `"52.8"', add
label define edscor50_lbl 0529 `"52.9"', add
label define edscor50_lbl 0530 `"53"', add
label define edscor50_lbl 0531 `"53.1"', add
label define edscor50_lbl 0532 `"53.2"', add
label define edscor50_lbl 0533 `"53.3"', add
label define edscor50_lbl 0534 `"53.4"', add
label define edscor50_lbl 0535 `"53.5"', add
label define edscor50_lbl 0536 `"53.6"', add
label define edscor50_lbl 0537 `"53.7"', add
label define edscor50_lbl 0538 `"53.8"', add
label define edscor50_lbl 0539 `"53.9"', add
label define edscor50_lbl 0540 `"54"', add
label define edscor50_lbl 0541 `"54.1"', add
label define edscor50_lbl 0542 `"54.2"', add
label define edscor50_lbl 0543 `"54.3"', add
label define edscor50_lbl 0544 `"54.4"', add
label define edscor50_lbl 0545 `"54.5"', add
label define edscor50_lbl 0546 `"54.6"', add
label define edscor50_lbl 0547 `"54.7"', add
label define edscor50_lbl 0548 `"54.8"', add
label define edscor50_lbl 0549 `"54.9"', add
label define edscor50_lbl 0550 `"55"', add
label define edscor50_lbl 0551 `"55.1"', add
label define edscor50_lbl 0552 `"55.2"', add
label define edscor50_lbl 0553 `"55.3"', add
label define edscor50_lbl 0554 `"55.4"', add
label define edscor50_lbl 0555 `"55.5"', add
label define edscor50_lbl 0556 `"55.6"', add
label define edscor50_lbl 0557 `"55.7"', add
label define edscor50_lbl 0558 `"55.8"', add
label define edscor50_lbl 0559 `"55.9"', add
label define edscor50_lbl 0560 `"56"', add
label define edscor50_lbl 0561 `"56.1"', add
label define edscor50_lbl 0562 `"56.2"', add
label define edscor50_lbl 0563 `"56.3"', add
label define edscor50_lbl 0564 `"56.4"', add
label define edscor50_lbl 0565 `"56.5"', add
label define edscor50_lbl 0566 `"56.6"', add
label define edscor50_lbl 0567 `"56.7"', add
label define edscor50_lbl 0568 `"56.8"', add
label define edscor50_lbl 0569 `"56.9"', add
label define edscor50_lbl 0570 `"57"', add
label define edscor50_lbl 0571 `"57.1"', add
label define edscor50_lbl 0572 `"57.2"', add
label define edscor50_lbl 0573 `"57.3"', add
label define edscor50_lbl 0574 `"57.4"', add
label define edscor50_lbl 0575 `"57.5"', add
label define edscor50_lbl 0576 `"57.6"', add
label define edscor50_lbl 0577 `"57.7"', add
label define edscor50_lbl 0578 `"57.8"', add
label define edscor50_lbl 0579 `"57.9"', add
label define edscor50_lbl 0580 `"58"', add
label define edscor50_lbl 0581 `"58.1"', add
label define edscor50_lbl 0582 `"58.2"', add
label define edscor50_lbl 0583 `"58.3"', add
label define edscor50_lbl 0584 `"58.4"', add
label define edscor50_lbl 0585 `"58.5"', add
label define edscor50_lbl 0586 `"58.6"', add
label define edscor50_lbl 0587 `"58.7"', add
label define edscor50_lbl 0588 `"58.8"', add
label define edscor50_lbl 0589 `"58.9"', add
label define edscor50_lbl 0590 `"59"', add
label define edscor50_lbl 0591 `"59.1"', add
label define edscor50_lbl 0592 `"59.2"', add
label define edscor50_lbl 0593 `"59.3"', add
label define edscor50_lbl 0594 `"59.4"', add
label define edscor50_lbl 0595 `"59.5"', add
label define edscor50_lbl 0596 `"59.6"', add
label define edscor50_lbl 0597 `"59.7"', add
label define edscor50_lbl 0598 `"59.8"', add
label define edscor50_lbl 0599 `"59.9"', add
label define edscor50_lbl 0600 `"60"', add
label define edscor50_lbl 0601 `"60.1"', add
label define edscor50_lbl 0602 `"60.2"', add
label define edscor50_lbl 0603 `"60.3"', add
label define edscor50_lbl 0604 `"60.4"', add
label define edscor50_lbl 0605 `"60.5"', add
label define edscor50_lbl 0606 `"60.6"', add
label define edscor50_lbl 0607 `"60.7"', add
label define edscor50_lbl 0608 `"60.8"', add
label define edscor50_lbl 0609 `"60.9"', add
label define edscor50_lbl 0610 `"61"', add
label define edscor50_lbl 0611 `"61.1"', add
label define edscor50_lbl 0612 `"61.2"', add
label define edscor50_lbl 0613 `"61.3"', add
label define edscor50_lbl 0614 `"61.4"', add
label define edscor50_lbl 0615 `"61.5"', add
label define edscor50_lbl 0616 `"61.6"', add
label define edscor50_lbl 0617 `"61.7"', add
label define edscor50_lbl 0618 `"61.8"', add
label define edscor50_lbl 0619 `"61.9"', add
label define edscor50_lbl 0620 `"62"', add
label define edscor50_lbl 0621 `"62.1"', add
label define edscor50_lbl 0622 `"62.2"', add
label define edscor50_lbl 0623 `"62.3"', add
label define edscor50_lbl 0624 `"62.4"', add
label define edscor50_lbl 0625 `"62.5"', add
label define edscor50_lbl 0626 `"62.6"', add
label define edscor50_lbl 0627 `"62.7"', add
label define edscor50_lbl 0628 `"62.8"', add
label define edscor50_lbl 0629 `"62.9"', add
label define edscor50_lbl 0630 `"63"', add
label define edscor50_lbl 0631 `"63.1"', add
label define edscor50_lbl 0632 `"63.2"', add
label define edscor50_lbl 0633 `"63.3"', add
label define edscor50_lbl 0634 `"63.4"', add
label define edscor50_lbl 0635 `"63.5"', add
label define edscor50_lbl 0636 `"63.6"', add
label define edscor50_lbl 0637 `"63.7"', add
label define edscor50_lbl 0638 `"63.8"', add
label define edscor50_lbl 0639 `"63.9"', add
label define edscor50_lbl 0640 `"64"', add
label define edscor50_lbl 0641 `"64.1"', add
label define edscor50_lbl 0642 `"64.2"', add
label define edscor50_lbl 0643 `"64.3"', add
label define edscor50_lbl 0644 `"64.4"', add
label define edscor50_lbl 0645 `"64.5"', add
label define edscor50_lbl 0646 `"64.6"', add
label define edscor50_lbl 0647 `"64.7"', add
label define edscor50_lbl 0648 `"64.8"', add
label define edscor50_lbl 0649 `"64.9"', add
label define edscor50_lbl 0650 `"65"', add
label define edscor50_lbl 0651 `"65.1"', add
label define edscor50_lbl 0652 `"65.2"', add
label define edscor50_lbl 0653 `"65.3"', add
label define edscor50_lbl 0654 `"65.4"', add
label define edscor50_lbl 0655 `"65.5"', add
label define edscor50_lbl 0656 `"65.6"', add
label define edscor50_lbl 0657 `"65.7"', add
label define edscor50_lbl 0658 `"65.8"', add
label define edscor50_lbl 0659 `"65.9"', add
label define edscor50_lbl 0660 `"66"', add
label define edscor50_lbl 0661 `"66.1"', add
label define edscor50_lbl 0662 `"66.2"', add
label define edscor50_lbl 0663 `"66.3"', add
label define edscor50_lbl 0664 `"66.4"', add
label define edscor50_lbl 0665 `"66.5"', add
label define edscor50_lbl 0666 `"66.6"', add
label define edscor50_lbl 0667 `"66.7"', add
label define edscor50_lbl 0668 `"66.8"', add
label define edscor50_lbl 0669 `"66.9"', add
label define edscor50_lbl 0670 `"67"', add
label define edscor50_lbl 0671 `"67.1"', add
label define edscor50_lbl 0672 `"67.2"', add
label define edscor50_lbl 0673 `"67.3"', add
label define edscor50_lbl 0674 `"67.4"', add
label define edscor50_lbl 0675 `"67.5"', add
label define edscor50_lbl 0676 `"67.6"', add
label define edscor50_lbl 0677 `"67.7"', add
label define edscor50_lbl 0678 `"67.8"', add
label define edscor50_lbl 0679 `"67.9"', add
label define edscor50_lbl 0680 `"68"', add
label define edscor50_lbl 0681 `"68.1"', add
label define edscor50_lbl 0682 `"68.2"', add
label define edscor50_lbl 0683 `"68.3"', add
label define edscor50_lbl 0684 `"68.4"', add
label define edscor50_lbl 0685 `"68.5"', add
label define edscor50_lbl 0686 `"68.6"', add
label define edscor50_lbl 0687 `"68.7"', add
label define edscor50_lbl 0688 `"68.8"', add
label define edscor50_lbl 0689 `"68.9"', add
label define edscor50_lbl 0690 `"69"', add
label define edscor50_lbl 0691 `"69.1"', add
label define edscor50_lbl 0692 `"69.2"', add
label define edscor50_lbl 0693 `"69.3"', add
label define edscor50_lbl 0694 `"69.4"', add
label define edscor50_lbl 0695 `"69.5"', add
label define edscor50_lbl 0696 `"69.6"', add
label define edscor50_lbl 0697 `"69.7"', add
label define edscor50_lbl 0698 `"69.8"', add
label define edscor50_lbl 0699 `"69.9"', add
label define edscor50_lbl 0700 `"70"', add
label define edscor50_lbl 0701 `"70.1"', add
label define edscor50_lbl 0702 `"70.2"', add
label define edscor50_lbl 0703 `"70.3"', add
label define edscor50_lbl 0704 `"70.4"', add
label define edscor50_lbl 0705 `"70.5"', add
label define edscor50_lbl 0706 `"70.6"', add
label define edscor50_lbl 0707 `"70.7"', add
label define edscor50_lbl 0708 `"70.8"', add
label define edscor50_lbl 0709 `"70.9"', add
label define edscor50_lbl 0710 `"71"', add
label define edscor50_lbl 0711 `"71.1"', add
label define edscor50_lbl 0712 `"71.2"', add
label define edscor50_lbl 0713 `"71.3"', add
label define edscor50_lbl 0714 `"71.4"', add
label define edscor50_lbl 0715 `"71.5"', add
label define edscor50_lbl 0716 `"71.6"', add
label define edscor50_lbl 0717 `"71.7"', add
label define edscor50_lbl 0718 `"71.8"', add
label define edscor50_lbl 0719 `"71.9"', add
label define edscor50_lbl 0720 `"72"', add
label define edscor50_lbl 0721 `"72.1"', add
label define edscor50_lbl 0722 `"72.2"', add
label define edscor50_lbl 0723 `"72.3"', add
label define edscor50_lbl 0724 `"72.4"', add
label define edscor50_lbl 0725 `"72.5"', add
label define edscor50_lbl 0726 `"72.6"', add
label define edscor50_lbl 0727 `"72.7"', add
label define edscor50_lbl 0728 `"72.8"', add
label define edscor50_lbl 0729 `"72.9"', add
label define edscor50_lbl 0730 `"73"', add
label define edscor50_lbl 0731 `"73.1"', add
label define edscor50_lbl 0732 `"73.2"', add
label define edscor50_lbl 0733 `"73.3"', add
label define edscor50_lbl 0734 `"73.4"', add
label define edscor50_lbl 0735 `"73.5"', add
label define edscor50_lbl 0736 `"73.6"', add
label define edscor50_lbl 0737 `"73.7"', add
label define edscor50_lbl 0738 `"73.8"', add
label define edscor50_lbl 0739 `"73.9"', add
label define edscor50_lbl 0740 `"74"', add
label define edscor50_lbl 0741 `"74.1"', add
label define edscor50_lbl 0742 `"74.2"', add
label define edscor50_lbl 0743 `"74.3"', add
label define edscor50_lbl 0744 `"74.4"', add
label define edscor50_lbl 0745 `"74.5"', add
label define edscor50_lbl 0746 `"74.6"', add
label define edscor50_lbl 0747 `"74.7"', add
label define edscor50_lbl 0748 `"74.8"', add
label define edscor50_lbl 0749 `"74.9"', add
label define edscor50_lbl 0750 `"75"', add
label define edscor50_lbl 0751 `"75.1"', add
label define edscor50_lbl 0752 `"75.2"', add
label define edscor50_lbl 0753 `"75.3"', add
label define edscor50_lbl 0754 `"75.4"', add
label define edscor50_lbl 0755 `"75.5"', add
label define edscor50_lbl 0756 `"75.6"', add
label define edscor50_lbl 0757 `"75.7"', add
label define edscor50_lbl 0758 `"75.8"', add
label define edscor50_lbl 0759 `"75.9"', add
label define edscor50_lbl 0760 `"76"', add
label define edscor50_lbl 0761 `"76.1"', add
label define edscor50_lbl 0762 `"76.2"', add
label define edscor50_lbl 0763 `"76.3"', add
label define edscor50_lbl 0764 `"76.4"', add
label define edscor50_lbl 0765 `"76.5"', add
label define edscor50_lbl 0766 `"76.6"', add
label define edscor50_lbl 0767 `"76.7"', add
label define edscor50_lbl 0768 `"76.8"', add
label define edscor50_lbl 0769 `"76.9"', add
label define edscor50_lbl 0770 `"77"', add
label define edscor50_lbl 0771 `"77.1"', add
label define edscor50_lbl 0772 `"77.2"', add
label define edscor50_lbl 0773 `"77.3"', add
label define edscor50_lbl 0774 `"77.4"', add
label define edscor50_lbl 0775 `"77.5"', add
label define edscor50_lbl 0776 `"77.6"', add
label define edscor50_lbl 0777 `"77.7"', add
label define edscor50_lbl 0778 `"77.8"', add
label define edscor50_lbl 0779 `"77.9"', add
label define edscor50_lbl 0780 `"78"', add
label define edscor50_lbl 0781 `"78.1"', add
label define edscor50_lbl 0782 `"78.2"', add
label define edscor50_lbl 0783 `"78.3"', add
label define edscor50_lbl 0784 `"78.4"', add
label define edscor50_lbl 0785 `"78.5"', add
label define edscor50_lbl 0786 `"78.6"', add
label define edscor50_lbl 0787 `"78.7"', add
label define edscor50_lbl 0788 `"78.8"', add
label define edscor50_lbl 0789 `"78.9"', add
label define edscor50_lbl 0790 `"79"', add
label define edscor50_lbl 0791 `"79.1"', add
label define edscor50_lbl 0792 `"79.2"', add
label define edscor50_lbl 0793 `"79.3"', add
label define edscor50_lbl 0794 `"79.4"', add
label define edscor50_lbl 0795 `"79.5"', add
label define edscor50_lbl 0796 `"79.6"', add
label define edscor50_lbl 0797 `"79.7"', add
label define edscor50_lbl 0798 `"79.8"', add
label define edscor50_lbl 0799 `"79.9"', add
label define edscor50_lbl 0800 `"80"', add
label define edscor50_lbl 0801 `"80.1"', add
label define edscor50_lbl 0802 `"80.2"', add
label define edscor50_lbl 0803 `"80.3"', add
label define edscor50_lbl 0804 `"80.4"', add
label define edscor50_lbl 0805 `"80.5"', add
label define edscor50_lbl 0806 `"80.6"', add
label define edscor50_lbl 0807 `"80.7"', add
label define edscor50_lbl 0808 `"80.8"', add
label define edscor50_lbl 0809 `"80.9"', add
label define edscor50_lbl 0810 `"81"', add
label define edscor50_lbl 0811 `"81.1"', add
label define edscor50_lbl 0812 `"81.2"', add
label define edscor50_lbl 0813 `"81.3"', add
label define edscor50_lbl 0814 `"81.4"', add
label define edscor50_lbl 0815 `"81.5"', add
label define edscor50_lbl 0816 `"81.6"', add
label define edscor50_lbl 0817 `"81.7"', add
label define edscor50_lbl 0818 `"81.8"', add
label define edscor50_lbl 0819 `"81.9"', add
label define edscor50_lbl 0820 `"82"', add
label define edscor50_lbl 0821 `"82.1"', add
label define edscor50_lbl 0822 `"82.2"', add
label define edscor50_lbl 0823 `"82.3"', add
label define edscor50_lbl 0824 `"82.4"', add
label define edscor50_lbl 0825 `"82.5"', add
label define edscor50_lbl 0826 `"82.6"', add
label define edscor50_lbl 0827 `"82.7"', add
label define edscor50_lbl 0828 `"82.8"', add
label define edscor50_lbl 0829 `"82.9"', add
label define edscor50_lbl 0830 `"83"', add
label define edscor50_lbl 0831 `"83.1"', add
label define edscor50_lbl 0832 `"83.2"', add
label define edscor50_lbl 0833 `"83.3"', add
label define edscor50_lbl 0834 `"83.4"', add
label define edscor50_lbl 0835 `"83.5"', add
label define edscor50_lbl 0836 `"83.6"', add
label define edscor50_lbl 0837 `"83.7"', add
label define edscor50_lbl 0838 `"83.8"', add
label define edscor50_lbl 0839 `"83.9"', add
label define edscor50_lbl 0840 `"84"', add
label define edscor50_lbl 0841 `"84.1"', add
label define edscor50_lbl 0842 `"84.2"', add
label define edscor50_lbl 0843 `"84.3"', add
label define edscor50_lbl 0844 `"84.4"', add
label define edscor50_lbl 0845 `"84.5"', add
label define edscor50_lbl 0846 `"84.6"', add
label define edscor50_lbl 0847 `"84.7"', add
label define edscor50_lbl 0848 `"84.8"', add
label define edscor50_lbl 0849 `"84.9"', add
label define edscor50_lbl 0850 `"85"', add
label define edscor50_lbl 0851 `"85.1"', add
label define edscor50_lbl 0852 `"85.2"', add
label define edscor50_lbl 0853 `"85.3"', add
label define edscor50_lbl 0854 `"85.4"', add
label define edscor50_lbl 0855 `"85.5"', add
label define edscor50_lbl 0856 `"85.6"', add
label define edscor50_lbl 0857 `"85.7"', add
label define edscor50_lbl 0858 `"85.8"', add
label define edscor50_lbl 0859 `"85.9"', add
label define edscor50_lbl 0860 `"86"', add
label define edscor50_lbl 0861 `"86.1"', add
label define edscor50_lbl 0862 `"86.2"', add
label define edscor50_lbl 0863 `"86.3"', add
label define edscor50_lbl 0864 `"86.4"', add
label define edscor50_lbl 0865 `"86.5"', add
label define edscor50_lbl 0866 `"86.6"', add
label define edscor50_lbl 0867 `"86.7"', add
label define edscor50_lbl 0868 `"86.8"', add
label define edscor50_lbl 0869 `"86.9"', add
label define edscor50_lbl 0870 `"87"', add
label define edscor50_lbl 0871 `"87.1"', add
label define edscor50_lbl 0872 `"87.2"', add
label define edscor50_lbl 0873 `"87.3"', add
label define edscor50_lbl 0874 `"87.4"', add
label define edscor50_lbl 0875 `"87.5"', add
label define edscor50_lbl 0876 `"87.6"', add
label define edscor50_lbl 0877 `"87.7"', add
label define edscor50_lbl 0878 `"87.8"', add
label define edscor50_lbl 0879 `"87.9"', add
label define edscor50_lbl 0880 `"88"', add
label define edscor50_lbl 0881 `"88.1"', add
label define edscor50_lbl 0882 `"88.2"', add
label define edscor50_lbl 0883 `"88.3"', add
label define edscor50_lbl 0884 `"88.4"', add
label define edscor50_lbl 0885 `"88.5"', add
label define edscor50_lbl 0886 `"88.6"', add
label define edscor50_lbl 0887 `"88.7"', add
label define edscor50_lbl 0888 `"88.8"', add
label define edscor50_lbl 0889 `"88.9"', add
label define edscor50_lbl 0890 `"89"', add
label define edscor50_lbl 0891 `"89.1"', add
label define edscor50_lbl 0892 `"89.2"', add
label define edscor50_lbl 0893 `"89.3"', add
label define edscor50_lbl 0894 `"89.4"', add
label define edscor50_lbl 0895 `"89.5"', add
label define edscor50_lbl 0896 `"89.6"', add
label define edscor50_lbl 0897 `"89.7"', add
label define edscor50_lbl 0898 `"89.8"', add
label define edscor50_lbl 0899 `"89.9"', add
label define edscor50_lbl 0900 `"90"', add
label define edscor50_lbl 0901 `"90.1"', add
label define edscor50_lbl 0902 `"90.2"', add
label define edscor50_lbl 0903 `"90.3"', add
label define edscor50_lbl 0904 `"90.4"', add
label define edscor50_lbl 0905 `"90.5"', add
label define edscor50_lbl 0906 `"90.6"', add
label define edscor50_lbl 0907 `"90.7"', add
label define edscor50_lbl 0908 `"90.8"', add
label define edscor50_lbl 0909 `"90.9"', add
label define edscor50_lbl 0910 `"91"', add
label define edscor50_lbl 0911 `"91.1"', add
label define edscor50_lbl 0912 `"91.2"', add
label define edscor50_lbl 0913 `"91.3"', add
label define edscor50_lbl 0914 `"91.4"', add
label define edscor50_lbl 0915 `"91.5"', add
label define edscor50_lbl 0916 `"91.6"', add
label define edscor50_lbl 0917 `"91.7"', add
label define edscor50_lbl 0918 `"91.8"', add
label define edscor50_lbl 0919 `"91.9"', add
label define edscor50_lbl 0920 `"92"', add
label define edscor50_lbl 0921 `"92.1"', add
label define edscor50_lbl 0922 `"92.2"', add
label define edscor50_lbl 0923 `"92.3"', add
label define edscor50_lbl 0924 `"92.4"', add
label define edscor50_lbl 0925 `"92.5"', add
label define edscor50_lbl 0926 `"92.6"', add
label define edscor50_lbl 0927 `"92.7"', add
label define edscor50_lbl 0928 `"92.8"', add
label define edscor50_lbl 0929 `"92.9"', add
label define edscor50_lbl 0930 `"93"', add
label define edscor50_lbl 0931 `"93.1"', add
label define edscor50_lbl 0932 `"93.2"', add
label define edscor50_lbl 0933 `"93.3"', add
label define edscor50_lbl 0934 `"93.4"', add
label define edscor50_lbl 0935 `"93.5"', add
label define edscor50_lbl 0936 `"93.6"', add
label define edscor50_lbl 0937 `"93.7"', add
label define edscor50_lbl 0938 `"93.8"', add
label define edscor50_lbl 0939 `"93.9"', add
label define edscor50_lbl 0940 `"94"', add
label define edscor50_lbl 0941 `"94.1"', add
label define edscor50_lbl 0942 `"94.2"', add
label define edscor50_lbl 0943 `"94.3"', add
label define edscor50_lbl 0944 `"94.4"', add
label define edscor50_lbl 0945 `"94.5"', add
label define edscor50_lbl 0946 `"94.6"', add
label define edscor50_lbl 0947 `"94.7"', add
label define edscor50_lbl 0948 `"94.8"', add
label define edscor50_lbl 0949 `"94.9"', add
label define edscor50_lbl 0950 `"95"', add
label define edscor50_lbl 0951 `"95.1"', add
label define edscor50_lbl 0952 `"95.2"', add
label define edscor50_lbl 0953 `"95.3"', add
label define edscor50_lbl 0954 `"95.4"', add
label define edscor50_lbl 0955 `"95.5"', add
label define edscor50_lbl 0956 `"95.6"', add
label define edscor50_lbl 0957 `"95.7"', add
label define edscor50_lbl 0958 `"95.8"', add
label define edscor50_lbl 0959 `"95.9"', add
label define edscor50_lbl 0960 `"96"', add
label define edscor50_lbl 0961 `"96.1"', add
label define edscor50_lbl 0962 `"96.2"', add
label define edscor50_lbl 0963 `"96.3"', add
label define edscor50_lbl 0964 `"96.4"', add
label define edscor50_lbl 0965 `"96.5"', add
label define edscor50_lbl 0966 `"96.6"', add
label define edscor50_lbl 0967 `"96.7"', add
label define edscor50_lbl 0968 `"96.8"', add
label define edscor50_lbl 0969 `"96.9"', add
label define edscor50_lbl 0970 `"97"', add
label define edscor50_lbl 0971 `"97.1"', add
label define edscor50_lbl 0972 `"97.2"', add
label define edscor50_lbl 0973 `"97.3"', add
label define edscor50_lbl 0974 `"97.4"', add
label define edscor50_lbl 0975 `"97.5"', add
label define edscor50_lbl 0976 `"97.6"', add
label define edscor50_lbl 0977 `"97.7"', add
label define edscor50_lbl 0978 `"97.8"', add
label define edscor50_lbl 0979 `"97.9"', add
label define edscor50_lbl 0980 `"98"', add
label define edscor50_lbl 0981 `"98.1"', add
label define edscor50_lbl 0982 `"98.2"', add
label define edscor50_lbl 0983 `"98.3"', add
label define edscor50_lbl 0984 `"98.4"', add
label define edscor50_lbl 0985 `"98.5"', add
label define edscor50_lbl 0986 `"98.6"', add
label define edscor50_lbl 0987 `"98.7"', add
label define edscor50_lbl 0988 `"98.8"', add
label define edscor50_lbl 0989 `"98.9"', add
label define edscor50_lbl 0990 `"99"', add
label define edscor50_lbl 0991 `"99.1"', add
label define edscor50_lbl 0992 `"99.2"', add
label define edscor50_lbl 0993 `"99.3"', add
label define edscor50_lbl 0994 `"99.4"', add
label define edscor50_lbl 0995 `"99.5"', add
label define edscor50_lbl 0996 `"99.6"', add
label define edscor50_lbl 0997 `"99.7"', add
label define edscor50_lbl 0998 `"99.8"', add
label define edscor50_lbl 0999 `"99.9"', add
label define edscor50_lbl 1000 `"100"', add
label define edscor50_lbl 9999 `"N/A"', add
label values edscor50 edscor50_lbl

label define edscor90_lbl 0000 `"0"'
label define edscor90_lbl 0001 `"0.1"', add
label define edscor90_lbl 0002 `"0.2"', add
label define edscor90_lbl 0003 `"0.3"', add
label define edscor90_lbl 0004 `"0.4"', add
label define edscor90_lbl 0005 `"0.5"', add
label define edscor90_lbl 0006 `"0.6"', add
label define edscor90_lbl 0007 `"0.7"', add
label define edscor90_lbl 0008 `"0.8"', add
label define edscor90_lbl 0009 `"0.9"', add
label define edscor90_lbl 0010 `"1"', add
label define edscor90_lbl 0011 `"1.1"', add
label define edscor90_lbl 0012 `"1.2"', add
label define edscor90_lbl 0013 `"1.3"', add
label define edscor90_lbl 0014 `"1.4"', add
label define edscor90_lbl 0015 `"1.5"', add
label define edscor90_lbl 0016 `"1.6"', add
label define edscor90_lbl 0017 `"1.7"', add
label define edscor90_lbl 0018 `"1.8"', add
label define edscor90_lbl 0019 `"1.9"', add
label define edscor90_lbl 0020 `"2"', add
label define edscor90_lbl 0021 `"2.1"', add
label define edscor90_lbl 0022 `"2.2"', add
label define edscor90_lbl 0023 `"2.3"', add
label define edscor90_lbl 0024 `"2.4"', add
label define edscor90_lbl 0025 `"2.5"', add
label define edscor90_lbl 0026 `"2.6"', add
label define edscor90_lbl 0027 `"2.7"', add
label define edscor90_lbl 0028 `"2.8"', add
label define edscor90_lbl 0029 `"2.9"', add
label define edscor90_lbl 0030 `"3"', add
label define edscor90_lbl 0031 `"3.1"', add
label define edscor90_lbl 0032 `"3.2"', add
label define edscor90_lbl 0033 `"3.3"', add
label define edscor90_lbl 0034 `"3.4"', add
label define edscor90_lbl 0035 `"3.5"', add
label define edscor90_lbl 0036 `"3.6"', add
label define edscor90_lbl 0037 `"3.7"', add
label define edscor90_lbl 0038 `"3.8"', add
label define edscor90_lbl 0039 `"3.9"', add
label define edscor90_lbl 0040 `"4"', add
label define edscor90_lbl 0041 `"4.1"', add
label define edscor90_lbl 0042 `"4.2"', add
label define edscor90_lbl 0043 `"4.3"', add
label define edscor90_lbl 0044 `"4.4"', add
label define edscor90_lbl 0045 `"4.5"', add
label define edscor90_lbl 0046 `"4.6"', add
label define edscor90_lbl 0047 `"4.7"', add
label define edscor90_lbl 0048 `"4.8"', add
label define edscor90_lbl 0049 `"4.9"', add
label define edscor90_lbl 0050 `"5"', add
label define edscor90_lbl 0051 `"5.1"', add
label define edscor90_lbl 0052 `"5.2"', add
label define edscor90_lbl 0053 `"5.3"', add
label define edscor90_lbl 0054 `"5.4"', add
label define edscor90_lbl 0055 `"5.5"', add
label define edscor90_lbl 0056 `"5.6"', add
label define edscor90_lbl 0057 `"5.7"', add
label define edscor90_lbl 0058 `"5.8"', add
label define edscor90_lbl 0059 `"5.9"', add
label define edscor90_lbl 0060 `"6"', add
label define edscor90_lbl 0061 `"6.1"', add
label define edscor90_lbl 0062 `"6.2"', add
label define edscor90_lbl 0063 `"6.3"', add
label define edscor90_lbl 0064 `"6.4"', add
label define edscor90_lbl 0065 `"6.5"', add
label define edscor90_lbl 0066 `"6.6"', add
label define edscor90_lbl 0067 `"6.7"', add
label define edscor90_lbl 0068 `"6.8"', add
label define edscor90_lbl 0069 `"6.9"', add
label define edscor90_lbl 0070 `"7"', add
label define edscor90_lbl 0071 `"7.1"', add
label define edscor90_lbl 0072 `"7.2"', add
label define edscor90_lbl 0073 `"7.3"', add
label define edscor90_lbl 0074 `"7.4"', add
label define edscor90_lbl 0075 `"7.5"', add
label define edscor90_lbl 0076 `"7.6"', add
label define edscor90_lbl 0077 `"7.7"', add
label define edscor90_lbl 0078 `"7.8"', add
label define edscor90_lbl 0079 `"7.9"', add
label define edscor90_lbl 0080 `"8"', add
label define edscor90_lbl 0081 `"8.1"', add
label define edscor90_lbl 0082 `"8.2"', add
label define edscor90_lbl 0083 `"8.3"', add
label define edscor90_lbl 0084 `"8.4"', add
label define edscor90_lbl 0085 `"8.5"', add
label define edscor90_lbl 0086 `"8.6"', add
label define edscor90_lbl 0087 `"8.7"', add
label define edscor90_lbl 0088 `"8.8"', add
label define edscor90_lbl 0089 `"8.9"', add
label define edscor90_lbl 0090 `"9"', add
label define edscor90_lbl 0091 `"9.1"', add
label define edscor90_lbl 0092 `"9.2"', add
label define edscor90_lbl 0093 `"9.3"', add
label define edscor90_lbl 0094 `"9.4"', add
label define edscor90_lbl 0095 `"9.5"', add
label define edscor90_lbl 0096 `"9.6"', add
label define edscor90_lbl 0097 `"9.7"', add
label define edscor90_lbl 0098 `"9.8"', add
label define edscor90_lbl 0099 `"9.9"', add
label define edscor90_lbl 0100 `"10"', add
label define edscor90_lbl 0101 `"10.1"', add
label define edscor90_lbl 0102 `"10.2"', add
label define edscor90_lbl 0103 `"10.3"', add
label define edscor90_lbl 0104 `"10.4"', add
label define edscor90_lbl 0105 `"10.5"', add
label define edscor90_lbl 0106 `"10.6"', add
label define edscor90_lbl 0107 `"10.7"', add
label define edscor90_lbl 0108 `"10.8"', add
label define edscor90_lbl 0109 `"10.9"', add
label define edscor90_lbl 0110 `"11"', add
label define edscor90_lbl 0111 `"11.1"', add
label define edscor90_lbl 0112 `"11.2"', add
label define edscor90_lbl 0113 `"11.3"', add
label define edscor90_lbl 0114 `"11.4"', add
label define edscor90_lbl 0115 `"11.5"', add
label define edscor90_lbl 0116 `"11.6"', add
label define edscor90_lbl 0117 `"11.7"', add
label define edscor90_lbl 0118 `"11.8"', add
label define edscor90_lbl 0119 `"11.9"', add
label define edscor90_lbl 0120 `"12"', add
label define edscor90_lbl 0121 `"12.1"', add
label define edscor90_lbl 0122 `"12.2"', add
label define edscor90_lbl 0123 `"12.3"', add
label define edscor90_lbl 0124 `"12.4"', add
label define edscor90_lbl 0125 `"12.5"', add
label define edscor90_lbl 0126 `"12.6"', add
label define edscor90_lbl 0127 `"12.7"', add
label define edscor90_lbl 0128 `"12.8"', add
label define edscor90_lbl 0129 `"12.9"', add
label define edscor90_lbl 0130 `"13"', add
label define edscor90_lbl 0131 `"13.1"', add
label define edscor90_lbl 0132 `"13.2"', add
label define edscor90_lbl 0133 `"13.3"', add
label define edscor90_lbl 0134 `"13.4"', add
label define edscor90_lbl 0135 `"13.5"', add
label define edscor90_lbl 0136 `"13.6"', add
label define edscor90_lbl 0137 `"13.7"', add
label define edscor90_lbl 0138 `"13.8"', add
label define edscor90_lbl 0139 `"13.9"', add
label define edscor90_lbl 0140 `"14"', add
label define edscor90_lbl 0141 `"14.1"', add
label define edscor90_lbl 0142 `"14.2"', add
label define edscor90_lbl 0143 `"14.3"', add
label define edscor90_lbl 0144 `"14.4"', add
label define edscor90_lbl 0145 `"14.5"', add
label define edscor90_lbl 0146 `"14.6"', add
label define edscor90_lbl 0147 `"14.7"', add
label define edscor90_lbl 0148 `"14.8"', add
label define edscor90_lbl 0149 `"14.9"', add
label define edscor90_lbl 0150 `"15"', add
label define edscor90_lbl 0151 `"15.1"', add
label define edscor90_lbl 0152 `"15.2"', add
label define edscor90_lbl 0153 `"15.3"', add
label define edscor90_lbl 0154 `"15.4"', add
label define edscor90_lbl 0155 `"15.5"', add
label define edscor90_lbl 0156 `"15.6"', add
label define edscor90_lbl 0157 `"15.7"', add
label define edscor90_lbl 0158 `"15.8"', add
label define edscor90_lbl 0159 `"15.9"', add
label define edscor90_lbl 0160 `"16"', add
label define edscor90_lbl 0161 `"16.1"', add
label define edscor90_lbl 0162 `"16.2"', add
label define edscor90_lbl 0163 `"16.3"', add
label define edscor90_lbl 0164 `"16.4"', add
label define edscor90_lbl 0165 `"16.5"', add
label define edscor90_lbl 0166 `"16.6"', add
label define edscor90_lbl 0167 `"16.7"', add
label define edscor90_lbl 0168 `"16.8"', add
label define edscor90_lbl 0169 `"16.9"', add
label define edscor90_lbl 0170 `"17"', add
label define edscor90_lbl 0171 `"17.1"', add
label define edscor90_lbl 0172 `"17.2"', add
label define edscor90_lbl 0173 `"17.3"', add
label define edscor90_lbl 0174 `"17.4"', add
label define edscor90_lbl 0175 `"17.5"', add
label define edscor90_lbl 0176 `"17.6"', add
label define edscor90_lbl 0177 `"17.7"', add
label define edscor90_lbl 0178 `"17.8"', add
label define edscor90_lbl 0179 `"17.9"', add
label define edscor90_lbl 0180 `"18"', add
label define edscor90_lbl 0181 `"18.1"', add
label define edscor90_lbl 0182 `"18.2"', add
label define edscor90_lbl 0183 `"18.3"', add
label define edscor90_lbl 0184 `"18.4"', add
label define edscor90_lbl 0185 `"18.5"', add
label define edscor90_lbl 0186 `"18.6"', add
label define edscor90_lbl 0187 `"18.7"', add
label define edscor90_lbl 0188 `"18.8"', add
label define edscor90_lbl 0189 `"18.9"', add
label define edscor90_lbl 0190 `"19"', add
label define edscor90_lbl 0191 `"19.1"', add
label define edscor90_lbl 0192 `"19.2"', add
label define edscor90_lbl 0193 `"19.3"', add
label define edscor90_lbl 0194 `"19.4"', add
label define edscor90_lbl 0195 `"19.5"', add
label define edscor90_lbl 0196 `"19.6"', add
label define edscor90_lbl 0197 `"19.7"', add
label define edscor90_lbl 0198 `"19.8"', add
label define edscor90_lbl 0199 `"19.9"', add
label define edscor90_lbl 0200 `"20"', add
label define edscor90_lbl 0201 `"20.1"', add
label define edscor90_lbl 0202 `"20.2"', add
label define edscor90_lbl 0203 `"20.3"', add
label define edscor90_lbl 0204 `"20.4"', add
label define edscor90_lbl 0205 `"20.5"', add
label define edscor90_lbl 0206 `"20.6"', add
label define edscor90_lbl 0207 `"20.7"', add
label define edscor90_lbl 0208 `"20.8"', add
label define edscor90_lbl 0209 `"20.9"', add
label define edscor90_lbl 0210 `"21"', add
label define edscor90_lbl 0211 `"21.1"', add
label define edscor90_lbl 0212 `"21.2"', add
label define edscor90_lbl 0213 `"21.3"', add
label define edscor90_lbl 0214 `"21.4"', add
label define edscor90_lbl 0215 `"21.5"', add
label define edscor90_lbl 0216 `"21.6"', add
label define edscor90_lbl 0217 `"21.7"', add
label define edscor90_lbl 0218 `"21.8"', add
label define edscor90_lbl 0219 `"21.9"', add
label define edscor90_lbl 0220 `"22"', add
label define edscor90_lbl 0221 `"22.1"', add
label define edscor90_lbl 0222 `"22.2"', add
label define edscor90_lbl 0223 `"22.3"', add
label define edscor90_lbl 0224 `"22.4"', add
label define edscor90_lbl 0225 `"22.5"', add
label define edscor90_lbl 0226 `"22.6"', add
label define edscor90_lbl 0227 `"22.7"', add
label define edscor90_lbl 0228 `"22.8"', add
label define edscor90_lbl 0229 `"22.9"', add
label define edscor90_lbl 0230 `"23"', add
label define edscor90_lbl 0231 `"23.1"', add
label define edscor90_lbl 0232 `"23.2"', add
label define edscor90_lbl 0233 `"23.3"', add
label define edscor90_lbl 0234 `"23.4"', add
label define edscor90_lbl 0235 `"23.5"', add
label define edscor90_lbl 0236 `"23.6"', add
label define edscor90_lbl 0237 `"23.7"', add
label define edscor90_lbl 0238 `"23.8"', add
label define edscor90_lbl 0239 `"23.9"', add
label define edscor90_lbl 0240 `"24"', add
label define edscor90_lbl 0241 `"24.1"', add
label define edscor90_lbl 0242 `"24.2"', add
label define edscor90_lbl 0243 `"24.3"', add
label define edscor90_lbl 0244 `"24.4"', add
label define edscor90_lbl 0245 `"24.5"', add
label define edscor90_lbl 0246 `"24.6"', add
label define edscor90_lbl 0247 `"24.7"', add
label define edscor90_lbl 0248 `"24.8"', add
label define edscor90_lbl 0249 `"24.9"', add
label define edscor90_lbl 0250 `"25"', add
label define edscor90_lbl 0251 `"25.1"', add
label define edscor90_lbl 0252 `"25.2"', add
label define edscor90_lbl 0253 `"25.3"', add
label define edscor90_lbl 0254 `"25.4"', add
label define edscor90_lbl 0255 `"25.5"', add
label define edscor90_lbl 0256 `"25.6"', add
label define edscor90_lbl 0257 `"25.7"', add
label define edscor90_lbl 0258 `"25.8"', add
label define edscor90_lbl 0259 `"25.9"', add
label define edscor90_lbl 0260 `"26"', add
label define edscor90_lbl 0261 `"26.1"', add
label define edscor90_lbl 0262 `"26.2"', add
label define edscor90_lbl 0263 `"26.3"', add
label define edscor90_lbl 0264 `"26.4"', add
label define edscor90_lbl 0265 `"26.5"', add
label define edscor90_lbl 0266 `"26.6"', add
label define edscor90_lbl 0267 `"26.7"', add
label define edscor90_lbl 0268 `"26.8"', add
label define edscor90_lbl 0269 `"26.9"', add
label define edscor90_lbl 0270 `"27"', add
label define edscor90_lbl 0271 `"27.1"', add
label define edscor90_lbl 0272 `"27.2"', add
label define edscor90_lbl 0273 `"27.3"', add
label define edscor90_lbl 0274 `"27.4"', add
label define edscor90_lbl 0275 `"27.5"', add
label define edscor90_lbl 0276 `"27.6"', add
label define edscor90_lbl 0277 `"27.7"', add
label define edscor90_lbl 0278 `"27.8"', add
label define edscor90_lbl 0279 `"27.9"', add
label define edscor90_lbl 0280 `"28"', add
label define edscor90_lbl 0281 `"28.1"', add
label define edscor90_lbl 0282 `"28.2"', add
label define edscor90_lbl 0283 `"28.3"', add
label define edscor90_lbl 0284 `"28.4"', add
label define edscor90_lbl 0285 `"28.5"', add
label define edscor90_lbl 0286 `"28.6"', add
label define edscor90_lbl 0287 `"28.7"', add
label define edscor90_lbl 0288 `"28.8"', add
label define edscor90_lbl 0289 `"28.9"', add
label define edscor90_lbl 0290 `"29"', add
label define edscor90_lbl 0291 `"29.1"', add
label define edscor90_lbl 0292 `"29.2"', add
label define edscor90_lbl 0293 `"29.3"', add
label define edscor90_lbl 0294 `"29.4"', add
label define edscor90_lbl 0295 `"29.5"', add
label define edscor90_lbl 0296 `"29.6"', add
label define edscor90_lbl 0297 `"29.7"', add
label define edscor90_lbl 0298 `"29.8"', add
label define edscor90_lbl 0299 `"29.9"', add
label define edscor90_lbl 0300 `"30"', add
label define edscor90_lbl 0301 `"30.1"', add
label define edscor90_lbl 0302 `"30.2"', add
label define edscor90_lbl 0303 `"30.3"', add
label define edscor90_lbl 0304 `"30.4"', add
label define edscor90_lbl 0305 `"30.5"', add
label define edscor90_lbl 0306 `"30.6"', add
label define edscor90_lbl 0307 `"30.7"', add
label define edscor90_lbl 0308 `"30.8"', add
label define edscor90_lbl 0309 `"30.9"', add
label define edscor90_lbl 0310 `"31"', add
label define edscor90_lbl 0311 `"31.1"', add
label define edscor90_lbl 0312 `"31.2"', add
label define edscor90_lbl 0313 `"31.3"', add
label define edscor90_lbl 0314 `"31.4"', add
label define edscor90_lbl 0315 `"31.5"', add
label define edscor90_lbl 0316 `"31.6"', add
label define edscor90_lbl 0317 `"31.7"', add
label define edscor90_lbl 0318 `"31.8"', add
label define edscor90_lbl 0319 `"31.9"', add
label define edscor90_lbl 0320 `"32"', add
label define edscor90_lbl 0321 `"32.1"', add
label define edscor90_lbl 0322 `"32.2"', add
label define edscor90_lbl 0323 `"32.3"', add
label define edscor90_lbl 0324 `"32.4"', add
label define edscor90_lbl 0325 `"32.5"', add
label define edscor90_lbl 0326 `"32.6"', add
label define edscor90_lbl 0327 `"32.7"', add
label define edscor90_lbl 0328 `"32.8"', add
label define edscor90_lbl 0329 `"32.9"', add
label define edscor90_lbl 0330 `"33"', add
label define edscor90_lbl 0331 `"33.1"', add
label define edscor90_lbl 0332 `"33.2"', add
label define edscor90_lbl 0333 `"33.3"', add
label define edscor90_lbl 0334 `"33.4"', add
label define edscor90_lbl 0335 `"33.5"', add
label define edscor90_lbl 0336 `"33.6"', add
label define edscor90_lbl 0337 `"33.7"', add
label define edscor90_lbl 0338 `"33.8"', add
label define edscor90_lbl 0339 `"33.9"', add
label define edscor90_lbl 0340 `"34"', add
label define edscor90_lbl 0341 `"34.1"', add
label define edscor90_lbl 0342 `"34.2"', add
label define edscor90_lbl 0343 `"34.3"', add
label define edscor90_lbl 0344 `"34.4"', add
label define edscor90_lbl 0345 `"34.5"', add
label define edscor90_lbl 0346 `"34.6"', add
label define edscor90_lbl 0347 `"34.7"', add
label define edscor90_lbl 0348 `"34.8"', add
label define edscor90_lbl 0349 `"34.9"', add
label define edscor90_lbl 0350 `"35"', add
label define edscor90_lbl 0351 `"35.1"', add
label define edscor90_lbl 0352 `"35.2"', add
label define edscor90_lbl 0353 `"35.3"', add
label define edscor90_lbl 0354 `"35.4"', add
label define edscor90_lbl 0355 `"35.5"', add
label define edscor90_lbl 0356 `"35.6"', add
label define edscor90_lbl 0357 `"35.7"', add
label define edscor90_lbl 0358 `"35.8"', add
label define edscor90_lbl 0359 `"35.9"', add
label define edscor90_lbl 0360 `"36"', add
label define edscor90_lbl 0361 `"36.1"', add
label define edscor90_lbl 0362 `"36.2"', add
label define edscor90_lbl 0363 `"36.3"', add
label define edscor90_lbl 0364 `"36.4"', add
label define edscor90_lbl 0365 `"36.5"', add
label define edscor90_lbl 0366 `"36.6"', add
label define edscor90_lbl 0367 `"36.7"', add
label define edscor90_lbl 0368 `"36.8"', add
label define edscor90_lbl 0369 `"36.9"', add
label define edscor90_lbl 0370 `"37"', add
label define edscor90_lbl 0371 `"37.1"', add
label define edscor90_lbl 0372 `"37.2"', add
label define edscor90_lbl 0373 `"37.3"', add
label define edscor90_lbl 0374 `"37.4"', add
label define edscor90_lbl 0375 `"37.5"', add
label define edscor90_lbl 0376 `"37.6"', add
label define edscor90_lbl 0377 `"37.7"', add
label define edscor90_lbl 0378 `"37.8"', add
label define edscor90_lbl 0379 `"37.9"', add
label define edscor90_lbl 0380 `"38"', add
label define edscor90_lbl 0381 `"38.1"', add
label define edscor90_lbl 0382 `"38.2"', add
label define edscor90_lbl 0383 `"38.3"', add
label define edscor90_lbl 0384 `"38.4"', add
label define edscor90_lbl 0385 `"38.5"', add
label define edscor90_lbl 0386 `"38.6"', add
label define edscor90_lbl 0387 `"38.7"', add
label define edscor90_lbl 0388 `"38.8"', add
label define edscor90_lbl 0389 `"38.9"', add
label define edscor90_lbl 0390 `"39"', add
label define edscor90_lbl 0391 `"39.1"', add
label define edscor90_lbl 0392 `"39.2"', add
label define edscor90_lbl 0393 `"39.3"', add
label define edscor90_lbl 0394 `"39.4"', add
label define edscor90_lbl 0395 `"39.5"', add
label define edscor90_lbl 0396 `"39.6"', add
label define edscor90_lbl 0397 `"39.7"', add
label define edscor90_lbl 0398 `"39.8"', add
label define edscor90_lbl 0399 `"39.9"', add
label define edscor90_lbl 0400 `"40"', add
label define edscor90_lbl 0401 `"40.1"', add
label define edscor90_lbl 0402 `"40.2"', add
label define edscor90_lbl 0403 `"40.3"', add
label define edscor90_lbl 0404 `"40.4"', add
label define edscor90_lbl 0405 `"40.5"', add
label define edscor90_lbl 0406 `"40.6"', add
label define edscor90_lbl 0407 `"40.7"', add
label define edscor90_lbl 0408 `"40.8"', add
label define edscor90_lbl 0409 `"40.9"', add
label define edscor90_lbl 0410 `"41"', add
label define edscor90_lbl 0411 `"41.1"', add
label define edscor90_lbl 0412 `"41.2"', add
label define edscor90_lbl 0413 `"41.3"', add
label define edscor90_lbl 0414 `"41.4"', add
label define edscor90_lbl 0415 `"41.5"', add
label define edscor90_lbl 0416 `"41.6"', add
label define edscor90_lbl 0417 `"41.7"', add
label define edscor90_lbl 0418 `"41.8"', add
label define edscor90_lbl 0419 `"41.9"', add
label define edscor90_lbl 0420 `"42"', add
label define edscor90_lbl 0421 `"42.1"', add
label define edscor90_lbl 0422 `"42.2"', add
label define edscor90_lbl 0423 `"42.3"', add
label define edscor90_lbl 0424 `"42.4"', add
label define edscor90_lbl 0425 `"42.5"', add
label define edscor90_lbl 0426 `"42.6"', add
label define edscor90_lbl 0427 `"42.7"', add
label define edscor90_lbl 0428 `"42.8"', add
label define edscor90_lbl 0429 `"42.9"', add
label define edscor90_lbl 0430 `"43"', add
label define edscor90_lbl 0431 `"43.1"', add
label define edscor90_lbl 0432 `"43.2"', add
label define edscor90_lbl 0433 `"43.3"', add
label define edscor90_lbl 0434 `"43.4"', add
label define edscor90_lbl 0435 `"43.5"', add
label define edscor90_lbl 0436 `"43.6"', add
label define edscor90_lbl 0437 `"43.7"', add
label define edscor90_lbl 0438 `"43.8"', add
label define edscor90_lbl 0439 `"43.9"', add
label define edscor90_lbl 0440 `"44"', add
label define edscor90_lbl 0441 `"44.1"', add
label define edscor90_lbl 0442 `"44.2"', add
label define edscor90_lbl 0443 `"44.3"', add
label define edscor90_lbl 0444 `"44.4"', add
label define edscor90_lbl 0445 `"44.5"', add
label define edscor90_lbl 0446 `"44.6"', add
label define edscor90_lbl 0447 `"44.7"', add
label define edscor90_lbl 0448 `"44.8"', add
label define edscor90_lbl 0449 `"44.9"', add
label define edscor90_lbl 0450 `"45"', add
label define edscor90_lbl 0451 `"45.1"', add
label define edscor90_lbl 0452 `"45.2"', add
label define edscor90_lbl 0453 `"45.3"', add
label define edscor90_lbl 0454 `"45.4"', add
label define edscor90_lbl 0455 `"45.5"', add
label define edscor90_lbl 0456 `"45.6"', add
label define edscor90_lbl 0457 `"45.7"', add
label define edscor90_lbl 0458 `"45.8"', add
label define edscor90_lbl 0459 `"45.9"', add
label define edscor90_lbl 0460 `"46"', add
label define edscor90_lbl 0461 `"46.1"', add
label define edscor90_lbl 0462 `"46.2"', add
label define edscor90_lbl 0463 `"46.3"', add
label define edscor90_lbl 0464 `"46.4"', add
label define edscor90_lbl 0465 `"46.5"', add
label define edscor90_lbl 0466 `"46.6"', add
label define edscor90_lbl 0467 `"46.7"', add
label define edscor90_lbl 0468 `"46.8"', add
label define edscor90_lbl 0469 `"46.9"', add
label define edscor90_lbl 0470 `"47"', add
label define edscor90_lbl 0471 `"47.1"', add
label define edscor90_lbl 0472 `"47.2"', add
label define edscor90_lbl 0473 `"47.3"', add
label define edscor90_lbl 0474 `"47.4"', add
label define edscor90_lbl 0475 `"47.5"', add
label define edscor90_lbl 0476 `"47.6"', add
label define edscor90_lbl 0477 `"47.7"', add
label define edscor90_lbl 0478 `"47.8"', add
label define edscor90_lbl 0479 `"47.9"', add
label define edscor90_lbl 0480 `"48"', add
label define edscor90_lbl 0481 `"48.1"', add
label define edscor90_lbl 0482 `"48.2"', add
label define edscor90_lbl 0483 `"48.3"', add
label define edscor90_lbl 0484 `"48.4"', add
label define edscor90_lbl 0485 `"48.5"', add
label define edscor90_lbl 0486 `"48.6"', add
label define edscor90_lbl 0487 `"48.7"', add
label define edscor90_lbl 0488 `"48.8"', add
label define edscor90_lbl 0489 `"48.9"', add
label define edscor90_lbl 0490 `"49"', add
label define edscor90_lbl 0491 `"49.1"', add
label define edscor90_lbl 0492 `"49.2"', add
label define edscor90_lbl 0493 `"49.3"', add
label define edscor90_lbl 0494 `"49.4"', add
label define edscor90_lbl 0495 `"49.5"', add
label define edscor90_lbl 0496 `"49.6"', add
label define edscor90_lbl 0497 `"49.7"', add
label define edscor90_lbl 0498 `"49.8"', add
label define edscor90_lbl 0499 `"49.9"', add
label define edscor90_lbl 0500 `"50"', add
label define edscor90_lbl 0501 `"50.1"', add
label define edscor90_lbl 0502 `"50.2"', add
label define edscor90_lbl 0503 `"50.3"', add
label define edscor90_lbl 0504 `"50.4"', add
label define edscor90_lbl 0505 `"50.5"', add
label define edscor90_lbl 0506 `"50.6"', add
label define edscor90_lbl 0507 `"50.7"', add
label define edscor90_lbl 0508 `"50.8"', add
label define edscor90_lbl 0509 `"50.9"', add
label define edscor90_lbl 0510 `"51"', add
label define edscor90_lbl 0511 `"51.1"', add
label define edscor90_lbl 0512 `"51.2"', add
label define edscor90_lbl 0513 `"51.3"', add
label define edscor90_lbl 0514 `"51.4"', add
label define edscor90_lbl 0515 `"51.5"', add
label define edscor90_lbl 0516 `"51.6"', add
label define edscor90_lbl 0517 `"51.7"', add
label define edscor90_lbl 0518 `"51.8"', add
label define edscor90_lbl 0519 `"51.9"', add
label define edscor90_lbl 0520 `"52"', add
label define edscor90_lbl 0521 `"52.1"', add
label define edscor90_lbl 0522 `"52.2"', add
label define edscor90_lbl 0523 `"52.3"', add
label define edscor90_lbl 0524 `"52.4"', add
label define edscor90_lbl 0525 `"52.5"', add
label define edscor90_lbl 0526 `"52.6"', add
label define edscor90_lbl 0527 `"52.7"', add
label define edscor90_lbl 0528 `"52.8"', add
label define edscor90_lbl 0529 `"52.9"', add
label define edscor90_lbl 0530 `"53"', add
label define edscor90_lbl 0531 `"53.1"', add
label define edscor90_lbl 0532 `"53.2"', add
label define edscor90_lbl 0533 `"53.3"', add
label define edscor90_lbl 0534 `"53.4"', add
label define edscor90_lbl 0535 `"53.5"', add
label define edscor90_lbl 0536 `"53.6"', add
label define edscor90_lbl 0537 `"53.7"', add
label define edscor90_lbl 0538 `"53.8"', add
label define edscor90_lbl 0539 `"53.9"', add
label define edscor90_lbl 0540 `"54"', add
label define edscor90_lbl 0541 `"54.1"', add
label define edscor90_lbl 0542 `"54.2"', add
label define edscor90_lbl 0543 `"54.3"', add
label define edscor90_lbl 0544 `"54.4"', add
label define edscor90_lbl 0545 `"54.5"', add
label define edscor90_lbl 0546 `"54.6"', add
label define edscor90_lbl 0547 `"54.7"', add
label define edscor90_lbl 0548 `"54.8"', add
label define edscor90_lbl 0549 `"54.9"', add
label define edscor90_lbl 0550 `"55"', add
label define edscor90_lbl 0551 `"55.1"', add
label define edscor90_lbl 0552 `"55.2"', add
label define edscor90_lbl 0553 `"55.3"', add
label define edscor90_lbl 0554 `"55.4"', add
label define edscor90_lbl 0555 `"55.5"', add
label define edscor90_lbl 0556 `"55.6"', add
label define edscor90_lbl 0557 `"55.7"', add
label define edscor90_lbl 0558 `"55.8"', add
label define edscor90_lbl 0559 `"55.9"', add
label define edscor90_lbl 0560 `"56"', add
label define edscor90_lbl 0561 `"56.1"', add
label define edscor90_lbl 0562 `"56.2"', add
label define edscor90_lbl 0563 `"56.3"', add
label define edscor90_lbl 0564 `"56.4"', add
label define edscor90_lbl 0565 `"56.5"', add
label define edscor90_lbl 0566 `"56.6"', add
label define edscor90_lbl 0567 `"56.7"', add
label define edscor90_lbl 0568 `"56.8"', add
label define edscor90_lbl 0569 `"56.9"', add
label define edscor90_lbl 0570 `"57"', add
label define edscor90_lbl 0571 `"57.1"', add
label define edscor90_lbl 0572 `"57.2"', add
label define edscor90_lbl 0573 `"57.3"', add
label define edscor90_lbl 0574 `"57.4"', add
label define edscor90_lbl 0575 `"57.5"', add
label define edscor90_lbl 0576 `"57.6"', add
label define edscor90_lbl 0577 `"57.7"', add
label define edscor90_lbl 0578 `"57.8"', add
label define edscor90_lbl 0579 `"57.9"', add
label define edscor90_lbl 0580 `"58"', add
label define edscor90_lbl 0581 `"58.1"', add
label define edscor90_lbl 0582 `"58.2"', add
label define edscor90_lbl 0583 `"58.3"', add
label define edscor90_lbl 0584 `"58.4"', add
label define edscor90_lbl 0585 `"58.5"', add
label define edscor90_lbl 0586 `"58.6"', add
label define edscor90_lbl 0587 `"58.7"', add
label define edscor90_lbl 0588 `"58.8"', add
label define edscor90_lbl 0589 `"58.9"', add
label define edscor90_lbl 0590 `"59"', add
label define edscor90_lbl 0591 `"59.1"', add
label define edscor90_lbl 0592 `"59.2"', add
label define edscor90_lbl 0593 `"59.3"', add
label define edscor90_lbl 0594 `"59.4"', add
label define edscor90_lbl 0595 `"59.5"', add
label define edscor90_lbl 0596 `"59.6"', add
label define edscor90_lbl 0597 `"59.7"', add
label define edscor90_lbl 0598 `"59.8"', add
label define edscor90_lbl 0599 `"59.9"', add
label define edscor90_lbl 0600 `"60"', add
label define edscor90_lbl 0601 `"60.1"', add
label define edscor90_lbl 0602 `"60.2"', add
label define edscor90_lbl 0603 `"60.3"', add
label define edscor90_lbl 0604 `"60.4"', add
label define edscor90_lbl 0605 `"60.5"', add
label define edscor90_lbl 0606 `"60.6"', add
label define edscor90_lbl 0607 `"60.7"', add
label define edscor90_lbl 0608 `"60.8"', add
label define edscor90_lbl 0609 `"60.9"', add
label define edscor90_lbl 0610 `"61"', add
label define edscor90_lbl 0611 `"61.1"', add
label define edscor90_lbl 0612 `"61.2"', add
label define edscor90_lbl 0613 `"0613"', add
label define edscor90_lbl 0614 `"61.4"', add
label define edscor90_lbl 0615 `"61.5"', add
label define edscor90_lbl 0616 `"61.6"', add
label define edscor90_lbl 0617 `"61.7"', add
label define edscor90_lbl 0618 `"61.8"', add
label define edscor90_lbl 0619 `"61.9"', add
label define edscor90_lbl 0620 `"62"', add
label define edscor90_lbl 0621 `"62.1"', add
label define edscor90_lbl 0622 `"62.2"', add
label define edscor90_lbl 0623 `"62.3"', add
label define edscor90_lbl 0624 `"62.4"', add
label define edscor90_lbl 0625 `"62.5"', add
label define edscor90_lbl 0626 `"62.6"', add
label define edscor90_lbl 0627 `"62.7"', add
label define edscor90_lbl 0628 `"62.8"', add
label define edscor90_lbl 0629 `"62.9"', add
label define edscor90_lbl 0630 `"63"', add
label define edscor90_lbl 0631 `"63.1"', add
label define edscor90_lbl 0632 `"63.2"', add
label define edscor90_lbl 0633 `"63.3"', add
label define edscor90_lbl 0634 `"63.4"', add
label define edscor90_lbl 0635 `"63.5"', add
label define edscor90_lbl 0636 `"63.6"', add
label define edscor90_lbl 0637 `"63.7"', add
label define edscor90_lbl 0638 `"63.8"', add
label define edscor90_lbl 0639 `"63.9"', add
label define edscor90_lbl 0640 `"64"', add
label define edscor90_lbl 0641 `"64.1"', add
label define edscor90_lbl 0642 `"64.2"', add
label define edscor90_lbl 0643 `"64.3"', add
label define edscor90_lbl 0644 `"64.4"', add
label define edscor90_lbl 0645 `"64.5"', add
label define edscor90_lbl 0646 `"64.6"', add
label define edscor90_lbl 0647 `"64.7"', add
label define edscor90_lbl 0648 `"64.8"', add
label define edscor90_lbl 0649 `"64.9"', add
label define edscor90_lbl 0650 `"65"', add
label define edscor90_lbl 0651 `"65.1"', add
label define edscor90_lbl 0652 `"65.2"', add
label define edscor90_lbl 0653 `"65.3"', add
label define edscor90_lbl 0654 `"65.4"', add
label define edscor90_lbl 0655 `"65.5"', add
label define edscor90_lbl 0656 `"65.6"', add
label define edscor90_lbl 0657 `"65.7"', add
label define edscor90_lbl 0658 `"65.8"', add
label define edscor90_lbl 0659 `"65.9"', add
label define edscor90_lbl 0660 `"66"', add
label define edscor90_lbl 0661 `"66.1"', add
label define edscor90_lbl 0662 `"66.2"', add
label define edscor90_lbl 0663 `"66.3"', add
label define edscor90_lbl 0664 `"66.4"', add
label define edscor90_lbl 0665 `"66.5"', add
label define edscor90_lbl 0666 `"66.6"', add
label define edscor90_lbl 0667 `"66.7"', add
label define edscor90_lbl 0668 `"66.8"', add
label define edscor90_lbl 0669 `"66.9"', add
label define edscor90_lbl 0670 `"67"', add
label define edscor90_lbl 0671 `"67.1"', add
label define edscor90_lbl 0672 `"67.2"', add
label define edscor90_lbl 0673 `"67.3"', add
label define edscor90_lbl 0674 `"67.4"', add
label define edscor90_lbl 0675 `"67.5"', add
label define edscor90_lbl 0676 `"67.6"', add
label define edscor90_lbl 0677 `"67.7"', add
label define edscor90_lbl 0678 `"67.8"', add
label define edscor90_lbl 0679 `"67.9"', add
label define edscor90_lbl 0680 `"68"', add
label define edscor90_lbl 0681 `"68.1"', add
label define edscor90_lbl 0682 `"68.2"', add
label define edscor90_lbl 0683 `"68.3"', add
label define edscor90_lbl 0684 `"68.4"', add
label define edscor90_lbl 0685 `"68.5"', add
label define edscor90_lbl 0686 `"68.6"', add
label define edscor90_lbl 0687 `"68.7"', add
label define edscor90_lbl 0688 `"68.8"', add
label define edscor90_lbl 0689 `"68.9"', add
label define edscor90_lbl 0690 `"69"', add
label define edscor90_lbl 0691 `"69.1"', add
label define edscor90_lbl 0692 `"69.2"', add
label define edscor90_lbl 0693 `"69.3"', add
label define edscor90_lbl 0694 `"69.4"', add
label define edscor90_lbl 0695 `"69.5"', add
label define edscor90_lbl 0696 `"69.6"', add
label define edscor90_lbl 0697 `"69.7"', add
label define edscor90_lbl 0698 `"69.8"', add
label define edscor90_lbl 0699 `"69.9"', add
label define edscor90_lbl 0700 `"70"', add
label define edscor90_lbl 0701 `"70.1"', add
label define edscor90_lbl 0702 `"70.2"', add
label define edscor90_lbl 0703 `"70.3"', add
label define edscor90_lbl 0704 `"70.4"', add
label define edscor90_lbl 0705 `"70.5"', add
label define edscor90_lbl 0706 `"70.6"', add
label define edscor90_lbl 0707 `"70.7"', add
label define edscor90_lbl 0708 `"70.8"', add
label define edscor90_lbl 0709 `"70.9"', add
label define edscor90_lbl 0710 `"71"', add
label define edscor90_lbl 0711 `"71.1"', add
label define edscor90_lbl 0712 `"71.2"', add
label define edscor90_lbl 0713 `"71.3"', add
label define edscor90_lbl 0714 `"71.4"', add
label define edscor90_lbl 0715 `"71.5"', add
label define edscor90_lbl 0716 `"71.6"', add
label define edscor90_lbl 0717 `"71.7"', add
label define edscor90_lbl 0718 `"71.8"', add
label define edscor90_lbl 0719 `"71.9"', add
label define edscor90_lbl 0720 `"72"', add
label define edscor90_lbl 0721 `"72.1"', add
label define edscor90_lbl 0722 `"72.2"', add
label define edscor90_lbl 0723 `"72.3"', add
label define edscor90_lbl 0724 `"72.4"', add
label define edscor90_lbl 0725 `"72.5"', add
label define edscor90_lbl 0726 `"72.6"', add
label define edscor90_lbl 0727 `"72.7"', add
label define edscor90_lbl 0728 `"72.8"', add
label define edscor90_lbl 0729 `"72.9"', add
label define edscor90_lbl 0730 `"73"', add
label define edscor90_lbl 0731 `"73.1"', add
label define edscor90_lbl 0732 `"73.2"', add
label define edscor90_lbl 0733 `"73.3"', add
label define edscor90_lbl 0734 `"73.4"', add
label define edscor90_lbl 0735 `"73.5"', add
label define edscor90_lbl 0736 `"73.6"', add
label define edscor90_lbl 0737 `"73.7"', add
label define edscor90_lbl 0738 `"73.8"', add
label define edscor90_lbl 0739 `"73.9"', add
label define edscor90_lbl 0740 `"74"', add
label define edscor90_lbl 0741 `"74.1"', add
label define edscor90_lbl 0742 `"74.2"', add
label define edscor90_lbl 0743 `"74.3"', add
label define edscor90_lbl 0744 `"74.4"', add
label define edscor90_lbl 0745 `"74.5"', add
label define edscor90_lbl 0746 `"74.6"', add
label define edscor90_lbl 0747 `"74.7"', add
label define edscor90_lbl 0748 `"74.8"', add
label define edscor90_lbl 0749 `"74.9"', add
label define edscor90_lbl 0750 `"75"', add
label define edscor90_lbl 0751 `"75.1"', add
label define edscor90_lbl 0752 `"75.2"', add
label define edscor90_lbl 0753 `"75.3"', add
label define edscor90_lbl 0754 `"75.4"', add
label define edscor90_lbl 0755 `"75.5"', add
label define edscor90_lbl 0756 `"75.6"', add
label define edscor90_lbl 0757 `"75.7"', add
label define edscor90_lbl 0758 `"75.8"', add
label define edscor90_lbl 0759 `"75.9"', add
label define edscor90_lbl 0760 `"76"', add
label define edscor90_lbl 0761 `"76.1"', add
label define edscor90_lbl 0762 `"76.2"', add
label define edscor90_lbl 0763 `"76.3"', add
label define edscor90_lbl 0764 `"76.4"', add
label define edscor90_lbl 0765 `"76.5"', add
label define edscor90_lbl 0766 `"76.6"', add
label define edscor90_lbl 0767 `"76.7"', add
label define edscor90_lbl 0768 `"76.8"', add
label define edscor90_lbl 0769 `"76.9"', add
label define edscor90_lbl 0770 `"77"', add
label define edscor90_lbl 0771 `"77.1"', add
label define edscor90_lbl 0772 `"77.2"', add
label define edscor90_lbl 0773 `"77.3"', add
label define edscor90_lbl 0774 `"77.4"', add
label define edscor90_lbl 0775 `"77.5"', add
label define edscor90_lbl 0776 `"77.6"', add
label define edscor90_lbl 0777 `"77.7"', add
label define edscor90_lbl 0778 `"77.8"', add
label define edscor90_lbl 0779 `"77.9"', add
label define edscor90_lbl 0780 `"78"', add
label define edscor90_lbl 0781 `"78.1"', add
label define edscor90_lbl 0782 `"78.2"', add
label define edscor90_lbl 0783 `"78.3"', add
label define edscor90_lbl 0784 `"78.4"', add
label define edscor90_lbl 0785 `"78.5"', add
label define edscor90_lbl 0786 `"78.6"', add
label define edscor90_lbl 0787 `"78.7"', add
label define edscor90_lbl 0788 `"78.8"', add
label define edscor90_lbl 0789 `"78.9"', add
label define edscor90_lbl 0790 `"79"', add
label define edscor90_lbl 0791 `"79.1"', add
label define edscor90_lbl 0792 `"79.2"', add
label define edscor90_lbl 0793 `"79.3"', add
label define edscor90_lbl 0794 `"79.4"', add
label define edscor90_lbl 0795 `"79.5"', add
label define edscor90_lbl 0796 `"79.6"', add
label define edscor90_lbl 0797 `"79.7"', add
label define edscor90_lbl 0798 `"79.8"', add
label define edscor90_lbl 0799 `"79.9"', add
label define edscor90_lbl 0800 `"80"', add
label define edscor90_lbl 0801 `"80.1"', add
label define edscor90_lbl 0802 `"80.2"', add
label define edscor90_lbl 0803 `"80.3"', add
label define edscor90_lbl 0804 `"80.4"', add
label define edscor90_lbl 0805 `"80.5"', add
label define edscor90_lbl 0806 `"80.6"', add
label define edscor90_lbl 0807 `"80.7"', add
label define edscor90_lbl 0808 `"80.8"', add
label define edscor90_lbl 0809 `"80.9"', add
label define edscor90_lbl 0810 `"81"', add
label define edscor90_lbl 0811 `"81.1"', add
label define edscor90_lbl 0812 `"81.2"', add
label define edscor90_lbl 0813 `"81.3"', add
label define edscor90_lbl 0814 `"81.4"', add
label define edscor90_lbl 0815 `"81.5"', add
label define edscor90_lbl 0816 `"81.6"', add
label define edscor90_lbl 0817 `"81.7"', add
label define edscor90_lbl 0818 `"81.8"', add
label define edscor90_lbl 0819 `"81.9"', add
label define edscor90_lbl 0820 `"82"', add
label define edscor90_lbl 0821 `"82.1"', add
label define edscor90_lbl 0822 `"82.2"', add
label define edscor90_lbl 0823 `"82.3"', add
label define edscor90_lbl 0824 `"82.4"', add
label define edscor90_lbl 0825 `"82.5"', add
label define edscor90_lbl 0826 `"82.6"', add
label define edscor90_lbl 0827 `"82.7"', add
label define edscor90_lbl 0828 `"82.8"', add
label define edscor90_lbl 0829 `"82.9"', add
label define edscor90_lbl 0830 `"83"', add
label define edscor90_lbl 0831 `"83.1"', add
label define edscor90_lbl 0832 `"83.2"', add
label define edscor90_lbl 0833 `"83.3"', add
label define edscor90_lbl 0834 `"83.4"', add
label define edscor90_lbl 0835 `"83.5"', add
label define edscor90_lbl 0836 `"83.6"', add
label define edscor90_lbl 0837 `"83.7"', add
label define edscor90_lbl 0838 `"83.8"', add
label define edscor90_lbl 0839 `"83.9"', add
label define edscor90_lbl 0840 `"84"', add
label define edscor90_lbl 0841 `"84.1"', add
label define edscor90_lbl 0842 `"84.2"', add
label define edscor90_lbl 0843 `"84.3"', add
label define edscor90_lbl 0844 `"84.4"', add
label define edscor90_lbl 0845 `"84.5"', add
label define edscor90_lbl 0846 `"84.6"', add
label define edscor90_lbl 0847 `"84.7"', add
label define edscor90_lbl 0848 `"84.8"', add
label define edscor90_lbl 0849 `"84.9"', add
label define edscor90_lbl 0850 `"85"', add
label define edscor90_lbl 0851 `"85.1"', add
label define edscor90_lbl 0852 `"85.2"', add
label define edscor90_lbl 0853 `"85.3"', add
label define edscor90_lbl 0854 `"85.4"', add
label define edscor90_lbl 0855 `"85.5"', add
label define edscor90_lbl 0856 `"85.6"', add
label define edscor90_lbl 0857 `"85.7"', add
label define edscor90_lbl 0858 `"85.8"', add
label define edscor90_lbl 0859 `"85.9"', add
label define edscor90_lbl 0860 `"86"', add
label define edscor90_lbl 0861 `"86.1"', add
label define edscor90_lbl 0862 `"86.2"', add
label define edscor90_lbl 0863 `"86.3"', add
label define edscor90_lbl 0864 `"86.4"', add
label define edscor90_lbl 0865 `"86.5"', add
label define edscor90_lbl 0866 `"86.6"', add
label define edscor90_lbl 0867 `"86.7"', add
label define edscor90_lbl 0868 `"86.8"', add
label define edscor90_lbl 0869 `"86.9"', add
label define edscor90_lbl 0870 `"87"', add
label define edscor90_lbl 0871 `"87.1"', add
label define edscor90_lbl 0872 `"87.2"', add
label define edscor90_lbl 0873 `"0873"', add
label define edscor90_lbl 0874 `"87.4"', add
label define edscor90_lbl 0875 `"87.5"', add
label define edscor90_lbl 0876 `"87.6"', add
label define edscor90_lbl 0877 `"87.7"', add
label define edscor90_lbl 0878 `"87.8"', add
label define edscor90_lbl 0879 `"87.9"', add
label define edscor90_lbl 0880 `"88"', add
label define edscor90_lbl 0881 `"88.1"', add
label define edscor90_lbl 0882 `"88.2"', add
label define edscor90_lbl 0883 `"88.3"', add
label define edscor90_lbl 0884 `"88.4"', add
label define edscor90_lbl 0885 `"88.5"', add
label define edscor90_lbl 0886 `"88.6"', add
label define edscor90_lbl 0887 `"88.7"', add
label define edscor90_lbl 0888 `"88.8"', add
label define edscor90_lbl 0889 `"88.9"', add
label define edscor90_lbl 0890 `"89"', add
label define edscor90_lbl 0891 `"89.1"', add
label define edscor90_lbl 0892 `"89.2"', add
label define edscor90_lbl 0893 `"89.3"', add
label define edscor90_lbl 0894 `"89.4"', add
label define edscor90_lbl 0895 `"89.5"', add
label define edscor90_lbl 0896 `"89.6"', add
label define edscor90_lbl 0897 `"89.7"', add
label define edscor90_lbl 0898 `"89.8"', add
label define edscor90_lbl 0899 `"89.9"', add
label define edscor90_lbl 0900 `"90"', add
label define edscor90_lbl 0901 `"90.1"', add
label define edscor90_lbl 0902 `"90.2"', add
label define edscor90_lbl 0903 `"90.3"', add
label define edscor90_lbl 0904 `"90.4"', add
label define edscor90_lbl 0905 `"90.5"', add
label define edscor90_lbl 0906 `"90.6"', add
label define edscor90_lbl 0907 `"90.7"', add
label define edscor90_lbl 0908 `"90.8"', add
label define edscor90_lbl 0909 `"90.9"', add
label define edscor90_lbl 0910 `"91"', add
label define edscor90_lbl 0911 `"91.1"', add
label define edscor90_lbl 0912 `"91.2"', add
label define edscor90_lbl 0913 `"91.3"', add
label define edscor90_lbl 0914 `"91.4"', add
label define edscor90_lbl 0915 `"91.5"', add
label define edscor90_lbl 0916 `"91.6"', add
label define edscor90_lbl 0917 `"91.7"', add
label define edscor90_lbl 0918 `"91.8"', add
label define edscor90_lbl 0919 `"91.9"', add
label define edscor90_lbl 0920 `"92"', add
label define edscor90_lbl 0921 `"92.1"', add
label define edscor90_lbl 0922 `"92.2"', add
label define edscor90_lbl 0923 `"92.3"', add
label define edscor90_lbl 0924 `"92.4"', add
label define edscor90_lbl 0925 `"92.5"', add
label define edscor90_lbl 0926 `"92.6"', add
label define edscor90_lbl 0927 `"92.7"', add
label define edscor90_lbl 0928 `"92.8"', add
label define edscor90_lbl 0929 `"92.9"', add
label define edscor90_lbl 0930 `"93"', add
label define edscor90_lbl 0931 `"93.1"', add
label define edscor90_lbl 0932 `"93.2"', add
label define edscor90_lbl 0933 `"93.3"', add
label define edscor90_lbl 0934 `"93.4"', add
label define edscor90_lbl 0935 `"93.5"', add
label define edscor90_lbl 0936 `"93.6"', add
label define edscor90_lbl 0937 `"93.7"', add
label define edscor90_lbl 0938 `"93.8"', add
label define edscor90_lbl 0939 `"93.9"', add
label define edscor90_lbl 0940 `"94"', add
label define edscor90_lbl 0941 `"94.1"', add
label define edscor90_lbl 0942 `"94.2"', add
label define edscor90_lbl 0943 `"94.3"', add
label define edscor90_lbl 0944 `"94.4"', add
label define edscor90_lbl 0945 `"94.5"', add
label define edscor90_lbl 0946 `"94.6"', add
label define edscor90_lbl 0947 `"94.7"', add
label define edscor90_lbl 0948 `"94.8"', add
label define edscor90_lbl 0949 `"94.9"', add
label define edscor90_lbl 0950 `"95"', add
label define edscor90_lbl 0951 `"95.1"', add
label define edscor90_lbl 0952 `"95.2"', add
label define edscor90_lbl 0953 `"95.3"', add
label define edscor90_lbl 0954 `"95.4"', add
label define edscor90_lbl 0955 `"95.5"', add
label define edscor90_lbl 0956 `"95.6"', add
label define edscor90_lbl 0957 `"95.7"', add
label define edscor90_lbl 0958 `"95.8"', add
label define edscor90_lbl 0959 `"95.9"', add
label define edscor90_lbl 0960 `"96"', add
label define edscor90_lbl 0961 `"96.1"', add
label define edscor90_lbl 0962 `"96.2"', add
label define edscor90_lbl 0963 `"96.3"', add
label define edscor90_lbl 0964 `"96.4"', add
label define edscor90_lbl 0965 `"96.5"', add
label define edscor90_lbl 0966 `"96.6"', add
label define edscor90_lbl 0967 `"96.7"', add
label define edscor90_lbl 0968 `"96.8"', add
label define edscor90_lbl 0969 `"96.9"', add
label define edscor90_lbl 0970 `"97"', add
label define edscor90_lbl 0971 `"97.1"', add
label define edscor90_lbl 0972 `"97.2"', add
label define edscor90_lbl 0973 `"97.3"', add
label define edscor90_lbl 0974 `"97.4"', add
label define edscor90_lbl 0975 `"97.5"', add
label define edscor90_lbl 0976 `"97.6"', add
label define edscor90_lbl 0977 `"97.7"', add
label define edscor90_lbl 0978 `"97.8"', add
label define edscor90_lbl 0979 `"97.9"', add
label define edscor90_lbl 0980 `"98"', add
label define edscor90_lbl 0981 `"98.1"', add
label define edscor90_lbl 0982 `"98.2"', add
label define edscor90_lbl 0983 `"98.3"', add
label define edscor90_lbl 0984 `"98.4"', add
label define edscor90_lbl 0985 `"98.5"', add
label define edscor90_lbl 0986 `"98.6"', add
label define edscor90_lbl 0987 `"98.7"', add
label define edscor90_lbl 0988 `"98.8"', add
label define edscor90_lbl 0989 `"98.9"', add
label define edscor90_lbl 0990 `"99"', add
label define edscor90_lbl 0991 `"99.1"', add
label define edscor90_lbl 0992 `"99.2"', add
label define edscor90_lbl 0993 `"99.3"', add
label define edscor90_lbl 0994 `"99.4"', add
label define edscor90_lbl 0995 `"99.5"', add
label define edscor90_lbl 0996 `"99.6"', add
label define edscor90_lbl 0997 `"99.7"', add
label define edscor90_lbl 0998 `"99.8"', add
label define edscor90_lbl 0999 `"99.9"', add
label define edscor90_lbl 1000 `"100"', add
label define edscor90_lbl 9999 `"N/A"', add
label values edscor90 edscor90_lbl


