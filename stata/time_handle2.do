
clear
import excel "F:\Dropbox\Flight\Data\air_BOS_PVD.xlsx", sheet("air_BOS_PVD") firstrow clear
drop if airport == "PVD"
gen year = year(date)
gen month = month(date)
gen day = day(date)
gen hour = hh(time)
gen min = mm(time)
gen sec = ss(time)


tostring year, replace
tostring month, replace
tostring day,replace
tostring hour, replace


gen temp = ((time[_n+1])+time)/2


gen id = _n


keep time temp id
save "F:\Dropbox\Flight\Data\time_bos.dta", replace




