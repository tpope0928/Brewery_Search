class BrewerySearch::Brewery

  attr_accessor :name, :location, :type, :num_beers, :rating, :num_rating, :website, :description

  def self.all
    self.scrape_breweries
  end

  def self.scrape_breweries
    breweries = []

    breweries << self.scrape_untappd

    breweries
  end

  def self.scrape_untappd
    doc = Nokogiri::HTML(open("https://untappd.com/brewery/top_rated?country_id=86"))

    breweries = self.new
    breweries.name = doc.css("div.beer-details a").text.strip
    breweries.location = doc.css("div.brewery").text.strip
    breweries.type = doc.css("p.style")
    breweries.num_beers = doc.css("p.abv").text.strip
    breweries.rating = doc.css("p.rating span[num]")
    breweries.num_rating = doc.css("div.details brewery p[ibu]")
    breweries.website = doc.search("a.url tip track-click")
    breweries.description = doc.css("div.beer-descrption-read-less")

    breweries
  end
end
