//Baseline Translog

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW ibn.ICYear#Residential if sample==1, vce(robust) noconstant noci cformat(%9.3f)

//R^2 is not computed correctly with the no-constant option; adjusted R^2 not reported with robust SEs.

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW ICYear#Residential if sample==1, noci cformat(%9.3f)



//Baseline Cobb-Douglas (for Appendix)

reg ln_TEC_2020 c.ln_kWh c.ln_kW ibn.ICYear#Residential if sample==1, vce(robust) noconstant noci cformat(%9.3f)

//R^2 is not computed correctly with the no-constant option; adjusted R^2 not reported with robust SEs.

reg ln_TEC_2020 c.ln_kWh c.ln_kW ICYear#Residential if sample==1, noci cformat(%9.3f)

//Cobb Douglas + Manufacturer Fixed Effects

reghdfe ln_TEC ln_kWh ln_kW if sample==1, vce(robust) noconstant absorb(Residential#ICYear ManufacturerName) noci cformat(%9.3g)