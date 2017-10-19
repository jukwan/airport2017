
import requests
import pandas as pd
from dateutil import parser, rrule
from datetime import datetime, time, date
import time

url = "https://www.wunderground.com/history/airport/BOS/2015/1/1/DailyHistory.html?format"
    #url = "http://www.wunderground.com/{station}/{year}
    #     #full_url = url.format(station=station, day=day, month=month, year=year)

    #full_url = url.format(station=station, day=day, month=month, year=year)
    # Request data from wunderground data
response = requests.get(url, headers={'User-agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'})
data = response.text
data = data.replace('<br>', '')
print(data)