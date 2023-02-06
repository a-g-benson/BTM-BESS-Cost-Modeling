use "data\CA_SGIP\TTS_SGIP.dta"

//The crossfold command reports the RMSE and MAE of each of the k cross-validation runs.
//This program computes the average RMSE or MAE of the k cross-validation runs.

capture program drop crossfold_avg
program define crossfold_avg, rclass
	args k
	
	matrix a = r(est)
	scalar sum = 0
	forvalues i = 1/`k' {
		scalar sum = sum + a[`i',1]	
	}
	local avg=sum/`k'
	display `avg'
end

set seed 72121422


//Cobb-Douglas
qui reg ln_TEC_2020 c.ln_kWh c.ln_kW ICYear#Residential if training_sample==1
estat ic
qui crossfold reghdfe ln_TEC_2020 c.ln_kWh c.ln_kW if training_sample==1, absorb(ICYear#Residential) k(10) eif(training_sample==1)
crossfold_avg 10
qui crossfold reghdfe ln_TEC_2020 c.ln_kWh c.ln_kW if training_sample==1, absorb(ICYear#Residential) k(10) eif(training_sample==1) mae
crossfold_avg 10

//Translog
qui reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW ICYear#Residential if training_sample==1
estat ic
qui crossfold reghdfe ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW if training_sample==1, absorb(ICYear#Residential) k(10) eif(training_sample==1)
crossfold_avg 10
qui crossfold reghdfe ln_TEC_2020 c.ln_kWh c.ln_kW if training_sample==1, absorb(ICYear#Residential) k(10) eif(sample==1) mae
crossfold_avg 10


//Numbers Mentioned in Text of Appendix B.2

count if sample==1
scalar sample_size=r(N)

count if sample==1 & duration<2.65 & duration>1.698
scalar common_durations=r(N)

di round(common_durations/sample_size*100,0.1) "% of observations fall within duration of Tesla Powerwall & LG Resu 10"

count if sample==1 & TeslaMan==1 & duration>2.63 & duration<2.65

di round(r(N)/sample_size*100,0.1) "% of observations are Tesla Powerwall 2"

count if sample==1 & LGMan==1 & duration>1.68 & duration<1.701

di round(r(N)/sample_size*100,0.1) "% of observations are LG Resu 10"

corr kW kWh if sample==1

clear
