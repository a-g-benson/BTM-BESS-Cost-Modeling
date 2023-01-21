replace InstallerName=subinstr(InstallerName, char(9), " ", .)
replace InstallerName=subinstr(InstallerName, char(34), "", .)
replace InstallerName=ustrtrim(strupper(InstallerName))
replace InstallerName=ustrregexra(InstallerName,"\.+","")
replace InstallerName=ustrregexra(InstallerName,"( CO)$","")
replace InstallerName=ustrregexra(InstallerName,"( CORP)$","")
replace InstallerName=ustrregexra(InstallerName,"( CORPORATION)$","")
replace InstallerName=ustrregexra(InstallerName,"( INC)$","")
replace InstallerName=ustrregexra(InstallerName,"( INCORPORATED)$","")
replace InstallerName=ustrregexra(InstallerName,"( LLC)$","")
replace InstallerName=ustrregexra(InstallerName,"( LTD)$","")
replace InstallerName=ustrregexra(InstallerName," & "," AND ")
replace InstallerName=ustrregexra(InstallerName,"&"," AND ")
replace InstallerName=ustrtrim(InstallerName)

replace InstallerName="YOUR ENERGY SOLUTIONS" if regexm(InstallerName,"YOUR ENERGY SOLU")

replace InstallerName="WORLDWATER" if regexm(InstallerName,"WORLDWATER") | regexm(InstallerName,"WORLD WATER")

replace InstallerName="WM LYLES" if regexm(InstallerName,"W M LYLES")

replace InstallerName="WIRED INTO THE FUTURE" if regexm(InstallerName,"WIRED INTO THE FUTURE")

replace InstallerName="WINDGATE ENERGY" if regexm(InstallerName,"WINDGATE ENERG")

replace InstallerName="WESTHAVEN" if regexm(InstallerName,"WESTHAVEN")

replace InstallerName="WESTCOAST SOLAR" if InstallerName=="WEST COAST SOLAR" & DeveloperName=="SEA BRIGHT SOLAR" & ManufacturerName=="TESLA" //correcting a typo; this company doesn't do business in SoCal
replace InstallerName="WEST COAST SOLAR" if regexm(InstallerName,"WEST COAST SOLAR") //This company is based in based in Brentwood, in inland Contra Costa County.
replace InstallerName="WESTCOAST SOLAR" if regexm(InstallerName,"WESTCOAST SOLAR") & regexm(InstallerName,"ENERGY")==0 //This company is based in Riverside.
replace InstallerName="WESTCOAST SOLAR ENERGY" if regexm(InstallerName,"WESTCOAST SOLAR ENERGY") //This company is based in Sonoma County.

replace InstallerName="WESTERN SUN SYSTEMS" if InstallerName=="WESTERNSUNSYSTEMS"

replace InstallerName="WESLEY HODGES" if regexm(InstallerName,"WESLEY HODGES")

replace InstallerName="WELTER ELECTRIC" if regexm(InstallerName,"WELTER ELECTRIC")

replace InstallerName="WE O'NEIL" if regexm(InstallerName,"E O'NEIL")

replace InstallerName="WE BUILD SAN DIEGO" if regexm(InstallerName, "WE BUILD SAN DIEGO")

replace InstallerName="W BRADLEY ELECTRIC" if regexm(InstallerName,"W BRADLEY") | regexm(InstallerName,"W BRADLY")

replace InstallerName="VEOLIA WEST OPERATING SERVICES" if regexm(InstallerName,"VEOLIA")

replace InstallerName="VIVINT" if regexm(InstallerName,"VIVINT")

replace InstallerName="VERENGO" if regexm(InstallerName,"VERENGO")

replace InstallerName="UTC POWER" if regexm(InstallerName,"UTC POWER")

replace InstallerName="UNITED ELECTRIC" if regexm(InstallerName,"UNITED ELECTRIC")

replace InstallerName="UNDERLINE ENERGY" if regexm(InstallerName,"UNDERLINE ENERGY")

replace InstallerName="TRUE POWER SOLAR" if regexm(InstallerName,"TRUE POWER SOLAR")

replace InstallerName="TREEPUBLIC" if regexm(InstallerName,"TREEPUBLIC")

replace InstallerName="TREEIUM" if regexm(InstallerName,"TREEIUM")

replace InstallerName="TRC ELECTRIC" if regexm(InstallerName,"TRC ELECTRIC") | regexm(InstallerName,"T R C ELECTRIC")

replace InstallerName="TRAVALINI" if regexm(InstallerName,"TRAVALINI")

replace InstallerName="TODD SOLAR" if regexm(InstallerName,"TODD SOLAR")

replace InstallerName="TLP ELECTRIC INTEGRATIONS" if regexm(InstallerName,"TLP ELEC")

