use "data\CA_SGIP\TTS_SGIP.dta"

////Estimate Basic Translog Model on Training Data

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW ibn.ICYear#Residential i.coupling ln_elec_wage_median if training_sample==1, vce(robust) noconstant noci

////Record RMSE & Compute Normal Prediction Interval

scalar RMSE_TL=e(rmse)

di round(exp(invnormal(0.975)*RMSE_TL),0.001)
di round(exp(invnormal(0.025)*RMSE_TL),0.001)

di round(exp(invnormal(0.975)*RMSE_TL)-1,0.001)
di round(1-exp(invnormal(0.025)*RMSE_TL),0.001)

////Compute Residuals

predict e_TL if training_sample==1, resid

////Compute Parameters of a Laplace Distribution
//mu: location parameter (median)
sum e_TL, detail
scalar median=r(p50)

//b: scale parameter (mean absolute deviation)
gen Abs_Dev=abs(median - e_TL)
sum Abs_Dev
scalar mad=r(mean)

//Graph Empirical Kernel Density, Normal Distribution, and Laplace Distribution

local LL=-1.7
local UL=1.7

twoway (function y=normalden(x,0,RMSE_TL), range(`LL' `UL') lw(thick) lp(solid) lcolor(gold)) ///
	(function y=laplaceden(median,mad,x), range(`LL' `UL') lw(thick) lp(solid) lcolor(forest_green)) ///
	(kdensity e_TL if training_sample==1 & inrange(e_TL,`LL',`UL'), bwidth(0.02) lw(thick) lp(solid) lcolor(black)), ///
	legend(order(3 1 2) cols(1) position(2) ring(0) yoffset(-5) region(fcolor(none) lcolor(none) lwidth(none)) size(medlarge) ///
	label(1 "Normal") label(2 "Laplace") label(3 "Empirical")) ///
	xlabel(-1.5 -1 -0.5 0 0.5 1 1.5, format(%02.1f)) xtitle("Residuals (log installed cost)", size(medlarge) margin(tiny)) xscale(titlegap(tiny)) ///
	ytitle("Probability Density", size(medlarge) margin(tiny)) ylabel(, angle(0)) yscale(titlegap(tiny)) ///
	graphregion(color(white) margin(l=1 t=1 b=1 r=1)) plotregion(color(white) margin(b=0)) bgcolor(white) ///
	name("Figure_11", replace)
graph export "manuscript\graphs\CA_SGIP\laplace_vs_normal.pdf", as(pdf) name("Figure_11") replace

//Laplace Prediction Interval for the Translog Model

di round(exp(invlaplace(median,mad,0.975))-1,0.001)
di round(1-exp(invlaplace(median,mad,0.025)),0.001)

clear
