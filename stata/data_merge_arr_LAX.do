////////// data_merge for the arrived flights ///////

clear
set more off



import excel "F:\Dropbox\Flight\Data\8_airports_arr.xlsx", sheet("8 airports arr") firstrow clear

keep if arr_airport_code == "LAX"
	
gen year = year(scheduled_arrival_date)
gen month = month(scheduled_arrival_date)
gen day = day(scheduled_arrival_date)
gen hour = hh(scheduled_arrival_time)
gen min = mm(scheduled_arrival_time)
gen sec = ss(scheduled_arrival_time)

gen new_arr_time = mdyhms(month, day, year, hour, min, sec)
format new_arr_time %tc

append using "F:\Dropbox\Flight\Data\time_LAX.dta" 

gen event = max(new_arr_time , time)
sort event

format event %tc
format time_mid %tc

sort event
gen new_id = id
gen time_mid_id = id
replace time_mid = time_mid[_n-1] if missing(id)
replace time_mid_id = time_mid_id[_n-1] if missing(id)
replace new_id = time_mid_id if new_id==. & new_arr_time < time_mid
replace new_id = time_mid_id+1 if new_id==. & new_arr_time>= time_mid
replace new_id =1 if new_id ==.
keep if id==.

drop id
rename  new_id id

merge m:1 id using "F:\Dropbox\Flight\Data\weather_LAX.dta"

save "F:\Dropbox\Flight\Data\data_LAX_arr.dta",replace

