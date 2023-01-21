//Generate Simulated Data: 5 kW residential, AC-coupled, Tesla system, given hypothetical discharge durations
insobs 60

replace kW=5 in -60/L
replace ln_kW=ln(kW) in -60/L

replace duration=mod(_n*0.1,6) in -60/L
replace duration=6 if duration==0 in -60/L
sort duration in -60/L

replace kWh=kW*duration in -60/L
replace ln_kWh=ln(kWh) in -60/L

replace Residential=1 in -60/L
replace ICYear=2020 in -60/L

replace coupling=1 in -60/L
sum ln_elec_wage_median_2020 if ICYear==2020 & sample==1
replace ln_elec_wage_median_2020=r(mean) in -60/L

replace ManufacturerCode=277 in -60/L

//Generate Predicted Marginal Cost
predictnl MC_kWh_R_2021 = exp(xb()+0.5*rmse^2) * _b[ln_kWh]/kWh in -60/L
format MC_kWh_R_2021 %9.0f