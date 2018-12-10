class Brewery

  attr_accessor :name, :num_beers, :rating, :num_rating

  @all = []

  def initialize
    @all << self
  end
end


class Scraper

  def self.scrape_data
    doc =
      Nokogiri::HTML(open("https://untappd.com/brewery/top_rated?country_id=86"))
      doc.css(".beer-item").each do |brewery|
        binding.pry
      end

    end
  end
