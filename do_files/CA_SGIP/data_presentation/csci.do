use "data\CA_SGIP\TTS_SGIP.dta"

////Constant-Scale Cost Index
//This file estimates baseline models of installed cost for SGIP and then plots the sector-year fixed effects.
//I normalized the sector-year fixed effects such that Residential-2016=100 and call this the "Constant-Scale Cost Index"
//This enables apples-to-apples comparisons of costs of systems of different scales.

//Cobb-Douglas, Annual Basis
reg ln_TEC_2020 ln_kWh ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear ibn.ICYear#0.Residential if training_sample==1, vce(hc3) noconstant
scalar base100=_b[2016.ICYear]
eststo residential_model
reg ln_TEC_2020 ln_kWh ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear ibn.ICYear#1.Residential if training_sample==1, vce(hc3) noconstant
eststo nonresidential_model

coefplot (residential_model, keep(*.ICYear) transform(* = 100*exp(@-base100)) label(Residential)) (nonresidential_model, keep(*.ICYear) transform(* = 100*exp(@-base100)) label(Non-Residential)), offset(0) vertical rename(*.ICYear = "") recast(line) lwidth(thick) ciopts(recast(rarea) color(%50) fintensity(inten80) lwidth(none)) graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Constant-Scale Cost Index" "(100 = 2016, Residential)", size(medlarge) margin(zero)) ylabel(50(50)150, format(%9.0f) angle(0)) ymtick(30(10)160, grid) legend(on position(2) ring(0) yoffset(-1) region(fcolor(none) lcolor(none) lwidth(none))) name("Figure_C15", replace)
graph export "manuscript\graphs\CA_SGIP\CSCI_CD.pdf", as(pdf) name("Figure_C15") replace


//Cobb-Douglas, Monthly Basis
reg ln_TEC_2020 ln_kWh ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICMonth ibn.ICMonth#0.Residential if training_sample==1, vce(hc3) noconstant
scalar base100=_b[681.ICMonth]
eststo residential_model
reg ln_TEC_2020 ln_kWh ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICMonth ibn.ICMonth#1.Residential if training_sample==1, vce(hc3) noconstant
eststo nonresidential_model

coefplot (residential_model, keep(*.ICMonth) transform(* = 100*exp(@-base100)) label(Residential)) (nonresidential_model, keep(*.ICMonth) transform(* = 100*@/base100) label(Non-Residential)), offset(0) vertical rename(*.ICMonth = "") recast(line) lwidth(thick) noci graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Constant Scale Cost Index", size(medlarge) margin(tiny)) ylabel(30(10)200, format(%9.0f) angle(0)) ymtick(30(10)200, grid) legend(on position(2) ring(0) region(fcolor(none) lcolor(none) lwidth(none)))

//Translog, Annual Basis
reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear ibn.ICYear#0.Residential if training_sample==1, vce(hc3) noconstant
scalar base100=_b[2016.ICYear]
eststo residential_model
reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear ibn.ICYear#1.Residential if training_sample==1, vce(hc3) noconstant
eststo nonresidential_model

coefplot (residential_model, keep(*.ICYear) transform(* = 100*exp(@-base100)) label(Residential)) (nonresidential_model, keep(*.ICYear) transform(* = 100*exp(@-base100)) label(Non-Residential)), offset(0) vertical rename(*.ICYear = "") recast(line) lwidth(thick) ciopts(recast(rarea) color(%50) fintensity(inten80) lwidth(none)) graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Constant-Scale Cost Index" "(100 = 2016, Residential)", size(medlarge) margin(zero)) ylabel(50(50)150, format(%9.0f) angle(0)) ymtick(30(10)160, grid) legend(on position(2) ring(0) yoffset(-1) region(fcolor(none) lcolor(none) lwidth(none))) name("Figure_5", replace)
graph export "manuscript\graphs\CA_SGIP\CSCI_TL.pdf", as(pdf) name("Figure_5") replace

//Translog, Annual Basis, Residential Only, Tesla vs. Non-Tesla
reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear ICYear#0.TeslaMan if training_sample==1 & Residential==1, vce(robust) noconstant
eststo tesla_model
scalar base100=_b[2016.ICYear]

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear ICYear#1.TeslaMan if training_sample==1 & Residential==1, vce(robust) noconstant
eststo non_tesla_model

coefplot (non_tesla_model, keep(*.ICYear) transform(* = 100*exp(@-base100)) label("All Others") lcolor(none) ciopts(recast(rarea) color(gold%50) fintensity(inten80) lwidth(none)))(tesla_model, keep(*.ICYear) transform(* = 100*exp(@-base100)) label(Tesla) lcolor(none) ciopts(recast(rarea) color("232 33 39%50") fintensity(inten80) lwidth(none)))(non_tesla_model, keep(*.ICYear) transform(* = 100*exp(@-base100)) label("All Others") lcolor(gold) noci)(tesla_model, keep(*.ICYear) transform(* = 100*exp(@-base100)) label(Tesla) lcolor("232 33 39") noci), offset(0) vertical rename(*.ICYear = "") recast(line) lwidth(thick) graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Constant-Scale Cost Index" "(100 = 2016, Residential, Tesla)", size(medlarge) margin(zero)) ylabel(50(50)250, format(%9.0f) angle(0)) ymtick(20(10)250, grid) legend(order(6 5) position(2) ring(0) yoffset(-3.5) region(fcolor(none) lcolor(none) lwidth(none))) name("Figure_6", replace)
graph export "manuscript\graphs\CA_SGIP\CSCI_by_mfr.pdf", as(pdf) name("Figure_6") replace

//Translog, Monthly Basis, Residential Only, Tesla % Cost Advantage
reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICMonth ICMonth#1.TeslaMan if training_sample==1 & Residential==1, vce(robust) noconstant
eststo non_tesla_model

coefplot (non_tesla_model, omitted keep(*.ICMonth#1.TeslaMan) transform(* = (exp(@)-1)*100) msymbol(none) noci)(non_tesla_model, keep(*.ICMonth#1.TeslaMan) transform(* = (exp(@)-1)*100) ciopts(color("232 33 39"))), offset(0) vertical mcolor("232 33 39") graphregion(color(white) margin(l=1 t=1 b=1 r=1)) plotregion(color(white) margin(b=0)) bgcolor(white) legend(off) xlabel(1 "2014" 13 "2015" 25 "2016" 37 "2017" 49 "2018" 61 "2019" 73 "2020" 85 "2021", custom) ylabel(-100 "-100%" -75 "-75%" -50 "-50%" -25 "25%" 0 "0%" 25 "25%" 50 "50%", format(%9.0g) angle(0)) yline(0, lcolor(black) lwidth(thin)) xline(34, lcolor(navy) lpattern(dash)) text(-88 33 "Powerwall 2" "Announced", placement(w) color(navy)) name("Figure_7", replace) 
graph export "manuscript\graphs\CA_SGIP\TSLA_cost_adv.pdf", as(pdf) name("Figure_7") replace

clear