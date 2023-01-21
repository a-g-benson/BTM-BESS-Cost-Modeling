//Section 3.1
//Count of Raw BESS observations
use "data\CA_SGIP\SGIP_raw.dta"
tab EquipmentType
clear

//Count of BESS observations in Final, Cleaned Sample
use "data\CA_SGIP\TTS_SGIP.dta"

count if sample==1
scalar sample_size=r(N)

count if training_sample==1
count if validation_sample==1

//Share of obs with PV
count if sample==1 & (PairedWith=="Photovoltaic" | kW_pv!=.)
di (r(N)/sample_size*100) "% of sample is paired with solar"

//Share of obs not paired with DG
tab StandAlone if sample==1 

//Share of obs paired with non-solar DG
count if sample==1 & (PairedWith!="Photovoltaic" & kW_pv==.) & StandAlone==0
di (r(N)/sample_size*100) "% of sample is paired with non-solar distributed generation"

//Residential vs. Non-Residential
tab Residential if sample==1
tab HostCustomerSector if sample==1

//Energy-Capacity-Weighted Sector Shares
sum kWh if sample==1
scalar total_kWh=r(N)*r(mean)

sum kWh if sample==1 & Residential==1
scalar res_kWh=r(N)*r(mean)
display as text round(res_kWh/total_kWh*100,.1) "% of energy capacity in residential sector"

sum kWh if sample==1 & Residential==0
scalar NR_kWh=r(N)*r(mean)
display as text round(NR_kWh/total_kWh*100,.1) "% of energy capacity in non-residential sector"

//Share of Obs belonging to special set-aside categories
tab BudgetCategory if sample==1
count if sample==1 & (regexm(BudgetCategory, "Equity") | regexm(BudgetCategory, "Joaquin"))
display as text round(r(N)/sample_size*100,.1) "% of installations in an equity or SJ budget category"

//Energy-Capacity-Weighted Share belonging to special set-aside categories
sum kWh if sample==1 & (regexm(BudgetCategory, "Equity") | regexm(BudgetCategory, "Joaquin"))
display as text round(r(N)*r(mean)/total_kWh*100,.1) "% of energy capacity in an equity or SJ budget category"

//Share of Obs. that are Tesla Powerwalls
tab TeslaMan if sample==1

//Energy-Capacity-Weighted Share of sample that is Tesla Powerwalls
collapse (sum) kWh if sample==1, by(ManufacturerName)

sum kWh
scalar total_kWh=r(mean) * r(N)

sum kWh if ManufacturerName=="TESLA"

display (r(mean)/total_kWh*100) "% of energy capacity attributable to Tesla"
clear