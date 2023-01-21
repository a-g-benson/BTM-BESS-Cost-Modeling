replace DeveloperName=subinstr(DeveloperName, char(9), " ", .)
replace DeveloperName=subinstr(DeveloperName, char(34), "", .)
replace DeveloperName=ustrtrim(strupper(DeveloperName))
replace DeveloperName=ustrregexra(DeveloperName,"\.+","")
replace DeveloperName=ustrregexra(DeveloperName,"( CO)$","")
replace DeveloperName=ustrregexra(DeveloperName,"( CORP)$","")
replace DeveloperName=ustrregexra(DeveloperName,"( CORPORATION)$","")
replace DeveloperName=ustrregexra(DeveloperName,"( INC)$","")
replace DeveloperName=ustrregexra(DeveloperName,"( INCORPORATED)$","")
replace DeveloperName=ustrregexra(DeveloperName,"( LLC)$","")
replace DeveloperName=ustrregexra(DeveloperName,"( LTD)$","")
replace DeveloperName=ustrregexra(DeveloperName," & "," AND ")
replace DeveloperName=ustrregexra(DeveloperName,"&"," AND ")
replace DeveloperName=ustrtrim(DeveloperName)

replace DeveloperName=substr(DeveloperName, 1, strlen(DeveloperName)-12) if regexm(DeveloperName,"HOMEOWNER")

replace DeveloperName="SYNERGY POWER" if regexm(DeveloperName,"SYNERGY POWER")

replace DeveloperName="BAKER ELECTRIC" if regexm(DeveloperName,"BAKER ELECTRIC")

replace DeveloperName="ALL ON ELECTRIC" if regexm(DeveloperName,"ALL ON ELECTRIC")

replace DeveloperName="ICE BEAR SPV #1" if regexm(DeveloperName,"ICE BEAR SPV #1")

replace DeveloperName="YOUR ENERGY SOLUTIONS" if regexm(DeveloperName,"YOUR ENERGY SOLU")

replace DeveloperName="WORLDWATER" if regexm(DeveloperName,"WORLDWATER") | regexm(DeveloperName,"WORLD WATER")

replace DeveloperName="WM LYLES" if regexm(DeveloperName,"W M LYLES")

replace DeveloperName="WIRED INTO THE FUTURE" if regexm(DeveloperName,"WIRED INTO THE FUTURE")

replace DeveloperName="WINDGATE ENERGY" if regexm(DeveloperName,"WINDGATE ENERG")

replace DeveloperName="WESTHAVEN" if regexm(DeveloperName,"WESTHAVEN")

replace DeveloperName="WEST COAST SOLAR" if regexm(DeveloperName,"^(WEST COAST SOLAR)") //This company is based in based in Brentwood, in inland Contra Costa County.
replace DeveloperName="WESTCOAST SOLAR" if regexm(DeveloperName,"WESTCOAST SOLAR") & regexm(DeveloperName,"ENERGY")==0 //This company is based in Riverside.
replace DeveloperName="WESTCOAST SOLAR ENERGY" if regexm(DeveloperName,"WESTCOAST SOLAR ENERGY") //This company is based in Sonoma County.

replace DeveloperName="WESLEY HODGES" if regexm(DeveloperName,"WESLEY HODGES")

replace DeveloperName="WELTER ELECTRIC" if regexm(DeveloperName,"WELTER ELECTRIC")

replace DeveloperName="WE O'NEIL" if regexm(DeveloperName,"E O'NEIL")

replace DeveloperName="WE BUILD SAN DIEGO" if regexm(DeveloperName, "WE BUILD SAN DIEGO")

replace DeveloperName="W BRADLEY ELECTRIC" if regexm(DeveloperName,"W BRADLEY") | regexm(DeveloperName,"W BRADLY")

replace DeveloperName="VIVINT" if regexm(DeveloperName,"VIVINT")

replace DeveloperName="VERENGO" if regexm(DeveloperName,"VERENGO")

replace DeveloperName="VITAL ENERGY SOLAR" if regexm(DeveloperName,"VITAL ENERGY SOLAR")

replace DeveloperName="UTC POWER" if regexm(DeveloperName,"UTC POWER")

replace DeveloperName="UNITED ELECTRIC" if regexm(DeveloperName,"UNITED ELECTRIC")

replace DeveloperName="UNDERLINE ENERGY" if regexm(DeveloperName,"UNDERLINE ENERGY")

replace DeveloperName="TRUE POWER SOLAR" if regexm(DeveloperName,"TRUE POWER SOLAR")

replace DeveloperName="TREEPUBLIC" if regexm(DeveloperName,"TREEPUBLIC")

replace DeveloperName="TREEIUM" if regexm(DeveloperName,"TREEIUM")

replace DeveloperName="TRC ELECTRIC" if regexm(DeveloperName,"TRC ELECTRIC")

