# airport delay 

## Ver 1. OAG Data
      OAG + Weather
      2014.10 - 2015.3
 
## Ver 2. Extended Data
   
   ### weather data:
   https://www.ncdc.noaa.gov/orders/qclcd/
      (1996~ current)
   ### on time data:

   https://www.transtats.bts.gov/Tables.asp?DB_ID=120&DB_Name=Airline%20On-Time%20Performance%20Data&DB_Short_Name=On-Time
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
      Identification methods
     1.	Pooled OLS / Logit
     2.	Fixed effect model
                   Airport/day
     3.	DDD
      a.	Treated effect of snowfall on northern part airports
      b.	Control group southern part airport
      c.	Event window: before : fall after: winter/ Snowfall \
      d.	Treatment 1: snowfall or not by day
      e.	Treatment 2: snowfall precipitation >0 by hour

       Extension.
      4.	Matching
      a.	With similar airports 

      
      5.    Baysian approach for estimation.
      Time based supervised learning.
      




