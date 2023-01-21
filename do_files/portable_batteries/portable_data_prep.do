import excel "data\portable_batteries\portable_batteries.xlsx", sheet("Sheet1") firstrow

rename WAC W_ac
label var W_ac "Watts (Continuous AC Power Output)"

label var Wh "Watt-hours (Nameplate Energy)"

rename OriginalRetailPrice msrp
label var msrp "Manufacturer's Suggested Retail Price"

label var ACOutput "=1 if this product is capable of AC output"

rename CycleLife80 CycleLife
label var CycleLife "Manufacturer's Warranted # of Cycles Before Degredation Falls Below 80% Capacity"

encode Chemistry, gen(Chemistry2)
drop Chemistry
rename Chemistry2 Chemistry
label var Chemistry "Battery Chemistry"

label var Source "Weblink to Product on Manufacturer's Website"
label var DateCollected "Date on which AGB Collected Price and Tech. Specs."
format DateCollected %tdNN-DD-CCYY

foreach var of varlist W_ac Wh msrp CycleLife{
	gen ihs_`var'=asinh(`var')
	label var ihs_`var' "Inverse Hyperbolic Sine of `var'"
	gen ln_`var'=ln(`var')
	label var ln_`var' "Natural Logarithm of `var'"
}

order Manufacturer Model Chemistry ACOutput CycleLife ln_CycleLife ihs_CycleLife msrp W_ac Wh ln_msrp ln_W_ac ln_Wh ihs_msrp ihs_W_ac ihs_Wh Chemistry DateCollected Source

save "data\portable_batteries\portable_batteries.dta", replace
clear