//Incremental Cost of Storage According to TTS
use "data\TTS\TTS.dta"

local PV_controls "ihs_kW_pv tracking ground_mounted dc_optimizer"
local inverter_controls "ihs_kW_inv micro_inverter solar_storage_hybrid_inverter multiple_phase_system"
local system_controls "DC_coupled co_install_exact self_installed third_party_owned expansion_system"

egen ICYear_BESS_sector_state_FE=concat(InstallationYear_BESS Residential state), punct(-)
replace ICYear_BESS_sector_state_FE="" if state==.
replace ICYear_BESS_sector_state_FE="No battery" if has_battery==0

reghdfe ihs_TC_2020 `PV_controls' `inverter_controls' has_battery `system_controls' if sample==1, absorb(InstallationYear_PV#Residential#state) vce(robust) noconstant
eststo has_battery
count if e(sample)==1 & has_battery==1
count if e(sample)==1 & has_battery==0
tab 
nlcom (exp(_b[has_battery])-1)*100
di round(invnormal(0.975)*sqrt(r(V)[1,1]),0.1)

nlcom (exp(_b[has_battery]+_b[DC_coupled]+_b[co_install_exact])-1)*100
di round(invnormal(0.975)*sqrt(r(V)[1,1]),0.1)

reghdfe ihs_TC_2020 `PV_controls' `inverter_controls' ihs_kWh_bess `system_controls' if sample==1, absorb(InstallationYear_PV#Residential#state ICYear_BESS_sector_state_FE) vce(robust) noconstant
eststo energy
count if e(sample)==1 & has_battery==1
count if e(sample)==1 & has_battery==0

reghdfe ihs_TC_2020 `PV_controls' `inverter_controls' ihs_kW_bess `system_controls' if sample==1, absorb(InstallationYear_PV#Residential#state ICYear_BESS_sector_state_FE) vce(robust) noconstant
eststo power
count if e(sample)==1 & has_battery==1
count if e(sample)==1 & has_battery==0

reghdfe ihs_TC_2020 `PV_controls' `inverter_controls' ihs_kWh_bess ihs_kW_bess `system_controls' if sample==1, absorb(InstallationYear_PV#Residential#state ICYear_BESS_sector_state_FE) vce(robust) noconstant
eststo cobb_douglas
count if e(sample)==1 & has_battery==1
count if e(sample)==1 & has_battery==0

di e(V)[10,9]/sqrt(e(V)[9,9]*e(V)[10,10])

reghdfe ihs_TC_2020 `PV_controls' `inverter_controls' c.ihs_kWh_bess##c.ihs_kWh_bess c.ihs_kW_bess##c.ihs_kW_bess c.ihs_kWh_bess#c.ihs_kW_bess `system_controls' if sample==1, absorb(InstallationYear_PV#Residential#state ICYear_BESS_sector_state_FE) vce(robust) noconstant
eststo translog
count if e(sample)==1 & has_battery==1
count if e(sample)==1 & has_battery==0

test c.ihs_kWh_bess#c.ihs_kWh_bess c.ihs_kW_bess#c.ihs_kW_bess c.ihs_kWh_bess#c.ihs_kW_bess

nlcom (exp(_b[ihs_kWh_bess]*asinh(2)+_b[c.ihs_kWh_bess#c.ihs_kWh_bess]*asinh(2)^2+_b[ihs_kW_bess]*asinh(1)+_b[c.ihs_kW_bess#c.ihs_kW_bess]*asinh(1)^2+_b[c.ihs_kWh_bess#c.ihs_kW_bess]*asinh(2)*asinh(1))-1)*100
di round(invnormal(0.975)*sqrt(r(V)[1,1]),0.1)

nlcom (exp(_b[ihs_kWh_bess]*asinh(20)+_b[c.ihs_kWh_bess#c.ihs_kWh_bess]*asinh(20)^2+_b[ihs_kW_bess]*asinh(10)+_b[c.ihs_kW_bess#c.ihs_kW_bess]*asinh(10)^2+_b[c.ihs_kWh_bess#c.ihs_kW_bess]*asinh(20)*asinh(10))-1)*100
di round(invnormal(0.975)*sqrt(r(V)[1,1]),0.1)

nlcom (exp(_b[ihs_kWh_bess]*asinh(200)+_b[c.ihs_kWh_bess#c.ihs_kWh_bess]*asinh(200)^2+_b[ihs_kW_bess]*asinh(100)+_b[c.ihs_kW_bess#c.ihs_kW_bess]*asinh(100)^2+_b[c.ihs_kWh_bess#c.ihs_kW_bess]*asinh(200)*asinh(100))-1)*100
di round(invnormal(0.975)*sqrt(r(V)[1,1]),0.1)

nlcom (exp(_b[ihs_kWh_bess]*asinh(2000)+_b[c.ihs_kWh_bess#c.ihs_kWh_bess]*asinh(2000)^2+_b[ihs_kW_bess]*asinh(1000)+_b[c.ihs_kW_bess#c.ihs_kW_bess]*asinh(1000)^2+_b[c.ihs_kWh_bess#c.ihs_kW_bess]*asinh(2000)*asinh(1000))-1)*100
di round(invnormal(0.975)*sqrt(r(V)[1,1]),0.1)

esttab has_battery energy power cobb_douglas translog, cells(b(nostar fmt(%9.3f)) se(nostar fmt(%9.3f) par)) order(ihs_kW_pv tracking ground_mounted dc_optimizer ihs_kW_inv micro_inverter solar_storage_hybrid_inverter multiple_phase_system has_battery ihs_kWh_bess c.ihs_kWh_bess#c.ihs_kWh_bess ihs_kW_bess c.ihs_kW_bess#c.ihs_kW_bess c.ihs_kWh_bess#c.ihs_kW_bess DC_coupled co_install_exact self_installed third_party_owned expansion_system) tex

//robustness checks
reghdfe ihs_TC_2020 `PV_controls' `inverter_controls' ihs_kWh_bess ihs_kW_bess `system_controls' if sample==1 & has_battery==1, absorb(InstallationYear_PV#Residential#state) vce(robust) noconstant

reghdfe ln_TC_2020 ln_kW_pv tracking ground_mounted dc_optimizer ln_kW_inv micro_inverter solar_storage_hybrid_inverter multiple_phase_system ln_kWh_bess ln_kW_bess `system_controls' if sample==1, absorb(InstallationYear_PV#Residential#state) vce(robust) noconstant

