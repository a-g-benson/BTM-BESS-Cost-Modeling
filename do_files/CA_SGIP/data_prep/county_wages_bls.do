///Import, Drop Unneeded Data, save as Stata file
//I don't use a loop here because each Excel file is a special snowflake. Thanks a lot, BLS. 

//2013
import excel "data\BLS_OEWS\oesm13ma\MSA_M2013_dl_1_AK_IN.xls", sheet("MSA_dl_1") firstrow
drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY
save "data\BLS_OEWS\oesm13ma\MSA_2013.dta", replace
clear

import excel "data\BLS_OEWS\oesm13ma\BOS_M2013_dl.xls", sheet("BOS_dl_1") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY
save "data\BLS_OEWS\oesm13ma\non_MSA_2013.dta", replace
clear


//2014
import excel "data\BLS_OEWS\oesm14ma\MSA_M2014_dl.xlsx", sheet("MSA_dl") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

save "data\BLS_OEWS\oesm14ma\MSA_2014.dta", replace
clear

import excel "data\BLS_OEWS\oesm14ma\BOS_M2014_dl.xlsx", sheet("BOS_dl") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

save "data\BLS_OEWS\oesm14ma\non_MSA_2014.dta", replace
clear

//2015 <--Marin is moved out of the SF-Redwood City-South SF Metropolitan Division

import excel "data\BLS_OEWS\oesm15ma\MSA_M2015_dl.xlsx", sheet("MSA_dl_1") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

save "data\BLS_OEWS\oesm15ma\MSA_2015.dta", replace
clear

import excel "data\BLS_OEWS\oesm15ma\BOS_M2015_dl.xlsx", sheet("BOS_dl_1") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

save "data\BLS_OEWS\oesm15ma\non_MSA_2015.dta", replace
clear

//2016

import excel "data\BLS_OEWS\oesm16ma\MSA_M2016_dl.xlsx", sheet("MSA_dl_1") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

save "data\BLS_OEWS\oesm16ma\MSA_2016.dta", replace
clear


import excel "data\BLS_OEWS\oesm16ma\BOS_M2016_dl.xlsx", sheet("BOS_dl_1") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

save "data\BLS_OEWS\oesm16ma\non_MSA_2016.dta", replace
clear

//2017

import excel "data\BLS_OEWS\oesm17ma\MSA_M2017_dl.xlsx", sheet("MSA_dl_1") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

save "data\BLS_OEWS\oesm17ma\MSA_2017.dta", replace
clear


import excel "data\BLS_OEWS\oesm17ma\BOS_M2017_dl.xlsx", sheet("BOS_dl_1") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

save "data\BLS_OEWS\oesm17ma\non_MSA_2017.dta", replace
clear

//2018 <--non-MSA definitions changed this year

import excel "data\BLS_OEWS\oesm18ma\MSA_M2018_dl.xlsx", sheet("MSA_dl") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

save "data\BLS_OEWS\oesm18ma\MSA_2018.dta", replace
clear


import excel "data\BLS_OEWS\oesm18ma\BOS_M2018_dl.xlsx", sheet("BOS_dl") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE OCC_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOCQUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

save "data\BLS_OEWS\oesm18ma\non_MSA_2018.dta", replace
clear

//2019 <--variable case changed to lower, state code dropped

import excel "data\BLS_OEWS\oesm19ma\MSA_M2019_dl.xlsx", sheet("All May 2019 Data") firstrow

drop if regexm(area_title,", CA")==0
drop if occ_code!="47-2111"

drop area_type naics naics_title i_group own_code occ_code occ_title o_group tot_emp emp_prse jobs_1000 loc_quotient pct_total a_mean mean_prse h_pct10 h_pct25 h_pct75 h_pct90 a_pct10 a_pct25 a_median a_pct75 a_pct90 annual hourly

rename area AREA
rename area_title AREA_NAME
rename h_mean H_MEAN
rename h_median H_MEDIAN
save "data\BLS_OEWS\oesm19ma\MSA_2019.dta", replace
clear


import excel "data\BLS_OEWS\oesm19ma\BOS_M2019_dl.xlsx", sheet("BOS_M2019_dl") firstrow

drop if regexm(area_title, "California")==0
drop if occ_code!="47-2111"

drop area_type naics naics_title i_group own_code occ_code occ_title o_group tot_emp emp_prse jobs_1000 loc_quotient pct_total a_mean mean_prse h_pct10 h_pct25 h_pct75 h_pct90 a_pct10 a_pct25 a_median a_pct75 a_pct90 annual hourly

rename area AREA
rename area_title AREA_NAME
rename h_mean H_MEAN
rename h_median H_MEDIAN
save "data\BLS_OEWS\oesm19ma\non_MSA_2019.dta", replace
clear


//2020 <--variable case changed back to upper, state code restored, other variables slightly renamed

import excel "data\BLS_OEWS\oesm20ma\MSA_M2020_dl.xlsx", sheet("MSA_M2020_dl") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE O_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOC_QUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY AREA_TYPE NAICS NAICS_TITLE I_GROUP OWN_CODE PCT_TOTAL