replace InstallerName="THRESHOLD CONSTRUCTION" if regexm(InstallerName,"THRESHOLD CONST")

replace InstallerName="THE REMODELORS" if regexm(InstallerName,"THE REMODELORS")

replace InstallerName="THE BIG DEAL SOLAR" if regexm(InstallerName,"THE BIG(.)?DEAL SOLAR")

replace InstallerName="TESLA" if regexm(InstallerName,"TESLA") | regexm(InstallerName,"TESTLA") | regexm(InstallerName,"TESAL") | regexm(InstallerName,"TELSA")
replace InstallerName="TESLA" if InstallerName=="TESA"

replace InstallerName="TEAM SOLAR" if regexm(InstallerName,"TEAM SOLAR") | regexm(InstallerName,"TEAM-SOLAR")

replace InstallerName="TECHNICAL SPECIALTY SOLUTIONS" if regexm(InstallerName,"^(TECHNICAL SPECIALTY SOL)")

replace InstallerName="TAYLOR ENERGY SYSTEMS" if regexm(InstallerName,"TAYLOR ENERGY")

replace InstallerName="SYNERGY SOLAR AND ELECTRICAL SYSTEMS" if regexm(InstallerName,"SYNERGY SOLAR AND ELECTRICAL SYSTEM")

replace InstallerName="SYNERGY 768" if regexm(InstallerName,"SYNERGY 768")

replace InstallerName="SYNERGY 768" if regexm(InstallerName,"SYNERGY 768")

replace InstallerName="SWELL SERVICES" if regexm(InstallerName,"SWELL SERVICE")

replace InstallerName="SUSTAINABLE TECHNOLOGIES" if regexm(InstallerName,"^(SUSTAINABLE TECHNOLOG)")

replace InstallerName="SUSTINEO CONSTRUCTION" if regexm(InstallerName,"SUSTINEO")

replace InstallerName="SUNGRID" if regexm(InstallerName, "SUNGRID")

replace InstallerName="SUNRUN" if regexm(InstallerName,"^SUNRUN ")

replace InstallerName="SUNWORKS" if regexm(InstallerName,"SUNWORKS")

replace InstallerName="SUNTECHNICS" if regexm(InstallerName,"SUNTECHNICS")

replace InstallerName="SUSTAINABLE ENERGY GROUP" if regexm(InstallerName,"SUSTAINABLE ENERGY GROUP")

replace InstallerName="SUNRISE805" if regexm(InstallerName,"SUNRISE805") | regexm(InstallerName,"SUNRISE 805")

replace InstallerName="SEA BRIGHT SOLAR" if regexm(InstallerName,"SEA BRIGHT SOLAR") | regexm(InstallerName,"SEABRIGHT SOLAR")

replace InstallerName="SUNPOWER" if regexm(InstallerName,"SUNPOWER")

replace InstallerName="SUNRIVER" if regexm(InstallerName,"SUNRIVER")

replace InstallerName="SUNEDISON" if regexm(InstallerName,"SUNEDIS")

replace InstallerName="SUNERGY CONSTRUCTION" if regexm(InstallerName,"^(SUNERGY)")

replace InstallerName="SUNFUSION SOLAR" if regexm(InstallerName,"^(SUNFUSION)")

replace InstallerName="SUNSPOT SOLAR AND HVAC" if regexm(InstallerName,"SUNSPOT SOLAR")

replace InstallerName="111ECE" if regexm(InstallerName,"111") & regexm(InstallerName,"ECE")

replace InstallerName="3 PHASES RENEWABLES" if regexm(InstallerName,"^(3 PHASES)")

replace InstallerName="3RD ROCK SYSTEMS AND TECHNOLOGIES" if regexm(InstallerName,"^(3RD ROCK SYSTEMS AND TECH)")

replace InstallerName="ABM" if regexm(InstallerName,"^(ABM )")

replace InstallerName="ADVANCED ALTERNATIVE ENERGY SOLUTIONS" if InstallerName=="AAES DBA ALOHA SOLAR" | InstallerName=="ADVANCED ALTERNATIVE ENERGY SYSTEMS"

replace InstallerName="ALIVE INDUSTRIES" if InstallerName=="ALIVE INDISTRIES"

replace InstallerName="ALTERNATIVE ENERGY SYSTEMS" if regexm(InstallerName,"^(ALTERNATIVE ENERGY SYSTEM)")

replace InstallerName="AM SUN SOLAR" if InstallerName=="A M SUN SOLAR"

replace InstallerName="AMBROSE SOLAR" if regexm(InstallerName,"^(AMBROSE )")

replace InstallerName="ANCA SOLAR" if regexm(InstallerName,"^(ANCA)")

replace InstallerName="ALTERRA SOLAR" if regexm(InstallerName,"^(ALTERRA )")

