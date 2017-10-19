import bs4 as bs
import urllib.request
import re
import numpy as np
import pandas as pd
# sauce = urllib.request.urlopen('https://pythonprogramming.net/parsememcparseface/').read()

sauce = urllib.request.urlopen("https://www.carfax.com/VehicleHistory/p/Report.cfx?vin=5NPDH4AE6CH112790&partner=COO_0").read()
soup = bs.BeautifulSoup(sauce,'lxml')
meat = soup.body
print(soup)
 

