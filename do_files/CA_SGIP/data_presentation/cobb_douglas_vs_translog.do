use "data\CA_SGIP\TTS_SGIP.dta"

//Cobb-Douglas
reghdfe ln_TEC c.ln_kWh c.ln_kW if sample==1, absorb(ICYear#Residential) vce(robust) resid
predict CD_resid, r

twoway (scatter CD_resid duration if sample==1, mlcolor(navy%80) msymbol(oh) legend(off label(1 "Residuals")))(lowess CD_resid duration if sample==1, bwidth(0.25) lwidth(medthick) lpattern(solid) lcolor(dkorange) legend(label(2 "Line-of-Best-Fit"))) if sample==1, xlabel(0(1)6) xscale(titlegap(tiny)) xtitle("Discharge Duration (hours)", size(large) margin(zero)) ylabel( , angle(0)) ytitle("Residual (log cost)", size(large) margin(medsmall)) graphregion(color(white) margin(medsmall)) bgcolor(white) legend(position(6)) name("Figure_B11a", replace)
graph export "manuscript\graphs\CA_SGIP\cobb_douglas_resids.pdf", as(pdf) name("Figure_B11a") replace


//Translog
reghdfe ln_TEC c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW if sample==1, absorb(ICYear#Residential) vce(robust) resid
predict TL_resid, r

twoway (scatter TL_resid duration if sample==1, mlcolor(navy%80) msymbol(oh) legend(off label(1 "Residuals")))(lowess TL_resid duration if sample==1, bwidth(0.25) lwidth(medthick) lpattern(solid) lcolor(dkorange) legend(label(2 "Line-of-Best-Fit"))) if sample==1, xlabel(0(1)6) xscale(titlegap(tiny)) xtitle("Discharge Duration (hours)", size(large) margin(zero)) ylabel( , angle(0)) ytitle("Residual (log cost)", size(large) margin(medsmall)) graphregion(color(white) margin(medsmall)) bgcolor(white) legend(position(6)) name("Figure_B11b", replace)
graph export "manuscript\graphs\CA_SGIP\translog_resids.pdf", as(pdf) name("Figure_B11b") replace 

clear