
reghdfe TC_2020 kW_pv kW_inv kWh_bess kW_bess if sample==1, absorb(InstallationYear_PV#Residential#state ICYear_BESS_sector_state_FE)
estat ic

reghdfe TC_per_kW_2020 ihs_kW_pv ihs_kW_inv ihs_kWh_bess ihs_kW_bess if sample==1, absorb(InstallationYear_PV#Residential#state ICYear_BESS_sector_state_FE)
estat ic

reghdfe ihs_TC_2020 ihs_kW_pv ihs_kW_inv ihs_kWh_bess ihs_kW_bess if sample==1, absorb(InstallationYear_PV#Residential#state ICYear_BESS_sector_state_FE)
estat ic