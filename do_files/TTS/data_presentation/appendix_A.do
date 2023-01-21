use "data\TTS\TTS.dta"
tab utility_service_territory if has_battery
tab state if has_battery, miss
clear

use "data\CA_SGIP\TTS_SGIP.dta"
tab _merge if sample==1
tab ICYear if sample==1 & _merge==1
count if sample==1 & _merge==1 & StandAlone==0 & ICYear<2022
clear