use "data\CA_SGIP\TTS_SGIP.dta"

////Estimate Basic Translog Model on Training Data

reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kWh#c.ln_kW ibn.ICYear#Residential if training_sample==1, noconstant noci

////Record RMSE

scalar RMSE_TL=e(rmse)

////Compute Residuals

predict e_TL if training_sample==1, resid

////Compute Parameters of a Laplace Distribution
//mu: location parameter (median)
sum e_TL, detail
scalar median=r(p50)

//b: scale parameter (mean absolute deviation from the median)
gen Abs_Dev=abs(e_TL - median)
sum Abs_Dev
scalar mad=r(mean)

//Graph Empirical Kernel Density, Normal Distribution, and Laplace Distribution

do "do_files\CA_SGIP\data_presentation\residual_distributions.do"

//Compute Standard Error of the Prediction 
//("Standard Error of the Forecast in Stata-lingo")
predict se_p if training_sample==1, stdf
sum se_p if training_sample==1

di "The standard error of the prediction is 0" round((r(mean)/e(rmse)-1)*100,0.01) "% larger than the RMSE."

////Form Prediction Intervals
//Set Desired Confidence
scalar alpha=0.95
scalar z_lower=(1-alpha)/2
scalar z_upper=1-z_lower

//Form Normal Prediction Intervals
di round(exp(invnormal(z_upper)*RMSE_TL),0.001)
di round(exp(invnormal(z_lower)*RMSE_TL),0.001)

//Form Laplace Prediction Intervals

di round(exp(invlaplace(median,mad,z_upper)),0.0001)
di round(exp(invlaplace(median,mad,z_lower)),0.0001)

//Checking my Laplace math in Appendix E

di round(exp(median-mad*ln(0.05)),0.0001)
di round(exp(median+mad*ln(0.05)),0.0001)

clear