replace InstallerName="ALLY ELECTRIC AND SOLAR" if regexm(InstallerName,"^(ALLY SOLAR AND ELECTRIC)")

replace InstallerName="AMERICAN SOLAR POWER" if regexm(InstallerName,"^(AMERICAN SOLAR POWER )")

replace InstallerName="ATLAS-PELLIZARI ELECTRIC" if regexm(InstallerName,"^(ATLAS)") & regexm(InstallerName,"PELLI(Z)+ARI")

replace InstallerName="AMERIGREEN SOLAR" if regexm(InstallerName,"^(AMERIGREEN )")

replace InstallerName="ALTA SIERRA PROPERTIES" if regexm(InstallerName,"^(ALTA SIERRA )")

replace InstallerName="AMECO" if regexm(InstallerName,"^(AMECO )")

replace InstallerName="APPLIED SOLAR ENERGY" if regexm(InstallerName,"APPLIED SOLAR ENERGY")

replace InstallerName="AZTEC SOLAR" if regexm(InstallerName,"SIGORA") //Sigora (HQ'd in Virginia) acquired Aztec Solar in October 2020)

replace InstallerName="BAKER ELECTRIC" if regexm(InstallerName,"(BAKER ELECTRIC)") | regexm(InstallerName,"(BAKER ELECRIC)")

replace InstallerName="BASS ELECTRIC" if regexm(InstallerName,"^(BASS ELECTRIC )") | InstallerName=="BAY AREA SYSTEMS AND SOLUTIONS"

replace InstallerName="BCI" if regexm(InstallerName,"^(BCI )")

replace InstallerName="BDS" if regexm(InstallerName,"^(BDS )")

replace InstallerName="BYERS SOLAR" if regexm(InstallerName,"^(BYERS )")

replace InstallerName="BLUE SKY ENERGY" if regexm(InstallerName,"^(BLUESKY ENERGY)") | regexm(InstallerName,"ROCHLIN")

replace InstallerName="BLUE LIGHT CONSTRUCTION" if regexm(InstallerName,"^(BLUE LIGHT)")

replace InstallerName="BLOOM ENERGY" if regexm(InstallerName,"^(BLOOM)")

replace InstallerName="BLAND AC AND HEATING" if regexm(InstallerName,"^(BLAND)")

replace InstallerName="BLALOCK ELECTRIC" if regexm(InstallerName,"^(BLALOCK ELECTRIC)")

replace InstallerName="BLACK AND VEATCH" if regexm(InstallerName,"^(BLACK AND VEATCH)")
replace InstallerName="BLACK AND VEATCH" if InstallerName=="BLACK $ VEATCH"

replace InstallerName="BRIGHTEN SOLAR" if regexm(InstallerName,"^(BRIGHTEN SOLAR)")

replace InstallerName="CALCOM ENERGY" if regexm(InstallerName,"^(CALCOM)")

replace InstallerName="CALIFORNIA POWER PARTNERS" if InstallerName=="CALIFORNA POWER PARTNERS"

replace InstallerName="CALWAVE TECHNOLOGIES" if regexm(InstallerName,"^(CALWAVE TECH)")

replace InstallerName="CAPITOL ELECTRIC" if regexm(InstallerName,"^(CAPITOL ELECTRIC)")
replace InstallerName="CAPITOL ELECTRIC" if InstallerName=="CAPITAOL ELECTRIC"

replace InstallerName="CAPTAIN VOLTAGE ELECTRIC" if regexm(InstallerName,"^(CAPTAIN VOLTAGE)")

replace InstallerName="CARLSBAD SOLAR" if regexm(InstallerName,"^(CARLSBAD SOLAR)")

replace InstallerName="CEI WEST ROOFING" if regexm(InstallerName,"^(CEI WEST ROOFING)")

replace InstallerName="CHEVRON" if regexm(InstallerName,"^(CHEVRON)")

replace InstallerName="CHICO ELECTRIC" if regexm(InstallerName,"^(CHICO ELECTRIC)")

replace InstallerName="CITADEL ROOFING AND SOLAR" if regexm(InstallerName,"CITADEL ROOFING AND SOLAR")  

replace InstallerName="CLEAN FUEL CONNECTIONS" if regexm(InstallerName,"^(CLEAN FUEL CONNECTION)")

replace InstallerName="CLEAREDGE POWER" if regexm(InstallerName,"^(CLEAREDGE)")
replace InstallerName="CLEAREDGE POWER" if InstallerName=="CLEAR EDGE"

replace InstallerName="CLIMATE AND ENERGY SOLUTIONS" if regexm(InstallerName,"^(CLIMATE AND ENERGY SOLUTIONS)")
replace InstallerName="CLIMATE AND ENERGY SOLUTIONS" if InstallerName=="CLIMATE ENERGY SOLUTIONS"

