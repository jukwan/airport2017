rm(list = ls())
setwd('F:/Dropbox/Flight/Data')

library(data.table)

library(httr)

library(rwunderground)

aa = "f436a200496d963b"

air <- read.csv("Airports_2.csv")
set_api_key(key="f436a200496d963b")
data_list = list()


for (i in 6:6){
  weather <- history_range(set_location(airport_code=air$airport[i]), "20141001","20150331")
  weather$airport <- air$airport[i]
  data_list[[i]] <- weather
}
big_data = do.call(rbind,data_list)

write.csv(big_data, file= file.path(paste0('air_SNA.csv')))
