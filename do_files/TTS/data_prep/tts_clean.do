use "data\TTS\TTS_raw.dta"

//replace -1 with missing

replace data_provider_2="" if data_provider_2=="-1"
replace installation_date="" if installation_date=="NaT"
replace system_size_dc=. if system_size_dc==-1
replace total_installed_price=. if total_installed_price==-1
replace rebate_or_grant=. if rebate_or_grant==-1
replace customer_segment="" if customer_segment=="-1"
replace new_construction=. if new_construction==-1
replace tracking=. if tracking==-1
replace ground_mounted=. if ground_mounted==-1
replace third_party_owned=. if third_party_owned==-1
replace zip_code=. if zip_code==-1
replace city="" if city=="-1"

replace state="AZ" if state=="-1" & (utility_service_territory=="Arizona Public Service" | utility_service_territory=="Tucson Electric Power" | utility_service_territory=="Salt River Project" | utility_service_territory=="Trico Electric Cooperative" | utility_service_territory=="Sulfur Springs Valley Electric Cooperative" | utility_service_territory=="Ajo Improvement Company" | data_provider_1=="UniSource Energy Services" | utility_service_territory=="Morenci Water and Electric")
replace state="CA" if state=="-1" & (utility_service_territory=="Southern California Edison" | utility_service_territory=="San Diego Gas and Electric" | utility_service_territory=="Riverside Public Utilities" | utility_service_territory=="Pacific Gas and Electric" | utility_service_territory=="Los Angeles Department of Water & Power" | utility_service_territory=="City of Palo Alto Utilities" | utility_service_territory=="City and County of San Francisco" | utility_service_territory=="Burbank Water and Power" | utility_service_territory=="Bear Valley Electric" | utility_service_territory=="Anaheim Public Utilities")
replace state="CA" if state=="-1" & regexm(data_provider_1,"California Center for Sustainable Energy")
replace state="OR" if state=="-1" & regexm(data_provider_1,"Oregon")
replace state="NM" if state=="-1" & (utility_service_territory=="Public Service Co of New Mexico" | regexm(data_provider_1,"New Mexico"))
replace state="CO" if state=="-1" & (utility_service_territory=="Public Service Company of Colorado")
replace state="UT" if state=="-1" & regexm(data_provider_1,"Utah")
replace state="TX" if state=="-1" & (utility_service_territory=="Austin Energy" | utility_service_territory=="CPS Energy" | utility_service_territory=="Sharyland Utilities")
replace state="MA" if state=="-1" & (regexm(data_provider_1,"Massachusetts") | regexm(data_provider_1,"MA DOER"))
replace state="NH" if state=="-1" & regexm(data_provider_1,"New Hampshire")
replace state="NY" if state=="-1" & (utility_service_territory=="Long Island Power Authority" | regexm(data_provider_1,"New York"))
replace state="PA" if state=="-1" & regexm(data_provider_1,"Pennsylvania")
replace state="DE" if state=="-1" & regexm(data_provider_1,"Delaware")
replace state="NJ" if state=="-1" & regexm(data_provider_1,"New Jersey")
replace state="RI" if state=="-1" & regexm(data_provider_1,"Rhode Island")
replace state="VT" if state=="-1" & regexm(data_provider_1,"Vermont")
replace state="CT" if state=="-1" & (regexm(data_provider_1,"Connecticut") | utility_service_territory=="Connecticut Light & Power" | utility_service_territory=="United Illuminating")
replace state="ME" if state=="-1" & regexm(data_provider_1,"Maine")
replace state="MD" if state=="-1" & regexm(data_provider_1,"Maryland")
replace state="IL" if state=="-1" & regexm(data_provider_1,"Illinois")
replace state="WI" if state=="-1" & regexm(data_provider_1,"Wisconsin")
replace state="MN" if state=="-1" & regexm(data_provider_1,"Minnesota")
replace state="OH" if state=="-1" & regexm(data_provider_1,"Ohio")
replace state="" if state=="-1"

encode state, gen(state2)
drop state
rename state2 state

