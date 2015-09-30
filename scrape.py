import csv
import requests
from bs4 import BeautifulSoup

slc_url = 'http://www.visitsaltlake.com/restaurants/dining/?sfilter=ALL&efilter=ALL&MAXSHOW=116&DTNSORTBY=dtnRank%20asc,%20dtnRandomListingSort&SORTDIR=ASC&MAPEXPAND=0&SHOWMAP=true&TOTALRESULTS=257&USEDTN=1&USERANKMULTI=1&RANKSORTBY=listingRankId%20asc&STARTROW=1&SORTBY=sortCompany&USEPRIMARYLISTING=1&USERANK=0&LIQUOR=2&GUESTROOMS=0&RECEPTION=0&BANQUET=0&MEETINGSPACE=0&HOLES=0&ITINERARYTHEMEID=0&LISTIDS=0&SUBCATID=0&LARGESTMEETING=0&CATID=601&THEATRE=0&MEETINGROOMS=0&PARKING=0&REGIONID=110&fromMenu=578'
slc_res = requests.get(slc_url)
data = slc_res.text

soup = BeautifulSoup(data, "html.parser")

selector = "h4"

lst = soup.find_all(selector)

list_of_restaurants = []
count = 0

for name in lst:
  name = name.get_text().strip()
  if count > 7:
    list_of_restaurants.append(name.encode('utf-8'))
  count += 1

print list_of_restaurants

# outfile = open("./slc_restaurants.csv", "wb")
# writer = csv.writer(outfile)
# writer.writerow(["rest_name"])
# writer.writerows(list_of_restaurants)

