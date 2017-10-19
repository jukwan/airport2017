rm(list = ls())
setwd('E:/research2016/projects/HeatedRunway')

library(data.table)
library(bitops)
library(httr)
library(XML)
library(RCurl)
library(rJava)
library(xlsxjars)
library(xlsx)
library(bitops)
library(RCurl)
library(httr)
library(weatherData)

air <- read.csv("Airports.csv")
for(i in 2:69) {
  weather <- getWeatherForDate(air$airport[i], "2014-10-01", end_date="2015-04-01",opt_detailed=T,
                                         opt_all_columns = T)
  write.csv(weather, file= file.path( paste0('air',i,'.csv'))
            )
}