foreach var of varlist module_quantity_* nameplate_capacity_module_* efficiency_module_* inverter_quantity_* additional_inverters additional_inverters micro_inverter_* built_in_meter_inverter_* output_capacity_inverter_* dc_optimizer inverter_loading_ratio battery_rated_capacity_kw battery_rated_capacity_kwh azimuth_* tilt_* additional_modules bipv_module_* bifacial_module_* efficiency_module_* {
	replace `var'=. if `var'==-1
}

recast int module_quantity_* inverter_quantity_*, force

replace dateofbatteryinstall="" if dateofbatteryinstall=="-1"

gen has_battery=!missing(dateofbatteryinstall)
replace has_battery=1 if battery_model=="Powerwall 2.0" | battery_model=="RESU10H"

//aggregating counts of modules & inverters

generate missing_module_count=module_quantity_1==.
replace module_quantity_2=0 if module_quantity_2==. & missing_module_count==0
replace module_quantity_3=0 if module_quantity_3==. & missing_module_count==0

gen module_q=module_quantity_1+module_quantity_2+module_quantity_3
replace module_q=. if additional_modules==1

generate missing_inverter_count=inverter_quantity_1==.
replace inverter_quantity_2=0 if inverter_quantity_2==. & missing_inverter_count==0
replace inverter_quantity_3=0 if inverter_quantity_3==. & missing_inverter_count==0

gen inverter_q=inverter_quantity_1+inverter_quantity_2+inverter_quantity_3
replace inverter_q=. if additional_inverters==1

generate missing_inverter_capacity=output_capacity_inverter_1==.
replace output_capacity_inverter_2=0 if output_capacity_inverter_2==. & missing_inverter_capacity==0
replace output_capacity_inverter_3=0 if output_capacity_inverter_3==. & missing_inverter_capacity==0

gen kW_inverter=inverter_quantity_1*output_capacity_inverter_1+inverter_quantity_2*output_capacity_inverter_2+inverter_quantity_3*output_capacity_inverter_3


//Dates

gen InstallationDate_PV = date(installation_date, "DMY")
gen InstallationMonth_PV = mofd(InstallationDate_PV)
gen InstallationYear_PV = yofd(InstallationDate_PV)

gen InstallationDate_BESS = date(dateofbatteryinstall, "DMY")
gen InstallationMonth_BESS = mofd(InstallationDate_BESS)
gen InstallationYear_BESS = yofd(InstallationDate_BESS)

//Creating Headers

gen ___Administrative_Data___ = .
label var ___Administrative_Data___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Location_Data___ = .
label var ___Location_Data___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Customer_Data___ = .
label var ___Customer_Data___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Installer_Data___ = .
label var ___Installer_Data___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Dates___ = .
label var ___Dates___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Technical_Specs_PV___ = .
label var ___Technical_Specs_PV___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Technical_Specs_Inv___ = .
label var ___Technical_Specs_Inv___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Technical_Specs_BESS___ = .
label var ___Technical_Specs_BESS___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
gen ___Money___ = .
label var ___Money___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"


//Organizing Administrative Data

order ___Administrative_Data___ system_id_1 system_id_2 data_provider_1 data_provider_2

//Organizing Location Data

order ___Location_Data___ zip_code city state utility_service_territory, after(data_provider_2)

//Organizing Customer Data

gen Residential=1 if customer_segment=="RES"
replace Residential=0 if customer_segment!="RES"
label var Residential "=1 if Residential, 0 otherwise"

order ___Customer_Data___ customer_segment Residential third_party_owned new_construction expansion_system multiple_phase_system, after(utility_service_territory)

//Organizing Installer Data

order ___Installer_Data___ installer_name self_installed, after(multiple_phase_system)


//Organizing Dates
gen co_install_exact=(InstallationDate_BESS==InstallationDate_PV)
replace co_install_exact=0 if has_battery==0
replace co_install_exact=. if InstallationDate_PV==.

gen co_install_30=(InstallationDate_BESS>InstallationDate_PV-31 & InstallationDate_BESS<InstallationDate_PV+31)
replace co_install_30=0 if co_install_exact==1
replace co_install_30=0 if has_battery==0
replace co_install_30=. if InstallationDate_PV==.

