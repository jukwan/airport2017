clear
set more off

//////////// single airport code example ///////////


import excel "F:\Dropbox\Flight\Data\8_airports.xlsx", sheet("8 airports") firstrow clear


keep if dep_airport_code == "LAX"
gen year = year(scheduled_departure_date)
gen month = month(scheduled_departure_date)
gen day = day(scheduled_departure_date)
gen hour = hh(scheduled_departure_time)
gen min = mm(scheduled_departure_time)
gen sec = ss(scheduled_departure_time)

gen new_dep_time = mdyhms(month, day, year, hour, min, sec)
format new_dep_time %tc


append using "F:\Dropbox\Flight\Data\time_LAX.dta" 

gen event = max(new_dep_time , time)
sort event


format event %tc
format time_mid %tc


gen new_id = id
gen time_mid_id = id
replace time_mid = time_mid[_n-1] if missing(id)
replace time_mid_id = time_mid_id[_n-1] if missing(id)
replace new_id = time_mid_id if new_id==. & new_dep_time < time_mid
replace new_id = time_mid_id+1 if new_id==. & new_dep_time>= time_mid
replace new_id =1 if new_id ==.

keep if id==.
drop id
rename  new_id id

merge m:1 id using "F:\Dropbox\Flight\Data\weather_LAX.dta"

save "F:\Dropbox\Flight\Data\data_LAX.dta",replace
	