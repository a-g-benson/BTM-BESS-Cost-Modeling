replace ManufacturerName=ustrtrim(strupper(ManufacturerName))

replace ManufacturerName="ZERO IMPACT SOLUTIONS" if regexm(ManufacturerName,"ZERO IMPACT S")

replace ManufacturerName="VIKING COLD" if regexm(ManufacturerName,"VIKING COLD")

replace ManufacturerName="TRUPOWER" if regexm(ManufacturerName,"TRU PWR")

replace ManufacturerName="TROJAN" if regexm(ManufacturerName,"TROJAN")

replace ManufacturerName="TESLA" if regexm(ManufacturerName,"TESLA") | regexm(ManufacturerName,"TESTLA") | regexm(ManufacturerName,"TESAL") | regexm(ManufacturerName,"TELSA")
replace ManufacturerName="TESLA" if ManufacturerName=="TESA INC."

replace ManufacturerName="TABUCHI" if regexm(ManufacturerName,"TABUCHI")

replace ManufacturerName="SWITCH" if regexm(ManufacturerName,"SWITCH")

replace ManufacturerName="SUNPOWER" if regexm(ManufacturerName,"SUNPOWER")

replace ManufacturerName="SUNFUSION" if regexm(ManufacturerName,"SUNFUSION") | regexm(ManufacturerName,"SUUNFUSION") | regexm(ManufacturerName,"SUNFUSTION")

replace ManufacturerName="SUNVERGE" if regexm(ManufacturerName,"SUNVERGE")

replace ManufacturerName="SAMSUNG/SUNGROW" if regexm(ManufacturerName,"SAMSUNG") & regexm(ManufacturerName,"SUNGROW")
replace ManufacturerName="SAMSUNG/EPC" if regexm(ManufacturerName,"SAMSUNG") & regexm(ManufacturerName,"EPC")
replace ManufacturerName="SAMSUNG/EPC" if regexm(ManufacturerName,"SAMSUNG") & regexm(ManufacturerName,"EPC")
replace ManufacturerName="SAMSUNG/GREENSMITH" if regexm(ManufacturerName,"SAMSUNG") & regexm(ManufacturerName,"GREENSMITH")
replace ManufacturerName="SAMSUNG" if regexm(ManufacturerName,"SAMSUNG") & ManufacturerName!="SAMSUNG/SUNGROW" & ManufacturerName!="SAMSUNG/EPC" & ManufacturerName!="SAMSUNG/GREENSMITH"

replace ManufacturerName="GREENSMITH" if regexm(ManufacturerName,"SAMSUNG")==0 & regexm(ManufacturerName,"GREENSMITH")

replace ManufacturerName="STORZ" if regexm(ManufacturerName,"STORZ")

replace ManufacturerName="STORE & FORECAST" if regexm(ManufacturerName,"STORE AND FORECAST")

replace ManufacturerName="STORBOX" if regexm(ManufacturerName,"STORBOX")

replace ManufacturerName="STORBOX" if regexm(ManufacturerName,"STORBOX")

replace ManufacturerName="STEM" if regexm(ManufacturerName,"STEM INC")

replace ManufacturerName="SONNEN" if regexm(ManufacturerName,"SONNEN")

replace ManufacturerName="SOLAR TURBINES" if regexm(ManufacturerName,"SOLAR TURBINES") | regexm(ManufacturerName,"CATEPILLAR")

replace ManufacturerName="SOL-ARK" if regexm(ManufacturerName,"SOLARK")
replace ManufacturerName="FORTRESS/SOL-ARK" if regexm(ManufacturerName,"FORTRESS") & (regexm(ManufacturerName,"SOL-ARK") | regexm(ManufacturerName,"SOL_ARK"))
replace ManufacturerName="FORTRESS/SOL-ARK" if ManufacturerName=="POWER/SOL_ARK"
replace ManufacturerName="FORTRESS" if regexm(ManufacturerName,"FORTRESS") & regexm(ManufacturerName,"SOL-ARK")==0

replace ManufacturerName="DISCOVER/SOL-ARK" if regexm(ManufacturerName,"DISCOVER") & (regexm(ManufacturerName,"SOL-ARK") | regexm(ManufacturerName,"SOL_ARK"))
replace ManufacturerName="SIMPLIPHI/SOL-ARK" if regexm(ManufacturerName,"SIMPLIPHI") & (regexm(ManufacturerName,"SOL-ARK") | regexm(ManufacturerName,"SOL_ARK"))
replace ManufacturerName="SIMPLIPHI/SOL-ARK" if ManufacturerName=="SIMPLPHI BATTERIES AND SOL-ARK 12K-P"

