import scrapy
from city_data.items import CityDataItem

class SlcSpider(scrapy.Spider):
    name = "slc"
    allowed_domains = ["visitsaltlake.com/"]
    start_urls = [
        "http://www.visitsaltlake.com/things-to-do/outdoor-recreation/?sfilter=A&efilter=F&MAXSHOW=50&DTNSORTBY=dtnRank%%20asc,%%20dtnRandomListingSort&SORTDIR=ASC&MAPEXPAND=0&SHOWMAP=true&TOTALRESULTS=268&USEDTN=1&USERANKMULTI=1&RANKSORTBY=listingRankId%%20asc&STARTROW=1&SORTBY=sortCompany&USEPRIMARYLISTING=1&USERANK=0&LIQUOR=2&GUESTROOMS=0&RECEPTION=0&BANQUET=0&MEETINGSPACE=0&HOLES=0&ITINERARYTHEMEID=0&LISTIDS=0&SUBCATID=0&LARGESTMEETING=0&CATID=600&THEATRE=0&MEETINGROOMS=0&PARKING=0&REGIONID=-1&fromMenu=650",
        "http://www.visitsaltlake.com/things-to-do/outdoor-recreation/?sfilter=G&efilter=L&MAXSHOW=50&DTNSORTBY=dtnRank%%20asc,%%20dtnRandomListingSort&SORTDIR=ASC&MAPEXPAND=0&SHOWMAP=true&TOTALRESULTS=78&USEDTN=1&USERANKMULTI=1&RANKSORTBY=listingRankId%%20asc&STARTROW=1&SORTBY=sortCompany&USEPRIMARYLISTING=1&USERANK=0&LIQUOR=2&GUESTROOMS=0&RECEPTION=0&BANQUET=0&MEETINGSPACE=0&HOLES=0&ITINERARYTHEMEID=0&LISTIDS=0&SUBCATID=0&LARGESTMEETING=0&CATID=600&THEATRE=0&MEETINGROOMS=0&PARKING=0&REGIONID=-1&fromMenu=650",
        "http://www.visitsaltlake.com/things-to-do/outdoor-recreation/?sfilter=M&efilter=R&MAXSHOW=50&DTNSORTBY=dtnRank%%20asc,%%20dtnRandomListingSort&SORTDIR=ASC&MAPEXPAND=0&SHOWMAP=true&TOTALRESULTS=44&USEDTN=1&USERANKMULTI=1&RANKSORTBY=listingRankId%%20asc&STARTROW=1&SORTBY=sortCompany&USEPRIMARYLISTING=1&USERANK=0&LIQUOR=2&GUESTROOMS=0&RECEPTION=0&BANQUET=0&MEETINGSPACE=0&HOLES=0&ITINERARYTHEMEID=0&LISTIDS=0&SUBCATID=0&LARGESTMEETING=0&CATID=600&THEATRE=0&MEETINGROOMS=0&PARKING=0&REGIONID=-1&fromMenu=650",
        "http://www.visitsaltlake.com/things-to-do/outdoor-recreation/?sfilter=S&efilter=Z&MAXSHOW=50&DTNSORTBY=dtnRank%%20asc,%%20dtnRandomListingSort&SORTDIR=ASC&MAPEXPAND=0&SHOWMAP=true&TOTALRESULTS=52&USEDTN=1&USERANKMULTI=1&RANKSORTBY=listingRankId%%20asc&STARTROW=1&SORTBY=sortCompany&USEPRIMARYLISTING=1&USERANK=0&LIQUOR=2&GUESTROOMS=0&RECEPTION=0&BANQUET=0&MEETINGSPACE=0&HOLES=0&ITINERARYTHEMEID=0&LISTIDS=0&SUBCATID=0&LARGESTMEETING=0&CATID=600&THEATRE=0&MEETINGROOMS=0&PARKING=0&REGIONID=-1&fromMenu=650"
    ]

    def parse(self, response):
        places = response.xpath('//h4/a/text()').extract()
        for place in places:
            item = CityDataItem()
            item['place'] = place.strip().encode('utf-8')
            item['city'] = "Salt Lake City"
            yield item


