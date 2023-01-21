//This code fetches data from the American Community Survey regarding median household income and population, by county.

forvalues year = 2013/2021{
	display("Now processing `year'...")
	
	censusapi, url(https://api.census.gov/data/`year'/acs/acs5?get=NAME,B19013_001E,B01001_001E&for=county:*&in=state:06) destination("data\ACS_Data/`year'.txt")

	replace name=strupper(substr(name,1,strlen(name)-19))
	rename name County
	label var County "County"

	rename b19013_001e MedHHInc
	label var MedHHInc "County Median Household Income (ACS 5-Year Estimates)"
	rename b01001_001e CountyPop
	label var CountyPop "County Population"
	drop state county

	gen Year=`year'

	order County Year CountyPop MedHHInc

	save "data\ACS_Data/`year'.dta", replace
	clear

}

use "data\ACS_Data\2013.dta"
forvalues year = 2014/2021{
	append using "data\ACS_Data/`year'.dta"
}

rename Year ICYear
save "data\ACS_Data\acs_data.dta", replace
clear

//This file extracts and reshapes data from the BEA regarding personal per capita income and population, by county.

import delimited "C:\Users\agbenso\Desktop\BESS_Cost_Analysis\data\CAINC1\CAINC1_CA_1969_2020.csv", delimiter(comma) varnames(1) 

drop in 178/181
drop if geoname=="California"
replace geoname=strupper(substr(geoname,1,strlen(geoname)-4))
rename geoname County

drop geofips region tablename linecode industryclassification unit

reshape long v, i(County description) j(year)
replace year=year+1960

replace description="PCPI" if description=="Per capita personal income (dollars) 2/"
replace description="PI" if description=="Personal income (thousands of dollars)"
replace description="Pop" if description=="Population (persons) 1/"

encode description, gen(var)
drop description

reshape wide v, i(County year) j(var)
rename v1 PCPI
label var PCPI "County Per Capita Personal Income (nominal dollars)"
rename v2 PI
label var PI "County Personal income (thousands of nominal dollars)"
rename v3 Pop
label var Pop "County Population (persons)"

rename year ICYear

save "data\CAINC1\CAINC1_CA.dta", replace
clear