replace InstallerName="CMCO ELECTRIC AND SOLAR" if regexm(InstallerName,"^(CMCO)")

replace InstallerName="CM SOLAR ELECTRIC" if regexm(InstallerName,"CM SOLAR ELECTRIC")

replace InstallerName="COMFORT DYNAMICS" if regexm(InstallerName,"^(COMFORT)")

replace InstallerName="CONTROL POWER SERVICES" if regexm(InstallerName,"^(CONTROL POWER SERVICES)")

replace InstallerName="COMFORT DYNAMICS" if regexm(InstallerName,"^(COMFORT DYNAM)")

replace InstallerName="CORE STATES GROUP" if regexm(InstallerName,"^(CORE STATE)") | regexm(InstallerName,"^(CORESTATE)")

replace InstallerName="CORNELY" if regexm(InstallerName,"^(CORNELY)")

replace InstallerName="CSI ELECTRICAL CONTRACTORS" if regexm(InstallerName,"^(CSI)")

replace InstallerName="DEL SOL ENERGY" if regexm(InstallerName,"^(DEL SOL)")

replace InstallerName="DELIDDO AND ASSOCIATES" if regexm(InstallerName,"^(DELIDDO)")

replace InstallerName="DELTA ELECTRIC PLUS" if regexm(InstallerName,"^(DELTA ELECTRIC)")

replace InstallerName="DESERT POWER" if regexm(InstallerName,"^(DESERT POWER)")

replace InstallerName="DEVON CONSTRUCTION" if regexm(InstallerName,"^(DEVON CONSTRUCTION)")

replace InstallerName="DIENER'S ELECTRIC" if regexm(InstallerName,"^(DIENER)")

replace InstallerName="DS ENERGY SOLUTIONS" if regexm(InstallerName,"^(DS ENERGY SOL)")

replace InstallerName="DSH SOLAR ELECTRIC" if regexm(InstallerName,"^(DSH SOLAR ELECTRIC)")

replace InstallerName="EARTHWISE ENERGY SOLUTIONS" if regexm(InstallerName,"^(EARTHWISE ENERGY SOLUTIONS)")

replace InstallerName="ECOENERGIES" if regexm(InstallerName,"^(ECOENERGIES)")

replace InstallerName="ECONOMIC ENERGY SOLUTIONS" if regexm(InstallerName,"^(ECONOMIC ENERGY SOLUTIONS)")

replace InstallerName="EDF RENEWABLES" if regexm(InstallerName,"^(EDF)")

replace InstallerName="EFFECT ENERGY" if regexm(InstallerName,"^(EFFECT ENERGY)")

replace InstallerName="EFFICIENT BUILDERS" if regexm(InstallerName,"^(EFFICIENT BUILDERS)")

replace InstallerName="EI SOLUTIONS" if regexm(InstallerName,"^(EI SOLUTIONS)") | regexm(InstallerName,"^(EL SOLUTIONS)")

replace InstallerName="ELITE SOLAR" if regexm(InstallerName,"ELITE SOLAR")

replace InstallerName="ENEL" if regexm(InstallerName,"^(ENEL)")

replace InstallerName="ENERGY ENTERPRISES" if regexm(InstallerName,"^(ENERGY ENTERPRISES)")

replace InstallerName="ENERGY EQUITY" if regexm(InstallerName,"^(ENERGY EQUITY)")

replace InstallerName="ENERGY SAVING PROS" if regexm(InstallerName,"^(ENERGY SAVING PROS)")

replace InstallerName="ENERGY SERVICE PARTNERS" if regexm(InstallerName,"ENERGY SERVICE PARTNERS")

replace InstallerName="ENERGY SYSTEMS DEVELOPMENT CONSTRUCTION" if regexm(InstallerName, "^ENERGY SYSTEMS")

replace InstallerName="ENGIE" if regexm(InstallerName,"^(ENGIE )")

replace InstallerName="FREEVOLT" if regexm(InstallerName,"^(FREEVOLT)")

replace InstallerName="FUTURE ENERGY CORPORATION" if regexm(InstallerName,"^(FUTURE ENERGY)")

replace InstallerName="G C ELECTRIC SOLAR" if regexm(InstallerName,"^(G C ELECTRIC)")

replace InstallerName="GAMMILL ELECTRIC" if regexm(InstallerName,"^(GAMMIL)")

replace InstallerName="GOLD RUSH ENERGY SOLUTIONS" if regexm(InstallerName,"^(GOLD RUSH ENERGY)")

replace InstallerName="GOLDEN BRIDGE DEVELOPMENT" if regexm(InstallerName,"^(GOLDENBRIDGE DEVELOPMENT)")

