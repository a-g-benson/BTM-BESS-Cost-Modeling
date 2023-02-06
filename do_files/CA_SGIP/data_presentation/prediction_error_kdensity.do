twoway (kdensity PE_ATB_adv if PE_ATB_adv>-2, bwidth(0.05) lwidth(thick)) ///
	(kdensity PE_TL if PE_TL>-2, bwidth(0.05) lwidth(thick)), ///
	xscale(titlegap(tiny)) xtitle("Pecentage Error", size(large)) ///
	xline(0, lcolor(black) lpattern(dash) lwidth(medthick)) ///
	xlabel(-1.5 "-150%" -1 "-100%" -0.5 "-50%" 0 "0%" 0.5 "50%" 1 "100%") ///
	ylabel(0 1 2 3, angle(0) format(%9.0fc)) ///
	ytitle("Kernel Density", size(large) margin(small)) ///
	graphregion(color(white) margin(b=0 r=3 t=0 l=0)) bgcolor(white) ///
	legend(position(10) yoffset(-4) order(1 "Linear (ATB Advanced)" 2 "Translog") ///
	ring(0) size(medium) region(fcolor(none) lcolor(none) lwidth(none)) rows(3)) ///
	name("Figure_12", replace)

graph export "manuscript\graphs\CA_SGIP\pct_error_dist.pdf", as(pdf) name("Figure_12") replace
