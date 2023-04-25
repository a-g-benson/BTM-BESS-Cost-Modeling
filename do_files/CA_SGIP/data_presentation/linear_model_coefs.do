use "data\CA_SGIP\TTS_SGIP.dta"

//estimate linear model with time-varying coefficients on training sample

qui reg TEC_2020 i.ICYear#c.kWh i.ICYear#c.kW ibn.ICYear ibn.ICYear#0.Residential if training_sample==1, vce(robust) noconstant
estat ic

//estimate linear model with time-varying coefficients over all years

reg TEC_2020 i.ICYear#c.kWh i.ICYear#c.kW ibn.ICYear ibn.ICYear#0.Residential if sample==1, vce(robust) noconstant
eststo augustineblair_2021
estat ic

//Coefplot for Alpha_R

coefplot (augustineblair_2021, keep(*.ICYear) lcolor("4 124 188") ciopts(recast(rarea) color("148 196 252%50") lwidth(none))), offset(0) vertical rename(*.ICYear = "") recast(line) lwidth(thick) graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Fixed Costs ($ × 10{superscript:3})", size(medlarge) margin(tiny)) ylabel(-20000 "-20" -10000 "-10" 0 "0" 10000 "10" 20000 "20", format(%9.0f) angle(0)) ymtick(, grid) legend(off) yline(0, lcolor(black) lwidth(thin)) name("Figure_B12", replace)
graph export "manuscript\graphs\CA_SGIP\linear_fc.pdf", as(pdf) name("Figure_B12") replace

//Coefplot for Beta 1

coefplot (augustineblair_2021, keep(*.ICYear#c.kWh) lcolor("212 172 12") ciopts(recast(rarea) color("252 212 68%50") lwidth(none))), offset(0) vertical rename(*.ICYear#c.kWh = "") recast(line) lwidth(thick) graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Energy Capacity Costs ($ × 10{superscript:3}/kWh)", size(medlarge) margin(tiny)) ylabel(-2500 "-2.5" 0 "0" 2500 "2.5" 5000 "5" 7500 "7.5" 10000 "10" 12500 "12.5" 15000 "15", format(%9.0f) angle(0)) ymtick(, grid) legend(off) yline(0, lcolor(black) lwidth(thin)) name("Figure_B13", replace)
graph export "manuscript\graphs\CA_SGIP\linear_ecc.pdf", as(pdf) name("Figure_B13") replace

//Coefplot for Beta 2

coefplot (augustineblair_2021, keep(*.ICYear#c.kW) lcolor("212 12 12") ciopts(recast(rarea) color("212 12 12%50") lwidth(none))), offset(0) vertical rename(*.ICYear#c.kW = "") recast(line) lwidth(thick) graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Power Capacity Costs ($ × 10{superscript:3}/kW)", size(medlarge) margin(tiny)) ylabel(-27500 " " -25000 "25" -22500 " " -20000 "-20" -17500 " " -15000 "-15" -12500 " " -10000 "10" -7500 " " -5000 "-5" -2500 " " 0 "0" 2500 " " 5000 "5" 7500 " ", format(%9.0f) angle(0)) ymtick(, grid) legend(off) yline(0, lcolor(black) lwidth(thin)) name("Figure_B14", replace)
graph export "manuscript\graphs\CA_SGIP\linear_pcc.pdf", as(pdf) name("Figure_B14") replace 

clear
