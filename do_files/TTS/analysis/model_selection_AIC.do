use "data\TTS\TTS.dta"

sum TC_per_kW if InstallationYear_PV==2020, detail

count if InstallationYear_PV==2020

replace sample=0 if has_battery==1

//For whatever reason, the translog regression has 1 fewer observation in the sample. Not sure why. Anyways, to make sure the AIC values are comparable, all regressions need to use the same sample. So the "sample" variable is based on those observations used by this regression.
qui reghdfe ln_TC_2020 c.ln_kW_pv##c.ln_kW_pv c.ln_kW_inv##c.ln_kW_inv c.ln_kW_pv#c.ln_kW_inv if sample==1, absorb(InstallationMonth_PV state)
replace sample=e(sample)


matrix AIC=J(4,4,.)
matrix colnames AIC = $ $/kW ln($) ln($/kW)
matrix rownames AIC = kW kW^2 ln(kW) ln(kW)^2

//General Form of Model Goes Like:
//reghdfe Y X if sample==1, absorb(InstallationMonth_PV state)
// i.e. OLS with fixed effects by month and state

scalar i = 1
foreach Y of varlist TC_2020 TC_per_kW_2020 ln_TC_2020 ln_TC_per_kW_2020 {
	qui reghdfe `Y' kW_pv kW_inv if sample==1, absorb(InstallationMonth_PV state)
	qui estat ic
	matrix AIC[1,i]=r(S)[1,5]+2*e(df_a) //The number of parameters used in the AIC calculation by Stata ignores the absorbed fixed effects, so this corrects for it.
	scalar i = i + 1
}

scalar i = 1
foreach Y of varlist TC_2020 TC_per_kW_2020 ln_TC_2020 ln_TC_per_kW_2020 {
	qui reghdfe `Y' c.kW_pv##c.kW_pv c.kW_inv##c.kW_inv c.kW_pv#c.kW_inv if sample==1, absorb(InstallationMonth_PV state)
	qui estat ic
	matrix AIC[2,i]=r(S)[1,5]+2*e(df_a) //ditto as above
	scalar i = i + 1
}

scalar i = 1
foreach Y of varlist TC_2020 TC_per_kW_2020 ln_TC_2020 ln_TC_per_kW_2020 {
	qui reghdfe `Y' ln_kW_pv ln_kW_inv if sample==1, absorb(InstallationMonth_PV state)
	qui estat ic
	matrix AIC[3,i]=r(S)[1,5]+2*e(df_a) //ditto as above
	scalar i = i + 1
}

scalar i = 1
foreach Y of varlist TC_2020 TC_per_kW_2020 ln_TC_2020 ln_TC_per_kW_2020 {
	qui reghdfe `Y' c.ln_kW_pv##c.ln_kW_pv c.ln_kW_inv##c.ln_kW_inv c.ln_kW_pv#c.ln_kW_inv if sample==1, absorb(InstallationMonth_PV state)
	qui estat ic
	matrix AIC[4,i]=r(S)[1,5]+2*e(df_a) //ditto as above
	scalar i = i + 1
}

scalar drop i



//Jacobian Correction to AIC for Transformed Dependent Variables
sum ln_kW_pv if sample==1
scalar sum_ln_kW_pv=r(mean)* r(N)

sum ln_TC_2020 if sample==1
scalar sum_ln_TC_2020=r(mean)* r(N)

forvalues i = 1/4 {
	matrix AIC[`i',2]=AIC[`i',2]+2*sum_ln_kW_pv
}

forvalues i = 1/4 {
	matrix AIC[`i',3]=AIC[`i',3]+2*sum_ln_TC_2020
	matrix AIC[`i',4]=AIC[`i',4]+2*sum_ln_TC_2020
}

//Table of AIC Values
matlist AIC, format(%10.3e)
matlist AIC, format(%9.0f)

di exp((AIC[4,3]-AIC[3,3])/2)

clear