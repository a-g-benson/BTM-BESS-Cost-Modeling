use "data\CA_SGIP\TTS_SGIP.dta"

// ~ ~ ~ ~ Linear (ATB) ~ ~ ~ ~ ~

//Generate Predicted Total Cost in 2022 using ATB "Advanced" Scenario

gen ATB_hat_adv = 631.16 * kWh + 487.76 * kW + 5852.68 if validation_sample==1 & Residential==1
replace ATB_hat_adv = 206.26 * kWh + 287.91 * kW + 349764.59 if validation_sample==1 & Residential==0

//Generate Predicted Total Cost in 2022 using ATB "Moderate" Scenario

gen ATB_hat_mod = 637.07 * kWh + 492.32 * kW + 5907.47 if validation_sample==1 & Residential==1
replace ATB_hat_mod = 203.22 * kWh + 289.82 * kW + 363497.67 if validation_sample==1 & Residential==0

//Generate Predicted Total Cost in 2022 using ATB "Conservative" Scenario

gen ATB_hat_con = 666.84 * kWh + 515.33 * kW + 6183.54 if validation_sample==1 & Residential==1
replace ATB_hat_con = 217.92 * kWh + 304.19 * kW + 369537.44 if validation_sample==1 & Residential==0

//Generate Percent Errors and compute median

gen PE_ATB_adv=(TEC_2020-ATB_hat_adv)/TEC_2020
sum PE_ATB_adv, detail

gen PE_ATB_mod=(TEC_2020-ATB_hat_mod)/TEC_2020
sum PE_ATB_mod, detail

gen PE_ATB_con=(TEC_2020-ATB_hat_con)/TEC_2020
sum PE_ATB_con, detail

//Generate absolute percent errors and compute mean
gen APE_ATB_adv=abs(TEC_2020-ATB_hat_adv)/TEC_2020
sum APE_ATB_adv

gen APE_ATB_mod=abs(TEC_2020-ATB_hat_mod)/TEC_2020
sum APE_ATB_mod

gen APE_ATB_con=abs(TEC_2020-ATB_hat_con)/TEC_2020
sum APE_ATB_con

//Calibration of Prediction, as if (Advanced, Conservative) were a prediction interval
gen TEC_within_ATB_pred=(TEC_2020<ATB_hat_con & TEC_2020>ATB_hat_adv) if validation_sample==1
tab TEC_within_ATB_pred

// ~ ~ ~ ~ Linear (Empirical) ~ ~ ~ ~ ~

//Estimate  model on training data (2013 - 2021)

reg TEC_2020 ibn.ICYear#c.kWh ibn.ICYear#c.kW ibn.ICYear#Residential if training_sample==1, noconstant

//Generate Predicted Total Cost for 2022 using same parameters as 2021
replace ICYear=2021 if validation_sample==1
predict Lin_hat if validation_sample==1, xb

//Generate percent errors and compute median
gen PE_Lin=(TEC_2020-Lin_hat)/TEC_2020
sum PE_Lin, detail

//Generate absolute percent errors and compute mean
gen APE_Lin=abs(TEC_2020-Lin_hat)/TEC_2020
sum APE_Lin

//Generate Prediction Interval & Validate Calibration
predict stdf_Lin if validation_sample==1, stdf
gen Lin_hat_UB=exp(Lin_hat+invnormal(0.975)*stdf_Lin)
gen Lin_hat_LB=exp(Lin_hat-invnormal(0.975)*stdf_Lin)

gen TEC_within_Lin_pred=(TEC_2020<Lin_hat_UB & TEC_2020>Lin_hat_LB) if validation_sample==1
tab TEC_within_Lin_pred

// ~ ~ ~ ~ Cobb-Douglas (CD) ~ ~ ~ ~ ~

//Estimate  model on training data (2013 - 2021)
reg ln_TEC_2020 ln_kWh ln_kW ibn.ICYear#Residential if training_sample==1, noconstant

//Generate Predicted Total Cost for 2022 using same alpha parameter as 2021
predict ln_CD_hat if validation_sample==1, xb
gen CD_hat=exp(ln_CD_hat+0.5*e(rmse)^2) if validation_sample==1

//Generate percent errors and look at median
gen PE_CD=(TEC_2020-CD_hat)/TEC_2020 if validation_sample==1
sum PE_CD, detail

//Generate absolute percent errors and compute mean
gen APE_CD=abs(TEC_2020-CD_hat)/TEC_2020
sum APE_CD

////Compute Parameters of a Laplace Distribution
predict e_CD if training_sample==1, r
//mu: location parameter (median)
sum e_CD, detail
scalar median=r(p50)

//b: scale parameter (mean absolute deviation)
gen Abs_Dev_CD=abs(median - e_CD) if training_sample==1
sum Abs_Dev_CD
scalar mad=r(mean)

//Generate Prediction Interval & Validate Calibration
gen CD_hat_UB=exp(ln_CD_hat+invlaplace(median,mad,0.975)) if validation_sample==1
gen CD_hat_LB=exp(ln_CD_hat+invlaplace(median,mad,0.025)) if validation_sample==1

gen TEC_within_CD_pred=(TEC_2020<CD_hat_UB & TEC_2020>CD_hat_LB) if validation_sample==1
tab TEC_within_CD_pred

// ~ ~ ~ ~ Translog (TL) ~ ~ ~ ~ ~

//Estimate model on training data (2013 - 2021)
reg ln_TEC_2020 c.ln_kWh##c.ln_kWh c.ln_kW##c.ln_kW c.ln_kW#c.ln_kWh ibn.ICYear#Residential if training_sample==1, noconstant

//Generate Predicted Total Cost for 2022 using same alpha parameter as 2021
replace ICYear=2021 if validation_sample==1
predict ln_TL_hat if validation_sample==1, xb
gen TL_hat=exp(ln_TL_hat+0.5*e(rmse)^2) if validation_sample==1

//Generate percent errors and compute median
gen PE_TL=(TEC_2020-TL_hat)/TEC_2020
sum PE_TL, detail

//Generate absolute percent errors and compute mean
gen APE_TL=abs(TEC_2020-TL_hat)/TEC_2020
sum APE_TL

////Compute Parameters of a Laplace Distribution
predict e_TL if training_sample==1, r
//mu: location parameter (median)
sum e_TL, detail
scalar median=r(p50)

//b: scale parameter (mean absolute deviation)
gen Abs_Dev_TL=abs(median - e_TL) if training_sample==1
sum Abs_Dev_TL
scalar mad=r(mean)

//Generate Prediction Interval & Validate Calibration
gen TL_hat_UB=exp(ln_CD_hat+invlaplace(median,mad,0.975)) if validation_sample==1
gen TL_hat_LB=exp(ln_CD_hat+invlaplace(median,mad,0.025)) if validation_sample==1

gen TEC_within_TL_pred=(TEC_2020<TL_hat_UB & TEC_2020>TL_hat_LB) if validation_sample==1
tab TEC_within_TL_pred

///Kernel Density Histogram of Prediction Errors: ATB Advanced vs. Translog

do "do_files\CA_SGIP\data_presentation\prediction_error_kdensity.do"

//What % of validation sample has discharge duration in excess of 2.64 hours?

count if duration>=2.65 & validation_sample==1
scalar long_duration_N=r(N)
count if validation_sample==1
scalar validation_N=r(N)

di round(long_duration_N/validation_N*100,0.1) "% of the validation sample exceeds 2.64 hours of discharge duration"

clear
