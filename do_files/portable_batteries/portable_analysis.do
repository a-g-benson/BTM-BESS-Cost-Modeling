use "data\portable_batteries\portable_batteries.dta"


//Scaling Parameters

reghdfe ln_msrp ln_Wh ln_W_ac, vce(robust) noabsorb noci cformat(%9.3g)
eststo model_no_FEs
reghdfe ln_msrp ln_Wh ln_W_ac, vce(robust) absorb(Chemistry) noconstant noci cformat(%9.3g)
eststo model_chem_FEs
reghdfe ln_msrp ln_Wh ln_W_ac, vce(robust) absorb(Manufacturer) noconstant noci cformat(%9.3g)
eststo model_mfgr_FEs

esttab model_no_FEs model_chem_FEs model_mfgr_FEs, nostar se(%9.2g) drop(_cons) nomtitles tex

qui reghdfe ln_msrp ln_Wh ln_W_ac, vce(robust) noabsorb
lincom _b[ln_Wh]+_b[ln_W_ac]
di invttail(69-5,.025)*r(se)
test _b[ln_Wh]+_b[ln_W_ac]=1

qui reghdfe ln_msrp ln_Wh ln_W_ac, vce(robust) absorb(Chemistry) noconstant
lincom _b[ln_Wh]+_b[ln_W_ac]
di invttail(69-5,.025)*r(se)
test _b[ln_Wh]+_b[ln_W_ac]=1

qui reghdfe ln_msrp ln_Wh ln_W_ac, vce(robust) absorb(Manufacturer)
lincom _b[ln_Wh]+_b[ln_W_ac]
di invttail(69-5,.025)*r(se)
test _b[ln_Wh]+_b[ln_W_ac]=1


//Predicted Cost of Portable Batteries the Size of a Tesla Powerwall (not in paper, I just thought it was fun)
insobs 3
replace Chemistry = 1 in 76
replace Chemistry = 2 in 77
replace Chemistry = 3 in 78
replace ACOutput = 1 in 76/78
replace W_ac = 5000 in 76/78
replace Wh = 13500 in 76/78
replace ln_Wh=ln(Wh)
replace ln_W_ac=ln(W_ac)

reg ln_msrp ln_Wh ln_W_ac ibn.Chemistry, vce(hc3) noconstant
predict ln_msrp_hat, xb
gen msrp_hat=exp(ln_msrp_hat+0.5*e(rmse)^2)

list Chemistry W_ac Wh msrp_hat in 76/78

clear