replace InstallerName="GOLDEN BEAR SOLAR" if regexm(InstallerName,"(GOLDEN BEAR)")

replace InstallerName="GOOD ENERGY RENEWABLES" if regexm(InstallerName,"^(GOOD ENERGY RENE)")

replace InstallerName="GREEN AIR HVAC" if regexm(InstallerName,"^(GREEN AIR)")

replace InstallerName="GREEN CONVERGENCE" if regexm(InstallerName,"^(GREEN CONVER)")

replace InstallerName="GREEN ENERGY EPC" if regexm(InstallerName,"^(GREEN ENERGY NPC)")

replace InstallerName="GREEN VALLEY" if regexm(InstallerName,"^(GREEN VALLEY)")

replace InstallerName="GREKA" if regexm(InstallerName,"^(GREKA)")

replace InstallerName="GOMEZ ENGINEERING" if regexm(InstallerName, "^GOMEZ ENGIN")

replace InstallerName="HARBOUR ELECTRIC" if regexm(InstallerName,"(HARBOUR ELEC)")

replace InstallerName="HARRISON ELECTRIC" if regexm(InstallerName,"(HARRISON ELECTRIC)")

replace InstallerName="HMT ELECTRIC" if regexm(InstallerName,"^(HMT )") | regexm(InstallerName,"^(H M T )")

replace InstallerName="HIGH DEFINITION" if regexm(InstallerName,"^(HIGH DEFINITION)")

replace InstallerName="HORIZON SOLAR POWER" if regexm(InstallerName,"^(HOSOPO)") | regexm(InstallerName,"^(HO SO PO)")

replace InstallerName="HOME PRO DIRECT" if regexm(InstallerName,"^(HOMEPRODIRECT)")

replace InstallerName=DeveloperName if InstallerName=="HOMEOWNER"

replace InstallerName="HOMEGROWN ENERGY SOLUTIONS" if regexm(InstallerName,"^(HOME GROWN ENERGY SOLUTIONS)")

replace InstallerName="I1 ENERGY" if regexm(InstallerName,"^(I1ENERGY)") | regexm(InstallerName,"^(I1 ENERGY)")

replace InstallerName="ICE ENERGY HOLDINGS" if regexm(InstallerName,"^(ICE ENERGY)")

replace InstallerName="ILA + ZAMMIT ENGINEERING" if regexm(InstallerName,"(ILA)") & regexm(InstallerName,"(ZAMMIT)")

replace InstallerName="IDEMAND ENERGY" if regexm(InstallerName,"^(IDEMAND ENERGY)")

replace InstallerName="IES" if regexm(InstallerName,"^(IES)")

replace InstallerName="INFINITY ENERGY" if regexm(InstallerName,"^(INFINITY EN)") | regexm(InstallerName,"^(INFINITYEN)")

replace InstallerName="INCENTIVE ELECTRIC" if regexm(InstallerName, "INCENTIVE ELECTRIC")

replace InstallerName="VITAL ENERGY SOLAR" if regexm(InstallerName,"^(J AND J)")

replace InstallerName="JBN ELECTRICAL CONSTRUCTION" if regexm(InstallerName,"^(J B N)") | regexm(InstallerName,"^(JBN)")

replace InstallerName="JAMES PETERSEN INDUSTRIES" if regexm(InstallerName,"^(JAMES PETERSEN INDUSTRIES)")

replace InstallerName="JCOR GROUP" if regexm(InstallerName,"^(JCOR GROUP)")

replace InstallerName="JOE A FLORES" if regexm(InstallerName,"^(JOE A)") & regexm(InstallerName,"(FLORES)$")

replace InstallerName="JOE MOORE CONSTRUCTION" if regexm(InstallerName,"^(JOE MOORE)")

replace InstallerName="JONAS ENERGY" if regexm(InstallerName,"^(JONAS ENERGY SOL)")

replace InstallerName="KUUBIX ENERGY" if regexm(InstallerName,"^(KUUBIX)")

replace InstallerName="KUYKENDALL SOLAR" if regexm(InstallerName,"^(KUYKENDALL)")

replace InstallerName="LA SOLAR GROUP" if regexm(InstallerName,"^(LA SOLAR GROUP)")

replace InstallerName="LEGACY ELECTRICAL SERVICES" if regexm(InstallerName,"^(LEGACY ELECTRICAL SER)")

replace InstallerName="LEND LEASE CONSTRUCTION" if regexm(InstallerName,"^(LEND LEASE CONS)")

replace InstallerName="LOGAN ENERGY CORP" if regexm(InstallerName,"^(LOGAN ENERGY)") | regexm(InstallerName,"^(LOGANENERGY)")

