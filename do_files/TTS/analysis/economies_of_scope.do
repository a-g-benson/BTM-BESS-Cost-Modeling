local PV_controls "ln_kW_pv tracking ground_mounted dc_optimizer"
local inverter_controls "ln_kW_inv micro_inverter solar_storage_hybrid_inverter multiple_phase_system"
local system_controls "DC_coupled self_installed third_party_owned expansion_system"


reghdfe ln_TEC_2020 `PV_controls' `inverter_controls' `system_controls' ln_kWh ln_kW if sample==1 & _merge==3, absorb(Residential#InstallationYear_PV Residential#InstallationYear_BESS) vce(robust)

gen x=InstallationDate_BESS-InstallationDate_PV

reghdfe ln_TC_2020 `PV_controls' `inverter_controls' `system_controls' c.x##c.x##c.x##c.x#co_install_BESS_first co_install_exact ln_kWh ln_kW if sample==1 & _merge==3, absorb(Residential#InstallationYear_PV Residential#InstallationYear_BESS) vce(robust)
scalar rmse=e(rmse)

count
scalar real_obs_N=r(N)
insobs 361
replace x=_n-real_obs_N-181 in -361/L

foreach var of varlist `PV_controls' `inverter_controls' `system_controls' ln_kWh ln_kW {
	qui sum `var' if sample==1
	replace `var'=r(mean) in -361/L
}

replace Residential=1 in -361/L
replace InstallationYear_PV=2019 in -361/L
replace InstallationYear_PV=2020 in -361/L
replace co_install_exact=(x==0) in -361/L
replace co_install_BESS_first=(x<0) in -361/L

predictnl TC_hat = exp(xb()+0.5*rmse^2) in -361/L, ci(TC_lb TC_ub)

twoway (rarea TC_lb TC_ub x in -361/L, fcolor(maroon%50) fintensity(inten80) lwidth(none))(line TC_hat x in -361/L, lwidth(medthick) lpattern(solid) lcolor(navy)) if duration>=1, xscale(titlegap(tiny)) xtitle( , size(medlarge)) ylabel(, angle(0) format(%9.0fc)) ytitle("Total Cost (2020 dollars)", size(medlarge) margin(small)) graphregion(color(white) margin(small)) bgcolor(white) legend(position(12) yoffset(-3) order() ring(0) region(fcolor(none) lcolor(none) lwidth(none)))