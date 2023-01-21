rename Zip ZIP
label var ZIP "ZIP Code"
replace ZIP="" if strlen(ZIP)<5
replace ZIP=substr(ZIP,1,5) if strlen(ZIP)==10
replace ZIP="" if substr(ZIP,1,1)!="9"
destring ZIP, replace
replace ZIP=93305 if ZIP==95505

replace County=City if County=="US" | County=="USA" | County=="UNKOWN" | County=="UNDO" | regexm(County,"UNITED STATES") | County=="TBD" | County=="CA" | County=="CALIFORNIA" | County=="CALIFORNIA(CA)" | County=="-" | County=="us" | County=="US" | County=="usa" | County=="USa"

replace County=subinstr(County, "â", "", .)
replace County=subinstr(County, char(9), " ", .)
replace County=subinstr(County, char(34), "", .)

replace County=ustrtrim(strupper(County))
replace County=regexr(County, "  ", " ")

replace County=City if County=="US" | County=="USA" | County=="UNKOWN" | County=="UNDO" | regexm(County,"UNITED STATES") | County=="TBD" | County=="CA" | County=="CALIFORNIA" | County=="CALIFORNIA(CA)" | County=="-" | County=="us" | County=="US" | County=="usa" | County=="USa"

replace County=ustrtrim(strupper(County))
replace County=regexr(County, "  ", " ")

