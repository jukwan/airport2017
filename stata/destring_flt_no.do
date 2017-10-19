use data_BOS


local airports `" "PVD" "MHT" "ORH" "LAX" "LGB" "SNA" "BUR" "'
foreach v of local airports {
	 use data_`v'_arr
	 destring flt_no,replace
	 save data_`v'_arr,replace
	 
}



