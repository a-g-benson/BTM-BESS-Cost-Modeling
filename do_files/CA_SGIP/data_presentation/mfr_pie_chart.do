use "data\CA_SGIP\TTS_SGIP.dta"

collapse (sum) kWh if sample==1, by(ManufacturerName)

gen other=1 if kWh<6000
sum kWh if other==1
scalar other_kWh=r(mean) * r(N)

insobs 1
replace ManufacturerName="All Others" in -1
replace kWh=other_kWh in -1
sort kWh
drop if other==1
rename other order
replace order=_n
replace order=0 if ManufacturerName=="All Others"

graph pie kWh, over(ManufacturerName) sort(order) legend(off) graphregion(color(white)) bgcolor(white) intensity(inten100) angle(48) pie(1, color(gs15)) plabel(1 percent, color(black) size(medlarge) gap(9rs) format(%9.1f)) pie(2, color(gs14)) pie(3, color(gs12)) pie(4, color(gs10)) pie(5, color(gs8)) pie(6, color(gs6)) pie(7, color(gs4)) pie(8, color(gs2))  pie(9, color(gs0)) pie(10, color("165 0 52")) plabel(10 percent, color(white) size(vlarge) gap(8rs) format(%9.1f)) pie(11, color("227 24 54")) plabel(11 percent, color(white) size(vhuge) format(%9.1f) gap(-10)) name("Figure_2", replace)
graph export "manuscript\graphs\CA_SGIP\manufacturer_shares_base.png", as(png) name("Figure_2") replace

clear