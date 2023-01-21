//Prepare TTS Data for Matching with SGIP Data
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

save "data\CA_SGIP\TTS_SGIP.dta", replace
clear

//Merge 

use "data\CA_SGIP\SGIP_data_cleaned.dta"

gen ___TTS_Vars___ = .
label var ___TTS_Vars___ "~ ~ ~ (Data from TTS) ~ ~ ~"

merge 1:1 ApplicationCode using "data\CA_SGIP\TTS_SGIP.dta", keep(match master) keepusing(InstallationDate_PV InstallationMonth_PV InstallationYear_PV InstallationDate_BESS InstallationMonth_BESS InstallationYear_BESS kW_pv ln_kW_pv ihs_kW_pv kW_inv ln_kW_inv ihs_kW_inv tracking micro_inverter dc_optimizer DC_coupled multiple_phase_system self_installed new_construction expansion_system ground_mounted third_party_owned co_install_* TC TC_2020 ln_TC_2020 ihs_TC_2020 subsidy_2020 ln_subsidy_2020 ihs_subsidy_2020)

replace StandAlone=0 if InstallationDate_PV!=. & sample==1
replace StandAlone=0 if ApplicationCode=="SD-SGIP-2019-4256"

//For these manufactureres, I infer DC or AC coupling based on the fact that this manufacturer exclusively sells AC-coupled or DC-coupled batteries.

replace DC_couple=0 if ManufacturerName=="TESLA" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="SONNEN" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="ENPHASE" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="SUNPOWER" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="ADARA" & StandAlone==0 & DC_couple==.
replace DC_couple=1 if ManufacturerName=="LG" & StandAlone==0 & DC_couple==.
replace DC_couple=1 if ManufacturerName=="GENERAC" & StandAlone==0 & DC_couple==.
replace DC_couple=1 if ManufacturerName=="PIKA" & StandAlone==0 & DC_couple==.

replace DC_couple=0 if StandAlone==1 & sample==1

//For these manufacturers, I guess whether that the system is DC coupled based on the fact that, according to TTS, batteries of these manufacturer tend not to have a solar+storage hybrid inverter.
//tab ManufacturerName solar_storage_hybrid_inverter if sample==1

replace DC_couple=0 if ManufacturerName=="CODA ENERGY" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="EGUANA" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="ENERGPORT" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="GREENCHARGE" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="IDEMAND" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="NANT (formerly SHARP)" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="OUTBACK" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="PRINCETON" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="SIMPLIPHI" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="SIMPLIPHI/OUTBACK" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="STEM" & StandAlone==0 & DC_couple==.
replace DC_couple=0 if ManufacturerName=="SUNPOWER" & StandAlone==0 & DC_couple==.

gen coupling=0 if StandAlone==1 & sample==1
replace coupling=1 if DC_coupled==0 & StandAlone==0 & sample==1
replace coupling=2 if DC_coupled==1 & sample==1

label define coupling_labels 0 "StandAlone" 1 "AC-Coupled" 2 "DC-Coupled"
label values coupling coupling_labels

gen PVSC_2020=TC_2020-TEC_2020
label var PVSC_2020 "PV System Costs (2020 dollars)"
gen ln_PVSC_2020=ln(PVSC_2020)
label var ln_PVSC_2020 "ln(PV System Costs (2020 dollars))"

gen co_install_BESS_first=(InstallationDate_BESS<InstallationDate_PV & InstallationDate_PV!=.)

gen co_install_bucket=0 if (InstallationDate_BESS<InstallationDate_PV-365 & InstallationDate_PV!=.)
replace co_install_bucket=1 if (InstallationDate_BESS<InstallationDate_PV-30 & InstallationDate_PV!=. & co_install_bucket==.)
replace co_install_bucket=2 if (InstallationDate_BESS<InstallationDate_PV & InstallationDate_PV!=. & co_install_bucket==.)
replace co_install_bucket=3 if (InstallationDate_BESS==InstallationDate_PV & InstallationDate_PV!=.)
replace co_install_bucket=4 if (InstallationDate_BESS>InstallationDate_PV & InstallationDate_PV!=.)
replace co_install_bucket=5 if (InstallationDate_BESS>InstallationDate_PV+30 & InstallationDate_PV!=.)
replace co_install_bucket=6 if (InstallationDate_BESS>InstallationDate_PV+365 & InstallationDate_PV!=.)

label define co_install_buckets 0 "BESS installed more than a year before PV" 1 "BESS installed 1 year to 31 days before PV" 2 "BESS installed 30 days or less before PV" 3 "BESS and PV installed on same day" 4 "BESS installed up to 30 days after PV" 5 "BESS installed between 31 days to a year after PV" 6 "BESS installed more than 1 year after PV"
label values co_install_bucket co_install_buckets

order ___Temp_Vars___, after(co_install_bucket) 

save "data\CA_SGIP\TTS_SGIP.dta", replace
clear