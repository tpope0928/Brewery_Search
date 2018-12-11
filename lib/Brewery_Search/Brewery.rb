class Brewery

  attr_accessor :name, :rating, :num_rating, :num_beers

  @@all = []

  def initialize(hash)
    hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end
end


class Scraper

  def self.scrape_data
    doc =
      Nokogiri::HTML(open("https://untappd.com/brewery/top_rated?country_id=86"))
      doc.css(".beer-item").each do |brewery|
          Brewery.new({
            name: brewery.css(".name").text,
            rating: brewery.css(".num").text.strip,
            num_rating: brewery.css(".ibu").text.strip,
            num_beers: brewery.css(".abv").text.strip,

          })
      end
    end
  end
