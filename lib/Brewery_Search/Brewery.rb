class Brewery

  attr_accessor :name, :rating, :num_rating, :num_beers

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
        Brewery.new({
          name: brewery.css(".name").text,
          num_beers: brewery.css(".abv").text.strip,
          rating: brewery.css(".num").text
          num_rating: brewery.css(".ibu").text.strip
          })

        binding.pry
      end

    end
  end
