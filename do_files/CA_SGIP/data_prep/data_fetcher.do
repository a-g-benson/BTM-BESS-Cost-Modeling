///// To run the analysis with the latest SGIP data, follow these instructions:
// 1. Go to: https://www.selfgenca.com/home/resources/
// 		Scroll down and click on "Reports" to expand the menu.
// 		Click on "Real-Time Public Report" to download the latest data.
//		Your downloaded file should have a name like "sgip_public_export_20YY-MM-DD.csv".
//
// 2. Place the downloaded file in: ~\BESS_Cost_Analysis_replication\data\CA_SGIP".
//
// 3. Open sgip_public_export_20YY-MM-DD.csv in Excel (or similar software) and edit cell AG628:
//   	This cell contains a line break that interferes with the data import process.
// 		Delete all text in this cell (especially the line break) except for "Tecogen" (without quotes).
// 		If in the future the absolute reference AG628 does not identify a cell matching this description,
// 		run a ctrl+f search for "Thermo Power Corporation" to find the problematic cell to edit.
//
// 4. With the file still open in Excel, remove commas:
//		4A. Convert the format of Columns Q, R, S, V, and W to "Number."
//		(The "Currency" format interferes with Stata's ability to correctly identify delimiters.)
//		4B. Highlight the entire sheet and run a search and replace on all commas, replacing them with nothing.
// 		4C. Save your edits to the .csv file (do not convert to .xlsx) and then close Excel.
//
// 5. Edit the name of the .csv file on line 27 of this .do file to update the date corresponding to your file.
//
///// If you want to replicate Benson (2023) exactly, do not edit anything. Proceed immediately with the code below.

import delimited "data\CA_SGIP\sgip_public_export_2023-01-04.csv", varnames(1) case(preserve) bindquote(loose)

save "data\CA_SGIP\SGIP_raw.dta", replace
clear

do "do_files\CA_SGIP\data_prep\county_data.do"

do "do_files\CA_SGIP\data_prep\county_wages_bls.do"

freduse PCEPI
gen ICMonth=mofd(daten)
gen ICYear=yofd(daten)
drop date daten

if _N < 768 {
	di "December 2022 data not yet released"
	format ICMonth %tm
	tsset ICMonth, delta(1 month)
	gen ln_PCEPI=ln(PCEPI)
	sum d.ln_PCEPI if ICYear==2022
	scalar monthly_inflation_2022=r(mean)
	insobs 1
	replace ICYear=2022 in 768
	replace ICMonth=755 in 768
	sort ICMonth
	replace PCEPI=L.PCEPI*(1+monthly_inflation_2022) in 768
	drop ln_PCEPI
}



sum PCEPI if ICYear==2020
scalar PCEPI_2020=r(mean)

gen inflation_factor=PCEPI_2020/PCEPI
label var inflation_factor "Factor for Inflation-Adjustment to year 2020 dollars"

save "data\Macroeconomic_Data\inflation_adjustment.dta", replace
clear