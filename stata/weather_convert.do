
clear

local airports `" "BOS" "PVD" "MHT" "ORH" "BUR" "LAX" "SNA" "LGB" "' 
foreach airport of local airports {
	import excel "F:\Dropbox\Flight\Data\air_`airport'.xlsx", sheet("air_`airport'") firstrow clear
	
	gen id = _n

	save "F:\Dropbox\Flight\Data\weather_`airport'.dta", replace

	gen time_mid = ((time[_n+1])+time)/2

	keep time time_mid id
	save "F:\Dropbox\Flight\Data\time_`airport'.dta", replace
}
