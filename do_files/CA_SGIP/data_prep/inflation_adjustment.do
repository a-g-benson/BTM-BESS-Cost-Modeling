gen ___Money_2020___ = .
label var ___Money_2020___ "~ ~ (Montetary Values in 2020 Dollars) ~ ~"

merge m:1 ICMonth using "data\Macroeconomic_Data\inflation_adjustment.dta", keep(match master) keepusing(PCEPI inflation_factor) nogenerate

generate TI_2020=TI*inflation_factor
label var TI_2020 "Total Incentive Funding (2020 dollars)"

generate ln_TI_2020=ln(TI_2020)
label var ln_TI_2020 "ln(Total Incentive Funding) (2020 dollars)"

generate TEC_2020=TEC*inflation_factor
label var TEC_2020 "Total Eligible Cost (2020 dollars)"

generate ln_TEC_2020=ln(TEC_2020)
label var ln_TEC_2020 "ln(Total Eligible Cost) (2020 dollars)"

order ___Money_2020___ PCEPI inflation_factor TI_2020 ln_TI_2020 TEC_2020 ln_TEC_2020, after(ln_TEC)

generate PCPI_2020=PCPI*inflation_factor
label var PCPI_2020 "County Per Capita Personal Income (2020 dollars)"
generate ln_PCPI_2020=ln(PCPI_2020)
label var ln_PCPI_2020 "ln(County Per Capita Personal Income) (2020 dollars)"

order PCPI_2020 ln_PCPI_2020, after(ln_PCPI)

generate elec_wage_mean_2020=elec_wage_mean*inflation_factor
label var elec_wage_mean_2020 "Mean Hourly Wage for Electricians (2020 dollars)"
gen ln_elec_wage_mean_2020=ln(elec_wage_mean_2020)
label var ln_elec_wage_mean_2020 "ln(Mean Hourly Wage for Electricians)(2020 dollars)"

generate elec_wage_median_2020=elec_wage_median*inflation_factor
label var elec_wage_median_2020 "median Hourly Wage for Electricians (2020 dollars)"
gen ln_elec_wage_median_2020=ln(elec_wage_median_2020)
label var ln_elec_wage_median_2020 "ln(median Hourly Wage for Electricians)(2020 dollars)"

order elec_wage_mean_2020 ln_elec_wage_mean_2020 elec_wage_median_2020 ln_elec_wage_median_2020, after(ln_elec_wage_median)