replace County="ALAMEDA" if regexm(County, "ALAMED") | regexm(County, "ALAMDED") | regexm(County, "ALAMENDA") | regexm(County, "ALMEDA") | regexm(County, "ALEMEDA") | regexm(County, "ALMAEDA")
replace County="ALAMEDA" if regexm(County, "BERKELEY") | regexm(County, "CASTRO VALLEY") | regexm(County, "DUBLIN") | regexm(County, "HAYWARD") |  regexm(County, "LIVERMORE") |  regexm(County, "OAKLAND") | regexm(County, "PIEDMONT")
replace County="ALAMEDA" if regexm(County, "MICHIGAN") & regexm(City, "Oakland")
replace County="ALAMEDA" if regexm(County, "SOUTH CAROLINA")
replace County="ALAMEDA" if City=="Union City " & County=="HUDSON"
replace County="ALAMEDA" if County=="ALEMADA"
replace County="ALAMEDA" if County=="FREMOUNT"
replace County="ALPINE" if regexm(County, "ALPINE")
replace County="AMADOR" if regexm(County, "AMADOR") | regexm(County, "AMADOUR")
replace County="AMADOR" if regexm(County,"VOLCANO") | regexm(County,"PINE GROVE") | regexm(County,"MARTELL")
replace County="BUTTE" if regexm(County, "BUTTE")
replace County="BUTTE" if County=="BUTT"
replace County="BUTTE" if regexm(County, "PARADISE") | regexm(County, "CHICO") | regexm(County, "FORBESTOWN")
replace County="CALAVERAS" if regexm(County, "CALAVERAS") | regexm(County, "CALAVARAS") | regexm(County, "CALAVARES")
replace County="CALAVERAS" if regexm(County, "VALLEY SPRINGS")
replace County="CALAVERAS" if ZIP==95254
replace County="COLUSA" if regexm(County, "COLUSA")
replace County="CONTRA COSTA" if regexm(County, "CONTRA") & regexm(County, "COSTA")
replace County="CONTRA COSTA" if regexm(County, "CONTA COSTA")
replace County="CONTRA COSTA" if regexm(County, "CONTR A COSTA")
replace County="CONTRA COSTA" if County=="CONRTA COSTA"
replace County="CONTRA COSTA" if County=="COSTRA COSTA"
replace County="CONTRA COSTA" if regexm(County,"^CONTRA COST")
replace County="CONTRA COSTA" if County=="CONTRA"
replace County="CONTRA COSTA" if County=="WILLIAMSON COUNTY"
replace County="CONTRA COSTA" if regexm(County, "^MONTGOMERY") & City=="Kensington "
replace County="CONTRA COSTA" if County=="CCC"
replace County="CONTRA COSTA" if regexm(County, "^CONT")
replace County="CONTRA COSTA" if regexm(County, "ONTRA COSTA COUNTY")
replace County="CONTRA COSTA" if County=="HIDALGO"
replace County="CONTRA COSTA" if regexm(County, "ALAMO") | regexm(County, "BRENTWOOD") | regexm(County, "CABARRUS") | regexm(County, "WALNUT CREEK") | regexm(County, "CABARRUS") | regexm(County, "MORAGO") | regexm(County, "BAY POINT")
replace County="DEL NORTE" if regexm(County, "DEL NORTE")
replace County="EL DORADO" if regexm(County, "EL DORADO") | regexm(County, "ELDORADO") | regexm(County, "EL DORAFO") | regexm(County, "EL DORDADO")
replace County="EL DORADO" if County=="WAKE COUNTY" | County=="EL"
replace County="EL DORADO" if regexm(County, "SHINGLE SPRINGS") | regexm(County, "GARDEN VALLEY") |regexm(County, "GREENWOOD")
replace County="EL DORADO" if regexm(County, "BOISE") | regexm(County, "CAMINO") | regexm(County, "RESCUE") | regexm(County, "COOL")
replace County="FRESNO" if regexm(County, "FRESNO") 
replace County="FRESNO" if County=="FRESON" | County=="FRESCO" | County=="FRENSO"
replace County="FRESNO" if regexm(County, "CITY OF CLOVES")
replace County="FRESNO" if regexm(County, "KINGSBERG") | regexm(County, "DEL REY")
replace County="GLENN" if regexm(County, "GLENN")
replace County="GLENN" if regexm(County, "ELK CREEK")
replace County="HUMBOLDT" if regexm(County, "HUMBOLDT") | regexm(County, "HUMBOLT") | regexm(County, "HOMBOLDT")
replace County="HUMBOLDT" if regexm(County,"WILLOW CREEK") | regexm(County,"TRINIDAD")
replace County="HUMBOLDT" if regexm(County,"MCKINLEYVILLE") | regexm(County,"HYDESVILLE")
replace County="IMPERIAL" if regexm(County, "IMPERIAL")
replace County="INYO" if regexm(County, "INYO")
replace County="INYO" if regexm(County, "BISHOP")
replace County="KERN" if regexm(County, "KERN")
replace County="KERN" if County=="KEM"
replace County="KERN" if regexm(County, "BAKERSFIELD")
replace County="KINGS" if regexm(County, "^KING")
replace County="LAKE" if regexm(County, "LAKE")
replace County="LAKE" if regexm(County, "KELSEYVILLE")
replace County="LASSEN" if regexm(County, "LASSEN")
replace County="LOS ANGELES" if regexm(County, "LOS ANGELES") | County=="LA" | County=="LA COUNTY" | regexm(County, "LAS ANGELES") | County=="OS ANGELES COUNTY"
replace County="LOS ANGELES" if regexm(County, "ANGELES") 
replace County="LOS ANGELES" if regexm(County, "^LOS ANGEL")
replace County="LOS ANGELES" if County=="LON ANGELES" | County=="LOS-ANGELES" | County=="LS ANGELES" | County=="LOS ANEGELES" | County=="LOS ANGLELES" | County=="LOS ANGLES" | County=="LOS ANQELES"
replace County="LOS ANGELES" if regexm(County, "VALENCIA") | regexm(County, "VAL VERDE") | regexm(County, "TORRANCE") | regexm(County, "BEVERLY HILLS") | regexm(County, "INDUSTRY")| regexm(County, "LA VERNE")| regexm(County, "LANCASTER") | regexm(County, "MALIBU")| regexm(County, "MANHATTAN BEACH")| regexm(County, "MONTBELLO")| regexm(County, "POMONA")| regexm(County, "SANTA CLARITA") | regexm(County, "SHERMAN OAKS") | regexm(County, "RANCHO DOMINGUEZ")
replace County="LOS ANGELES" if County=="MONTGOMERY" & City=="Northridge "
replace County="LOS ANGELES" if County=="ACTON" | City=="ACTON"
replace County="LOS ANGELES" if regexm(County, "AGUA DULCE") | regexm(County, "CANOGA PARK") | regexm(County, "CANYON COUNTRY") | regexm(County, "CASTAIC") | regexm(County, "CHATSWORTH") | regexm(County, "CHATSWORTH") | regexm(County, "HUNTINGTON PK") | regexm(County, "LA CANADA") | regexm(County, "NEWHALL") | regexm(County, "HOLLYWOOD") | regexm(County, "PACIFIC PALISADES") | regexm(County, "PALOS VERDES") | regexm(County, "SAN PEDRO") | regexm(County, "TOPANGA") | regexm(County, "VAN NUYS") | regexm(County, "VENICE")
replace County="MADERA" if regexm(County, "MADERA") & regexm(County, "CORTE")==0
replace County="MADERA" if regexm(County, "MADREA")
replace County="MADERA" if regexm(County, "CITY OF MEDERA")
replace County="MADERA" if regexm(County, "COARSEGOLD") | regexm(County, "LA VINA")
replace County="MARIN" if regexm(County, "MARIN")
replace County="MARIN" if regexm(County, "BELVEDERE")
replace County="MARIN" if regexm(County, "DOUGLAS") & City=="Larkspur"
replace County="MARIN" if regexm(County, "KENTFIELD")
replace County="MARIN" if regexm(County, "STINSON BEACH")
replace County="MARIN" if ApplicationCode=="PGE-SGIP-2021-28051"
replace County="MARIPOSA" if regexm(County, "MARIPOSA")
replace County="MENDOCINO" if regexm(County, "MENDOCINO") | regexm(County, "MENDOCINO") | regexm(County, "MENDICINO") | regexm(County, "^MENDO")
replace County="MERCED" if regexm(County, "MERCED") | regexm(County, "MRCED") | regexm(County, "MECED")
replace County="MERCED" if regexm(County, "LE GRAND")
replace County="MODOC" if regexm(County, "MODOC")
replace County="MONO" if regexm(County, "MONO")
replace County="MONTEREY" if regexm(County, "MONTEREY") | regexm(County, "MONTERAY") | regexm(County, "MONTERY")
replace County="MONTEREY" if County=="MENDINA"
replace County="MONTEREY" if County=="LAS LAMOS"
replace County="NAPA" if regexm(County, "NAPA")
replace County="NAPA" if regexm(County, "AMERICAN CANYON") | regexm(County, "CALISTOGA")
replace County="NAPA" if City=="Napa" & County=="SOLANE"
replace County="NAPA" if City=="Napa" & County=="COUNTY"
replace County="NEVADA" if regexm(County, "NEVADA")
replace County="NEVADA" if regexm(County, "PENN VALLEY")
replace County="ORANGE" if regexm(County, "ORANGE") | County=="OC"  | County=="ORNAGE"  | County=="ORANG"  | County=="ORANCE"  | County=="ORAGE"
replace County="ORANGE" if County=="WESTCHESTER COUNTY"
replace County="ORANGE" if regexm(County, "YORBA LINDA") | regexm(County, "TUSTIN") | regexm(County, "BUENA PARK") | regexm(County, "CARROLL")
replace County="ORANGE" if County=="COUNTY" & City=="San Clemente" 
replace County="PLACER" if regexm(County, "PLACER")
replace County="PLACER" if regexm(County, "GRANITE BAY") | regexm(County, "PENRYN")
replace County="PLACER" if regexm(County, "AUBURN")
replace County="PLACER" if regexm(County, "LEE COUNTY") | County=="LEE"
replace County="PLUMAS" if regexm(County, "PLUMAS")
replace County="RIVERSIDE" if regexm(County, "RIVERSIDE")
replace County="RIVERSIDE" if regexm(County, "JEFFERSON")
replace County="RIVERSIDE" if regexm(County, "^(RIVER)")
replace County="RIVERSIDE" if County=="RIVESIDE"
replace County="RIVERSIDE" if regexm(County, "^(RIVVER)") | regexm(County, "^(REVER)")
replace County="RIVERSIDE" if regexm(County,"TEMECULA")
replace County="SACRAMENTO" if regexm(County, "SACRAMENTO") | regexm(County, "SACAMENTO")
replace County="SAN BENITO" if regexm(County, "SAN BENITO")
replace County="SAN BERNARDINO" if regexm(County, "SAN BERNARDINO")
replace County="SAN BERNARDINO" if regexm(County, "AN BERNARDINO") | regexm(County, "SN BERNRDNO") | regexm(County, "^(SAN BERN)")
replace County="SAN BERNARDINO" if regexm(City, "Ontario") | regexm(City, "Yucaipa") | regexm(City, "ALTA LOMA") | regexm(County, "ALTA LOMA") | regexm(City, "Barstow")
replace County="SAN BERNARDINO" if ZIP==92346
replace County="SAN BERNARDINO" if regexm(County, "APPLE VALLEY") | regexm(County, "YUCCA VALLEY") | regexm(County, "PHELAN")
replace County="SAN DIEGO" if regexm(County, "SAN DIEGO")
replace County="SAN DIEGO" if regexm(County, "AN DIEGO") | regexm(County, "SANDIEGO")
replace County="SAN DIEGO" if regexm(County, "CARLSBAD") | regexm(County, "RANCHO SANTA FE") | regexm(County, "JAMUL") | regexm(County, "FALLBROOK") | regexm(County, "BONSALL") | regexm(County, "BORREGO SPRINGS") | regexm(County, "JULIAN") | regexm(County, "DULZURA") | regexm(County, "LA JOLLA") | regexm(County, "PALOMAR") | regexm(County, "PAUMA") | regexm(County, "RAMONA") | regexm(County, "SPRING VALLEY") | regexm(County, "VALLEY CENTER")
replace County="SAN DIEGO" if regexm(County, "RANCHO SANTE FE") 
replace County="SAN DIEGO" if regexm(County, "^SAN D") | regexm(County, "^SAB DIEGO") | regex(County, "S(A)?(N)? DIEGO")
replace County="SAN DIEGO" if County=="HAYS"
replace County="SAN FRANCISCO" if (regexm(County, "SAN FRANCISCO") & regexm(County, "SOUTH")==0) | County=="SF" | County=="SAN FRANICSCO"
replace County="SAN JOAQUIN" if regexm(County, "SAN JOAQUIN") | regexm(County, "SANJOAQUIN") | regexm(County, "SAM JOAQUIN") | regexm(County, "SAM JOAQIUN")
replace County="SAN JOAQUIN" if regexm(County, "^(SAN JOA)")
replace County="SAN JOAQUIN" if regexm(County, "^(SAN KOAQ)") 
replace County="SAN JOAQUIN" if regexm(County, "^(SAN JAO)") 
replace County="SAN JOAQUIN" if regexm(County, "^(SAN JOQA)") 
replace County="SAN JOAQUIN" if regexm(County, "^(SAN JUAQ)")
replace County="SAN JOAQUIN" if regexm(County,"TRACY")
replace County="SAN LUIS OBISPO" if regexm(County, "SAN LUIS OBISPO") | County=="SLO" | regexm(County, "AN LUIS OBISPO") | regexm(County, "SN LUIS OBISPO") | regexm(County, "SA UIS OBISPO")
replace County="SAN LUIS OBISPO" if regexm(County,"SAN") & regexm(County,"LUIS") & regexm(County,"PO")
replace County="SAN LUIS OBISPO" if regexm(County,"SAN LUI") 
replace County="SAN MATEO" if regexm(County, "SAN MATEO") | regexm(County, "SAM MATEO")
replace County="SAN MATEO" if regexm(County, "BELMONT") | regexm(County, "PESCADERO") | regexm(County, "EL GRANADA") | regexm(County, "LOS OSOS") | regexm(County, "LOS OSOS")
replace County="SAN MATEO" if regexm(County, "SOUTH") & regexm(County, "SAN FRAN")
replace County="SANTA BARBARA" if regexm(County, "BA(R)?BARA")
replace County="SANTA CLARA" if regexm(County, "SANTA CLARA")
replace County="SANTA CLARA" if regexm(County, "SANT CLARA") |  regexm(County, "SANTA  CLARA") |  regexm(County, "SANTA CARA") | regexm(County, "SANTA CLASRA") | regexm(County, "SAN CLARA") | regexm(County, "SANTRA CLARA")
replace County="SANTA CLARA" if County=="MH"
replace County="SANTA CRUZ" if regexm(County, "SANTA CRUZ")
replace County="SANTA CRUZ" if regexm(County, "APTOS")
replace County="SANTA CRUZ" if regexm(County, "SANTZ CRUZ") | regexm(County, "SAN CRUZ")
replace County="SANTA CRUZ" if regexm(County, "BOULDER CREEK")
replace County="SANTA CRUZ" if regexm(County, "SOQUEL")
replace County="SANTA CRUZ" if County=="CRUZ"
replace County="SHASTA" if regexm(County, "SHASTA")
replace County="SHASTA" if regexm(County, "COTTONWOOD") | regexm(County, "OAK ROAD") | regexm(County, "SHINGLETOWN")
replace County="SIERRA" if regexm(County, "SIERRA")
replace County="SISKIYOU" if regexm(County, "SISKIYOU")
replace County="SOLANO" if regexm(County, "SOLANO") | regexm(County, "SOLONO") | regexm(County, "SOLANE") | regexm(County, "SALANO") | regexm(County, "SOLARNO")
replace County="SOLANO" if regexm(County, "VACAVILLE")
replace County="SOLANO" if regexm(County, "DISCOVERY BAY")
replace County="SONOMA" if regexm(County, "SONOMA") | (County=="SOCO" & City=="Sebastopol")
replace County="SONOMA" if regexm(County, "SOMOMA") | regexm(County, "SOMONA") | regexm(County, "SONONA")
replace County="SONOMA" if regexm(County, "BODEGA") | regexm(County, "SEBASTOPOL") | regexm(County, "GUERNEVILLE") | regexm(County, "OCCIDENTAL")
replace County="STANISLAUS" if regexm(County, "STANISLAU")
replace County="SUTTER" if regexm(County, "SUTTER")
replace County="TEHAMA" if regexm(County, "TEHAMA") | County=="TEHEMA" | County=="TAHAMA"
replace County="TRINITY" if regexm(County, "TRINITY")
replace County="TULARE" if regexm(County, "TULARE")
replace County="TUOLUMNE" if regexm(County, "TUOL(U)?(O)?MNE") | County=="TUOLOMNE" | County=="TOULUMNE" | County=="TUOLOMNE"
replace County="TUOLUMNE" if regexm(County, "JAMESTOWN")
replace County="VENTURA" if regexm(County, "VENTURA") | County=="VENTU" | County=="VENUTRA" | County=="VENTRUA" | County=="VENTUTRA"
replace County="VENTURA" if regexm(County,"THOUSAND OAKS") | regexm(County, "CAMARILLA")
replace County="VENTURA" if County=="JBORCHARD@VCOASTAL.COM"
replace County="VENTURA" if County=="COOK" & City=="Oak Park "
replace County="VENTURA" if County=="VAENTURA"
replace County="VENTURA" if County=="VC"
replace County="YOLO" if regexm(County, "YOLO")
replace County="YOLO" if regexm(County,"WOODLAND") | regexm(County,"CAPAY") | regexm(County,"DAVIS") | regexm(County,"ESPARTO")
replace County="YUBA" if regexm(County, "YUBA")
replace County="YUBA" if regexm(County,"WHEATLAND") | regexm(County,"BROWNS VALLEY") | regexm(County,"OREGON HOUSE")