replace ManufacturerName="SMA AMERICA" if ManufacturerName=="SMA"

replace ManufacturerName="SIMPLIPHI/OUTBACK" if regexm(ManufacturerName,"SIMPLIPHI") & regexm(ManufacturerName,"OUTBACK")
replace ManufacturerName="SIMPLIPHI" if regexm(ManufacturerName,"SIMLIPHI")
replace ManufacturerName="SIMPLIPHI" if (regexm(ManufacturerName,"SIMPLIPHI") | regexm(ManufacturerName,"SIMPLI PHI")) & regexm(ManufacturerName,"SOL-ARK")==0 & regexm(ManufacturerName,"OUTBACK")==0

replace ManufacturerName="DISCOVER/OUTBACK" if regexm(ManufacturerName,"OUTBACK") & regexm(ManufacturerName,"DISCOVER")
replace ManufacturerName="OUTBACK" if regexm(ManufacturerName,"OUTBACK") & regexm(ManufacturerName,"DISCOVER")==0 & regexm(ManufacturerName,"SIMPLIPHI")==0

replace ManufacturerName="DISCOVER" if regexm(ManufacturerName,"DISCOVER") & regexm(ManufacturerName,"OUTBACK")==0 & regexm(ManufacturerName,"SOL-ARK")==0 

replace ManufacturerName="SHARP" if regexm(ManufacturerName,"SHARP")

replace ManufacturerName="SCHNEIDER" if regexm(ManufacturerName,"SCHNEIDER")

replace ManufacturerName="PRINCETON" if regexm(ManufacturerName,"PRINCETON") & regexm(ManufacturerName,"EOS")==0

replace ManufacturerName="POWIN" if regexm(ManufacturerName,"POWIN")

replace ManufacturerName="POMCUBE" if regexm(ManufacturerName,"POMCUBE")

replace ManufacturerName="POWIN" if regexm(ManufacturerName,"POWIN")

replace ManufacturerName="PANASONIC/PIKA" if ManufacturerName=="PANASONIC PIKA ENERGY"
replace ManufacturerName="PANASONIC" if regexm(ManufacturerName,"PANASONIC") & regexm(ManufacturerName,"PIKA")==0
replace ManufacturerName="PIKA" if regexm(ManufacturerName,"PIKA") | regexm(ManufacturerName,"PIIKA")

replace ManufacturerName="PALADIN" if regexm(ManufacturerName,"PALADIN")

replace ManufacturerName="NEOVOLTA" if regexm(ManufacturerName,"NEOVOLTA") | regexm(ManufacturerName,"NEO VOLTA")

replace ManufacturerName="NECES" if regexm(ManufacturerName,"NEC ES") | regexm(ManufacturerName,"NE-CES") | regexm(ManufacturerName,"NEC-ES")

replace ManufacturerName="NANT (formerly SHARP)" if regexm(ManufacturerName,"NANT") | regexm(ManufacturerName,"SHARP")

replace ManufacturerName="MITSUBHISHI" if regexm(ManufacturerName,"MITSUBISHI")

replace ManufacturerName="MERCEDES BENZ" if regexm(ManufacturerName,"MERCEDES")

replace ManufacturerName="LOCKHEED MARTIN" if regexm(ManufacturerName,"LOCKHEED") | regexm(ManufacturerName,"LOCKHEAD")

replace ManufacturerName="LG/SOLAREDGE" if regexm(ManufacturerName,"LG") & regexm(ManufacturerName,"SOLAREDGE")
replace ManufacturerName="LG/CHINT" if regexm(ManufacturerName,"LG") & regexm(ManufacturerName,"CHINT")
replace ManufacturerName="LG/SMA/BYD" if regexm(ManufacturerName,"LG") & regexm(ManufacturerName,"SMA") & regexm(ManufacturerName,"BYD")
replace ManufacturerName="LG" if regexm(ManufacturerName,"LG") & regexm(ManufacturerName,"CHINT")==0 & regexm(ManufacturerName,"SMA")==0 & regexm(ManufacturerName,"BYD")==0 & regexm(ManufacturerName,"SOLAREDGE")==0
replace ManufacturerName="LG" in 33377

replace ManufacturerName="KOKAM" if regexm(ManufacturerName,"KOKAM")

