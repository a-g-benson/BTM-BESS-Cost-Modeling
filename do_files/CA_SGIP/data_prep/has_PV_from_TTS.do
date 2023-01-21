//This code identifies SGIP observations in the TTS dataset and extracts the power rating of the PV installed. 
//This is used for the purpose of filling in blanks in the SGIP dataset where the "PairedWith" and "PairedWithRenewable" variables are blank.

use "data\TTS\TTS.dta"

keep if regexm(system_id_2,"SGIP")

gen id2_length=strlen(system_id_2)

gen ApplicationCode=system_id_2 if regexm(system_id_2,"&")==0
label var ApplicationCode "SGIP Application Code"

gen ampersand_pos=strpos(system_id_2,"&") if ApplicationCode==""
replace ApplicationCode=substr(system_id_2,ampersand_pos+2,.) if ampersand_pos!=.

drop id2_length ampersand_pos

//There are duplicates of SGIP observations in the TTS data. 
duplicates tag ApplicationCode, gen(dup)
list ApplicationCode if dup==1, sep(2)

//This code identifies which copy of the SGIP observation has more complete data and drops the less complete observation.
gen keep_score=!missing(kW_pv)+!missing(kW_inv)+!missing(kW_bess)+!missing(kWh_bess)+!missing(TC)+!missing(subsidy) if dup==1
by ApplicationCode, sort: egen max_keep_score=max(keep_score) if dup==1
drop if keep_score<max_keep_score & dup==1
drop dup

//If there was a tie in completeness score, then this line just keeps the first instance of the observation.
duplicates drop ApplicationCode, force

keep ApplicationCode kW_pv
save "data\CA_SGIP\has_PV_from_TTS.dta", replace
clear