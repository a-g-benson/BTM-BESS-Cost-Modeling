use "data\CA_SGIP\SGIP_raw.dta"

rename IncentiveLevel12RET3NR IncentiveLevel
label var IncentiveLevel "Generosity of SGIP Incentive (2001-2016 rules)"

rename Step IncentiveStep
label var IncentiveStep "Generosity of SGIP Incentive (2017-present rules)"

rename Renewable RenewablePercentage
label var RenewablePercentage "Renewable Fuel Percentage"

replace PairedWithRenewable="0" if PairedWithRenewable=="FALSE"
replace PairedWithRenewable="1" if PairedWithRenewable=="TRUE"
destring PairedWithRenewable, replace
label define true_false 0 "False" 1 "True"
label values PairedWithRenewable true_false
label var PairedWithRenewable "Paired with Renewable Generation"

replace PairedWith="Advanced Energy Storage" if PairedWith=="A.E.S."

rename EquipmentManufacturer ManufacturerName
rename DeveloperCompanyName DeveloperName

do "do_files\CA_SGIP\data_prep\manufacturer_name_cleaning.do"
do "do_files\CA_SGIP\data_prep\developer_name_cleaning.do"
do "do_files\CA_SGIP\data_prep\installer_name_cleaning.do"

gen ___Program_Data___ = .
label var ___Program_Data___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Technical_Specs___ = .
label var ___Technical_Specs___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Companies_Involved___ = .
label var ___Companies_Involved___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Customer_Data___ = .
label var ___Customer_Data___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Location_Data___ = .
label var ___Location_Data___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Dates___ = .
label var ___Dates___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Money___ = .
label var ___Money___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"

encode BudgetCategory, gen(BudgetCategoryCode)
label var BudgetCategory "Budget Category (string)"
label var BudgetCategoryCode "Budget Category (numeric)"

encode SGIPAdministrator, gen(SGIPAdminCode)
label var SGIPAdministrator "SGIP Administrator (string)"
label var SGIPAdminCode "SGIP Administrator (numeric)"

order ___Program_Data___ ApplicationCode SGIPAdministrator SGIPAdminCode ProgramYear IncentiveLevel IncentiveStep BudgetCategory BudgetCategoryCode BudgetClassification FullyQualifiedState ___Technical_Specs___, first

save "data\CA_SGIP\SGIP_data_cleaned.dta", replace
clear

do "do_files\CA_SGIP\data_prep\has_PV_from_TTS.do"

use "data\CA_SGIP\SGIP_data_cleaned.dta"

replace ApplicationCode = string(_n) if ApplicationCode==""
merge 1:1 ApplicationCode using "data\CA_SGIP\has_PV_from_TTS.dta", nogenerate

gen StandAlone=mi(PairedWith)
replace StandAlone=0 if PairedWithRenewable==1
replace StandAlone=1 if PairedWith=="Advanced Energy Storage" | PairedWith=="Electrochemical Storage"
replace StandAlone=0 if !mi(kW_pv)
label var StandAlone "=1 if not paired with generation"

drop kW_pv

order EquipmentType FuelType BiogasSource RenewablePercentage PairedWith PairedWithRenewable StandAlone RatedCapacitykW EnergyStorageCapacitykWh ___Companies_Involved___, after(___Technical_Specs___)

rename RatedCapacitykW kW
label var kW "Rated Power Capacity [kW]"
rename EnergyStorageCapacitykWh kWh

gen ln_kW=ln(kW), after(kW)
label var ln_kW "ln(Rated Power Capacity [kW])"

gen ln_kWh=ln(kWh), after(kWh)
label var ln_kWh "ln(Energy Storage Capacity [kWh])"

gen duration=kWh/kW
label var duration "Discharge Duration (hours)"
egen duration_bin=cut(duration), at(0(2)6) icodes
label define duration_bin_code 0 "<2 hours" 1 "2 to 4 hours" 2 "4 to 6 hours"
label values duration_bin duration_bin_code
label var duration_bin "Discharge Duration (categorical)"
order duration duration_bin, before(___Companies_Involved___)

encode ManufacturerName, gen(ManufacturerCode)
encode InstallerName, gen(InstallerCode)

gen TeslaMan=ManufacturerName=="TESLA"
label var TeslaMan "=1 if Manufacturer is Tesla"

gen TeslaDev=(Developer=="TESLA" | Developer=="SOLARCITY")
label var TeslaDev "=1 if Developer is Tesla (or SolarCity)"

gen TeslaInst=(InstallerName=="TESLA" | InstallerName=="SOLARCITY")
label var TeslaInst "=1 if Installer is Tesla (or SolarCity)"

gen LGMan=ManufacturerName=="LG"
gen EnphaseMan=ManufacturerName=="ENPHASE"
gen OtherMan=1 if LGMan==0 & EnphaseMan==0 & TeslaMan==0
replace OtherMan=0 if OtherMan==.

