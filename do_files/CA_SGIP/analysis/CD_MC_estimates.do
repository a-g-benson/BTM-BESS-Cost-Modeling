reg ln_TEC_2020 c.ln_kWh c.ln_kW i.coupling ln_elec_wage_mean_2020 ibn.ICYear#Residential if sample==1 & duration<1.7, vce(robust) noconstant
nlcom exp(_b[2021.ICYear#1.Residential]+0.5*.30982^2+(_b[ln_kWh]-1)*ln(5)+_b[ln_kW]*ln(5))*_b[ln_kWh]

reg ln_TEC_2020 c.ln_kWh c.ln_kW i.coupling ln_elec_wage_mean_2020 ibn.ICYear#Residential if sample==1 & duration<1.699, vce(robust) noconstant
nlcom exp(_b[2021.ICYear#1.Residential]+0.5*.30982^2+(_b[ln_kWh]-1)*ln(5)+_b[ln_kW]*ln(5))*_b[ln_kWh]

reg ln_TEC_2020 c.ln_kWh c.ln_kW i.coupling ln_elec_wage_mean_2020 ibn.ICYear#Residential if sample==1 & duration>2.6, vce(robust) noconstant
nlcom exp(_b[2021.ICYear#1.Residential]+0.5*.30982^2+(_b[ln_kWh]-1)*ln(5)+_b[ln_kW]*ln(20))*_b[ln_kWh]

reg ln_TEC_2020 c.ln_kWh c.ln_kW i.coupling ln_elec_wage_mean_2020 ibn.ICYear#Residential if sample==1 & duration>2.64, vce(robust) noconstant
nlcom exp(_b[2021.ICYear#1.Residential]+0.5*.30982^2+(_b[ln_kWh]-1)*ln(5)+_b[ln_kW]*ln(20))*_b[ln_kWh]