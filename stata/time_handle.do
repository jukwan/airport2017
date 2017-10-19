
clear

import excel "F:\Dropbox\Flight\Data\8_airports.xlsx", sheet("8 airports") firstrow

gen year = year(scheduled_departure_date)
gen month = month(scheduled_departure_date)
gen day = day(scheduled_departure_date)
gen hour = hh(scheduled_departure_time)
gen min = mm(scheduled_departure_time)
gen sec = ss(scheduled_departure_time)

gen new_dep_time = mdyhms(month, day, year, hour, min, sec)
format new_dep_time %tc

keep if dep_airport_code == "BOS" 

append using "F:\Dropbox\Flight\Data\time_bos'.dta" 

gen event = max(new_dep_time , time)
sort event

format event %tc
format time_mid %tc

sort event
gen new_id = id
gen time_mid_id = id
replace time_mid = time_mid[_n-1] if missing(id)
replace time_mid_id = time_mid_id[_n-1] if missing(id)
replace new_id = time_mid_id if new_id==. & new_dep_time < time_mid
replace new_id = time_mid_id+1 if new_id==. & new_dep_time>= time_mid

keep if id==.

drop id
rename  new_id id

//gen time = hms(hour, min, sec)
//format time  %tc

merge m:1 id using "F:\Dropbox\Flight\Data\weather_bos.dta"

/*
gen date = mdy(month,day,year)
format date  %td


gen year_1 = year(scheduled_arrival_date)
gen month_1 = month(scheduled_arrival_date)
gen day_1 = day(scheduled_arrival_date)
gen hour_1 = hh(scheduled_arrival_time)
gen min_1 = mm(scheduled_arrival_time)
gen sec_1 = ss(scheduled_arrival_time)
gen new_date_1 = mdyhms(month_1, day_1, year_1, hour_1, min_1, sec_1)
format new_date_1 %tc

*/
end
