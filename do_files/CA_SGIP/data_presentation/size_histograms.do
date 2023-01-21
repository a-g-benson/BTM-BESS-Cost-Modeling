use "data\CA_SGIP\TTS_SGIP.dta"

//Histograms of kW and kWh: base 10

gen log10_kW = ln_kW / ln(10)
gen log10_kWh = ln_kWh / ln(10)

histogram log10_kW if sample==1, start(-1) width(.25) lcolor(black) lwidth(thin) lalign(center) frequency ylabel(0(2000)19000, format(%9.0gc) angle(0)) xlabel(-1 "100 W" 0 "1 kW" 1 "10 kW" 2 "100 kW" 3 "1 MW" 4 "10 MW") xscale(titlegap(tiny)) xtitle("", size(large) margin(tiny)) yscale(titlegap(tiny)) ytitle("Count of Observations", size(large) margin(tiny)) graphregion(color(white) margin(l=1 t=1 b=1 r=6)) bgcolor(white) color(black) fcolor(navy) plotregion(m(b=1)) name("Figure_1a", replace)
graph export "manuscript\graphs\CA_SGIP\kW_histogram.pdf", as(pdf) name("Figure_1a") replace

histogram log10_kWh if sample==1, start(0) width(.25) lcolor(black) lwidth(thin) lalign(center) frequency ylabel(0(1000)12000, format(%9.0gc) angle(0)) xlabel(0 "1 kWh" 1 "10 kWh" 2 "100 kWh" 3 "1 MWh" 4 "10 MWh") xscale(titlegap(tiny)) xtitle("", size(large) margin(tiny)) yscale(titlegap(tiny)) ytitle("Count of Observations", size(large) margin(tiny)) graphregion(color(white) margin(l=1 t=1 b=1 r=6)) bgcolor(white) color(black) fcolor(navy) plotregion(m(b=1)) name("Figure_1b", replace)
graph export "manuscript\graphs\CA_SGIP\kWh_histogram.pdf", as(pdf) name("Figure_1b") replace

//histogram: discharge duration

histogram duration if sample==1, start(0) width(1) frequency lcolor(black) lwidth(thin) lalign(center) xlabel(0(1)6) ylabel(0(3000)27000, format(%9.0gc) angle(0)) xscale(titlegap(zero)) xtitle(Discharge Duration (Hours), size(large) margin(vsmall)) yscale(titlegap(zero)) ytitle("Count of Observations", size(large) margin(tiny)) graphregion(color(white) margin(l=1 t=1 b=1 r=6)) bgcolor(white) color(black) fcolor(navy) plotregion(m(b=1)) name("Figure_1c", replace)
graph export "manuscript\graphs\CA_SGIP\duration_histogram.pdf", as(pdf) name("Figure_1c") replace

clear