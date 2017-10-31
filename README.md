# airport delay 

## Ver 1. OAG Data
      OAG + Weather
      2014.10 - 2015.3
 
## Ver 2. Extended Data
   
   ### weather data:
   https://www.ncdc.noaa.gov/orders/qclcd/
      (1996~ current)
   ### on time data:
   https://www.transtats.bts.gov/DL_SelectFields.asp
      (1998 ~ current)
  
### 2.1 Data Prepare 
   #### new_ontime.py
      merge ontimedata {2014.4 -2015.3}
      current : 8 airport
### 2.2 Navigate the data
   #### airports_analysis.ipynb
      simple descriptive information by airport, month, day.
### 2.3 Describe on the map
     ![alt text](https://github.com/jukwan/airport2017/blob/master/delay1.ex.png)
 
### 2.4 Predicting delay by snow
      Pooled OLS, Fixed effect.
      Baysian approach for estimation.
      




