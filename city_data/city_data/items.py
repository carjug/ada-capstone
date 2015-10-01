import scrapy


class CityDataItem(scrapy.Item):
    place = scrapy.Field()
    city = scrapy.Field()
    desc = scrapy.Field()
    pass