replace ManufacturerName="JOHNSON CONTROLS" if regexm(ManufacturerName,"JOHNSON CONTROLS")

replace ManufacturerName="JLM ENERGY" if regexm(ManufacturerName,"JLM ENERGY")

replace ManufacturerName="JLM" if regexm(ManufacturerName,"JLM")

replace ManufacturerName="IMERGY" if regexm(ManufacturerName,"IMERGY")

replace ManufacturerName="IDEMAND" if regexm(ManufacturerName,"IDEMAND")

replace ManufacturerName="ICE ENERGY" if regexm(ManufacturerName,"ICE ENERGY")

replace ManufacturerName="HITACHI" if regexm(ManufacturerName,"HITACHI")

replace ManufacturerName="GS YUASA" if ManufacturerName=="GS"

replace ManufacturerName="GREENCHARGE" if regexm(ManufacturerName,"GREENCHARGE") | regexm(ManufacturerName,"GREEN CHARGE")

replace ManufacturerName="GOTION/IDEAL POWER" if ManufacturerName=="GOTION BATTERIES/IDEAL POWER INVERTER"

replace ManufacturerName="GOTION" if (regexm(ManufacturerName,"GOTION") | regexm(ManufacturerName,"GOUXUAN") | regexm(ManufacturerName,"GUOXUAN")) & regexm(ManufacturerName,"IDEAL")==0

replace ManufacturerName="GENERAL ELECTRIC" if ManufacturerName=="GE" | ManufacturerName=="GE ENERGY"

replace ManufacturerName="FLUENCE" if regexm(ManufacturerName,"FLUENCE")

replace ManufacturerName="FLEX ENERGY" if regexm(ManufacturerName,"FLEX")

replace ManufacturerName="ENPHASE" if regexm(ManufacturerName,"ENPHASE")

replace ManufacturerName="ENGIE" if regexm(ManufacturerName,"ENGIE") & regexm(ManufacturerName,"BYD")==0
replace ManufacturerName="ENGIE/BYD" if regexm(ManufacturerName,"ENGIE") & regexm(ManufacturerName,"BYD")

replace ManufacturerName="ENERGPORT" if regexm(ManufacturerName,"ENERGPORT") | regexm(ManufacturerName,"ENEGPORT")

replace ManufacturerName="ELM" if regexm(ManufacturerName,"ELM")

replace ManufacturerName="ELECTRIQ" if regexm(ManufacturerName,"ELECTRIQ")

replace ManufacturerName="EGUANA" if regexm(ManufacturerName,"EGUANA")

replace ManufacturerName="DELTA" if regexm(ManufacturerName,"DELTA")

replace ManufacturerName="CUMMINS" if regexm(ManufacturerName,"CUMMINS")

replace ManufacturerName="CORNELL/LINCOLN" if ManufacturerName=="CORNELL / LINCOLN"

replace ManufacturerName="CONCORDE" if ManufacturerName=="CONCREDE"
replace ManufacturerName="CONCORDE" if regexm(ManufacturerName,"CONCORDE")

replace ManufacturerName="CLEAN ENERGY STORAGE" if regexm(ManufacturerName,"CLEAN ENERGY STORAGE")

replace ManufacturerName="CHINT" if regexm(ManufacturerName,"CHINT") & regexm(ManufacturerName,"LG")==0

replace ManufacturerName="CAPSTONE" if regexm(ManufacturerName,"CAPSTONE")

replace ManufacturerName="BYD/SMA AMERICA" if regexm(ManufacturerName,"BYD") & regexm(ManufacturerName,"SMA")
replace ManufacturerName="BYD/CHESS" if regexm(ManufacturerName,"BYD") & regexm(ManufacturerName,"CHESS")
replace ManufacturerName="BYD" if regexm(ManufacturerName,"BYD AMERICA") | regexm(ManufacturerName,"BYD AUTO INDUSTRY COMPANY LIMITED")

replace ManufacturerName="BLUE PLANET" if regexm(ManufacturerName,"BLUE PLANET")

replace ManufacturerName="AVALON" if regexm(ManufacturerName,"AVALON")

replace ManufacturerName="ADARA" if regexm(ManufacturerName,"ADARA")

replace ManufacturerName="ACCESS/SOL-ARK" if regexm(ManufacturerName,"ACCESS SOL")

replace ManufacturerName="" if ManufacturerName=="TBD"
replace ManufacturerName="" if ManufacturerName=="12345"