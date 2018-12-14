class BrewerySearch::Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://untappd.com/brewery/top_rated?country_id=86"))
  end

  def scrape_breweries
    get_page.css(".beer-item")
  end

  def create_brewery
    scrape_breweries.each do |brewery_url|
            BrewerySearch::Brewery.new_from_url(brewery_url)
    end
    BrewerySearch::Brewery.all
  end
end
