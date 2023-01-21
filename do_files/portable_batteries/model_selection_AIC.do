use "data\portable_batteries\portable_batteries.dta"

gen msrp_per_kWh=1000*msrp/Wh
gen ln_msrp_per_kWh=ln(msrp_per_kWh)

matrix AIC=J(4,4,.)
matrix colnames AIC = $ $/kWh ln($) ln($/kWh)
matrix rownames AIC = "W+Wh" "W^2+Wh^2" "ln(W)+ln(Wh)" "ln(W)^2+ln(Wh)^2"

scalar i = 1
foreach Y of varlist msrp msrp_per_kWh ln_msrp ln_msrp_per_kWh {
	qui reg `Y' W_ac Wh if W_ac!=0
	qui estat ic
	matrix AIC[1,i]=r(S)[1,5]
	scalar i = i + 1
}

scalar i = 1
foreach Y of varlist msrp msrp_per_kWh ln_msrp ln_msrp_per_kWh {
	qui reg `Y' c.W_ac##c.W_ac c.Wh##c.Wh c.Wh#c.W_ac if W_ac!=0
	qui estat ic
	matrix AIC[2,i]=r(S)[1,5]
	scalar i = i + 1
}

scalar i = 1
foreach Y of varlist msrp msrp_per_kWh ln_msrp ln_msrp_per_kWh {
	qui reg `Y' ln_W_ac ln_Wh if W_ac!=0
	qui estat ic
	matrix AIC[3,i]=r(S)[1,5]
	scalar i = i + 1
}

scalar i = 1
foreach Y of varlist msrp msrp_per_kWh ln_msrp ln_msrp_per_kWh {
	qui reg `Y' c.ln_W_ac##c.ln_W_ac c.ln_Wh##c.ln_Wh c.ln_W_ac#c.ln_Wh if W_ac!=0
	qui estat ic
	matrix AIC[4,i]=r(S)[1,5]
	scalar i = i + 1
}
scalar drop i

//Jacobian Correction to AIC for Transformed Dependent Variables
sum ln_Wh if W_ac!=0
scalar sum_ln_Wh=r(mean)*r(N)

sum ln_msrp if W_ac!=0
scalar sum_ln_msrp=r(mean)*r(N)

forvalues i = 1/4 {
	matrix AIC[`i',2]=AIC[`i',2]+2*sum_ln_Wh
}

forvalues i = 1/4 {
	matrix AIC[`i',3]=AIC[`i',3]+2*sum_ln_msrp
	matrix AIC[`i',4]=AIC[`i',4]+2*sum_ln_msrp
}

//Table of AIC Values
matlist AIC, format(%9.0f)

//Translog Model
reg ln_msrp c.ln_Wh##c.ln_Wh c.ln_W_ac##c.ln_W_ac c.ln_Wh#c.ln_W_ac, vce(robust)

clear