rename AREA_TITLE AREA_NAME
save "data\BLS_OEWS\oesm20ma\MSA_2020.dta", replace
clear

import excel "data\BLS_OEWS\oesm20ma\BOS_M2020_dl.xlsx", sheet("BOS_M2020_dl") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop AREA_TYPE PRIM_STATE NAICS NAICS_TITLE OWN_CODE OCC_CODE O_GROUP I_GROUP OCC_TITLE TOT_EMP EMP_PRSE JOBS_1000 LOC_QUOTIENT PCT_TOTAL A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY

rename AREA_TITLE AREA_NAME
save "data\BLS_OEWS\oesm20ma\non_MSA_2020.dta", replace
clear

//2021 <--new variable called "PCT_RPT" (I just drop it)

import excel "data\BLS_OEWS\oesm21ma\MSA_M2021_dl.xlsx", sheet("MSA_M2021_dl") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop PRIM_STATE OCC_CODE OCC_TITLE O_GROUP TOT_EMP EMP_PRSE JOBS_1000 LOC_QUOTIENT A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY AREA_TYPE NAICS NAICS_TITLE I_GROUP OWN_CODE PCT_TOTAL PCT_RPT

rename AREA_TITLE AREA_NAME
save "data\BLS_OEWS\oesm21ma\MSA_2021.dta", replace
clear

import excel "data\BLS_OEWS\oesm21ma\BOS_M2021_dl.xlsx", sheet("BOS_M2021_dl") firstrow

drop if PRIM_STATE!="CA"
drop if OCC_CODE!="47-2111"

drop AREA_TYPE PRIM_STATE NAICS NAICS_TITLE OWN_CODE OCC_CODE O_GROUP I_GROUP OCC_TITLE TOT_EMP EMP_PRSE JOBS_1000 LOC_QUOTIENT PCT_TOTAL A_MEAN MEAN_PRSE H_PCT10 H_PCT25 H_PCT75 H_PCT90 A_PCT10 A_PCT25 A_MEDIAN A_PCT75 A_PCT90 ANNUAL HOURLY PCT_RPT

rename AREA_TITLE AREA_NAME
save "data\BLS_OEWS\oesm21ma\non_MSA_2021.dta", replace
clear

///Append all Files & Save
use "data\BLS_OEWS\oesm13ma\MSA_2013.dta"
gen ICYear=2013

foreach year of numlist 14/21{
	append using `"data\BLS_OEWS\oesm`year'ma\MSA_20`year'.dta"'
	replace ICYear=`year'+2000 if ICYear==.
}

//Append non-MSA Data
foreach year of numlist 13/21{
	append using `"data\BLS_OEWS\oesm`year'ma\non_MSA_20`year'.dta"'
	replace ICYear=`year'+2000 if ICYear==.
}
order AREA AREA_NAME ICYear H_MEAN H_MEDIAN

replace AREA="11244" if AREA=="42044"
replace AREA_NAME="Anaheim-Santa Ana-Irvine, CA Metropolitan Division" if AREA_NAME=="Santa Ana-Anaheim-Irvine, CA Metropolitan Division"

replace AREA="42200" if AREA=="42060"
replace AREA_NAME="Santa Maria-Santa Barbara, CA" if AREA_NAME=="Santa Barbara-Santa Maria-Goleta, CA"

//Clean up variable names & labels
rename H_MEAN elec_wage_mean
rename H_MEDIAN elec_wage_median
label var elec_wage_mean "Mean Hourly Wage for Electricians in MSA (nominal dollars)(BLS)"
label var elec_wage_median "Median Hourly Wage for Electricians in MSA (nominal dollars)(BLS)"
replace elec_wage_mean="" if elec_wage_mean=="*"
destring elec_wage_mean, replace
replace elec_wage_median="" if elec_wage_median=="*"
destring elec_wage_median, replace

//Merced is missing data in 2019. I interpolate between the 2018 and 2020 values.
sum elec_wage_mean if (ICYear>=2018 & ICYear<=2020) & AREA_NAME=="Merced, CA"
replace elec_wage_mean=r(mean) if ICYear==2019 & AREA_NAME=="Merced, CA"

sum elec_wage_median if (ICYear>=2018 & ICYear<=2020) & AREA_NAME=="Merced, CA"
replace elec_wage_median=r(mean) if ICYear==2019 & AREA_NAME=="Merced, CA"


gen ln_elec_wage_mean=ln(elec_wage_mean)
label var ln_elec_wage_mean "ln(Mean Hourly Wage for Electricians)(nominal dollars)(BLS)"
gen ln_elec_wage_median=ln(elec_wage_median)
label var ln_elec_wage_median "ln(Mean Hourly Wage for Electricians)(nominal dollars)(BLS)"

save "data\BLS_OEWS\OEWS_Electrician_Wages.dta", replace
clear


///Convert County-MSA-Code Match File from .XLSX to .DTA
import excel "data\BLS_OEWS\county_MSA_match.xlsx", sheet("Sheet1") firstrow allstring
save "data\BLS_OEWS\county_MSA_match.dta", replace
clear