replace DeveloperName="TRAVALINI" if regexm(DeveloperName,"TRAVALINI")

replace DeveloperName="TODD SOLAR" if regexm(DeveloperName,"TODD SOLAR")

replace DeveloperName="TLP ELECTRIC INTERGRATIONS" if regexm(DeveloperName,"TLP ELECTRIC INTEGRATIONS")

replace DeveloperName="THRESHOLD CONSTRUCTION" if regexm(DeveloperName,"THRESHOLD CONST")

replace DeveloperName="THE REMODELORS" if regexm(DeveloperName,"THE REMODELORS")

replace DeveloperName="THE BIGDEAL SOLAR" if regexm(DeveloperName,"THE BIGDEAL SOLAR")

replace DeveloperName="TESLA" if regexm(DeveloperName,"TESLA") | regexm(DeveloperName,"TESTLA") | regexm(DeveloperName,"TESAL") | regexm(DeveloperName,"TELSA")
replace DeveloperName="TESLA" if DeveloperName=="TESA"

replace DeveloperName="TEAM SOLAR" if regexm(DeveloperName,"TEAM SOLAR") | regexm(DeveloperName,"TEAM-SOLAR")

replace DeveloperName="TECHNICAL SPECIALTY SOLUTIONS" if regexm(DeveloperName,"^(TECHNICAL SPECIALTY SOL)")

replace DeveloperName="TAYLOR ENERGY SYSTEMS" if regexm(DeveloperName,"TAYLOR ENERGY")

replace DeveloperName="SYNERGY SOLAR AND ELECTRICAL SYSTEMS" if regexm(DeveloperName,"SYNERGY SOLAR AND ELECTRICAL SYSTEM")

replace DeveloperName="SYNERGY 768" if regexm(DeveloperName,"SYNERGY 768")

replace DeveloperName="SWELL SERVICES" if regexm(DeveloperName,"SWELL SERVICE")

replace DeveloperName="SUSTAINABLE TECHNOLOGIES" if regexm(DeveloperName,"^(SUSTAINABLE TECHNOLOG)")

replace DeveloperName="SUSTINEO CONSTRUCTION" if regexm(DeveloperName,"SUSTINEO")

replace DeveloperName="SUNRUN" if regexm(DeveloperName,"^SUNRUN ")

replace DeveloperName="SUNWORKS" if regexm(DeveloperName,"SUNWORKS")

replace DeveloperName="SUNTECHNICS" if regexm(DeveloperName,"SUNTECHNICS")

replace DeveloperName="SUSTAINABLE ENERGY GROUP" if regexm(DeveloperName,"SUSTAINABLE ENERGY GROUP")

replace DeveloperName="SUNRISE805" if regexm(DeveloperName,"SUNRISE805") | regexm(DeveloperName,"SUNRISE 805")

replace DeveloperName="SEA BRIGHT SOLAR" if regexm(DeveloperName,"SEA BRIGHT SOLAR") | regexm(DeveloperName,"SEABRIGHT SOLAR")

replace DeveloperName="SUNPOWER" if regexm(DeveloperName,"SUNPOWER")

replace DeveloperName="SUNRIVER" if regexm(DeveloperName,"SUNRIVER")

replace DeveloperName="SUNEDISON" if regexm(DeveloperName,"SUNEDIS")

replace DeveloperName="SUNERGY CONSTRUCTION" if regexm(DeveloperName,"^(SUNERGY)")

replace DeveloperName="SUNFUSION SOLAR" if regexm(DeveloperName,"^(SUNFUSION)")

replace DeveloperName="111ECE" if regexm(DeveloperName,"111") & regexm(DeveloperName,"ECE")

replace DeveloperName="3 PHASES RENEWABLES" if regexm(DeveloperName,"^(3 PHASES)")

replace DeveloperName="3RD ROCK SYSTEMS AND TECHNOLOGIES" if regexm(DeveloperName,"^(3RD ROCK SYSTEMS AND TECH)")

replace DeveloperName="ABM" if regexm(DeveloperName,"^(ABM )")

replace DeveloperName="ADVANCED ALTERNATIVE ENERGY SOLUTIONS" if DeveloperName=="AAES DBA ALOHA SOLAR" | DeveloperName=="ADVANCED ALTERNATIVE ENERGY SYSTEMS"

replace DeveloperName="ALIVE INDUSTRIES" if DeveloperName=="ALIVE INDISTRIES"

replace DeveloperName="ALTERNATIVE ENERGY SYSTEMS" if regexm(DeveloperName,"^(ALTERNATIVE ENERGY SYSTEM)")

replace DeveloperName="AM SUN SOLAR" if DeveloperName=="A M SUN SOLAR"

replace DeveloperName="AMBROSE SOLAR" if regexm(DeveloperName,"^(AMBROSE )")

