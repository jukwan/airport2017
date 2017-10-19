rm(list = ls())
setwd('F:/Dropbox/Flight/Data')

library(readxl)
library(dplyr)
X8_airports <- read_excel("8_airports.xlsx")
View(X8_airports)


BOS <- filter(X8_airports, X8_airports$dep_airport_code == "BOS" | X8_airports$arr_airport_code == "BOS")
View(BOS)

sdt <-factor(BOS$scheduled_departure_time)
sd_time <- strftime(sdt, "%H:%M:%S")
BOS$scheduled_departure_time= data.frame(sd_time)

sdt <-factor(BOS$scheduled_arrival_time)
sd_time <- strftime(sdt, "%H:%M:%S")
BOS$scheduled_arrival_time= data.frame(sd_time)

sdt <-factor(BOS$actual_arrival_time)
sd_time <- strftime(sdt, "%H:%M:%S")
BOS$actual_arrival_time= data.frame(sd_time)

sdt <-factor(BOS$actual_departure_time)
sd_time <- strftime(sdt, "%H:%M:%S")
BOS$actual_departure_time= data.frame(sd_time)

weather= read.csv("air_BOS_PVD.csv")

air_bos = filter(weather, weather$airport=="KBOS")
View(air_bos)

BOS$time = as.POSIXct(paste(BOS$scheduled_departure_date,BOS$scheduled_departure_time), format="%Y-%m-%d %H:%M:%S")