replace InstallerName="LUMINALT" if regexm(InstallerName,"^(LUMINALT)") | regexm(InstallerName,"^(LUMIANLT)")

replace InstallerName="M KAHN SOLAR" if regexm(InstallerName,"^(M KAHN SOLAR)") | regexm(InstallerName,"^(MKAHN SOLAR)")

replace InstallerName="M2 MULTIMEDIA" if regexm(InstallerName,"^(M2 MULTIMEDIA)") | regexm(InstallerName,"^(M2MULIMEDIA)") | regexm(InstallerName,"^(M2MULTIMEDIA)")

replace InstallerName="MAIN STREET CONSTRUCTION" if regexm(InstallerName,"^(MAIN ST)") & regexm(InstallerName,"(CONSTR)")

replace InstallerName="MATSON SERVICES" if regexm(InstallerName,"^(MATSON SERVICES)") | regexm(InstallerName,"^(MATSON-SERVICES)")

replace InstallerName="MAXAPTO" if regexm(InstallerName,"(SOLAR HEROES)") | regexm(InstallerName,"(ELECTRIC HEROES)")

replace InstallerName="MILHOLLAND ELECTRIC" if regexm(InstallerName,"^(MILHOLLAND ELEC)")

replace InstallerName="MIMEOS SOLAR" if regexm(InstallerName,"^(MIMEOS)")

replace InstallerName="MMR CONSTRUCTORS" if regexm(InstallerName,"^(MMR CONSTR)")

replace InstallerName="MOHR POWER SOLAR" if regexm(InstallerName,"^(MOHR)")

replace InstallerName="NATIONWIDE SUN" if regexm(InstallerName,"^(NATIONWIDE)")

replace InstallerName="NEIGHBORHOOD POWER CORP" if regexm(InstallerName,"^(NEIGHBORHOOD POWER)")

replace InstallerName="NEW VISION TECHNOLOGIES" if regexm(InstallerName,"^(NEW VISION TECH)")

replace InstallerName="NEXTEDGE" if regexm(InstallerName,"^(NEXTEDGE)") | regexm(InstallerName,"^(NEXT>EDGE)")

replace InstallerName="NJOORD" if regexm(InstallerName,"^(NJOORD)")

replace InstallerName="NOR CAL SOLAR CONSTRUCTION" if InstallerName=="NOR CAL CONST" | InstallerName=="NOR CAL CONTRACTING" | InstallerName=="NOR CAL SOLAR CONTRACTING"

replace InstallerName="NORTH PHASE" if regexm(InstallerName,"^(NORTH PHASE EL)")

replace InstallerName="CORNELY" if regexm(InstallerName,"^(CORNELY)")

replace InstallerName="NOSTALGICS" if regexm(InstallerName,"^(NOSTALGIC)")

replace InstallerName="NRG CLEAN POWER" if regexm(InstallerName,"^(N R G CLEAN POWER)")

replace InstallerName="OFFLINE SOLAR" if regexm(InstallerName,"^(OFFLINE SOLAR)")

replace InstallerName="OHR ENERGY" if regexm(InstallerName,"^(OHR ENERGY)")

replace InstallerName="ONSITE ENERGY" if regexm(InstallerName,"^(ONSITE ENERGY)")

replace InstallerName="OPTION ONE" if regexm(InstallerName,"^(OPTION ONE)") | regexm(InstallerName,"^(OPTIONONE)")

replace InstallerName="ORANGE COUNTY SOLAR" if regexm(InstallerName,"^(ORANGE COUNT)")

replace InstallerName="OVERLAND CONTRACTING" if regexm(InstallerName,"^(OVERLAND CON)")

replace InstallerName="OWL ENERGY RESOURCES" if regexm(InstallerName,"^(OWL ENERGY RES)")

replace InstallerName="PACIFIC GAS AND ELECTRIC" if regexm(InstallerName,"^(PACCIFIC GAS AND ELECTRIC)")

replace InstallerName="PACIFIC SKY SOLAR" if regexm(InstallerName,"^(PACIFICSKY SOLAR)")

replace InstallerName="PACIFICWEST ENERGY SOLUTIONS" if regexm(InstallerName,"^(PACIFICWEST ENERGY SOLUTIONS)") | regexm(InstallerName,"^(PACIFIC WEST ENERGY SOLUTIONS)")

replace InstallerName="PARAGON SUN" if regexm(InstallerName,"^(PARAGON)")

replace InstallerName="PERK SOLAR" if regexm(InstallerName,"^(PERK SOLAR)")

replace InstallerName="PERMACITY" if regexm(InstallerName,"^(PERMACITY)")

replace InstallerName="PETERSEN DEAN" if regexm(InstallerName,"^(PETERSEN DEAN)") | regexm(InstallerName,"^(PETERSENDEAN)") | regexm(InstallerName,"^(PETERSON DEAN)") | regexm(InstallerName,"^(PETERENDEAN)")

