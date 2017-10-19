/////////data append_all
clear
set more off
cd "F:\Dropbox\Flight\Data"
use data_BOS,clear
local airports `" "PVD" "MHT" "ORH" "LAX" "LGB" "SNA" "BUR" "'
foreach v of local airports {
	append using data_`v',force
	append using data_`v'_arr,force
	
}
append using data_BOS_arr,force

drop if _merge ==2 
save airports.dta,replace

	