label var LGMan "=1 if Manufacturer is LG"
label var EnphaseMan "=1 if Manufacturer is Enphase"
label var OtherMan "=1 if Manufacturer is neither Tesla, LG, nor Enphase"

order ManufacturerName ManufacturerCode DeveloperName InstallerName InstallerCode TeslaMan TeslaDev TeslaInst LGMan EnphaseMan  OtherMan ___Customer_Data___, after(___Companies_Involved___)

gen Residential=1 if HostCustomerSector=="Multifamily" | HostCustomerSector=="Single Family" | HostCustomerSector=="Residential"
replace Residential=0 if HostCustomerSector=="Commercial" | HostCustomerSector=="Small Business" | HostCustomerSector=="Non-Profit" | HostCustomerSector=="Educational Institution" | HostCustomerSector=="Government" | HostCustomerSector=="State or Local Government" | HostCustomerSector=="Tribal Agency"

label define CustomerClassValues 1 "Residential" 0 "Non-Residential"
label values Residential CustomerClassValues
label var Residential "=1 if Residential"

order HostCustomerSector Residential HostCustomerSICNAICSCode ___Location_Data___, after(___Customer_Data___)

order Zip City County WestLALRA ElectricUtility GasUtility ___Dates___, after(___Location_Data___)

rename RRFSubmitted RRFSubmittedDate
rename Interconnectiondate InterconnectionDate

gen RRFSubmittedDate2 = date(RRFSubmittedDate, "MDY")
format %tdNN/DD/CCYY RRFSubmittedDate2
drop RRFSubmittedDate
rename RRFSubmittedDate2 RRFSubmittedDate

gen DateReceived2 = date(DateReceived, "MD20Y#")
format %tdNN/DD/CCYY DateReceived2

rename DateReceived DateTimeReceived
label var DateTimeReceived "Date-Time when the RRF was Received"
rename DateReceived2 DateReceived
label var DateReceived "Date when the RFF was Received"

order RRFSubmittedDate DateReceived DateTimeReceived InterconnectionDate PaymentCompletedDate CancelledDate ___Money___, after(___Dates___)

order FuelIncentive EquipmentIncentive CurrentIncentive TypeofOtherIncentive OtherIncentiveAmount TotalEligibleCosts, last

rename TypeofOtherIncentive OtherIncentiveSource
label var OtherIncentiveSource "Source of Additional Incentive Money"

gen ln_TEC=ln(TotalEligibleCosts)
label var ln_TEC "ln(Total Eligible Costs)"
rename TotalEligibleCosts TEC

rename CurrentIncentive SGIPIncentive

gen temp=OtherIncentiveAmount
replace temp=0 if OtherIncentiveAmount==.
gen TI=SGIPIncentive+temp
gen ln_TI=ln(TI)
drop temp
order TI ln_TI, after(OtherIncentiveAmount)
label var TI "Total Incentive Funding"

do "do_files\CA_SGIP\data_prep\location_cleaning.do"
do "do_files\CA_SGIP\data_prep\utility_cleaning.do"

replace InterconnectionDate="9/1/2021" if ApplicationCode=="SCG-SGIP-2020-2009" //Obvious typo in date.

gen ICDate=date(InterconnectionDate,"MDY")
replace ICDate=. if ICDate<mdy(1,1,2000)
format ICDate %tdNN/DD/CCYY
drop InterconnectionDate
gen ICMonth=mofd(ICDate)
format ICMonth %tmMon-CCYY
gen ICYear=yofd(ICDate)
order ICDate ICMonth ICYear, after(DateReceived)
label var ICDate "Interconnection Date"
label var ICMonth "Interconnection Month"
label var ICYear "Interconnection Year"

gen ___Sample___ = .
label var ___Sample___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"

gen sample=1 if reliable_location==1 & EquipmentType=="Electrochemical Storage"
replace sample=0 if sample==.
replace sample=0 if ApplicationCode=="PGE-SGIP-2020-6176" //$2.69 billion in total eligible costs for a 15 kW, 39.6 kWh residential storage system? Sounds like a typo or very brazen faud. 
replace sample=0 if ApplicationCode=="SCG-SGIP-2017-0619" //$609 million for a 280 kW and 651 kWh system seems excessive. Cost per kWh is $936,000
replace sample=0 if kW==. | kWh==. | TEC==. //exclude from sample if missing the core data
replace sample=0 if ICYear-ProgramYear<=-3 & ICYear!=. //exclude from sample if the interconnection date is 3 or more years before the "Program Year." My manual inspection of the data concludes these are highly likely to be data entry errors. It's not worth the trouble to identify and correct all possible such errors.
replace sample=0 if ICYear-ProgramYear>=3 & ICYear!=. //exclude from sample if the interconnection date is 3 or more years after the "Program Year"
replace sample=0 if ICYear<2013 //Not enough observations prior to 2013 to generate valid statistical inferences.
replace sample=0 if ICYear>2022 //I downloaded the data most recently on January 4th, 2023. I choose to exclude 5 observations from 2023 because that's an insufficient sample size to make any statistical inferences from. Plus, it enhances ease of exposition in the manuscript to only consider systems interconnected on or before 12/31/2022.
replace sample=0 if duration>6 //SGIP does not provide any incentives for batteries with durations in excess of 6 hours, so such observations must have erroneous data.
replace sample=0 if BudgetClassification=="Cancelled" | BudgetClassification==""

