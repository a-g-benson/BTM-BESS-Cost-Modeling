use "data\CA_SGIP\TTS_SGIP.dta" 

//Estimate Translog Model of Cost

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if training_sample==1, vce(robust) noconstant noci cformat(%9.3f)
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
sum ln_elec_wage_median_2020 if ICYear==2021 & training_sample==1
replace ln_elec_wage_median_2020=r(mean) in -60/L

//Generate Predicted Average Cost & Marginal Cost, with Confidence Intervals
predictnl TC_kWh_R_2021 = exp(xb()+0.5*rmse^2)
predictnl AC_kWh_R_2021 = exp(xb()+0.5*rmse^2)/kWh in -60/L, ci(AC_lb AC_ub)
predictnl MC_kWh_R_2021 = exp(xb()+0.5*rmse^2)/kWh * [_b[ln_kWh]+2*_b[c.ln_kWh#c.ln_kWh]*ln_kWh+_b[c.ln_kWh#c.ln_kW]*ln_kW] in -60/L, ci(MC_lb MC_ub)

//Plot Graph
twoway (rarea AC_lb AC_ub duration in -60/L, fcolor(maroon%50) fintensity(inten80) lwidth(none))(rarea MC_lb MC_ub duration in -60/L, fcolor(navy%50) fintensity(inten80) lwidth(none))(line AC_kWh_R_2021 duration in -60/L, lwidth(thick) lpattern(solid) lcolor(maroon))(line MC_kWh_R_2021 duration in -60/L, lwidth(thick) lpattern(solid) lcolor(navy)) if duration>=1, xscale(titlegap(tiny)) xtitle( , size(medlarge)) ylabel(-1000 "-$1000" -500 "-$500" 0 "$0" 500 "$500" 1000 "$1,000" 1500 "$1,500" 2000 "$2,000" 2500 "$2,500" 3000 "$3,000", angle(0) format(%9.0fc)) ytitle("Cost per kWh (2020 dollars)", size(medlarge) margin(small)) graphregion(color(white) margin(small)) bgcolor(white) legend(position(12) yoffset(-5) order(3 "Average Cost" 4 "Marginal Cost") ring(0) region(fcolor(none) lcolor(none) lwidth(none))) yline(0, lcolor(black) lwidth(thin)) name("Figure_8a", replace)
graph export "manuscript\graphs\CA_SGIP\residential_mc_ac.pdf", as(pdf) name("Figure_8a") replace

//clear simulated data
drop TC_kWh_R_2021 AC_kWh_R_2021 AC_lb AC_ub MC_kWh_R_2021 MC_lb MC_ub
drop in -60/L

//Non-Linear Combination of Parameters - Marginal Cost of Energy Capacity, 10/100/1000kW Non-Residential System

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if training_sample==1, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse = e(rmse)

//Generate Simulated Data
insobs 180

replace kW=10 in -180/-121
replace kW=100 in -120/-61
replace kW=1000 in -60/L
replace ln_kW=ln(kW) in -180/L

replace duration=mod(_n*0.1,6) in -180/L
replace duration=6 if duration==0 in -180/L
sort kW duration in -180/L

replace kWh=kW*duration in -180/L
replace ln_kWh=ln(kWh) in -180/L

replace Residential=0 in -180/L
replace ICYear=2021 in -180/L

replace coupling=1 in -180/L
sum ln_elec_wage_median_2020 if ICYear==2021 & training_sample==1
replace ln_elec_wage_median_2020=r(mean) in -180/L

//Generate Predicted Average Cost & Marginal Cost, with Confidence Intervals
predictnl TC_kWh_NR_2021 = exp(xb()+0.5*rmse^2) in -180/L
predictnl AC_kWh_NR_2021 = exp(xb()+0.5*rmse^2)/kWh in -180/L, ci(AC_lb AC_ub)
predictnl MC_kWh_NR_2021 = exp(xb()+0.5*rmse^2)/kWh * [_b[ln_kWh]+2*_b[c.ln_kWh#c.ln_kWh]*ln_kWh+_b[c.ln_kWh#c.ln_kW]*ln_kW] in -180/L, ci(MC_lb MC_ub)

//Plot Graphs
//AC & MC for 1MW battery
twoway (rarea AC_lb AC_ub duration in -60/L, fcolor(maroon%50) fintensity(inten80) lwidth(none))(rarea MC_lb MC_ub duration in -60/L, fcolor(navy%50) fintensity(inten80) lwidth(none))(line AC_kWh_NR_2021 duration in -60/L, lwidth(thick) lpattern(solid) lcolor(maroon))(line MC_kWh_NR_2021 duration in -60/L, lwidth(thick) lpattern(solid) lcolor(navy)) if duration>=1, xscale(titlegap(tiny)) xtitle( , size(medlarge)) ylabel(-500 "-$500" 0 "$0" 500 "$500" 1000 "$1,000" 1500 "$1,500" 2000 "$2,000" 2500 "$2,500", angle(0) format(%9.0fc)) ytitle("Cost per kWh (2020 dollars)", size(medlarge) margin(small)) graphregion(color(white) margin(small)) bgcolor(white) legend(position(12) yoffset(-3) order(3 "Average Cost" 4 "Marginal Cost") ring(0) region(fcolor(none) lcolor(none) lwidth(none))) yline(0, lcolor(black) lwidth(thin)) name("Figure_8b", replace)
graph export "manuscript\graphs\CA_SGIP\non_residential_mc_ac.pdf", as(pdf) name("Figure_8b") replace

//MC for 10 kW, 100 kW, 1 MW battery
twoway (rarea MC_lb MC_ub duration in -180/-121, fcolor("0 128 255%50") fintensity(inten80) lwidth(none))(rarea MC_lb MC_ub duration in -120/-61, fcolor("0 76 180%50") fintensity(inten80) lwidth(none))(rarea MC_lb MC_ub duration in -60/L, fcolor(navy%50) fintensity(inten80) lwidth(none))(line MC_kWh_NR_2021 duration in -180/-121, lwidth(thick) lpattern(solid) lcolor("0 128 255"))(line MC_kWh_NR_2021 duration in -120/-61, lwidth(thick) lpattern(solid) lcolor("0 76 180"))(line MC_kWh_NR_2021 duration in -60/L, lwidth(thick) lpattern(solid) lcolor(navy)) if duration>=1, xscale(titlegap(tiny)) xtitle( , size(medlarge)) ylabel(-1000 "-$1,000" -500 "-$500" 0 "$0" 500 "$500" 1000 "$1,000" 1500 "$1,500" 2000 "$2,000" 2500 "$2,500" 3000 "$3,000", angle(0) format(%9.0fc)) ytitle("Cost per kWh (2020 dollars)", size(medlarge) margin(small)) graphregion(color(white) margin(small)) bgcolor(white) legend(position(4) xoffset(0) yoffset(1.25) rows(3) order(4 "10 kW" 5 "100 kW" 6 "1 MW") ring(0) region(fcolor(none) lcolor(none) lwidth(none))) yline(0, lcolor(black) lwidth(thin)) name("Figure_9", replace)
graph export "manuscript\graphs\CA_SGIP\non_residential_mc_by_size.pdf", as(pdf) name("Figure_9") replace

clear