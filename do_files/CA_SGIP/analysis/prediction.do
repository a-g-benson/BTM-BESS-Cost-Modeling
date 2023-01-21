use "data\CA_SGIP\TTS_SGIP.dta"

//Translog - Table 6

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if sample==1, vce(robust) noconstant noci cformat(%9.3f)

//running this again to present the sector-year FEs to only 2 decimal places
reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if sample==1, vce(robust) noconstant noci cformat(%9.2f)

di round(invnormal(0.975)*sqrt(e(V)[7,7]),.001)
di round(invnormal(0.975)*sqrt(e(V)[8,8]),.001)
di round(invnormal(0.975)*sqrt(e(V)[9,9]),.001)

nlcom exp(_b[1.coupling])-1
di round(invnormal(0.975)*sqrt(r(V)[1,1]),.001)

//R2 isn't calculated correctly with the no-constant option, adjusted-R2 isn't available with robust SEs
reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW i.coupling ln_elec_wage_median_2020 i.ICYear#Residential if sample==1, noci cformat(%9.3f)


//Cobb-Douglas - Table C17
reg ln_TEC_2020 c.ln_kWh c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if sample==1, vce(robust) noconstant noci cformat(%9.3f)

reg ln_TEC_2020 c.ln_kWh c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if sample==1, vce(robust) noconstant noci cformat(%9.2f)

di round(invnormal(0.975)*sqrt(e(V)[1,1]),.001)
di round(invnormal(0.975)*sqrt(e(V)[2,2]),.001)

lincom _b[c.ln_kWh]+_b[c.ln_kW]
di round(invnormal(0.975)*r(se),.001)

nlcom 10^(_b[c.ln_kWh]+_b[c.ln_kW]-1)-1
di round(invnormal(0.975)*sqrt(r(V)[1,1]),.001)

//R2 isn't calculated correctly with the no-constant option, adjusted-R2 isn't available with robust SEs
reg ln_TEC_2020 c.ln_kWh c.ln_kW i.coupling ln_elec_wage_median_2020 i.ICYear#Residential if sample==1, noci cformat(%9.3f)

//Cobb-Douglas with Manufacturer FEs
reghdfe ln_TEC_2020 c.ln_kWh c.ln_kW i.coupling ln_elec_wage_median_2020 if sample==1, vce(robust) noconstant absorb(Residential#ICYear ManufacturerName) noci cformat(%9.3g)
di round(invnormal(0.975)*sqrt(e(V)[1,1]),.001)
di round(invnormal(0.975)*sqrt(e(V)[2,2]),.001)

lincom _b[c.ln_kWh]+_b[c.ln_kW]
di round(invnormal(0.975)*r(se),.001)

clear