replace DeveloperName="ANCA SOLAR" if regexm(DeveloperName,"^(ANCA)")

replace DeveloperName="ALTERRA SOLAR" if regexm(DeveloperName,"^(ALTERRA )")

replace DeveloperName="ALLY ELECTRIC AND SOLAR" if regexm(DeveloperName,"^(ALLY SOLAR AND ELECTRIC)")

replace DeveloperName="AMERICAN SOLAR POWER" if regexm(DeveloperName,"^(AMERICAN SOLAR POWER )")

replace DeveloperName="ATLAS-PELLIZARI ELECTRIC" if regexm(DeveloperName,"^(ATLAS)") & regexm(DeveloperName,"PELLI(Z)+ARI")

replace DeveloperName="AMERIGREEN SOLAR" if regexm(DeveloperName,"^(AMERIGREEN )")

replace DeveloperName="ALTA SIERRA PROPERTIES" if regexm(DeveloperName,"^(ALTA SIERRA )")

replace DeveloperName="AMECO" if regexm(DeveloperName,"^(AMECO )")

replace DeveloperName="AZTEC SOLAR" if regexm(DeveloperName,"SIGORA") //Sigora (HQ'd in Virginia) acquired Aztec Solar in October 2020)

replace DeveloperName="BAKER ELECTRIC" if regexm(DeveloperName,"(BAKER ELECTRIC)") | regexm(DeveloperName,"(BAKER ELECRIC)")

replace DeveloperName="BASS ELECTRIC" if regexm(DeveloperName,"^(BASS ELECTRIC )") | DeveloperName=="BAY AREA SYSTEMS AND SOLUTIONS"

replace DeveloperName="BCI" if regexm(DeveloperName,"^(BCI )")

replace DeveloperName="BDS" if regexm(DeveloperName,"^(BDS )")

replace DeveloperName="BYERS SOLAR" if regexm(DeveloperName,"^(BYERS )")

replace DeveloperName="BLUE SKY ENERGY" if regexm(DeveloperName,"^(BLUESKY ENERGY)")

replace DeveloperName="BLUE LIGHT CONSTRUCTION" if regexm(DeveloperName,"^(BLUE LIGHT)")

replace DeveloperName="BLOOM ENERGY" if regexm(DeveloperName,"^(BLOOM)")

replace DeveloperName="BLAND AC AND HEATING" if regexm(DeveloperName,"^(BLAND)")

replace DeveloperName="BLALOCK ELECTRIC" if regexm(DeveloperName,"^(BLALOCK ELECTRIC)")

replace DeveloperName="BLACK AND VEATCH" if regexm(DeveloperName,"^(BLACK AND VEATCH)")
replace DeveloperName="BLACK AND VEATCH" if DeveloperName=="BLACK $ VEATCH"

replace DeveloperName="BRIGHTEN SOLAR" if regexm(DeveloperName,"^(BRIGHTEN SOLAR)")

replace DeveloperName="CALCOM ENERGY" if regexm(DeveloperName,"^(CALCOM)")

replace DeveloperName="CALIFORNIA POWER PARTNERS" if DeveloperName=="CALIFORNA POWER PARTNERS"

replace DeveloperName="CALWAVE TECHNOLOGIES" if regexm(DeveloperName,"^(CALWAVE TECH)")

replace DeveloperName="CAPITOL ELECTRIC" if regexm(DeveloperName,"^(CAPITOL ELECTRIC)")
replace DeveloperName="CAPITOL ELECTRIC" if DeveloperName=="CAPITAOL ELECTRIC"

replace DeveloperName="CAPTAIN VOLTAGE ELECTRIC" if regexm(DeveloperName,"^(CAPTAIN VOLTAGE)")

replace DeveloperName="CARLSBAD SOLAR" if regexm(DeveloperName,"^(CARLSBAD SOLAR)")

replace DeveloperName="CEI WEST ROOFING" if regexm(DeveloperName,"^(CEI WEST ROOFING)")

replace DeveloperName="CHEVRON" if regexm(DeveloperName,"^(CHEVRON)")

replace DeveloperName="CHICO ELECTRIC" if regexm(DeveloperName,"^(CHICO ELECTRIC)")

replace DeveloperName="CLEAN FUEL CONNECTIONS" if regexm(DeveloperName,"^(CLEAN FUEL CONNECTION)")

replace DeveloperName="CLEAREDGE POWER" if regexm(DeveloperName,"^(CLEAREDGE)")
replace DeveloperName="CLEAREDGE POWER" if DeveloperName=="CLEAR EDGE"

replace DeveloperName="CLIMATE AND ENERGY SOLUTIONS" if regexm(DeveloperName,"^(CLIMATE AND ENERGY SOLUTIONS)")
replace DeveloperName="CLIMATE AND ENERGY SOLUTIONS" if DeveloperName=="CLIMATE ENERGY SOLUTIONS"