//Work smarter, not harder.
//List of incorporated municipalities by county taken from Wikipedia: https://en.wikipedia.org/wiki/List_of_municipalities_in_California
//List of regex statements generated in Microsoft Excel. See "Mass Regex Statement Creation.xlsx"

replace County="SAN BERNARDINO" if regexm(County, "ADELANTO")
replace County="LOS ANGELES" if regexm(County, "AGOURA HILLS") | regexm(County, "AGUORA HILLS")
replace County="ALAMEDA" if regexm(County, "ALAMEDA")
replace County="ALAMEDA" if regexm(County, "ALBANY")
replace County="LOS ANGELES" if regexm(County, "ALHAMBRA")
replace County="ORANGE" if regexm(County, "ALISO VIEJO")
replace County="MODOC" if regexm(County, "ALTURAS")
replace County="AMADOR" if regexm(County, "AMADOR CITY")
replace County="NAPA" if regexm(County, "AMERICAN CANYON")
replace County="ORANGE" if regexm(County, "ANAHEIM")
replace County="SHASTA" if regexm(County, "ANDERSON")
replace County="CALAVERAS" if regexm(County, "ANGELS CAMP")
replace County="CONTRA COSTA" if regexm(County, "ANTIOCH")
replace County="SAN BERNARDINO" if regexm(County, "APPLE VALLEY")
replace County="LOS ANGELES" if regexm(County, "ARCADIA")
replace County="HUMBOLDT" if regexm(County, "ARCATA")
replace County="SAN LUIS OBISPO" if regexm(County, "ARROYO GRANDE")
replace County="LOS ANGELES" if regexm(County, "ARTESIA")
replace County="KERN" if regexm(County, "ARVIN")
replace County="SAN LUIS OBISPO" if regexm(County, "ATASCADERO")
replace County="SAN MATEO" if regexm(County, "ATHERTON")
replace County="MERCED" if regexm(County, "ATWATER")
replace County="PLACER" if regexm(County, "AUBURN")
replace County="LOS ANGELES" if regexm(County, "AVALON")
replace County="KINGS" if regexm(County, "AVENAL")
replace County="LOS ANGELES" if regexm(County, "AZUSA")
replace County="KERN" if regexm(County, "BAKERSFIELD")
replace County="KERN" if regexm(County, "BAKERSFEILD")
replace County="LOS ANGELES" if regexm(County, "BALDWIN PARK")
replace County="RIVERSIDE" if regexm(County, "BANNING")
replace County="SAN BERNARDINO" if regexm(County, "BARSTOW")
replace County="RIVERSIDE" if regexm(County, "BEAUMONT")
replace County="LOS ANGELES" if regexm(County, "BELL")
replace County="LOS ANGELES" if regexm(County, "BELL GARDENS")
replace County="LOS ANGELES" if regexm(County, "BELLFLOWER")
replace County="SAN MATEO" if regexm(County, "BELMONT")
replace County="MARIN" if regexm(County, "BELVEDERE")
replace County="SOLANO" if regexm(County, "BENICIA")
replace County="ALAMEDA" if regexm(County, "BERKELEY")
replace County="LOS ANGELES" if regexm(County, "BEVERLY HILLS")
replace County="SAN BERNARDINO" if regexm(County, "BIG BEAR LAKE")
replace County="BUTTE" if regexm(County, "BIGGS")
replace County="INYO" if regexm(County, "BISHOP")
replace County="HUMBOLDT" if regexm(County, "BLUE LAKE")
replace County="RIVERSIDE" if regexm(County, "BLYTHE")
replace County="LOS ANGELES" if regexm(County, "BRADBURY")
replace County="IMPERIAL" if regexm(County, "BRAWLEY")
replace County="ORANGE" if regexm(County, "BREA")
replace County="CONTRA COSTA" if regexm(County, "BRENTWOOD")
replace County="SAN MATEO" if regexm(County, "BRISBANE")
replace County="SANTA BARBARA" if regexm(County, "BUELLTON")
replace County="ORANGE" if regexm(County, "BUENA PARK")
replace County="LOS ANGELES" if regexm(County, "BURBANK")
replace County="SAN MATEO" if regexm(County, "BURLINGAME")
replace County="LOS ANGELES" if regexm(County, "CALABASAS")
replace County="IMPERIAL" if regexm(County, "CALEXICO")
replace County="KERN" if regexm(County, "CALIFORNIA CITY")
replace County="RIVERSIDE" if regexm(County, "CALIMESA")
replace County="IMPERIAL" if regexm(County, "CALIPATRIA")
replace County="NAPA" if regexm(County, "CALISTOGA")
replace County="SAN LUIS OBISPO" if regexm(County, "CAMBRIA")
replace County="VENTURA" if regexm(County, "CAMAR(R)?IL(L)?O")
replace County="SANTA CLARA" if regexm(County, "CAMPBELL")
replace County="FRESNO" if regexm(County, "CANTUA CREEK")
replace County="RIVERSIDE" if regexm(County, "CANYON LAKE")
replace County="SANTA CRUZ" if regexm(County, "CAPITOLA")
replace County="SAN DIEGO" if regexm(County, "CARLSBAD")
replace County="MONTEREY" if regexm(County, "CARMEL")
replace County="SANTA BARBARA" if regexm(County, "CARPINTERIA")
replace County="LOS ANGELES" if regexm(County, "CARSON")
replace County="RIVERSIDE" if regexm(County, "CATHEDRAL CITY")
replace County="STANISLAUS" if regexm(County, "CERES")
replace County="LOS ANGELES" if regexm(County, "CERRITOS")
replace County="BUTTE" if regexm(County, "CHICO")
replace County="SAN BERNARDINO" if regexm(County, "CHINO")
replace County="SAN BERNARDINO" if regexm(County, "CHINO HILLS")
replace County="MADERA" if regexm(County, "CHOWCHILLA")
replace County="SAN DIEGO" if regexm(County, "CHULA VISTA")
replace County="SACRAMENTO" if regexm(County, "CITRUS HEIGHTS")
replace County="LOS ANGELES" if regexm(County, "CLAREMONT")
replace County="CONTRA COSTA" if regexm(County, "CLAYTON")
replace County="LAKE" if regexm(County, "CLEARLAKE")
replace County="SONOMA" if regexm(County, "CLOVERDALE")
replace County="FRESNO" if regexm(County, "CLOVIS")
replace County="RIVERSIDE" if regexm(County, "COACHELLA")
replace County="FRESNO" if regexm(County, "COALINGA")
replace County="PLACER" if regexm(County, "COLFAX")
replace County="SAN MATEO" if regexm(County, "COLMA")
replace County="SAN BERNARDINO" if regexm(County, "COLTON")
replace County="COLUSA" if regexm(County, "COLUSA")
replace County="LOS ANGELES" if regexm(County, "COMMERCE")
replace County="LOS ANGELES" if regexm(County, "COMPTON")
replace County="CONTRA COSTA" if regexm(County, "CONCORD")
replace County="KINGS" if regexm(County, "CORCORAN")
replace County="TEHAMA" if regexm(County, "CORNING")
replace County="RIVERSIDE" if regexm(County, "CORONA")
replace County="SAN DIEGO" if regexm(County, "CORONADO")
replace County="MARIN" if regexm(County, "CORTE MADERA")
replace County="ORANGE" if regexm(County, "COSTA MESA")
replace County="SONOMA" if regexm(County, "COTATI")
replace County="LOS ANGELES" if regexm(County, "COVINA")
replace County="DEL NORTE" if regexm(County, "CRESCENT CITY")
replace County="LOS ANGELES" if regexm(County, "CUDAHY")
replace County="LOS ANGELES" if regexm(County, "CULVER CITY")
replace County="SANTA CLARA" if regexm(County, "CUPERTINO")
replace County="ORANGE" if regexm(County, "CYPRESS")
replace County="SAN MATEO" if regexm(County, "DALY CITY")
replace County="ORANGE" if regexm(County, "DANA POINT")
replace County="CONTRA COSTA" if regexm(County, "DANVILLE")
replace County="YOLO" if regexm(County, "DAVIS")
replace County="SAN DIEGO" if regexm(County, "DEL MAR")
replace County="MONTEREY" if regexm(County, "DEL REY OAKS")
replace County="KERN" if regexm(County, "DELANO")
replace County="RIVERSIDE" if regexm(County, "DESERT HOT SPRINGS")
replace County="LOS ANGELES" if regexm(County, "DIAMOND BAR")
replace County="TULARE" if regexm(County, "DINUBA")
replace County="SOLANO" if regexm(County, "DIXON")
replace County="SISKIYOU" if regexm(County, "DORRIS")
replace County="MERCED" if regexm(County, "DOS PALOS")
replace County="LOS ANGELES" if regexm(County, "DOWNEY")
replace County="LOS ANGELES" if regexm(County, "DUARTE")
replace County="ALAMEDA" if regexm(County, "DUBL(L)?IN")
replace County="SISKIYOU" if regexm(County, "DUNSMUIR")
replace County="SAN MATEO" if regexm(County, "EAST PALO ALTO")
replace County="RIVERSIDE[9]" if regexm(County, "EASTVALE")
replace County="SAN DIEGO" if regexm(County, "EL CAJON")
replace County="IMPERIAL" if regexm(County, "EL CENTRO")
replace County="CONTRA COSTA" if regexm(County, "EL CERRITO")
replace County="LOS ANGELES" if regexm(County, "EL MONTE")
replace County="LOS ANGELES" if regexm(County, "EL SEGUNDO")
replace County="SACRAMENTO" if regexm(County, "ELK GROVE")
replace County="ALAMEDA" if regexm(County, "EMERYVILLE")
replace County="SAN DIEGO" if regexm(County, "ENCINITAS")
replace County="SAN JOAQUIN" if regexm(County, "ESCALON")
replace County="SAN DIEGO" if regexm(County, "ESCONDIDO")
replace County="SISKIYOU" if regexm(County, "ETNA")
replace County="HUMBOLDT" if regexm(County, "EUREKA")
replace County="TULARE" if regexm(County, "EXETER")
replace County="MARIN" if regexm(County, "FAIRFAX")
replace County="SOLANO" if regexm(County, "FAIRFIELD")
replace County="TULARE" if regexm(County, "FARMERSVILLE")
replace County="HUMBOLDT" if regexm(County, "FERNDALE")
replace County="VENTURA" if regexm(County, "FILLMORE")
replace County="FRESNO" if regexm(County, "FIREBAUGH")
replace County="SACRAMENTO" if regexm(County, "FOLSOM")
replace County="SAN BERNARDINO" if regexm(County, "FONTANA")
replace County="MENDOCINO" if regexm(County, "FORT BRAGG")
replace County="SISKIYOU" if regexm(County, "FORT JONES")
replace County="HUMBOLDT" if regexm(County, "FORTUNA")
replace County="SAN MATEO" if regexm(County, "FOSTER CITY")
replace County="ORANGE" if regexm(County, "FOUNTAIN VALLEY")
replace County="FRESNO" if regexm(County, "FOWLER")
replace County="ALAMEDA" if regexm(County, "FREMONT")
replace County="FRESNO" if regexm(County, "FRESNO")
replace County="ORANGE" if regexm(County, "FULLERTON")
replace County="SACRAMENTO" if regexm(County, "GALT")
replace County="ORANGE" if regexm(County, "GARDEN GROVE")
replace County="LOS ANGELES" if regexm(County, "GARDENA")
replace County="SANTA CLARA" if regexm(County, "GILROY")
replace County="LOS ANGELES" if regexm(County, "GLENDALE")
replace County="LOS ANGELES" if regexm(County, "GLENDORA")
replace County="SANTA BARBARA" if regexm(County, "GOLETA")
replace County="MONTEREY" if regexm(County, "GONZALES")
replace County="SAN BERNARDINO" if regexm(County, "GRAND TERRACE")
replace County="NEVADA" if regexm(County, "GRASS VALLEY")
replace County="MONTEREY" if regexm(County, "GREENFIELD")
replace County="BUTTE" if regexm(County, "GRIDLEY")
replace County="SAN LUIS OBISPO" if regexm(County, "GROVER BEACH")
replace County="TUOLOMNE" if regexm(County, "GROVELAND")
replace County="SANTA BARBARA" if regexm(County, "GUADALUPE")
replace County="MERCED" if regexm(County, "GUSTINE")
replace County="SAN MATEO" if regexm(County, "HALF MOON BAY")
replace County="KINGS" if regexm(County, "HANFORD")
replace County="LOS ANGELES" if regexm(County, "HAWAIIAN GARDENS")
replace County="LOS ANGELES" if regexm(County, "HAWTHORNE")
replace County="ALAMEDA" if regexm(County, "HAYWARD")
replace County="SONOMA" if regexm(County, "HEALDSBURG")
replace County="RIVERSIDE" if regexm(County, "HEMET")
replace County="CONTRA COSTA" if regexm(County, "HERCULES")
replace County="LOS ANGELES" if regexm(County, "HERMOSA BEACH")
replace County="SAN BERNARDINO" if regexm(County, "HESPERIA")
replace County="LOS ANGELES" if regexm(County, "HIDDEN HILLS")
replace County="SAN BERNARDINO" if regexm(County, "HIGHLAND")
replace County="SAN MATEO" if regexm(County, "HILLSBOROUGH")
replace County="SAN BENITO" if regexm(County, "HOLLISTER")
replace County="IMPERIAL" if regexm(County, "HOLTVILLE")
replace County="STANISLAUS" if regexm(County, "HUGHSON")
replace County="ORANGE" if regexm(County, "HUNTINGTON BEACH")
replace County="LOS ANGELES" if regexm(County, "HUNTINGTON PARK")
replace County="FRESNO" if regexm(County, "HURON")
replace County="IMPERIAL" if regexm(County, "IMPERIAL")
replace County="SAN DIEGO" if regexm(County, "IMPERIAL BEACH")
replace County="RIVERSIDE" if regexm(County, "INDIAN WELLS")
replace County="RIVERSIDE" if regexm(County, "INDIO")
replace County="LOS ANGELES" if regexm(County, "INDUSTRY")
replace County="LOS ANGELES" if regexm(County, "INGLEWOOD")
replace County="AMADOR" if regexm(County, "IONE")
replace County="ORANGE" if regexm(County, "IRVINE")
replace County="LOS ANGELES" if regexm(County, "IRWINDALE")
replace County="SACRAMENTO" if regexm(County, "ISLETON")
replace County="AMADOR" if regexm(County, "JACKSON")
replace County="RIVERSIDE[10]" if regexm(County, "JURUPA VALLEY")
replace County="FRESNO" if regexm(County, "KERMAN")
replace County="MONTEREY" if regexm(County, "KING CITY")
replace County="FRESNO" if regexm(County, "KINGSBURG")
replace County="LOS ANGELES" if regexm(County, "LA CAÑADA FLINTRIDGE")
replace County="ORANGE" if regexm(County, "LA HABRA")
replace County="LOS ANGELES" if regexm(County, "LA HABRA HEIGHTS")
replace County="SAN DIEGO" if regexm(County, "LA MESA")
replace County="LOS ANGELES" if regexm(County, "LA MIRADA")
replace County="ORANGE" if regexm(County, "LA PALMA")
replace County="LOS ANGELES" if regexm(County, "LA PUENTE")
replace County="RIVERSIDE" if regexm(County, "LA QUINTA")
replace County="LOS ANGELES" if regexm(County, "LA VERNE")
replace County="CONTRA COSTA" if regexm(County, "LAFAYETTE")
replace County="ORANGE" if regexm(County, "LAGUNA BEACH")
replace County="ORANGE" if regexm(County, "LAGUNA HILLS")
replace County="ORANGE" if regexm(County, "LAGUNA NIG(U)?EL")
replace County="ORANGE" if regexm(County, "LAGUNA WOODS")
replace County="RIVERSIDE" if regexm(County, "LAKE ELSINORE")
replace County="ORANGE" if regexm(County, "LAKE FOREST")
replace County="LAKE" if regexm(County, "LAKEPORT")
replace County="LOS ANGELES" if regexm(County, "LAKEWOOD")
replace County="LOS ANGELES" if regexm(County, "LANCASTER")
replace County="MARIN" if regexm(County, "LARKSPUR")
replace County="SAN JOAQUIN" if regexm(County, "LATHROP")
replace County="LOS ANGELES" if regexm(County, "LAWNDALE")
replace County="SAN DIEGO" if regexm(County, "LEMON GROVE")
replace County="KINGS" if regexm(County, "LEMOORE")
replace County="PLACER" if regexm(County, "LINCOLN")
replace County="TULARE" if regexm(County, "LINDSAY")
replace County="SUTTER" if regexm(County, "LIVE OAK")
replace County="ALAMEDA" if regexm(County, "LIVERMORE")
replace County="MERCED" if regexm(County, "LIVINGSTON")
replace County="SAN JOAQUIN" if regexm(County, "LODI")
replace County="SAN BERNARDINO" if regexm(County, "LOMA LINDA")
replace County="LOS ANGELES" if regexm(County, "LOMITA")
replace County="SANTA BARBARA" if regexm(County, "LOMPOC")
replace County="LOS ANGELES" if regexm(County, "LONG BEACH")
replace County="PLACER" if regexm(County, "LOOMIS")
replace County="ORANGE" if regexm(County, "LOS ALAMITOS")
replace County="SANTA CLARA" if regexm(County, "LOS ALTOS")
replace County="SANTA CLARA" if regexm(County, "LOS ALTOS HILLS")
replace County="LOS ANGELES" if regexm(County, "LOS ANGELES")
replace County="MERCED" if regexm(County, "LOS BANOS")
replace County="SANTA CLARA" if regexm(County, "LOS GATOS")
replace County="SIERRA" if regexm(County, "LOYALTON")
replace County="LOS ANGELES" if regexm(County, "LYNWOOD")
replace County="MADERA" if regexm(County, "MADERA")
replace County="LOS ANGELES" if regexm(County, "MALIBU")
replace County="MONO" if regexm(County, "MAMMOTH LAKES")
replace County="LOS ANGELES" if regexm(County, "MANHATTAN BEACH")
replace County="SAN JOAQUIN" if regexm(County, "MANTECA")
replace County="KERN" if regexm(County, "MARICOPA")
replace County="MONTEREY" if regexm(County, "MARINA")
replace County="CONTRA COSTA" if regexm(County, "MARTINEZ")
replace County="YUBA" if regexm(County, "MARYSVILLE")
replace County="LOS ANGELES" if regexm(County, "MAYWOOD")
replace County="KERN" if regexm(County, "MCFARLAND")
replace County="FRESNO" if regexm(County, "MENDOTA")
replace County="RIVERSIDE" if regexm(County, "MENIFEE")
replace County="SAN MATEO" if regexm(County, "MENLO PARK")
replace County="MERCED" if regexm(County, "MERCED")
replace County="MARIN" if regexm(County, "MILL VALLEY")
replace County="SAN MATEO" if regexm(County, "MILLBRAE")
replace County="SANTA CLARA" if regexm(County, "MILPITAS")
replace County="ORANGE" if regexm(County, "MISSION VIEJO")
replace County="STANISLAUS" if regexm(County, "MODESTO")
replace County="LOS ANGELES" if regexm(County, "MONROVIA")
replace County="SISKIYOU" if regexm(County, "MONTAGUE")
replace County="SAN BERNARDINO" if regexm(County, "MONTCLAIR")
replace County="SANTA CLARA" if regexm(County, "MONTE SERENO")
replace County="LOS ANGELES" if regexm(County, "MONTEBELLO")
replace County="MONTEREY" if regexm(County, "MONTEREY")
replace County="LOS ANGELES" if regexm(County, "MONTEREY PARK")
replace County="VENTURA" if regexm(County, "MOORPARK")
replace County="CONTRA COSTA" if regexm(County, "MORAGA")
replace County="RIVERSIDE" if regexm(County, "MORENO VALLEY")
replace County="SANTA CLARA" if regexm(County, "MORGAN HILL")
replace County="SAN LUIS OBISPO" if regexm(County, "MORRO BAY")
replace County="SISKIYOU" if regexm(County, "MOUNT SHASTA")
replace County="SANTA CLARA" if regexm(County, "MOUNTAIN VIEW")
replace County="RIVERSIDE" if regexm(County, "MURRIETA")
replace County="NAPA" if regexm(County, "NAPA")
replace County="SAN DIEGO" if regexm(County, "NATIONAL CITY")
replace County="SAN BERNARDINO" if regexm(County, "NEEDLES")
replace County="NEVADA" if regexm(County, "NEVADA CITY")
replace County="ALAMEDA" if regexm(County, "NEWARK")
replace County="STANISLAUS" if regexm(County, "NEWMAN")
replace County="ORANGE" if regexm(County, "NEWPORT BEACH")
replace County="RIVERSIDE" if regexm(County, "NORCO")
replace County="LOS ANGELES" if regexm(County, "NORWALK")
replace County="MARIN" if regexm(County, "NOVATO")
replace County="STANISLAUS" if regexm(County, "OAKDALE")
replace County="ALAMEDA" if regexm(County, "OAKLAND")
replace County="CONTRA COSTA" if regexm(County, "OAKLEY")
replace County="SAN DIEGO" if regexm(County, "OCEANSIDE")
replace County="VENTURA" if regexm(County, "OJAI")
replace County="SAN BERNARDINO" if regexm(County, "ONTARIO")
replace County="ORANGE" if regexm(County, "ORANGE")
replace County="FRESNO" if regexm(County, "ORANGE COVE")
replace County="CONTRA COSTA" if regexm(County, "ORINDA")
replace County="GLENN" if regexm(County, "ORLAND")
replace County="BUTTE" if regexm(County, "OROVILLE")
replace County="VENTURA" if regexm(County, "OXNARD")
replace County="MONTEREY" if regexm(County, "PACIFIC GROVE")
replace County="SAN MATEO" if regexm(County, "PACIFICA")
replace County="RIVERSIDE" if regexm(County, "PALM DESERT")
replace County="RIVERSIDE" if regexm(County, "PALM SPRINGS")
replace County="LOS ANGELES" if regexm(County, "PALMDALE")
replace County="SANTA CLARA" if regexm(County, "PALO ALTO")
replace County="LOS ANGELES" if regexm(County, "PALOS VERDES ESTATES")
replace County="BUTTE" if regexm(County, "PARADISE")
replace County="LOS ANGELES" if regexm(County, "PARAMOUNT")
replace County="FRESNO" if regexm(County, "PARLIER")
replace County="LOS ANGELES" if regexm(County, "PASADENA")
replace County="SAN LUIS OBISPO" if regexm(County, "PASO ROBLES")
replace County="STANISLAUS" if regexm(County, "PATTERSON")
replace County="RIVERSIDE" if regexm(County, "PERRIS")
replace County="SONOMA" if regexm(County, "PETALUMA")
replace County="LOS ANGELES" if regexm(County, "PICO RIVERA")
replace County="ALAMEDA" if regexm(County, "PIEDMONT")
replace County="CONTRA COSTA" if regexm(County, "PINOLE")
replace County="SAN LUIS OBISPO" if regexm(County, "PISMO BEACH")
replace County="CONTRA COSTA" if regexm(County, "PITTSBURG")
replace County="ORANGE" if regexm(County, "PLACENTIA")
replace County="EL DORADO" if regexm(County, "PLACERVILLE")
replace County="CONTRA COSTA" if regexm(County, "PLEASANT HILL")
replace County="ALAMEDA" if regexm(County, "PLEASANTON")
replace County="AMADOR" if regexm(County, "PLYMOUTH")
replace County="MENDOCINO" if regexm(County, "POINT ARENA")
replace County="LOS ANGELES" if regexm(County, "POMONA")
replace County="VENTURA" if regexm(County, "PORT HUENEME")
replace County="TULARE" if regexm(County, "PORTERVILLE")
replace County="PLUMAS" if regexm(County, "PORTOLA")
replace County="SAN MATEO" if regexm(County, "PORTOLA VALLEY")
replace County="SAN DIEGO" if regexm(County, "POWAY")
replace County="SACRAMENTO" if regexm(County, "RANCHO CORDOVA")
replace County="SAN BERNARDINO" if regexm(County, "RANCHO CUCAMONGA")
replace County="RIVERSIDE" if regexm(County, "RANCHO MIRAGE")
replace County="LOS ANGELES" if regexm(County, "RANCHO PALOS VERDES")
replace County="ORANGE" if regexm(County, "RANCHO SANTA MARGARITA")
replace County="TEHAMA" if regexm(County, "RED BLUFF")
replace County="SHASTA" if regexm(County, "REDDING")
replace County="SAN BERNARDINO" if regexm(County, "REDLANDS")
replace County="LOS ANGELES" if regexm(County, "REDONDO BEACH")
replace County="SAN MATEO" if regexm(County, "REDWOOD")
replace County="FRESNO" if regexm(County, "REEDLEY")
replace County="SAN BERNARDINO" if regexm(County, "RIALTO")
replace County="CONTRA COSTA" if regexm(County, "RICHMOND")
replace County="KERN" if regexm(County, "RIDGECREST")
replace County="HUMBOLDT" if regexm(County, "RIO DELL")
replace County="SOLANO" if regexm(County, "RIO VISTA")
replace County="SAN JOAQUIN" if regexm(County, "RIPON")
replace County="STANISLAUS" if regexm(County, "RIVERBANK")
replace County="RIVERSIDE" if regexm(County, "RIVERSIDE")
replace County="PLACER" if regexm(County, "ROCKLIN")
replace County="SONOMA" if regexm(County, "ROHNERT PARK")
replace County="LOS ANGELES" if regexm(County, "ROLLING HILLS")
replace County="LOS ANGELES" if regexm(County, "ROLLING HILLS ESTATES")
replace County="LOS ANGELES" if regexm(County, "ROSEMEAD")
replace County="PLACER" if regexm(County, "ROSEVILLE")
replace County="MARIN" if regexm(County, "ROSS")
replace County="SACRAMENTO" if regexm(County, "SACRAMENTOCAPITAL CITY")
replace County="NAPA" if regexm(County, "ST. HELENA")
replace County="MONTEREY" if regexm(County, "SALINAS")
replace County="MARIN" if regexm(County, "SAN ANSELM(O)?")
replace County="SAN BERNARDINO" if regexm(County, "SAN BERNARDINO")
replace County="SAN MATEO" if regexm(County, "SAN BRUNO")
replace County="SAN MATEO" if regexm(County, "SAN CARLOS")
replace County="ORANGE" if regexm(County, "SAN CLEMENTE")
replace County="SAN DIEGO" if regexm(County, "SAN DIEGO")
replace County="LOS ANGELES" if regexm(County, "SAN DIMAS")
replace County="LOS ANGELES" if regexm(County, "SAN FERNANDO")
replace County="SAN FRANCISCO" if regexm(County, "SAN FRANCISCO")
replace County="LOS ANGELES" if regexm(County, "SAN GABRIEL")
replace County="RIVERSIDE" if regexm(County, "SAN JACINTO")
replace County="FRESNO" if regexm(County, "SAN JOAQUIN") & County!="SAN JOAQUIN"
replace County="SANTA CLARA" if regexm(County, "SAN JOSE")
replace County="SAN BENITO" if regexm(County, "SAN JUAN BAUTISTA")
replace County="ORANGE" if regexm(County, "SAN JUAN CAPISTRANO")
replace County="ALAMEDA" if regexm(County, "SAN LEANDRO")
replace County="SAN LUIS OBISPO" if regexm(County, "SAN LUIS OBISPO")
replace County="SAN DIEGO" if regexm(County, "SAN MARCOS")
replace County="LOS ANGELES" if regexm(County, "SAN MARINO")
replace County="SAN MATEO" if regexm(County, "SAN MATEO")
replace County="CONTRA COSTA" if regexm(County, "SAN PABLO")
replace County="MARIN" if regexm(County, "SAN RAFAEL")
replace County="CONTRA COSTA" if regexm(County, "SAN RAMON")
replace County="MONTEREY" if regexm(County, "SAND CITY")
replace County="FRESNO" if regexm(County, "SANGER")
replace County="ORANGE" if regexm(County, "SANTA ANA")
replace County="SANTA BARBARA" if regexm(County, "SANTA BARBARA")
replace County="SANTA CLARA" if regexm(County, "SANTA CLARA")
replace County="LOS ANGELES" if regexm(County, "SANTA CLARITA")
replace County="SANTA CRUZ" if regexm(County, "SANTA CRUZ")
replace County="LOS ANGELES" if regexm(County, "SANTA FE SPRINGS")
replace County="SANTA BARBARA" if regexm(County, "SANTA MARIA")
replace County="LOS ANGELES" if regexm(County, "SANTA MONICA")
replace County="VENTURA" if regexm(County, "SANTA PAULA")
replace County="SONOMA" if regexm(County, "SANTA ROSA")
replace County="SAN DIEGO" if regexm(County, "SANTEE")
replace County="SANTA CLARA" if regexm(County, "SARATOGA")
replace County="MARIN" if regexm(County, "SAUSALITO")
replace County="SANTA CRUZ" if regexm(County, "SCOTTS VALLEY")
replace County="ORANGE" if regexm(County, "SEAL BEACH")
replace County="MONTEREY" if regexm(County, "SEASIDE")
replace County="SONOMA" if regexm(County, "SEBASTOPOL")
replace County="FRESNO" if regexm(County, "SELMA")
replace County="KERN" if regexm(County, "SHAFTER")
replace County="SHASTA" if regexm(County, "SHASTA LAKE")
replace County="LOS ANGELES" if regexm(County, "SIERRA MADRE")
replace County="LOS ANGELES" if regexm(County, "SIGNAL HILL")
replace County="VENTURA" if regexm(County, "SIMI VALLEY")
replace County="SAN DIEGO" if regexm(County, "SOL(A)?(O)?NA BEACH")
replace County="MONTEREY" if regexm(County, "SOLEDAD")
replace County="SANTA BARBARA" if regexm(County, "SOLVANG")
replace County="SONOMA" if regexm(County, "SONOMA")
replace County="TUOLUMNE" if regexm(County, "SONORA")
replace County="LOS ANGELES" if regexm(County, "SOUTH EL MONTE")
replace County="LOS ANGELES" if regexm(County, "SOUTH GATE")
replace County="EL DORADO" if regexm(County, "SOUTH LAKE TAHOE")
replace County="LOS ANGELES" if regexm(County, "SOUTH PASADENA")
replace County="SAN MATEO" if regexm(County, "SOUTH SAN FRANCISCO")
replace County="ORANGE" if regexm(County, "STANTON")
replace County="SAN JOAQUIN" if regexm(County, "STOCKTON")
replace County="SOLANO" if regexm(County, "SUISUN CITY")
replace County="SANTA CLARA" if regexm(County, "SUNNYVALE")
replace County="LASSEN" if regexm(County, "SUSANVILLE")
replace County="AMADOR" if regexm(County, "SUTTER CREEK")
replace County="KERN" if regexm(County, "TAFT")
replace County="KERN" if regexm(County, "TEHACHAPI")
replace County="TEHAMA" if regexm(County, "TEHAMA")
replace County="RIVERSIDE" if regexm(County, "TEMECULA")
replace County="LOS ANGELES" if regexm(County, "TEMPLE CITY")
replace County="VENTURA" if regexm(County, "THOUSAND OAKS")
replace County="MARIN" if regexm(County, "TIBURON")
replace County="LOS ANGELES" if regexm(County, "TORRANCE")
replace County="SAN JOAQUIN" if regexm(County, "TRACY")
replace County="HUMBOLDT" if regexm(County, "TRINIDAD")
replace County="NEVADA" if regexm(County, "TRUCKEE")
replace County="TULARE" if regexm(County, "TULARE")
replace County="SISKIYOU" if regexm(County, "TULELAKE")
replace County="STANISLAUS" if regexm(County, "TURLOCK")
replace County="ORANGE" if regexm(County, "TUSTIN")
replace County="SAN BERNARDINO" if regexm(County, "TWENTYNINE PALMS")
replace County="MENDOCINO" if regexm(County, "UKIAH")
replace County="ALAMEDA" if regexm(County, "UNION CITY")
replace County="SAN BERNARDINO" if regexm(County, "UPLAND")
replace County="SOLANO" if regexm(County, "VACAVILLE")
replace County="SOLANO" if regexm(County, "VALLEJO")
replace County="VENTURA" if regexm(County, "VENTURA")
replace County="LOS ANGELES" if regexm(County, "VERNON")
replace County="SAN BERNARDINO" if regexm(County, "VICTORVILLE")
replace County="ORANGE" if regexm(County, "VILLA PARK")
replace County="TULARE" if regexm(County, "VISALIA")
replace County="SAN DIEGO" if regexm(County, "VISTA")
replace County="LOS ANGELES" if regexm(County, "WALNUT")
replace County="CONTRA COSTA" if regexm(County, "WALNUT CREEK")
replace County="KERN" if regexm(County, "WASCO")
replace County="STANISLAUS" if regexm(County, "WATERFORD")
replace County="SANTA CRUZ" if regexm(County, "WATSONVILLE")
replace County="SISKIYOU" if regexm(County, "WEED")
replace County="LOS ANGELES" if regexm(County, "WEST COVINA")
replace County="LOS ANGELES" if regexm(County, "WEST HOLLYWOOD")
replace County="YOLO" if regexm(County, "WEST SACRAMENTO")
replace County="LOS ANGELES" if regexm(County, "WESTLAKE VILLAGE")
replace County="ORANGE" if regexm(County, "WESTMINSTER")
replace County="IMPERIAL" if regexm(County, "WESTMORLAND")
replace County="YUBA" if regexm(County, "WHEATLAND")
replace County="LOS ANGELES" if regexm(County, "WHITTIER")
replace County="RIVERSIDE" if regexm(County, "WILDOMAR")
replace County="COLUSA" if regexm(County, "WILLIAMS")
replace County="MENDOCINO" if regexm(County, "WILLITS")
replace County="GLENN" if regexm(County, "WILLOWS")
replace County="SONOMA" if regexm(County, "WINDSOR")
replace County="YOLO" if regexm(County, "WINTERS")
replace County="TULARE" if regexm(County, "WOODLAKE")
replace County="YOLO" if regexm(County, "WOODLAND")
replace County="SAN MATEO" if regexm(County, "WOODSIDE")
replace County="ORANGE" if regexm(County, "YORBA LINDA")
replace County="NAPA" if regexm(County, "YOUNTVILLE")
replace County="SISKIYOU" if regexm(County, "YREKA")
replace County="SUTTER" if regexm(County, "YUBA CITY")
replace County="SAN BERNARDINO" if regexm(County, "YUCAIPA")
replace County="SAN BERNARDINO" if regexm(County, "YUCCA VALLEY")

