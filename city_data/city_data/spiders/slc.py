import scrapy
from city_data.items import CityDataItem

class SlcSpider(scrapy.Spider):
    name = "slc"
    allowed_domains = ["visitsaltlake.com/"]
    start_urls = [
    ]

    def parse(self, response):
        places = response.xpath('//h4/a/text()').extract()
        for place in places:
            item = CityDataItem()
            item['place'] = place.strip().encode('utf-8')
            item['city'] = "Salt Lake City"
            yield item


