import scrapy
from city_data.items import CityDataItem

class SlcSpider(scrapy.Spider):
    name = "slc"
    allowed_domains = ["visitsaltlake.com/"]
    start_urls = [
        "http://www.visitsaltlake.com/things-to-do/attractions/?listsearch_submit=1&listingGetAll=0&subcatID=1790&regionID=0&listing_keyword=Keywords...&submit=#searchBr"
    ]

    def parse(self, response):
        places = response.xpath('//h4/a/text()').extract()
        for place in places:
            item = CityDataItem()
            item['place'] = place.strip().encode('utf-8')
            item['city'] = "Salt Lake City"
            yield item