replace DeveloperName="CMCO ELECTRIC AND SOLAR" if regexm(DeveloperName,"^(CMCO)")

replace DeveloperName="COMFORT DYNAMICS" if regexm(DeveloperName,"^(COMFORT)")

replace DeveloperName="CONTROL POWER SERVICES" if regexm(DeveloperName,"^(CONTROL POWER SERVICES)")

replace DeveloperName="COMFORT DYNAMICS" if regexm(DeveloperName,"^(COMFORT DYNAM)")

replace DeveloperName="CORE STATES GROUP" if regexm(DeveloperName,"^(CORE STATE)") | regexm(DeveloperName,"^(CORESTATE)")

replace DeveloperName="CORNELY" if regexm(DeveloperName,"^(CORNELY)")

replace DeveloperName="CSI ELECTRICAL CONTRACTORS" if regexm(DeveloperName,"^(CSI)")

replace DeveloperName="DEL SOL ENERGY" if regexm(DeveloperName,"^(DEL SOL)")

replace DeveloperName="DELIDDO AND ASSOCIATES" if regexm(DeveloperName,"^(DELIDDO)")

replace DeveloperName="DELTA ELECTRIC PLUS" if regexm(DeveloperName,"^(DELTA ELECTRIC)")

replace DeveloperName="DESERT POWER" if regexm(DeveloperName,"^(DESERT POWER)")

replace DeveloperName="DEVON CONSTRUCTION" if regexm(DeveloperName,"^(DEVON CONSTRUCTION)")

replace DeveloperName="DIENER'S ELECTRIC" if regexm(DeveloperName,"^(DIENER)")

replace DeveloperName="DS ENERGY SOLUTIONS" if regexm(DeveloperName,"^(DS ENERGY SOL)")

replace DeveloperName="DSH SOLAR ELECTRIC" if regexm(DeveloperName,"^(DSH SOLAR ELECTRIC)")

replace DeveloperName="EARTHWISE ENERGY SOLUTIONS" if regexm(DeveloperName,"^(EARTHWISE ENERGY SOLUTIONS)")

replace DeveloperName="ECOENERGIES" if regexm(DeveloperName,"^(ECOENERGIES)")

replace DeveloperName="ECONOMIC ENERGY SOLUTIONS" if regexm(DeveloperName,"^(ECONOMIC ENERGY SOLUTIONS)")

replace DeveloperName="EDF RENEWABLES" if regexm(DeveloperName,"^(EDF)")

replace DeveloperName="EFFECT ENERGY" if regexm(DeveloperName,"^(EFFECT ENERGY)")

replace DeveloperName="EFFICIENT BUILDERS" if regexm(DeveloperName,"^(EFFICIENT BUILDERS)")

replace DeveloperName="EI SOLUTIONS" if regexm(DeveloperName,"^(EI SOLUTIONS)") | regexm(DeveloperName,"^(EL SOLUTIONS)")

replace DeveloperName="ELITE SOLAR" if regexm(DeveloperName,"ELITE SOLAR")

replace DeveloperName="ENEL" if regexm(DeveloperName,"^(ENEL)")

replace DeveloperName="ENERGY ENTERPRISES" if regexm(DeveloperName,"^(ENERGY ENTERPRISES)")

replace DeveloperName="ENERGY EQUITY" if regexm(DeveloperName,"^(ENERGY EQUITY)")

replace DeveloperName="ENERGY SAVING PROS" if regexm(DeveloperName,"^(ENERGY SAVING PROS)")

replace DeveloperName="ENERGY SYSTEMS DEVELOPMENT CONSTRUCTION" if regexm(DeveloperName, "^ENERGY SYSTEMS")

replace DeveloperName="ENGIE" if regexm(DeveloperName,"^(ENGIE )")

replace DeveloperName="FREEVOLT" if regexm(DeveloperName,"^(FREEVOLT)")

replace DeveloperName="FUTURE ENERGY CORPORATION" if regexm(DeveloperName,"^(FUTURE ENERGY)")

replace DeveloperName="G C ELECTRIC SOLAR" if regexm(DeveloperName,"^(G C ELECTRIC)")

replace DeveloperName="GAMMILL ELECTRIC" if regexm(DeveloperName,"^(GAMMIL)")

replace DeveloperName="GOLD RUSH ENERGY SOLUTIONS" if regexm(DeveloperName,"^(GOLD RUSH ENERGY)")

replace DeveloperName="GOLDEN BRIDGE DEVELOPMENT" if regexm(DeveloperName,"^(GOLDENBRIDGE DEVELOPMENT)")

replace DeveloperName="GOLDEN BEAR SOLAR" if regexm(DeveloperName,"(GOLDEN BEAR)")

