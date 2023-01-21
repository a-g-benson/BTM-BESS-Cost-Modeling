use "data\CA_SGIP\TTS_SGIP.dta"

//simulated Observations
count
scalar real_obs_N=r(N)

insobs 1000

replace kW=_n-real_obs_N in -1000/L
replace ln_kW=ln(kW) in -1000/L

replace kWh=kW*2.64 in -1000/L
replace ln_kWh=ln(kWh) in -1000/L

replace Residential=0 in -1000/L
replace ICYear=2021 in -1000/L

replace coupling=1 in -1000/L
sum ln_elec_wage_median_2020 if ICYear==2021 & sample==1
replace ln_elec_wage_median_2020=r(mean) in -1000/L

replace ManufacturerCode=306 in -60/L

//Estimate Translog Model of Cost

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if sample==1, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse_TL=e(rmse)

predictnl AC_kWh_NR_2021_TL = exp(xb()+0.5*rmse_TL^2)/kWh in -1000/L, ci(AC_TL_lb AC_TL_ub)

replace Residential=1 in -1000/L
predictnl AC_kWh_R_2021_TL = exp(xb()+0.5*rmse_TL^2)/kWh in -1000/L, ci(AC_R_TL_lb AC_R_TL_ub)

//Estimate Cobb-Douglas Model of Cost

reg ln_TEC_2020 ln_kWh ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if sample==1, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse_CD=e(rmse)

predictnl AC_kWh_NR_2021_CD = exp(xb()+0.5*rmse_CD^2)/kWh in -1000/L, ci(AC_CD_lb AC_CD_ub)

//Plot Graph

gen log10_kW=ln(kW)/ln(10)

twoway (rarea AC_TL_lb AC_TL_ub log10_kW, fcolor(maroon%60) lwidth(none))(line AC_kWh_NR_2021_TL log10_kW, lcolor(maroon) lwidth(thick))(rarea AC_R_TL_lb AC_R_TL_ub log10_kW if log10_kW<ln(40)/ln(10), fcolor(navy%60) lwidth(none))(line AC_kWh_R_2021_TL log10_kW if log10_kW<ln(40)/ln(10), lcolor(navy) lwidth(thick)) in -1000/L, legend(position(1) yoffset(-4) order(2 "Non-Residential" 4 "Residential") ring(0) region(fcolor(none) lcolor(none) lwidth(none))) yscale(range(0 2000)) ylabel(0 "$0" 250 "$250" 500 "$500" 750 "$750" 1000 "$1,000" 1250 "$1,250" 1500 "$1,500" 1750 "$1,750" 2000 "$2,000", angle(0)) ytitle("Average Total Cost per kWh (2020 dollars)", size(medlarge)) xlabel(0 "1 kW" 1 "10 kW" 2 "100 kW" 3 "1 MW") xtitle("") plotregion(m(b=0)) graphregion(color(white) margin(l=1 t=1 r=3 b=1)) bgcolor(white) name("Figure_10", replace)
graph export "manuscript\graphs\CA_SGIP\EOS.pdf", as(pdf) name("Figure_10") replace


//List Estimated Cost per kWh for Table
format AC_kWh_R_2021_TL AC_kWh_NR_2021_TL %9.0f
list kW AC_kWh_R_2021_TL AC_kWh_NR_2021_TL if kW==1 | kW==10 | kW==100 | kW==1000 in -1000/L

//Compute Percentage Reductions per Order-of-Magnitude Increase in System Size (Translog) and standard errors

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if sample==1, vce(robust) noconstant noci cformat(%9.3f)

nlcom (10^(_b[ln_kWh]+_b[ln_kW]-1+(_b[c.ln_kWh#c.ln_kWh]+_b[c.ln_kW#c.ln_kW]+_b[c.ln_kWh#c.ln_kW])*ln(10)+(2*_b[c.ln_kWh#c.ln_kWh]+_b[c.ln_kWh#c.ln_kW])*ln(2.64)+(2*_b[c.ln_kW#c.ln_kW]+_b[c.ln_kWh#c.ln_kW])*ln(1))-1)*100, cformat(%9.1f)
di round(invnormal(0.975)*sqrt(r(V)[1,1]),0.1)
nlcom (10^(_b[ln_kWh]+_b[ln_kW]-1+(_b[c.ln_kWh#c.ln_kWh]+_b[c.ln_kW#c.ln_kW]+_b[c.ln_kWh#c.ln_kW])*ln(10)+(2*_b[c.ln_kWh#c.ln_kWh]+_b[c.ln_kWh#c.ln_kW])*ln(26.4)+(2*_b[c.ln_kW#c.ln_kW]+_b[c.ln_kWh#c.ln_kW])*ln(10))-1)*100, cformat(%9.1f)
di round(invnormal(0.975)*sqrt(r(V)[1,1]),0.1)
nlcom (10^(_b[ln_kWh]+_b[ln_kW]-1+(_b[c.ln_kWh#c.ln_kWh]+_b[c.ln_kW#c.ln_kW]+_b[c.ln_kWh#c.ln_kW])*ln(10)+(2*_b[c.ln_kWh#c.ln_kWh]+_b[c.ln_kWh#c.ln_kW])*ln(264)+(2*_b[c.ln_kW#c.ln_kW]+_b[c.ln_kWh#c.ln_kW])*ln(100))-1)*100, cformat(%9.1f)
di round(invnormal(0.975)*sqrt(r(V)[1,1]),0.1)


//double-checking the above to be sure there are no arithmetic errors

di 100*round(AC_kWh_NR_2021_TL[_N-990]/AC_kWh_NR_2021_TL[_N-999]-1,0.001)
di 100*round(AC_kWh_NR_2021_TL[_N-900]/AC_kWh_NR_2021_TL[_N-990]-1,0.001)
di 100*round(AC_kWh_NR_2021_TL[_N-000]/AC_kWh_NR_2021_TL[_N-900]-1,0.001)

clear