replace InstallerName="PHOENIX SOLAR" if regexm(InstallerName,"^(PHOENIX)")

replace InstallerName="POWER GENERATING SYSTEMS" if regexm(InstallerName,"^(POWER GENERAT)")

replace InstallerName="POWER INDEPENDENCE" if regexm(InstallerName,"^(POWER INDEPENDENCE)")

replace InstallerName="POWERLIGHT" if regexm(InstallerName,"^(POWER LIGHT)") | InstallerName=="POWERLIGT"

replace InstallerName="PACIFIC GAS AND ELECTRIC" if InstallerName=="PG AND E"

replace InstallerName="PORTERMATT ELECTRIC" if (regexm(InstallerName,"(POWERMATT)") | regexm(InstallerName,"(POWERMART)")) & regexm(InstallerName,"(ELECTRIC)")
replace InstallerName="PORTERMATT ELECTRIC" if InstallerName=="POTERMATT ELECRIC"

replace InstallerName="PRECIS SOLAR" if regexm(InstallerName,"^(PRECIS SOLAR)") | regexm(InstallerName,"^(PRECIS DEVELOPMENT)")

replace InstallerName="PRECISION AIR SYSTEMS" if regexm(InstallerName,"^(PRECISION AIR)")

replace InstallerName="PREMIER POWER" if regexm(InstallerName,"^(PREMIER POWER)")

replace InstallerName="PREMIER SOLAR" if regexm(InstallerName,"^(PREMIER SOLAR)")

replace InstallerName="CORNELY" if regexm(InstallerName,"^(CORNELY)")

replace InstallerName="PROMISE ENERGY" if regexm(InstallerName,"^(PROMISE)") & regexm(InstallerName,"(ENERGY)")

replace InstallerName="PSG CONSTRUCTION" if regexm(InstallerName,"^(PSG )")

replace InstallerName="PURE POWER SOLUTIONS" if regexm(InstallerName,"^(PUREPOWER)")

replace InstallerName="REAL ENERGY" if regexm(InstallerName,"^(REAL)") & regexm(InstallerName,"(ENERGY)")

replace InstallerName="REF CORP" if regexm(InstallerName,"^(REF CORP)")

replace InstallerName="REGAL SOLAR" if regexm(InstallerName,"^(REGAL SOLAR)")

replace InstallerName="RENEWABLE ENERGY CONCEPTS" if InstallerName=="RENERWABLE ENERGY CONCEPTS"

replace InstallerName="RENOVA ENERGY" if regexm(InstallerName,"^(RENOVA)")

replace InstallerName="RENSUS" if regexm(InstallerName,"^(RENSUS)")

replace InstallerName="RODNEY E FITE" if regexm(InstallerName,"^(RODNEY E FI)")

replace InstallerName="RUBICON PROFESSIONAL SERVICES" if regexm(InstallerName,"RUBICON")

replace InstallerName="RWE-SCHOTT" if regexm(InstallerName,"^(RWE)") & regexm(InstallerName,"(SCHOTT)")

replace InstallerName="SATTLER SOLAR" if regexm(InstallerName,"^(SATTLER SOLAR)")

replace InstallerName="SCHNEIDER ELECTRIC" if regexm(InstallerName,"^(SCHNEIDER ELECTRIC)")

replace InstallerName="SCUDDER ROOFING" if regexm(InstallerName,"^(SCUDDER)")

replace InstallerName="SEMPER SOLARIS" if regexm(InstallerName,"^(SEMPER SOLARIS)")

replace InstallerName="SHELL SOLAR" if regexm(InstallerName,"^(SHELL SOLAR)")

replace InstallerName="SIEMENS" if regexm(InstallerName,"^(SIEMENS)")

replace InstallerName="SKYBRIDGE RENEWABLES" if regexm(InstallerName,"^(SKYBRIDGE)")

replace InstallerName="SKYTECH SOLAR" if regexm(InstallerName,"^(SKYTECH S)")

replace InstallerName="SKY POWER SYSTEMS" if regexm(InstallerName,"SKY POWER SYSTEMS")

replace InstallerName="SMART SOLAR" if regexm(InstallerName,"^(SMART SOLAR)")

replace InstallerName="SOLAR 4 AMERICA" if regexm(InstallerName,"(SOLAR4AMERICA)")
replace InstallerName="SOLAR 4 AMERICA" if InstallerName=="SOALR4AMERICA"

replace InstallerName="SOLARCITY" if regexm(InstallerName,"(SOLAR CITY)") | regexm(InstallerName,"(SOLARCITY)") | regexm(InstallerName,"(SOLARCITE)")

