class BrewerySearch::Brewery

  attr_accessor :name, :location, :type, :num_beers, :rating, :num_rating, :website, :description

  def self.all
    self.scrape_breweries
  end

  def scrape_breweries
    breweries = []

    breweries < self.scrape_untappd

    breweries
  end

  def scrape_untappd
    doc = Nokogiri::HTML(open("https://untappd.com/brewery/top_rated?country_id=86"))

    breweries = self.new
    breweries.name = doc.css("div.name h1").text.strip
    breweries.location = doc.search("button.buy-button").text.gsub("Buy it.", "").strip
    breweries.type = "https://meh.com"
    breweries.num_beers =
    breweries.rating =
    breweries.num_rating =
    breweries.website =
    breweries.description =

    breweries
  end
end
