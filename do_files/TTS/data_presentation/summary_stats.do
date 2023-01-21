use "data\TTS\TTS.dta"

//total publicly available observations
count

//has a battery
count if has_battery==1
scalar battery_n=r(N)

//Nearly all of this data is from SGIP
tab utility_service_territory if has_battery==1 & state==3
count if has_battery==1 & state==3
di r(N)/battery_n

clear