replace InstallerName="SOLAR FORWARD" if regexm(InstallerName,"^(SOLAR FORWARD)")

replace InstallerName="SOLAR INTEGRATED TECHNOLOGIES" if regexm(InstallerName,"^(SOLAR INTEGRATED)")

replace InstallerName="SOLAR OPTIMUM" if regexm(InstallerName,"^(SOLAR OPTIMUM)") | regexm(InstallerName,"^(SOLAR OPITMUM)")

replace InstallerName="SOLAR POWER AND ELECTRIC" if InstallerName=="SOLAR POWER AND ELECTRIC I"

replace InstallerName="SOLAR PRICE DISCOVERY" if regexm(InstallerName,"(SOLAR PRICE DISCOVERY)")

replace InstallerName="SOLAR WATT SOLUTIONS" if regexm(InstallerName,"^(SOLAR WATT SOLUTIONS)")

replace InstallerName="SOLARCRAFT" if regexm(InstallerName,"^(SOLARCRAFT)")

replace InstallerName="SOLAR ENERGY 911" if regexm(InstallerName,"^(SOLARENERGY911)")

replace InstallerName="SOLARMAX TECHNOLOGY" if regexm(InstallerName,"^(SOLARMAX)")

replace InstallerName="SOLARPONICS" if InstallerName=="SOLARPONIICS" | InstallerName=="SOLAPONICS"

replace InstallerName="SOLAR PROS" if InstallerName=="SOLARPROS"

replace InstallerName="SOLAR RENEWABLE ENERGY" if InstallerName=="SOLAR RENEWABLE"

replace InstallerName="SOLAR SYMPHONY CONSTRUCTION" if InstallerName=="SOLAR SYMPHONY"

replace InstallerName="SOLAR TECH ENERGY" if regexm(InstallerName,"^(SOLARTECH)")

replace InstallerName="SOLAR TECHNOLOGIES" if InstallerName=="SOLAR TECHNOLOGEIS"

replace InstallerName="SOLARWINDS" if regexm(InstallerName,"^(SOLARWINDS)") | InstallerName=="SOLAR WINDS ENERGY"

replace InstallerName="SONOMARIN SOLAR" if regexm(InstallerName,"^(SONOMARIN SOLAR)")

replace InstallerName="SP ENERGY SERVICE" if regexm(InstallerName,"^(SP ENERGY SERVICE)")

replace InstallerName="SPANDA INDUSTRIAL" if regexm(InstallerName,"^(SPANDA INDUSTRIAL)")

replace InstallerName="STATEN SOLAR" if regexm(InstallerName,"^(STATEN SOLAR)")

replace InstallerName="STELLAR ENERGY SOLUTIONS" if regexm(InstallerName,"^(STELLAR ENERGY)")

replace InstallerName="STELLAR SOLAR" if regexm(InstallerName,"(STELLAR SOLAR)") | regexm(InstallerName,"TMAG INDUSTRIES INC DBA STELLAR")

replace InstallerName="STEWART AND STEVENSON" if InstallerName=="STEWART AND STEVENSEN"

replace InstallerName="STOWELL DISTRIBUTED POWER" if InstallerName=="STOWEL DISTRIBUTED POWER"

replace InstallerName="STRONGHOLD ENGINEERING" if regexm(InstallerName,"^(STRONGHOLD ENGIN)")

replace InstallerName="SULLIVAN SOLAR POWER" if regexm(InstallerName,"^(SULLIVAN SOLAR POWER)") | InstallerName=="SULLIIVAN SOLAR POWER"

replace InstallerName="SUN FIRST SOLAR" if regexm(InstallerName,"^(SUN FIRST)")

replace InstallerName="SUN PACIFIC SOLAR" if regexm(InstallerName,"^(SUN PACIFIC SOLAR)")

replace InstallerName="SUN POWER AND GEOTHERMAL" if regexm(InstallerName,"^(SUN POWER AND GEOTHERMAL)") | regexm(InstallerName,"^(SPG)")

replace InstallerName="SUNISTICS GROUP" if regexm(InstallerName,"^(SUNISTICS)")

replace InstallerName="SUNLOGIC" if regexm(InstallerName,"^(SUNLOGIC)")

replace InstallerName="SUNLUX" if regexm(InstallerName,"^(SUNLUX)")

replace InstallerName="SUNNOVA" if regexm(InstallerName,"^(SUNNOVA)")

replace InstallerName="SWEARINGEN SYSTEMS" if regexm(InstallerName,"^(SWEARINGTON)")

replace InstallerName="SWELL ENERGY" if regexm(InstallerName,"^(SWELL )")

replace InstallerName="SUN POWER AND GEOTHERMAL" if regexm(InstallerName,"(OCTAVIO)") & regexm(InstallerName,"(SAENZ)")