replace DeveloperName="GOOD ENERGY RENEWABLES" if regexm(DeveloperName,"^(GOOD ENERGY RENE)")

replace DeveloperName="GREEN AIR HVAC" if regexm(DeveloperName,"^(GREEN AIR)")

replace DeveloperName="GREEN CONVERGENCE" if regexm(DeveloperName,"^(GREEN CONVER)")

replace DeveloperName="GREEN ENERGY EPC" if regexm(DeveloperName,"^(GREEN ENERGY NPC)")

replace DeveloperName="GREEN VALLEY" if regexm(DeveloperName,"^(GREEN VALLEY)")

replace DeveloperName="GREKA" if regexm(DeveloperName,"^(GREKA)")

replace DeveloperName="GOMEZ ENGINEERING" if regexm(DeveloperName, "^GOMEZ ENGIN")

replace DeveloperName="HARBOUR ELECTRIC" if regexm(DeveloperName,"(HARBOUR ELEC)")

replace DeveloperName="HARRISON ELECTRIC" if regexm(DeveloperName,"(HARRISON ELECTRIC)")

replace DeveloperName="HMT ELECTRIC" if regexm(DeveloperName,"^(HMT )") | regexm(DeveloperName,"^(H M T )")

replace DeveloperName="HIGH DEFINITION" if regexm(DeveloperName,"^(HIGH DEFINITION)")

replace DeveloperName="HORIZON SOLAR POWER" if regexm(DeveloperName,"^(HOSOPO)") | regexm(DeveloperName,"^(HO SO PO)")

replace DeveloperName="HOME PRO DIRECT" if regexm(DeveloperName,"^(HOMEPRODIRECT)")

replace DeveloperName="HOMEGROWN ENERGY SOLUTIONS" if regexm(DeveloperName,"^(HOME GROWN ENERGY SOLUTIONS)")

replace DeveloperName="I1 ENERGY" if regexm(DeveloperName,"^(I1ENERGY)") | regexm(DeveloperName,"^(I1 ENERGY)")

replace DeveloperName="ICE ENERGY HOLDINGS" if regexm(DeveloperName,"^(ICE ENERGY)")

replace DeveloperName="ILA + ZAMMIT ENGINEERING" if regexm(DeveloperName,"(ILA)") & regexm(DeveloperName,"(ZAMMIT)")

replace DeveloperName="IDEMAND ENERGY" if regexm(DeveloperName,"^(IDEMAND ENERGY)")

replace DeveloperName="IES" if regexm(DeveloperName,"^(IES)")

replace DeveloperName="INFINITY ENERGY" if regexm(DeveloperName,"^(INFINITY EN)") | regexm(DeveloperName,"^(INFINITYEN)")

replace DeveloperName="INCENTIVE ELECTRIC" if regexm(DeveloperName, "INCENTIVE ELECTRIC")

replace DeveloperName="JBN ELECTRICAL CONSTRUCTION" if regexm(DeveloperName,"^(J B N)") | regexm(DeveloperName,"^(JBN)")

replace DeveloperName="JAMES PETERSEN INDUSTRIES" if regexm(DeveloperName,"^(JAMES PETERSEN INDUSTRIES)")

replace DeveloperName="JCOR GROUP" if regexm(DeveloperName,"^(JCOR GROUP)")

replace DeveloperName="JOE A FLORES" if regexm(DeveloperName,"^(JOE A)") & regexm(DeveloperName,"(FLORES)$")

replace DeveloperName="JOE MOORE CONSTRUCTION" if regexm(DeveloperName,"^(JOE MOORE)")

replace DeveloperName="JONAS ENERGY" if regexm(DeveloperName,"^(JONAS ENERGY SOL)")

replace DeveloperName="KUUBIX ENERGY" if regexm(DeveloperName,"^(KUUBIX)")

replace DeveloperName="KUYKENDALL SOLAR" if regexm(DeveloperName,"^(KUYKENDALL)")

replace DeveloperName="LA SOLAR GROUP" if regexm(DeveloperName,"^(LA SOLAR GROUP)")

replace DeveloperName="LEGACY ELECTRICAL SERVICES" if regexm(DeveloperName,"^(LEGACY ELECTRICAL SER)")

replace DeveloperName="LEND LEASE CONSTRUCTION" if regexm(DeveloperName,"^(LEND LEASE CONS)")

replace DeveloperName="LOGAN ENERGY CORP" if regexm(DeveloperName,"^(LOGAN ENERGY)") | regexm(DeveloperName,"^(LOGANENERGY)")

replace DeveloperName="LUMINALT" if regexm(DeveloperName,"^(LUMINALT)") | regexm(DeveloperName,"^(LUMIANLT)")

replace DeveloperName="M KAHN SOLAR" if regexm(DeveloperName,"^(M KAHN SOLAR)") | regexm(DeveloperName,"^(MKAHN SOLAR)")