gen co_install_60=(InstallationDate_BESS>InstallationDate_PV-61 & InstallationDate_BESS<InstallationDate_PV+61)
replace co_install_60=0 if co_install_exact==1 | co_install_30==1
replace co_install_60=0 if has_battery==0
replace co_install_60=. if InstallationDate_PV==.

gen co_install_90=(InstallationDate_BESS>InstallationDate_PV-91 & InstallationDate_BESS<InstallationDate_PV+91)
replace co_install_90=0 if co_install_exact==1 | co_install_30==1 | co_install_60==1
replace co_install_90=0 if has_battery==0
replace co_install_90=. if InstallationDate_PV==.

gen co_install_120=(InstallationDate_BESS>InstallationDate_PV-121 & InstallationDate_BESS<InstallationDate_PV+121)
replace co_install_120=0 if co_install_exact==1 | co_install_30==1 | co_install_60==1 | co_install_90==1
replace co_install_120=0 if has_battery==0
replace co_install_120=. if InstallationDate_PV==.

label var co_install_exact "=1 if PV array & BESS are installed on the exact same day"
label var co_install_30 "=1 if PV array & BESS are installed within 1 to 30 days of each other"
label var co_install_60 "=1 if PV array & BESS are installed within 31 to 60 days of each other"
label var co_install_90 "=1 if PV array & BESS are installed within 61 to 90 days of each other"
label var co_install_120 "=1 if PV array & BESS are installed within 91 to 120 days of each other"

order ___Dates___ InstallationDate_PV InstallationMonth_PV InstallationYear_PV InstallationDate_BESS InstallationMonth_BESS InstallationYear_BESS co_install_*, after(self_installed)
drop installation_date dateofbatteryinstall

//Organizing PV Technical Specs

order ___Technical_Specs_PV___ system_size_dc tracking ground_mounted azimuth_1 azimuth_2 azimuth_3 tilt_1 tilt_2 tilt_3 module_manufacturer_1 module_manufacturer_2 module_manufacturer_3 module_model_1 module_model_2 module_model_3 module_quantity_1 module_quantity_2 module_quantity_3 module_q technology_module_1 technology_module_2 technology_module_3 bipv_module_1 bipv_module_2 bipv_module_3 bifacial_module_1 bifacial_module_2 bifacial_module_3 nameplate_capacity_module_1 nameplate_capacity_module_2 nameplate_capacity_module_3 efficiency_module_1 efficiency_module_2 efficiency_module_3 additional_modules missing_module_count, after(InstallationYear_BESS)

rename system_size_dc kW_pv
label var kW_pv "PV System Size (kW_DC)"

gen ln_kW_pv=ln(kW_pv), after(kW_pv)
label var ln_kW_pv "ln(PV System Size (kW_DC))"

gen ihs_kW_pv=asinh(kW_pv), after(ln_kW_pv)
label var ihs_kW_pv "asinh(PV System Size (kW_DC))"

//Organizing Inverter Technical Specs

gen micro_inverter=(micro_inverter_1==1 | micro_inverter_2==1 | micro_inverter_3==1)
label var micro_inverter "=1 if any of the inverters are microinverters"

//gen solar_storage_hybrid_inverter=(solar_storage_hybrid_inverter_1==1 | solar_storage_hybrid_inverter_2==1 | solar_storage_hybrid_inverter_3==1)
//label var solar_storage_hybrid_inverter "=1 if any of the inverters are solar+storage hybrid inverters"

order ___Technical_Specs_Inv___ kW_inverter inverter_manufacturer_1 inverter_manufacturer_2 inverter_manufacturer_3 inverter_model_1 inverter_model_2 inverter_model_3 inverter_quantity_1 inverter_quantity_2 inverter_quantity_3 inverter_q micro_inverter_1 micro_inverter_2 micro_inverter_3 micro_inverter built_in_meter_inverter_1 built_in_meter_inverter_2 built_in_meter_inverter_3 output_capacity_inverter_1 output_capacity_inverter_2 output_capacity_inverter_3 dc_optimizer inverter_loading_ratio additional_inverters missing_inverter_count missing_inverter_capacity, after(missing_module_count)

rename kW_inverter kW_inv
label var kW_inv "Inverter Size (kW)"

