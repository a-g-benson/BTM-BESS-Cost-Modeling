use "data\CA_SGIP\TTS_SGIP.dta"

//Histograms of kW and kWh: base e
histogram ln_kW if sample==1, start(-1) width(0.5) frequency lcolor(black) lwidth(thin) lalign(center) yscale(range(0(2000)16000)) ylabel(0(2000)16000, format(%9.0gc) angle(0)) xlabel(-1 "`=round(exp(-1),0.01)'" 0 "`=round(exp(0),0.01)'" 1 "`=round(exp(1),0.01)'" 2 "7.39" 3 "`=round(exp(3),0.1)'" 4 "`=round(exp(4),0.1)'" 5 "`=round(exp(5),1)'" 6 "`=round(exp(6),1)'" 7 "`=round(exp(7),1)'" 9.5 "`=round(exp(9.5),1)'") xscale(titlegap(zero)) xtitle("Rated Power Output (kW)", size(large) margin(medsmall)) ytitle("Count of Observations", size(large) margin(medsmall)) graphregion(color(white) lstyle(white) margin(medium)) bgcolor(white) color(black) fcolor(navy) plotregion(m(b=1))

histogram ln_kWh if sample==1, start(0) width(0.5) frequency lcolor(black) lwidth(thin) lalign(center) yscale(range(0(1000)9000)) ylabel(0(1000)9000, format(%9.0gc) angle(0)) xlabel(0 "`=round(exp(0),0.01)'" 1 "`=round(exp(1),0.01)'" 2 "7.39" 3 "`=round(exp(3),0.1)'" 4 "`=round(exp(4),0.1)'" 5 "`=round(exp(5),1)'" 6 "`=round(exp(6),1)'" 7 "`=round(exp(7),1)'" 8 "`=round(exp(8),1)'" 10.5 "`=round(exp(10.5),1)'") xscale(titlegap(zero)) xtitle("Rated Energy Capacity (kWh)", size(large) margin(medsmall)) ytitle("Count of Observations", size(large) margin(medsmall)) graphregion(color(white) lstyle(white) margin(medium)) bgcolor(white) color(black) fcolor(navy) plotregion(m(b=1))

//Trend in Cost per kWh, Residential, Tesla vs. Everyone Else
reg cpk ibn.ICYear if sample==1 & Residential==1 & TeslaMan==1, noconstant vce(hc3)
eststo Tesla_cpk_res_trend
reg cpk ibn.ICYear if sample==1 & Residential==1 & TeslaMan==0, noconstant vce(hc3)
eststo non_Tesla_cpk_res_trend

coefplot (Tesla_cpk_res_trend, label("Tesla") lcolor("232 33 39")) (non_Tesla_cpk_res_trend, label("All Other Competitors") lcolor(purple)), offset(0) vertical rename(*.ICYear = "") recast(line) lwidth(thick) noci graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Installed Cost per kWh ($2020)", size(medlarge) margin(tiny)) ylabel(0(500)3500, format(%9.0fc) angle(0) gmax) legend(on position(12) ring(0) region(fcolor(none) lcolor(none) lwidth(none)))
graph export "manuscript1\graphs\CA_SGIP\tesla_cpk_res_trend.png", as(png) name("Graph") replace

//Tesla vs. Non-Tesla Constant Scale Cost Index
reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW ibn.ICYear if sample==1 & Residential==1 & TeslaMan==1, vce(robust) noconstant noci cformat(%9.3f)
eststo tesla_res_model

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW ibn.ICYear if sample==1 & Residential==1 & TeslaMan==0, vce(robust) noconstant noci cformat(%9.3f)
scalar base100=_b[2015.ICYear]
eststo non_tesla_res_model

coefplot (tesla_res_model, drop(StandAlone ln_kWh) transform(* = 100*@/base100) label(Tesla) lcolor("232 33 39") ciopts(recast(rarea) color(red%25) lwidth(none)))(non_tesla_res_model, drop(StandAlone ln_kWh) transform(* = 100*@/base100) label(All Other competitors) lcolor(purple) ciopts(recast(rarea) color(purple%30) lwidth(none))), offset(0) vertical rename(*.ICYear = "") recast(line) lwidth(thick) graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Constant Scale Cost Index", size(medlarge) margin(tiny)) ylabel(85(5)100, format(%9.0f) angle(0)) ymtick(82.5(2.5)102.5, grid) legend(on position(12) ring(0) region(fcolor(none) lcolor(none) lwidth(none)))
graph export "manuscript1\graphs\CA_SGIP\tesla_relative_cost.png", as(png) name("Graph") replace