replace DeveloperName="M2 MULTIMEDIA" if regexm(DeveloperName,"^(M2 MULTIMEDIA)") | regexm(DeveloperName,"^(M2MULIMEDIA)") | regexm(DeveloperName,"^(M2MULTIMEDIA)")

replace DeveloperName="MAIN STREET CONSTRUCTION" if regexm(DeveloperName,"^(MAIN ST)") & regexm(DeveloperName,"(CONSTR)")

replace DeveloperName="MATSON SERVICES" if regexm(DeveloperName,"^(MATSON SERVICES)") | regexm(DeveloperName,"^(MATSON-SERVICES)")

replace DeveloperName="MAXAPTO" if regexm(DeveloperName,"(SOLAR HEROES)") | regexm(DeveloperName,"(ELECTRIC HEROES)")

replace DeveloperName="MILHOLLAND ELECTRIC" if regexm(DeveloperName,"^(MILHOLLAND ELEC)")

replace DeveloperName="MIMEOS SOLAR" if regexm(DeveloperName,"^(MIMEOS)")

replace DeveloperName="MMR CONSTRUCTORS" if regexm(DeveloperName,"^(MMR CONSTR)")

replace DeveloperName="MOHR POWER SOLAR" if regexm(DeveloperName,"^(MOHR)")

replace DeveloperName="NATIONWIDE SUN" if regexm(DeveloperName,"^(NATIONWIDE)")

replace DeveloperName="NEIGHBORHOOD POWER CORP" if regexm(DeveloperName,"^(NEIGHBORHOOD POWER)")

replace DeveloperName="NEW VISION TECHNOLOGIES" if regexm(DeveloperName,"^(NEW VISION TECH)")

replace DeveloperName="NEXTEDGE" if regexm(DeveloperName,"^(NEXTEDGE)") | regexm(DeveloperName,"^(NEXT>EDGE)")

replace DeveloperName="NJOORD" if regexm(DeveloperName,"^(NJOORD)")

replace DeveloperName="NOR CAL SOLAR CONSTRUCTION" if DeveloperName=="NOR CAL CONST" | DeveloperName=="NOR CAL CONTRACTING" | DeveloperName=="NOR CAL SOLAR CONTRACTING"

replace DeveloperName="NORTH PHASE" if regexm(DeveloperName,"^(NORTH PHASE EL)")

replace DeveloperName="CORNELY" if regexm(DeveloperName,"^(CORNELY)")

replace DeveloperName="NOSTALGICS" if regexm(DeveloperName,"^(NOSTALGIC)")

replace DeveloperName="NRG CLEAN POWER" if regexm(DeveloperName,"^(N R G CLEAN POWER)")

replace DeveloperName="OFFLINE SOLAR" if regexm(DeveloperName,"^(OFFLINE SOLAR)")

replace DeveloperName="OHR ENERGY" if regexm(DeveloperName,"^(OHR ENERGY)")

replace DeveloperName="ONSITE ENERGY" if regexm(DeveloperName,"^(ONSITE ENERGY)")

replace DeveloperName="OPTION ONE" if regexm(DeveloperName,"^(OPTION ONE)") | regexm(DeveloperName,"^(OPTIONONE)")

replace DeveloperName="ORANGE COUNTY SOLAR" if regexm(DeveloperName,"^(ORANGE COUNT)")

replace DeveloperName="OVERLAND CONTRACTING" if regexm(DeveloperName,"^(OVERLAND CON)")

replace DeveloperName="OWL ENERGY RESOURCES" if regexm(DeveloperName,"^(OWL ENERGY RES)")

replace DeveloperName="PACIFIC GAS AND ELECTRIC" if regexm(DeveloperName,"^(PACCIFIC GAS AND ELECTRIC)")

replace DeveloperName="PACIFIC SKY SOLAR" if regexm(DeveloperName,"^(PACIFICSKY SOLAR)")

replace DeveloperName="PACIFICWEST ENERGY SOLUTIONS" if regexm(DeveloperName,"^(PACIFICWEST ENERGY SOLUTIONS)") | regexm(DeveloperName,"^(PACIFIC WEST ENERGY SOLUTIONS)")

replace DeveloperName="PARAGON SUN" if regexm(DeveloperName,"^(PARAGON)")

replace DeveloperName="PERK SOLAR" if regexm(DeveloperName,"^(PERK SOLAR)")

replace DeveloperName="PERMACITY" if regexm(DeveloperName,"^(PERMACITY)")

replace DeveloperName="PETERSEN DEAN" if regexm(DeveloperName,"^(PETERSEN DEAN)") | regexm(DeveloperName,"^(PETERSENDEAN)") | regexm(DeveloperName,"^(PETERSON DEAN)") | regexm(DeveloperName,"^(PETERENDEAN)")