gen ln_kW_inv=ln(kW_inv), after(kW_inv)
label var ln_kW_inv "ln(Inverter Size (kW))"

gen ihs_kW_inv=asinh(kW_inv), after(ln_kW_inv)
label var ihs_kW_inv "asinh(Inverter Size (kW))"

//Organizing BESS Technical Specs
order ___Technical_Specs_BESS___ has_battery battery_manufacturer battery_model battery_rated_capacity_kw battery_rated_capacity_kwh, after(missing_inverter_capacity)

replace battery_rated_capacity_kw=0 if battery_rated_capacity_kw==. & has_battery==0
replace battery_rated_capacity_kwh=0 if battery_rated_capacity_kwh==. & has_battery==0

rename battery_rated_capacity_kw kW_bess
label var kW_bess "Rated Power Capacity of Battery (kW)"
rename battery_rated_capacity_kwh kWh_bess
label var kWh_bess "Rated Energy Capacity of Battery (kWh)"

gen ln_kW_bess=ln(kW_bess), after(kWh_bess)
label var ln_kW_bess "ln(Rated Power Capacity of Battery (kW))"
gen ln_kWh_bess=ln(kWh_bess), after(ln_kW_bess)
label var ln_kWh_bess "ln(Rated Energy Capacity of Battery (kWh))"

gen ihs_kW_bess=asinh(kW_bess), after(ln_kWh_bess)
label var ihs_kW_bess "asinh(Rated Power Capacity of Battery (kW))"
gen ihs_kWh_bess=asinh(kWh_bess), after(ihs_kW_bess)
label var ihs_kWh_bess "asinh(Rated Energy Capacity of Battery (kWh))"

//Battery Model Cleaning

do "do_files\TTS\data_prep\battery_model_cleaning_and_data.do"

//Organizing Money

order ___Money___ total_installed_price rebate_or_grant, after(ihs_kWh_bess)
rename total_installed_price TC
label var TC "Total Installed Cost (Nominal)"
gen ln_TC=ln(TC), after(TC)
label var ln_TC "ln(Total Installed Cost (Nominal))"
gen ihs_TC=asinh(TC), after(ln_TC)
label var ihs_TC "asinh(Total Installed Cost (Nominal))"

rename rebate_or_grant subsidy
label var subsidy "Rebate, Grant, or other Subsidy (Nominal)"
gen ln_subsidy=ln(subsidy), after(subsidy)
label var ln_subsidy "ln(Rebate, Grant, or other Subsidy (Nominal))"
gen ihs_subsidy=asinh(subsidy), after(ln_subsidy)
label var ihs_subsidy "asinh(Rebate, Grant, or other Subsidy (Nominal))"

gen TC_per_kW=TC/kW_pv
label var TC_per_kW "Cost per kW (Nominal)"
gen ln_TC_per_kW=ln(TC_per_kW)
label var ln_TC_per_kW "ln(Cost per kW (Nominal))"
gen ihs_TC_per_kW=asinh(TC_per_kW)
label var ihs_TC_per_kW "asinh(Cost per kW (Nominal))"

//defining sample

gen sample=1
replace sample=0 if InstallationYear_PV<2000 | InstallationYear_PV>2021
replace sample=0 if TC==.
replace sample=0 if kW_pv==.
replace sample=0 if kW_pv<1
replace sample=0 if kWh_bess<-1 //idk how but there are batteries with very large, negative values of energy capacity

// I trim the top and bottom 1% of outliers (within each year) from the TTS sample because there appears to be a LOT of garbage data. As in: stupidly high and stupidly low costs per kWh that simply have no explanation other than data entry error.

foreach year of numlist 2000/2022 {
	qui sum TC_per_kW if sample==1 & InstallationYear_PV==`year', detail
	replace sample=0 if (TC_per_kW<r(p1) | TC_per_kW>r(p99)) & InstallationYear_PV==`year'
}

label var sample "=1 if included in the sample"
order sample, before(___Location_Data___)

//Inflation Adjustment

do "do_files\TTS\data_prep\inflation_adjustment.do"

//Space for Temp Variables 

gen ___Temp_Vars___ = .
label var ___Temp_Vars___ "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"

//Final Save
save "data\TTS\TTS.dta", replace
clear