//Identifying Remaining Counties by ZIP Code

drop if County=="UNIVSERAL" & ZIP==90001 //This observation is a mess. Universal City and ZIP 90001 are in Los Angeles (although the ZIP code for Universal City is not 90001!). But the listed Utility is PG&E. The RRF was cancelled anyways so no important data are lost by dropping this observaiton.

replace County=string(ZIP) if County=="USA" | County=="US" | County=="UNKNOWN" | County=="UNITED STATES" | County=="UNDO" | County=="NA" | regexm(County, "CALIFORNIA") | County=="CA" | regexm(County, "^[0-9]")

replace County="LOS ANGELES" if County=="90277"
replace County="LOS ANGELES" if County=="90303"
replace County="LOS ANGELES" if County=="90505"
replace County="LOS ANGELES" if County=="90805"
replace County="LOS ANGELES" if County=="90670"
replace County="LOS ANGELES" if County=="91301"
replace County="LOS ANGELES" if County=="91384"
replace County="LOS ANGELES" if County=="91384"
replace County="LOS ANGELES" if County=="91789"
replace County="LOS ANGELES" if County=="93552"
replace County="ORANGE" if County=="90620"
replace County="ORANGE" if County=="90623"
replace County="LOS ANGELES" if County=="90640"
replace County="LOS ANGELES" if County=="91355"
replace County="VENTURA" if County=="91320"
replace County="VENTURA" if County=="91360"
replace County="LOS ANGELES" if County=="91387"
replace County="LOS ANGELES" if County=="91401"
replace County="LOS ANGELES" if County=="91605"
replace County="LOS ANGELES" if County=="91711"
replace County="SAN DIEGO" if County=="91915"
replace County="SAN DIEGO" if County=="92008"
replace County="SAN DIEGO" if County=="92014"
replace County="SAN DIEGO" if County=="92024"
replace County="SAN DIEGO" if County=="92027"
replace County="SAN DIEGO" if County=="92028"
replace County="SAN DIEGO" if County=="92029"
replace County="SAN DIEGO" if County=="92064"
replace County="SAN DIEGO" if County=="92082"
replace County="SAN DIEGO" if County=="92083"
replace County="SAN DIEGO" if County=="92084"
replace County="SAN DIEGO" if County=="92101"
replace County="SAN DIEGO" if County=="92108"
replace County="SAN DIEGO" if County=="92109"
replace County="SAN DIEGO" if County=="92115"
replace County="SAN DIEGO" if County=="92120"
replace County="SAN DIEGO" if County=="92121"
replace County="SAN DIEGO" if County=="92126"
replace County="SAN DIEGO" if County=="92130"
replace County="SAN DIEGO" if County=="92131"
replace County="SAN DIEGO" if County=="92154"
replace County="RIVERSIDE" if County=="92201"
replace County="RIVERSIDE" if County=="92211"
replace County="RIVERSIDE" if County=="92220"
replace County="RIVERSIDE" if County=="92234"
replace County="RIVERSIDE" if County=="92260"
replace County="SAN BERNARDINO" if County=="92336"
replace County="SAN BERNARDINO" if County=="92407"
replace County="SAN BERNARDINO" if County=="92377"
replace County="SAN BERNARDINO" if County=="92376"
replace County="RIVERSIDE" if County=="92508"
replace County="RIVERSIDE" if County=="92583"
replace County="RIVERSIDE" if County=="92883"
replace County="RIVERSIDE" if County=="92570"
replace County="RIVERSIDE" if County=="92592"
replace County="ORANGE" if County=="92647"
replace County="ORANGE" if County=="92677"
replace County="ORANGE" if County=="92782"
replace County="ORANGE" if County=="92823"
replace County="ORANGE" if County=="92868"
replace County="ORANGE" if County=="92870"
replace County="ORANGE" if County=="92675"
replace County="RIVERSIDE" if County=="92882"
replace County="VENTURA" if County=="93001"
replace County="VENTURA" if County=="93010"
replace County="VENTURA" if County=="93021"
replace County="VENTURA" if County=="93023"
replace County="VENTURA" if County=="93036"
replace County="VENTURA" if County=="93065"
replace County="SANTA BARBARA" if County=="93105"
replace County="TULARE" if County=="93274"
replace County="SAN LUIS OBISPO" if County=="93401"
replace County="SAN LUIS OBISPO" if County=="93420"
replace County="LOS ANGELES" if County=="93510"
replace County="KERN" if County=="93561"
replace County="FRESNO" if County=="93704"
replace County="MONTEREY" if County=="93906"
replace County="MONTEREY" if County=="93908"
replace County="SAN MATEO" if County=="94010"
replace County="SAN MATEO" if County=="94062"
replace County="SAN FRANCISCO" if County=="94102"
replace County="SAN FRANCISCO" if County=="94105"
replace County="SAN FRANCISCO" if County=="94117"
replace County="SANTRA CLARA" if County=="95037"
replace County="SANTRA CLARA" if County=="95070"
replace County="CONTRA COSTA" if County=="94513"
replace County="CONTRA COSTA" if County=="94526"
replace County="ALAMEDA" if County=="94538"
replace County="CONTRA COSTA" if County=="94553"
replace County="CONTRA COSTA" if County=="94563"
replace County="NAPA" if County=="94574"
replace County="CONTRA COSTA" if County=="94583"
replace County="SOLANO" if County=="94585"
replace County="CONTRA COSTA" if County=="94596"
replace County="ALAMEDA" if County=="94611"
replace County="ALAMEDA" if County=="94710"
replace County="CONTRA COSTA" if County=="94801"
replace County="MARIN" if County=="94930"
replace County="SONOMA" if County=="94931"
replace County="SANTA CLARA" if County=="95008"
replace County="SANTA CRUZ" if County=="95010"
replace County="SANTA CRUZ" if County=="95065"
replace County="SANTA CRUZ" if County=="95062"
replace County="SANTA CRUZ" if County=="95060"
replace County="SANTA CRUZ" if County=="95073"
replace County="CALAVERAS" if County=="95248"
replace County="MARIPOSA" if County=="95318"
replace County="TUOLUMNE" if County=="95372"
replace County="TUOLUMNE" if County=="95379"
replace County="SONOMA" if County=="95401"
replace County="SONOMA" if County=="95403"
replace County="SONOMA" if County=="95404"
replace County="SONOMA" if County=="95409"
replace County="SONOMA" if County=="95442"
replace County="SONOMA" if County=="95472"
replace County="KERN" if County=="93305"
replace County="YOLO" if County=="95616"
replace County="EL DORADO" if County=="95623"
replace County="EL DORADO" if County=="95682"
replace County="AMADOR" if County=="95665"
replace County="EL DORADO" if County=="95667"
replace County="PLACER" if County=="95677"
replace County="PLACER" if County=="95631"
replace County="NEVADA" if County=="95945"
replace County="BUTTE" if County=="95969"
replace County="BUTTE" if County=="95973"