replace DeveloperName="PHOENIX SOLAR" if regexm(DeveloperName,"^(PHOENIX)")

replace DeveloperName="POWER GENERATING SYSTEMS" if regexm(DeveloperName,"^(POWER GENERAT)")

replace DeveloperName="POWER INDEPENDENCE" if regexm(DeveloperName,"^(POWER INDEPENDENCE)")

replace DeveloperName="POWERLIGHT" if regexm(DeveloperName,"^(POWER LIGHT)") | DeveloperName=="POWERLIGT"

replace DeveloperName="PACIFIC GAS AND ELECTRIC" if DeveloperName=="PG AND E"

replace DeveloperName="PORTERMATT ELECTRIC" if (regexm(DeveloperName,"(POWERMATT)") | regexm(DeveloperName,"(POWERMART)")) & regexm(DeveloperName,"(ELECTRIC)")
replace DeveloperName="PORTERMATT ELECTRIC" if DeveloperName=="POTERMATT ELECRIC"

replace DeveloperName="PRECIS SOLAR" if regexm(DeveloperName,"^(PRECIS SOLAR)") | regexm(DeveloperName,"^(PRECIS DEVELOPMENT)")

replace DeveloperName="PRECISION AIR SYSTEMS" if regexm(DeveloperName,"^(PRECISION AIR)")

replace DeveloperName="PREMIER POWER" if regexm(DeveloperName,"^(PREMIER POWER)")

replace DeveloperName="PREMIER SOLAR" if regexm(DeveloperName,"^(PREMIER SOLAR)")

replace DeveloperName="CORNELY" if regexm(DeveloperName,"^(CORNELY)")

replace DeveloperName="PROMISE ENERGY" if regexm(DeveloperName,"^(PROMISE)") & regexm(DeveloperName,"(ENERGY)")

replace DeveloperName="PSG CONSTRUCTION" if regexm(DeveloperName,"^(PSG )")

replace DeveloperName="PURE POWER SOLUTIONS" if regexm(DeveloperName,"^(PUREPOWER)")

replace DeveloperName="REAL ENERGY" if regexm(DeveloperName,"^(REAL)") & regexm(DeveloperName,"(ENERGY)")

replace DeveloperName="REF CORP" if regexm(DeveloperName,"^(REF CORP)")

replace DeveloperName="REGAL SOLAR" if regexm(DeveloperName,"^(REGAL SOLAR)")

replace DeveloperName="RENEWABLE ENERGY CONCEPTS" if DeveloperName=="RENERWABLE ENERGY CONCEPTS"

replace DeveloperName="RENOVA ENERGY" if regexm(DeveloperName,"^(RENOVA)")

replace DeveloperName="RENSUS" if regexm(DeveloperName,"^(RENSUS)")

replace DeveloperName="RODNEY E FITE" if regexm(DeveloperName,"^(RODNEY E FI)")

replace DeveloperName="RUBICON PROFESSIONAL SERVICES" if regexm(DeveloperName,"RUBICON")

replace DeveloperName="RWE-SCHOTT" if regexm(DeveloperName,"^(RWE)") & regexm(DeveloperName,"(SCHOTT)")

replace DeveloperName="SATTLER SOLAR" if regexm(DeveloperName,"^(SATTLER SOLAR)")

replace DeveloperName="SCHNEIDER ELECTRIC" if regexm(DeveloperName,"^(SCHNEIDER ELECTRIC)")

replace DeveloperName="SCUDDER ROOFING" if regexm(DeveloperName,"^(SCUDDER)")

replace DeveloperName="SEMPER SOLARIS" if regexm(DeveloperName,"^(SEMPER SOLARIS)")

replace DeveloperName="SHELL SOLAR" if regexm(DeveloperName,"^(SHELL SOLAR)")

replace DeveloperName="SIEMENS" if regexm(DeveloperName,"^(SIEMENS)")

replace DeveloperName="SKYBRIDGE RENEWABLES" if regexm(DeveloperName,"^(SKYBRIDGE)")

replace DeveloperName="SKYTECH SOLAR" if regexm(DeveloperName,"^(SKYTECH S)")

replace DeveloperName="SMART SOLAR" if regexm(DeveloperName,"^(SMART SOLAR)")

replace DeveloperName="SOLAR 4 AMERICA" if regexm(DeveloperName,"(SOLAR4AMERICA)")
replace DeveloperName="SOLAR 4 AMERICA" if DeveloperName=="SOALR4AMERICA"

replace DeveloperName="SOLARCITY" if regexm(DeveloperName,"(SOLAR CITY)") | regexm(DeveloperName,"(SOLARCITY)") | regexm(DeveloperName,"(SOLARCITE)")

replace DeveloperName="SOLAR FORWARD" if regexm(DeveloperName,"^(SOLAR FORWARD)")

