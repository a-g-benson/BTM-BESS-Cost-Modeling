use "data\CA_SGIP\TTS_SGIP.dta"

//Trend in Cost per kWh, Residential
gen cpk=TEC_2020/kWh

reg cpk ibn.ICYear if sample==1 & Residential==1, noconstant vce(hc3)
eststo cpk_res_trend
reg kWh ibn.ICYear if sample==1 & Residential==1, noconstant vce(hc3)
eststo kWh_res_trend

coefplot (cpk_res_trend, label("Cost") lcolor(green)) (kWh_res_trend, axis(2) label("System Size") lcolor(dkorange)), offset(0) vertical rename(*.ICYear = "") recast(line) lwidth(thick) noci graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Installed Cost per kWh ($2020)", size(medlarge) margin(tiny)) ylabel(0 "$0" 500 "$500" 1000 "$1,000" 1500 "$1,500" 2000 "$2,000" 2500 "$2,500" 3000 "$3,000" 3500 "$3,500", axis(1) grid format(%9.0fc) angle(0)) yscale(axis(1) r(0, 3500)) ytitle("Energy Capacity (kWh)", axis(2) size(medlarge) margin(tiny)) ylabel(0(4)28, axis(2) grid format(%9.0f) angle(0)) yscale(axis(2) r(0, 28)) legend(on position(6) ring(0) xoffset(0) yoffset(2) region(fcolor(none) lcolor(none) lwidth(none))) name("Figure_3a", replace)
graph export "manuscript\graphs\CA_SGIP\cpk_res_trend.pdf", as(pdf) name("Figure_3a") replace

//Trend in Cost per kWh, Non-Residential
reg cpk ibn.ICYear if sample==1 & Residential==0, noconstant vce(hc3)
eststo cpk_non_res_trend
reg kWh ibn.ICYear if sample==1 & Residential==0, noconstant vce(hc3)
eststo kWh_non_res_trend

coefplot (cpk_non_res_trend, label("Cost") lcolor(green)) (kWh_non_res_trend, axis(2) label(System Size) lcolor(dkorange)), offset(0) vertical rename(*.ICYear = "") recast(line) lwidth(thick) noci graphregion(color(white) margin(l=1 t=1 b=1 r=6)) plotregion(color(white) margin(b=0)) bgcolor(white) ytitle("Installed Cost per kWh ($2020)", size(medlarge) margin(tiny)) ylabel(0 "$0" 500 "$500" 1000 "$1,000" 1500 "$1,500" 2000 "$2,000" 2500 "$2,500", axis(1) grid format(%9.0fc) angle(0)) ytitle("Energy Capacity (kWh)", axis(2) size(medlarge) margin(tiny)) ylabel(0(250)1250, axis(2) grid format(%9.0f) angle(0)) legend(on position(6) ring(0) xoffset(0) yoffset(2) region(fcolor(none) lcolor(none) lwidth(none))) name("Figure_3b", replace)
graph export "manuscript\graphs\CA_SGIP\cpk_nonres_trend.pdf", as(pdf) name("Figure_3b") replace

clear