//These ones slipped through the cracks:
replace County="EL DORADO" if City=="El Dorado Hills"
replace County="LAKE" if City==" HIDDEN VALLEY LAKE"
replace County="FRESNO" if City=="FRESNO"
replace County="TUOLUMNE" if County=="TUOLOMNE"
replace County="LOS ANGELES" if County=="TARZANA"
replace County="LOS ANGELES" if County=="STEVENSON RANCH"
replace County="SAN MATEO" if County=="SM" & City=="San Bruno"

replace County="SAN BERNARDINO" if ZIP==92359
replace County="SAN BERNARDINO" if ZIP==92342
replace County="SAN BERNARDINO" if ZIP==91709
replace County="SANTA BARBARA" if ZIP==93110

replace County="SAN BERNARDINO" if County=="SAN BER"
replace County="SAN BERNARDINO" if County=="SAN B" & ZIP==92336

replace County="CONTRA COSTA" if ZIP==94572

replace County="RIVERSIDE" if City=="Corona"
replace County="RIVERSIDE" if ZIP==92223
replace County="RIVERSIDE" if ZIP==91752

replace County="CALAVERAS" if County=="RAIL ROAD FLAT"

replace County="BUTTE" if ZIP==95966
replace County="MADERA" if ZIP==93645
replace County="MADERA" if ZIP==93601

