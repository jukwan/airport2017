
# This is for web crawing for flight delay information.

# ctrl k c incert comment sign ctrl k u remove

# load libraries

import re
from bs4 import BeautifulSoup
import urllib.request

import urlilb
import mechanize

br = mechanize.Browser()
br.set_handle_robots(False)
br.addheaders= [('User-agent','chrome')]
term = "dl+1484 "
query= "https://www.google.com/search?q="+term+"&oq"+term"





url = "http://www.boston-airport.com/arrivals.php"

urli= urllib.request.urlopen(url)
print(urli)
soup = BeautifulSoup(urli.read(),'html.parser')
print(soup)

make_soup = soup.find_all("table", class_ ="tableListingTable")

print(make_soup)