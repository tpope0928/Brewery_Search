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

    brewery = self.new
    brewery.name = doc.css("div.beer-item p.name").text.strip
    #brewery.location = doc.css("div.brewery").text.strip
    #brewery.type = doc.css("p.style")
    brewery.num_beers = doc.css("div.beer-item p.abv").text.strip
    brewery.rating = doc.css("div.beer-item p.rating span[num]").text.strip
    brewery.num_rating = doc.css("div.beer-item p[ibu]").text.strip
    #brewery.website = doc.search("a.url tip track-click")
    #brewery.description = doc.css("div.beer-descrption-read-less")

    brewery
  end
end