replace County="SAN MATEO" if ZIP==94025
replace County="MARIN" if ZIP==94947
replace County="HUMBOLDT" if ZIP==95524
replace County="LOS ANGELES" if ZIP==91344 
replace County="NAPA" if ZIP==94574
replace County="SONOMA" if County=="GEYSERVILLE"
replace County="SONOMA" if County=="KENWOOD"
replace County="SANTA CRUZ" if County=="FELTON"
replace County="SANTA CRUZ" if ZIP==95006
replace County="CONTRA COSTA" if ZIP==94549
replace County="TULARE" if County=="DUCOR"
replace County="RIVERSIDE" if City=="Jurupa Valley"
replace County="MARIPOSA" if County=="COULTERVILLE"
replace County="RIVERSIDE" if County=="COMAL COUNTY"

//Cross-Validating Counties Against Zip Code
//I found six observations with City equal to Fairfield, county equal to Sacramento, and utility equal to PG&E.
//These are patent data entry failures, as the city of Fairfield is in Solano County and is served by PG&E. (SMUD serves most of Sacramento county.)
//To check for more mistakes of this nature, I infer the county from the ZIP code for all observations and test whether they match.

save "data\CA_SGIP\SGIP_data_cleaned.dta", replace
clear

import excel "data\CA_SGIP\zip_city_county.xlsx", sheet("ZIP List") firstrow
drop City County Pop
rename CountyFORMATTED County_by_ZIP
label var County_by_ZIP "County identified by ZIP code"
save "data\CA_SGIP\ZIP_County_match.dta", replace
clear

use "data\CA_SGIP\SGIP_data_cleaned.dta"
merge m:1 ZIP using "data\CA_SGIP\ZIP_County_match.dta", keep(match master)

gen reliable_location=County==County_by_ZIP
label var reliable_location "=1 if County and ZIP match"

//Encoding Counties as Numeric Variables
encode County, generate(CountyCode)
label var County "County (string)"
label var CountyCode "County (numeric)"

//Cleaning Up
order CountyCode County_by_ZIP reliable_location, before(WestLALRA)
drop _merge