//Big Graphs of Model Fit - Log Log

twoway (scatter ln_TEC_2020 ln_kW if sample==1, mlcolor(navy%80) msymbol(oh) legend(label(1 "Observed Values")))(lfit ln_TEC_2020 ln_kW if sample==1, lwidth(medthick) lpattern(dash) lcolor(dkorange) legend(label(2 "Line-of-Best-Fit"))) if sample==1, xscale(titlegap(zero)) xtitle("ln(Rated Energy Capacity in kW AC)", size(large) margin(medsmall)) ylabel( , angle(0)) ytitle("ln(Total Installed Costs)", size(large) margin(medsmall)) graphregion(color(white) margin(medium)) bgcolor(white) legend(position(6))

twoway (scatter ln_TEC_2020 ln_kWh if sample==1, mlcolor(navy%80) msymbol(oh) legend(label(1 "Observed Values")))(lfit ln_TEC_2020 ln_kWh if sample==1, lwidth(medthick) lpattern(dash) lcolor(dkorange) legend(label(2 "Line-of-Best-Fit"))) if sample==1, xscale(titlegap(zero)) xtitle("ln(Rated Energy Capacity in kWh AC)", size(large) margin(medsmall)) ylabel( , angle(0)) ytitle("ln(Total Installed Costs)", size(large) margin(medsmall)) graphregion(color(white) margin(medium)) bgcolor(white) legend(position(6))
graph export "manuscript1\graphs\CA_SGIP\ln_TEC_vs_ln_kWh.png", as(png) name("Graph") replace

//Estimate Cobb-Douglas Model of Cost

reg ln_TEC_2020 c.ln_kWh c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if sample==1, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse = e(rmse)

//Non-Linear Combination of Parameters - Marginal Cost of Energy Capacity, 5kW Residential System
//Generate Simulated Data
insobs 60

replace kW=5 in -60/L
replace ln_kW=ln(kW) in -60/L

replace duration=mod(_n*0.1,6) in -60/L
replace duration=6 if duration==0 in -60/L
sort duration in -60/L

replace kWh=kW*duration in -60/L
replace ln_kWh=ln(kWh) in -60/L

replace Residential=1 in -60/L
replace ICYear=2021 in -60/L

replace coupling=1 in -60/L
sum ln_elec_wage_median_2020 if ICYear==2021 & sample==1
replace ln_elec_wage_median_2020=r(mean) in -60/L

//Generate Predicted Average Cost & Marginal Cost, with Confidence Intervals

predictnl TC_kWh_R_2021 = exp(xb()+0.5*rmse^2)
predictnl AC_kWh_R_2021 = exp(xb()+0.5*rmse^2)/kWh in -60/L, ci(AC_lb AC_ub)
predictnl MC_kWh_R_2021 = exp(xb()+0.5*rmse^2)/kWh * _b[ln_kWh] in -60/L, ci(MC_lb MC_ub)

//Plot Graph
twoway (rarea AC_lb AC_ub duration in -60/L, fcolor(maroon%50) fintensity(inten80) lwidth(none))(rarea MC_lb MC_ub duration in -60/L, fcolor(navy%50) fintensity(inten80) lwidth(none))(line AC_kWh_R_2021 duration in -60/L, lwidth(medthick) lpattern(solid) lcolor(maroon))(line MC_kWh_R_2021 duration in -60/L, lwidth(medthick) lpattern(solid) lcolor(navy)) if duration>=1, xscale(titlegap(tiny)) xtitle( , size(medlarge)) ylabel(-500 "-$500" 0 "$0" 500 "$500" 1000 "$1,000" 1500 "$1,500" 2000 "$2,000" 2500 "$2,500" 3000 "$3,000", angle(0) format(%9.0fc)) yscale(range(-708 3000)) ytitle("Cost per kWh (2020 dollars)", size(medlarge) margin(small)) graphregion(color(white) margin(small)) bgcolor(white) legend(position(12) yoffset(-4) order(3 "Average Cost" 4 "Marginal Cost") ring(0) region(fcolor(none) lcolor(none) lwidth(none))) yline(0, lcolor(black) lwidth(thin)) name("Graph", replace)
graph export "manuscript1\graphs\CA_SGIP\residential_mc_ac_CD.png", as(png) name("Graph") replace

drop TC_kWh_R_2021 AC_kWh_R_2021 AC_lb AC_ub MC_kWh_R_2021 MC_lb MC_ub
drop in -60/L