import scrapy
from city_data.items import CityDataItem

class SlcSpider(scrapy.Spider):
    name = "slc"
    allowed_domains = ["visitsaltlake.com/"]
    start_urls = [
        "http://www.visitsaltlake.com/restaurants/nightlife/microbreweries-distilleries/?sfilter=ALL&efilter=ALL&MAXSHOW=50&DTNSORTBY=dtnRank%%20asc,%%20dtnRandomListingSort&SORTDIR=ASC&MAPEXPAND=false&SHOWMAP=true&TOTALRESULTS=12&USEDTN=1&USERANKMULTI=1&RANKSORTBY=listingRankId%%20asc&STARTROW=1&SORTBY=sortCompany&USEPRIMARYLISTING=1&USERANK=0&LIQUOR=2&GUESTROOMS=0&RECEPTION=0&BANQUET=0&MEETINGSPACE=0&HOLES=0&ITINERARYTHEMEID=0&LISTIDS=0&SUBCATID=2279&LARGESTMEETING=0&CATID=602&THEATRE=0&MEETINGROOMS=0&PARKING=0&REGIONID=-1&fromMenu=3516"
    ]

    def parse(self, response):
        places = response.xpath('//h4/a/text()').extract()
        for place in places:
            item = CityDataItem()
            item['place'] = place.strip().encode('utf-8')
            item['city'] = "Salt Lake City"
            yield item


