use "data\CA_SGIP\TTS_SGIP.dta"

//Non-Linear Combination of Parameters - Marginal Cost of Energy Capacity, 5kW Residential System

////Estimate Baseline Translog Model
use "data\CA_SGIP\TTS_SGIP.dta"

qui reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW ibn.ICYear#Residential if training_sample==1, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse = e(rmse)

qui do "do_files\CA_SGIP\analysis\MC_calculator_TL.do"

list duration MC_kWh_R_2021 if mod(duration,1)==0 & duration>0 in -60/L, separator(6) divider

clear

////Estimate Translog Model with Manufacturer Fixed Effects
use "data\CA_SGIP\TTS_SGIP.dta"

qui reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW ibn.ICYear#Residential i.ManufacturerCode if training_sample==1, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse = e(rmse)

qui do "do_files\CA_SGIP\analysis\MC_calculator_TL.do"

list duration MC_kWh_R_2021 if mod(duration,1)==0 & duration>0 in -60/L, separator(6) divider 

clear

////Estimate Baseline Cobb-Douglas Model
use "data\CA_SGIP\TTS_SGIP.dta"

qui reg ln_TEC_2020 ln_kWh c.ln_kW i.coupling ln_elec_wage_median_2020 ibn.ICYear#Residential if training_sample==1, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse = e(rmse)

qui do "do_files\CA_SGIP\analysis\MC_calculator_CD.do"

list duration MC_kWh_R_2021 if mod(duration,1)==0 & duration>0 in -60/L, separator(6) divider 

clear

////Estimate Baseline Cobb-Douglas Model, discharge durations [0,1.699]
use "data\CA_SGIP\TTS_SGIP.dta"

qui reg ln_TEC_2020 ln_kWh c.ln_kW ibn.ICYear#Residential if training_sample==1 & duration<1.7, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse = e(rmse)

qui do "do_files\CA_SGIP\analysis\MC_calculator_CD.do"

list duration MC_kWh_R_2021 if duration==1 in -60/L, separator(6) divider 

clear

////Estimate Baseline Cobb-Douglas Model, discharge durations [0,1.699)
use "data\CA_SGIP\TTS_SGIP.dta"

qui reg ln_TEC_2020 ln_kWh c.ln_kW ibn.ICYear#Residential if training_sample==1 & duration<1.699, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse = e(rmse)

qui do "do_files\CA_SGIP\analysis\MC_calculator_CD.do"

list duration MC_kWh_R_2021 if duration==1 in -60/L, separator(6) divider 

clear

////Estimate Baseline Cobb-Douglas Model, discharge durations [2.64, 6]
use "data\CA_SGIP\TTS_SGIP.dta"

qui reg ln_TEC_2020 ln_kWh c.ln_kW ibn.ICYear#Residential if training_sample==1 & duration>=2.63999, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse = e(rmse)

qui do "do_files\CA_SGIP\analysis\MC_calculator_CD.do"

list duration MC_kWh_R_2021 if mod(duration,1)==0 & duration>2 in -60/L, separator(6) divider 

clear

////Estimate Baseline Cobb-Douglas Model, discharge durations (2.64, 6]
use "data\CA_SGIP\TTS_SGIP.dta"

qui reg ln_TEC_2020 ln_kWh c.ln_kW ibn.ICYear#Residential if training_sample==1 & duration>2.64, vce(robust) noconstant noci cformat(%9.3f)
scalar rmse = e(rmse)

qui do "do_files\CA_SGIP\analysis\MC_calculator_CD.do"

list duration MC_kWh_R_2021 if mod(duration,1)==0 & duration>2 in -60/L, separator(6) divider 

clear