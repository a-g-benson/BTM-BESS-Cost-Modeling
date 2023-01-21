use "data\portable_batteries\portable_batteries.dta"

tabstat W_ac Wh msrp, stat(min median max) columns(stats)

clear