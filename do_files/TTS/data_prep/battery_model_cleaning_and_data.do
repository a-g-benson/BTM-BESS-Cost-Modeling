replace battery_model="No Battery" if has_battery==0
replace battery_model="Unknown" if has_battery==1 & battery_model=="-1"

replace battery_manufacturer="No battery" if has_battery==0

replace battery_model="Eco 10" if battery_model=="ECO 10"
replace battery_model="Eco 10" if battery_model=="ECO10 [10 kWh]"
replace battery_model="Eco 20" if battery_model=="eco 20"

replace battery_model="Enchage 10" if battery_model=="ENCHARGE-10T-1P-NA"

replace battery_manufacturer="No Battery" if has_battery==0
replace battery_manufacturer="Tesla Inc." if battery_model=="Powerwall 2.0"
replace battery_manufacturer="Unknown" if has_battery==1 & battery_manufacturer=="-1"

gen DC_coupled=0 if battery_manufacturer=="Tesla Inc." | battery_manufacturer=="Enphase Energy Inc." | battery_manufacturer=="Sonnen Inc." | battery_manufacturer=="NeoVolta Inc."

replace DC_coupled=1 if battery_manufacturer=="LG Energy Solution, Ltd." | battery_manufacturer=="Generac Power Systems" | battery_manufacturer=="Pika Energy"

replace DC_coupled=0 if has_battery==0

order DC_coupled, after(battery_model)