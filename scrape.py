import requests
from bs4 import BeautifulSoup

slc_url = 'http://www.visitsaltlake.com/restaurants/?sfilter=ALL&efilter=ALL&MAXSHOW=2070&DTNSORTBY=dtnRank%20asc,%20dtnRandomListingSort&SORTDIR=ASC&MAPEXPAND=false&SHOWMAP=true&TOTALRESULTS=2070&USEDTN=1&USERANKMULTI=1&RANKSORTBY=listingRankId%20asc&STARTROW=1&SORTBY=sortCompany&USEPRIMARYLISTING=1&USERANK=0&LIQUOR=2&GUESTROOMS=0&RECEPTION=0&BANQUET=0&MEETINGSPACE=0&HOLES=0&ITINERARYTHEMEID=0&LISTIDS=0&SUBCATID=0&LARGESTMEETING=0&CATID=665&THEATRE=0&MEETINGROOMS=0&PARKING=0&REGIONID=-1&fromMenu=577'
slc_res = requests.get(slc_url)
data = slc_res.text

soup = BeautifulSoup(data, "html.parser")

selector = "h4"

lst = soup.find_all(selector)

for name in lst:
  print name.get_text()
