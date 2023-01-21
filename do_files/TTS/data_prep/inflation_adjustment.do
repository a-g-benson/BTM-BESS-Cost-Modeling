//The inflation data are imported with the code for SGIP.
//However, if you care to run it again, here it is:

// freduse PCEPI
// gen ICMonth=mofd(daten)
// gen ICYear=yofd(daten)
// drop date daten

// sum PCEPI if ICYear==2020
// scalar PCEPI_2020=r(mean)

// gen inflation_factor=PCEPI_2020/PCEPI
// label var inflation_factor "Factor for Inflation-Adjustment to year 2020 dollars"

// save "data\Macroeconomic_Data\inflation_adjustment.dta", replace
// clear

gen ___Money_2020___ = .
label var ___Money_2020___ "~ ~ (Montetary Values in 2020 Dollars) ~ ~"

gen ICMonth = InstallationMonth_PV

merge m:1 ICMonth using "data\Macroeconomic_Data\inflation_adjustment.dta", keep(match master) keepusing(PCEPI inflation_factor) nogenerate

drop ICMonth

generate TC_2020=TC*inflation_factor
label var TC_2020 "Total Installed Cost (2020 dollars)"

generate ln_TC_2020=ln(TC_2020)
label var ln_TC_2020 "ln(Total Installed Cost) (2020 dollars)"

generate ihs_TC_2020=asinh(TC_2020)
label var ihs_TC_2020 "asinh(Total Installed Cost) (2020 dollars)"


generate subsidy_2020=subsidy*inflation_factor
label var subsidy_2020 "Rebate, Grant, or other Subsidy (2020 dollars)"

generate ln_subsidy_2020=ln(subsidy_2020)
label var ln_subsidy_2020 "ln(Rebate, Grant, or other Subsidy) (2020 dollars)"

generate ihs_subsidy_2020=asinh(subsidy_2020)
label var ihs_subsidy_2020 "asinh(Rebate, Grant, or other Subsidy) (2020 dollars)"


generate TC_per_kW_2020=TC_per_kW*inflation_factor
label var TC_per_kW_2020 "Cost per kW (2020 dollars)"

generate ln_TC_per_kW_2020=ln(TC_per_kW_2020)
label var ln_TC_per_kW_2020 "ln(Cost per kW) (2020 dollars)"

generate ihs_TC_per_kW_2020=asinh(TC_per_kW_2020)
label var ihs_TC_per_kW_2020 "asinh(Cost per kW) (2020 dollars)"