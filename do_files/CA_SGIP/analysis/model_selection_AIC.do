use "data\CA_SGIP\TTS_SGIP.dta"

gen TEC_2020_per_kWh=TEC_2020/kWh
gen ln_TEC_2020_per_kWh=ln(TEC_2020_per_kWh)


matrix AIC=J(4,4,.)
matrix colnames AIC = $ $/kWh ln($) ln($/kWh)
matrix rownames AIC = "kWh & kW" "kWh^2 & kW^2" "ln(kWh) & ln(kW)" "ln(kWh)^2 & ln(kW)^2"

//General Form of Model Goes Like:
//reghdfe Y X if sample==1, absorb(ICYear#Residential)

local i = 1
foreach Y of varlist TEC_2020 TEC_2020_per_kWh ln_TEC_2020 ln_TEC_2020_per_kWh {
	qui reghdfe `Y' kW kWh if training_sample==1, absorb(ICYear#Residential)
	qui estat ic
	matrix AIC[1,`i']=r(S)[1,5]+2*e(df_a) //The number of parameters used in the AIC calculation by Stata ignores the absorbed fixed effects, so this corrects for it.
	local i = `i' + 1
	di `i'
}

local i = 1
foreach Y of varlist TEC_2020 TEC_2020_per_kWh ln_TEC_2020 ln_TEC_2020_per_kWh {
	qui reghdfe `Y' c.kW##c.kW c.kWh##c.kWh c.kWh#c.kW if training_sample==1, absorb(ICYear#Residential)
	qui estat ic
	matrix AIC[2,`i']=r(S)[1,5]+2*e(df_a) //ditto as above
	local i = `i' + 1
	di `i'
}

local i = 1
foreach Y of varlist TEC_2020 TEC_2020_per_kWh ln_TEC_2020 ln_TEC_2020_per_kWh {
	qui reghdfe `Y' ln_kW ln_kWh if training_sample==1, absorb(ICYear#Residential)
	qui estat ic
	matrix AIC[3,`i']=r(S)[1,5]+2*e(df_a) //ditto as above
	local i = `i' + 1
	di `i'
}

local i = 1
foreach Y of varlist TEC_2020 TEC_2020_per_kWh ln_TEC_2020 ln_TEC_2020_per_kWh {
	qui reghdfe `Y' c.ln_kW##c.ln_kW c.ln_kWh##c.ln_kWh c.ln_kWh#c.ln_kW if training_sample==1, absorb(ICYear#Residential)
	qui estat ic
	matrix AIC[4,`i']=r(S)[1,5]+2*e(df_a) //ditto as above
	local i = `i' + 1
	di `i'
}

//Jacobian Correction to AIC for Transformed Dependent Variables
sum ln_kWh if training_sample==1
scalar sum_ln_kWh=r(mean)* r(N)

sum ln_TEC_2020 if training_sample==1
scalar sum_ln_TEC_2020=r(mean)* r(N)

forvalues i = 1/4 {
	matrix AIC[`i',2]=AIC[`i',2]+2*sum_ln_kWh
}

forvalues i = 1/4 {
	matrix AIC[`i',3]=AIC[`i',3]+2*sum_ln_TEC_2020
	matrix AIC[`i',4]=AIC[`i',4]+2*sum_ln_TEC_2020
}


matlist AIC, format(%9.2e)

//Model Comparable to Augustine and Blair (2021) ("Storage Futures Study")
reghdfe TEC_2020 c.kW#i.ICYear c.kWh#i.ICYear if training_sample==1, absorb(ICYear#Residential)
qui estat ic
scalar BA_AIC=r(S)[1,5]+2*e(df_a)
di BA_AIC

//Probability that Augstine-Blair reduces information loss compared to Translog
di exp((AIC[4,3]-BA_AIC)/2)


//Probablity that Translog reduces Information Loss compared to Cobb-Douglas
di exp((AIC[4,3]-AIC[3,3])/2)

//Comparison of Cobb-Douglas and Translog within most common durations
//Cobb-Douglas
reg ln_TEC_2020 ln_kWh ln_kW ICYear#Residential if training_sample==1 & duration<2.65 & duration>1.698
estat ic

//Translog
reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW ICYear#Residential if training_sample==1 & duration<2.65 & duration>1.698
estat ic

clear