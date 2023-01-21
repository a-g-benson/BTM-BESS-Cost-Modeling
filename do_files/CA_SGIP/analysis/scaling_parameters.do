//Basic Cobb-Douglas Model with Sector-Year Fixed Effects

reghdfe ln_TEC_2020 ln_kWh ln_kW i.coupling ln_elec_wage_median_2020 if sample==1, noconstant absorb(ICYear#Residential) vce(robust) cformat(%9.3f)

di round(invnormal(0.975)*sqrt(e(V)[1,1]),.001)
di round(invnormal(0.975)*sqrt(e(V)[2,2]),.001)

lincom _b[ln_kWh] + _b[ln_kW]
di round(invnormal(0.975)*r(se),.001)

nlcom 10^(_b[ln_kWh]+_b[ln_kW]-1)-1
di round(invnormal(0.975)*sqrt(r(V)[1,1]),0.001)

gen typical_pe_ratio=(duration>=1.69900 & duration<=2.64)
tab typical_pe_ratio if sample==1

gen RESU10=(duration>1.699 & duration<1.7 & LGMan==1)
tab RESU10 typical_pe_ratio if sample==1, cell
gen Powerwall2=(duration>=2.6399 & duration<=2.6401 & TeslaMan==1)
tab Powerwall2 typical_pe_ratio if sample==1, cell

reghdfe ln_TEC_2020 ln_kWh ln_kW i.coupling ln_elec_wage_median_2020 if sample==1, noconstant absorb(ICYear#Residential ManufacturerName) vce(robust)
di round(invnormal(0.975)*sqrt(e(V)[1,1]),.001)
di round(invnormal(0.975)*sqrt(e(V)[2,2]),.001)

lincom _b[ln_kWh] + _b[ln_kW]
di round(invnormal(0.975)*r(se),.001)