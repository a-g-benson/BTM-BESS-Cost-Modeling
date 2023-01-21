replace ElectricUtility=ustrtrim(strupper(ElectricUtility))

replace ElectricUtility="PG&E" if ElectricUtility=="54050777"
replace ElectricUtility="PG&E" if City=="San Rafael"

replace ElectricUtility=subinstr(ElectricUtility, char(9), " ", .)
replace ElectricUtility=subinstr(ElectricUtility, char(34), "", .)

replace ElectricUtility=subinstr(ElectricUtility, " & ", " AND ", .)
replace ElectricUtility=subinstr(ElectricUtility, "&", " AND ", .)

replace ElectricUtility="ALAMEDA" if regexm(ElectricUtility, "ALAMEDA")
replace ElectricUtility="ANAHEIM" if regexm(ElectricUtility, "ANAHEIM") | ElectricUtility=="ANA"
replace ElectricUtility="ANZA" if regexm(ElectricUtility, "ANZA")
replace ElectricUtility="AZUSA" if regexm(ElectricUtility, "AZUSA")
replace ElectricUtility="BANNING" if regexm(ElectricUtility, "BANNING")
replace ElectricUtility="BURBANK" if regexm(ElectricUtility, "BURBANK") | ElectricUtility=="BW AND P" | ElectricUtility=="BWP" |  ElectricUtility=="BUR"
replace ElectricUtility="CORONA" if regexm(ElectricUtility, "CORONA")
replace ElectricUtility="BURBANK" if regexm(ElectricUtility, "GLENDALE") | ElectricUtility=="GLEN" | regexm(ElectricUtility, "GELNDALE") |  ElectricUtility=="GWP"
replace ElectricUtility="HEALDSBURG" if regexm(ElectricUtility, "HEALDSBURG")
replace ElectricUtility="IID" if regexm(ElectricUtility, "IMPERIAL") | regexm(ElectricUtility, "IID") | County=="IMPERIAL"
replace ElectricUtility="LODI" if regexm(ElectricUtility, "LODI")
replace ElectricUtility="LOMPOC" if regexm(ElectricUtility, "LOMPOC")
replace ElectricUtility="LATHROP" if regexm(ElectricUtility, "LATHROP")
replace ElectricUtility="MORENO VALLEY" if regexm(ElectricUtility, "MORENO")
replace ElectricUtility="LOMPOC" if regexm(ElectricUtility, "LOMPOC")
replace ElectricUtility="PASADENA" if regexm(ElectricUtility, "PASADENA") | ElectricUtility=="PASA" |  ElectricUtility=="PWP" | regexm(ElectricUtility, "PASEDENA") | ElectricUtility=="PAS"
replace ElectricUtility="RANCHO CUCAMONGA" if regexm(ElectricUtility, "CUCAMONGA")
replace ElectricUtility="REDDING" if regexm(ElectricUtility, "REDDING")
replace ElectricUtility="RIVERSIDE" if regexm(ElectricUtility, "RIVERSIDE") | ElectricUtility=="RIV"
replace ElectricUtility="ROSEVILLE" if regexm(ElectricUtility, "ROSEVILLE")
replace ElectricUtility="SANTA CLARA" if regexm(ElectricUtility, "SANTA CLARA") | regexm(ElectricUtility, "SILICON VALLEY") | ElectricUtility=="SPV" | ElectricUtility=="SVP" | ElectricUtility=="SVE"
replace ElectricUtility="COLTON" if regexm(ElectricUtility, "COLTON")

replace ElectricUtility="HERCULES" if regexm(ElectricUtility, "HERCULES") | regexm(ElectricUtility, "HEREULESE")
replace ElectricUtility="LADWP" if regexm(ElectricUtility, "LOS ANGELES") | ElectricUtility=="LADWP" |  ElectricUtility=="LA DWP" | ElectricUtility=="LA DEPT. OF WATER AND POWER"
replace ElectricUtility="MERCED" if regexm(ElectricUtility, "MERCED") |  ElectricUtility=="MEID"
replace ElectricUtility="MODESTO" if regexm(ElectricUtility, "MODESTO") |  ElectricUtility=="MID"
replace ElectricUtility="PACIFICORP" if regexm(ElectricUtility, "PACIFICORP")
replace ElectricUtility="PORT OF OAKLAND" if regexm(ElectricUtility, "OAKLAND")
replace ElectricUtility="SMUD" if regexm(ElectricUtility, "SACRAMENT") | regexm(ElectricUtility, "SMUD")
replace ElectricUtility="SFPUC" if regexm(ElectricUtility, "CCSF") | regexm(ElectricUtility, "SAN FRANCISCO") | regexm(ElectricUtility, "HETCH HETCHY")
replace ElectricUtility="SCE" if regexm(ElectricUtility, "SCE") | regexm(ElectricUtility, "EDISON")
replace ElectricUtility="SDG&E" if regexm(ElectricUtility, "SAN DIEGO") | regexm(ElectricUtility, "SDG AND E") | regexm(ElectricUtility, "SDGE")
replace ElectricUtility="PG&E" if regexm(ElectricUtility, "PACIFIC GAS") | regexm(ElectricUtility, "PG AND E")
replace ElectricUtility="PG&E" if regexm(ElectricUtility, "WAPA") & County=="ALAMEDA"
replace ElectricUtility="PG&E" if regexm(ElectricUtility, "SONOMA CLEAN POWER")

replace ElectricUtility="SURPRISE VALLEY" if regexm(ElectricUtility, "SURPRISE")
replace ElectricUtility="TURLOCK" if regexm(ElectricUtility, "TURLOCK") | regexm(ElectricUtility, "TID")
replace ElectricUtility="VERNON" if regexm(ElectricUtility, "VERN")

replace ElectricUtility="DIRECT ACCESS" if regexm(ElectricUtility, "CONSTELLATION") | regexm(ElectricUtility, "DIRECT ACCESS") | regexm(ElectricUtility, "SEMPRE")

replace ElectricUtility="PG&E" if ElectricUtility=="DIRECT ACCESS" & (County=="ALAMEDA" | County=="SANTA CLARA" | County=="MARIN" | County=="SAN JOAQUIN" | County=="CONTRA COSTA" | County=="MONTEREY" | County=="FRESNO" | County=="SOLANO")
replace ElectricUtility="PG&E" if ElectricUtility=="DIRECT ACCESS" & SGIPAdministrator=="Pacific Gas and Electric"

//Encoding Utilities as Numeric Variables
encode ElectricUtility, generate(ElecUtilityCode)
order ElecUtilityCode, after(ElectricUtility)
label var ElectricUtility "Electric Utility (string)"
label var ElecUtilityCode "Electric Utility (numeric)"