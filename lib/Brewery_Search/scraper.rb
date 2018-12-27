class BrewerySearch::Scraper

  def self.new_from_index_page(b)
    BrewerySearch::Brewery.new(
      b.css(".name").text, #name
      "https://untappd.com#{b.css("a").attribute("href").text}", #url
      b.css(".num").text.strip, #rating
      b.css(".ibu").text.strip, #num_rating
      b.css(".abv").text.strip #num_beers
      )
  end

  def get_page
    doc = Nokogiri::HTML(open("https://untappd.com/brewery/top_rated?country_id=86"))
  end

  def scrape_breweries
    get_page.css(".beer-item")
  end

  def create_brewery
    scrape_breweries.each do |brewery_url|
            BrewerySearch::Scraper.new_from_index_page(brewery_url)
    end
    BrewerySearch::Brewery.all
  end
end
