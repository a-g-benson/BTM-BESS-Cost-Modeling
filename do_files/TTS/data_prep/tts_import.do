import delimited "data\TTS\TTS_LBNL_public_file_07-Sep-2022_all.csv", delimiter(comma) varnames(1) 

replace zip_code="-1" if zip_code=="redacted"
destring zip_code, replace force
recast float rebate_or_grant, force

////This code is deprecated. This was used to import and merge the TTS data released in 2021
//import delimited "data\TTS\TTS_LBNL_public_file_06-Sep-2021_p1.csv", delimiter(comma) varnames(1) 
//replace zip_code="-1" if zip_code=="redacted"
//destring zip_code, replace
//recast float rebate_or_grant, force
//save "data\TTS\TTS_p1.dta", replace
//clear

//import delimited "data\TTS\TTS_LBNL_public_file_06-Sep-2021_p2.csv", delimiter(comma) varnames(1) 
//replace zip_code=93463 if zip_code==2236
//replace city="Solvang" if city=="CA"
//replace state="CA" if state=="93463"
//recast float rebate_or_grant, force
//tostring inverter_manu~2 inverter_mode~2 inverter_manu~3 inverter_mode~3, replace
//save "data\TTS\TTS_p2.dta", replace
//clear

//use "data\TTS\TTS_p1.dta"
//append using "data\TTS\TTS_p2.dta"

save "data\TTS\TTS_raw.dta", replace
clear