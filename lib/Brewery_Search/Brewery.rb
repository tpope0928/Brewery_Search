class BrewerySearch::Brewery

  attr_accessor :name, :rating, :num_rating, :num_beers, :url

  @@all = []

  def self.new_from_index_page(b)
    self.new(
      b.css(".name").text,
      "https://untappd.com/brewery/top_rated?country_id=86#{b.css("a").attribute("href").text}",
      b.css(".num").text.strip,

      )
  end

  def initialize(name=nil, url=nil, rating=nil)
    @name = name
    @url = url
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def num_rating
    @num_rating ||= doc.css(".ibu").text.strip
  end

  def num_beers
    @num_beers ||= doc.css(".abv").text.strip
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