//Defining Training and Validation Samples
gen training_sample=(sample==1 & ICYear!=2022)
gen validation_sample=(sample==1 & ICYear==2022)


//Tesla-Specific Data-Cleaning
//These commands bin the observations into values equal to an integer number of (2nd edition) Powerwalls.
//1st Edition Powerwalls are left alone, as they are very rare in this dataset.
//In some cases, it is clear that the users did not follow SGIP instructions regarding calculations.
//For example, SGIP requires that applicants report the kWh rating after accounting for DC-to-AC conversion losses.
//The vast majority of observations with Tesla Powerwalls report 13.2 kWh (or integer multiples thereof), but some report 13.5 kWh (which is the claimed "usable energy" rating by Tesla, but that value isn't adjusted for inverter losses as SGIP requires.)
//Other observations are just way off.
replace kWh=13.2 if kWh<=14 & kWh>12.229 & Residential==1 & TeslaMan==1
replace kW=5 if kW<10 & kWh==float(13.2) & Residential==1 & TeslaMan==1
replace kWh=13.2 if kWh>16.6 & kWh<16.7 & Residential==1 & TeslaMan==1
replace kWh=26.4 if kWh<30 & kWh>20 & Residential==1 & TeslaMan==1
replace kWh=39.6 if kWh<45 & kWh>35 & Residential==1 & TeslaMan==1
replace kWh=52.8 if kWh==float(52.6) & Residential==1 & TeslaMan==1

gen ___County_Data___ = .
label var ___County_Data___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"

merge m:1 County ICYear using "data\ACS_Data\acs_data.dta", keep(match master) generate(has_ACS_data)

rename CountyPop CountyPop_ACS
label var CountyPop "County Population (ACS)"

gen ln_CountyPop_ACS =  ln(CountyPop_ACS)
gen ln_MedHHInc = ln(MedHHInc)
label var ln_CountyPop "ln(County Population)(ACS)"
label var ln_MedHHInc "ln(County Median Income)(2019 dollars)"

merge m:1 County using "data\BLS_OEWS\county_MSA_match.dta", keep(match master) nogenerate
gen AREA=AREA_2017 if ICYear<=2017
replace AREA=AREA_2014 if ICYear<=2014
replace AREA=AREA_2018 if ICYear>=2018
drop AREA_2014 AREA_2017 AREA_2018

merge m:1 AREA ICYear using "data\BLS_OEWS\OEWS_Electrician_Wages.dta", keep(match master) keepusing(elec_wage_mean elec_wage_median ln_elec_wage_mean ln_elec_wage_median AREA_NAME) generate(has_BLS_data)
rename AREA MSA_code
rename AREA_NAME MSA_name
label var MSA_code "Metropolitan Statistical Area (code)(BLS)"
label var MSA_name "Metropolitan Statistical Area (string)(BLS)"
order MSA_code MSA_name, after(County_by_ZIP)

merge m:1 County ICYear using "data\CAINC1\CAINC1_CA.dta", keep(match master) generate(has_BEA_data)

gen ln_PCPI=ln(PCPI)
label var ln_PCPI "ln(County Per Capita Personal Income) (nominal)(BEA)"
gen ln_PI=ln(PI)
label var ln_PI "ln(County Personal income) (thousands, nominal)(BEA)"

rename Pop CountyPop_BEA
gen ln_CountyPop_BEA = ln(CountyPop_BEA)
label var ln_CountyPop_BEA "ln(County Population)(BEA)"

order ___County_Data___ has_ACS_data has_BEA_data CountyPop_ACS ln_CountyPop_ACS CountyPop_BEA ln_CountyPop_BEA MedHHInc ln_MedHHInc has_ACS_data PCPI ln_PCPI PI ln_PI elec_wage_mean elec_wage_median ln_elec_wage_mean ln_elec_wage_median has_BLS_data, after(GasUtility)

gen ___Temp_Vars___ = .
label var ___Temp_Vars___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"

save "data\CA_SGIP\SGIP_data_cleaned.dta", replace

do "do_files\CA_SGIP\data_prep\inflation_adjustment.do"

save "data\CA_SGIP\SGIP_data_cleaned.dta", replace
clear

do "do_files\TTS\data_prep\TTS_SGIP_match_merge.do"
