use "data\CA_SGIP\SGIP_data_cleaned.dta"

sum TEC if TeslaMan & sample & kW==5 & ICYear==2021
di 8500/r(mean)

sum TEC if TeslaMan & sample & kW==10 & ICYear==2021
di 16000/r(mean)

sum TEC if TeslaMan & sample & kW==15 & ICYear==2021
di 23500/r(mean)