replace DeveloperName="SOLAR INTEGRATED TECHNOLOGIES" if regexm(DeveloperName,"^(SOLAR INTEGRATED)")

replace DeveloperName="SOLAR OPTIMUM" if regexm(DeveloperName,"^(SOLAR OPTIMUM)") | regexm(DeveloperName,"^(SOLAR OPITMUM)")

replace DeveloperName="SOLAR POWER AND ELECTRIC" if DeveloperName=="SOLAR POWER AND ELECTRIC I"

replace DeveloperName="SOLAR PRICE DISCOVERY" if regexm(DeveloperName,"(SOLAR PRICE DISCOVERY)")

replace DeveloperName="SOLAR WATT SOLUTIONS" if regexm(DeveloperName,"^(SOLAR WATT SOLUTIONS)")

replace DeveloperName="SOLARCRAFT" if regexm(DeveloperName,"^(SOLARCRAFT)")

replace DeveloperName="SOLAR ENERGY 911" if regexm(DeveloperName,"^(SOLARENERGY911)")

replace DeveloperName="SOLARMAX TECHNOLOGY" if regexm(DeveloperName,"^(SOLARMAX)")

replace DeveloperName="SOLARPONICS" if DeveloperName=="SOLARPONIICS" | DeveloperName=="SOLAPONICS"

replace DeveloperName="SOLAR PROS" if DeveloperName=="SOLARPROS"

replace DeveloperName="SOLAR RENEWABLE ENERGY" if DeveloperName=="SOLAR RENEWABLE"

replace DeveloperName="SOLAR SYMPHONY CONSTRUCTION" if DeveloperName=="SOLAR SYMPHONY"

replace DeveloperName="SOLAR TECH ENERGY" if regexm(DeveloperName,"^(SOLARTECH)")

replace DeveloperName="SOLAR TECHNOLOGIES" if DeveloperName=="SOLAR TECHNOLOGEIS"

replace DeveloperName="SOLARWINDS" if regexm(DeveloperName,"^(SOLARWINDS)") | DeveloperName=="SOLAR WINDS ENERGY"

replace DeveloperName="SONOMARIN SOLAR" if regexm(DeveloperName,"^(SONOMARIN SOLAR)")

replace DeveloperName="SP ENERGY SERVICE" if regexm(DeveloperName,"^(SP ENERGY SERVICE)")

replace DeveloperName="SPANDA INDUSTRIAL" if regexm(DeveloperName,"^(SPANDA INDUSTRIAL)")

replace DeveloperName="STATEN SOLAR" if regexm(DeveloperName,"^(STATEN SOLAR)")

replace DeveloperName="STELLAR ENERGY SOLUTIONS" if regexm(DeveloperName,"^(STELLAR ENERGY)")

replace DeveloperName="STELLAR SOLAR" if regexm(DeveloperName,"(STELLAR SOLAR)")

replace DeveloperName="STEWART AND STEVENSON" if DeveloperName=="STEWART AND STEVENSEN"

replace DeveloperName="STOWELL DISTRIBUTED POWER" if DeveloperName=="STOWEL DISTRIBUTED POWER"

replace DeveloperName="STRONGHOLD ENGINEERING" if regexm(DeveloperName,"^(STRONGHOLD ENGIN)")

replace DeveloperName="SULLIVAN SOLAR POWER" if regexm(DeveloperName,"^(SULLIVAN SOLAR POWER)") | DeveloperName=="SULLIIVAN SOLAR POWER"

replace DeveloperName="SUN FIRST SOLAR" if regexm(DeveloperName,"^(SUN FIRST)")

replace DeveloperName="SUN PACIFIC SOLAR" if regexm(DeveloperName,"^(SUN PACIFIC SOLAR)")

replace DeveloperName="SUN POWER AND GEOTHERMAL" if regexm(DeveloperName,"^(SUN POWER AND GEOTHERMAL)") | regexm(DeveloperName,"^(SPG)")

replace DeveloperName="SUNISTICS GROUP" if regexm(DeveloperName,"^(SUNISTICS)")

replace DeveloperName="SUNLOGIC" if regexm(DeveloperName,"^(SUNLOGIC)")

replace DeveloperName="SUNLUX" if regexm(DeveloperName,"^(SUNLUX)")

replace DeveloperName="SUNNOVA" if regexm(DeveloperName,"^(SUNNOVA)")

replace DeveloperName="SWEARINGEN SYSTEMS" if regexm(DeveloperName,"^(SWEARINGTON)")

replace DeveloperName="SWELL ENERGY" if regexm(DeveloperName,"^(SWELL )")

replace DeveloperName="SUN POWER AND GEOTHERMAL" if regexm(DeveloperName,"(OCTAVIO)") & regexm(DeveloperName,"(SAENZ)")
