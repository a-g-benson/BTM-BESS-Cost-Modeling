use "data\CA_SGIP\TTS_SGIP.dta"

//Combo Graph - Model Comparison
gen TEC_2020_per_Wh=TEC_2020/(kWh*1000)
gen TEC_2020_per_kWh=TEC_2020/kWh
gen ln_TEC_2020_per_kWh=ln(TEC_2020_per_kWh)

twoway (scatter TEC_2020 kWh if sample==1, mlcolor(navy%80) msymbol(oh) legend(label(1 "Observed Values")) )(lfit TEC_2020 kWh if sample==1, lwidth(medthick) lpattern(dash) lcolor(dkorange) legend(label(2 "Line of Best Fit")) ) if sample==1, xscale(titlegap(tiny)) xtitle("kWh", size(medsmall) margin(zero)) ylabel(0 "0" 2500000 "2.5" 5000000 "5" 7500000 "7.5" 10000000 "10" 12500000 "12.5" 15000000 "15", angle(0)) ytitle("$ × 10{superscript:6}", size(medsmall) margin(tiny)) graphregion(color(white) margin(small)) bgcolor(white) legend(position(6) region(lstyle(none)))  name("Figure_4a", replace)

twoway (scatter ln_TEC_2020 kWh if sample==1, mlcolor(navy%80) msymbol(oh) legend(label(1 "Observed Values")))(lfit ln_TEC_2020 kWh if sample==1, lwidth(medthick) lpattern(dash) lcolor(dkorange) legend(label(2 "Line of Best Fit"))) if sample==1, xscale(titlegap(tiny)) xtitle("kWh", size(medsmall) margin(zero)) ylabel(7(7)35, angle(0) gmax) ytitle("ln($)", size(medsmall) margin(tiny)) graphregion(color(white) margin(small)) bgcolor(white) legend(position(6))  name("Figure_4b", replace)

twoway (scatter TEC_2020_per_Wh ln_kWh if sample==1, mlcolor(navy%80) msymbol(oh) legend(label(1 "Observed Values")))(lfit TEC_2020_per_Wh ln_kWh if sample==1, lwidth(medthick) lpattern(dash) lcolor(dkorange) legend(label(2 "Line of Best Fit"))) if sample==1, xscale(titlegap(tiny)) xtitle("ln(kWh)", size(medsmall) margin(zero)) ylabel( , angle(0)) ytitle("$/Wh", size(medsmall) margin(tiny)) graphregion(color(white) margin(small)) bgcolor(white) legend(position(6))  name("Figure_4c", replace)

twoway (scatter ln_TEC_2020 ln_kWh if sample==1, mlcolor(navy%80) msymbol(oh) legend(label(1 "Observed Values")))(lfit ln_TEC_2020 ln_kWh if sample==1, lwidth(medthick) lpattern(dash) lcolor(dkorange) legend(label(2 "Line of Best Fit"))) if sample==1, xscale(titlegap(tiny)) xtitle("ln(kWh)", size(medsmall) margin(zero)) ylabel( , angle(0)) ytitle("ln($)", size(medsmall) margin(tiny)) graphregion(color(white) margin(small)) bgcolor(white) legend(position(6))  name("Figure_4d", replace)

grc1leg Figure_4a Figure_4b Figure_4c Figure_4d, legendfrom(Figure_4a) position(12) graphregion(color(white) margin(small) lcolor(white) lwidth(large)) name("Figure_4", replace)
graph export "manuscript\graphs\CA_SGIP\LOBF_comparison.pdf", as(png) name("Figure_4") replace

clear