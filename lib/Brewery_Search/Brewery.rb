class BrewerySearch::Brewery

  attr_accessor :name, :rating, :num_rating, :num_beers, :url

  @@all = []

  def self.new_from_index_page(b)
    self.new(
      b.css(".name").text, #name
      "https://untappd.com#{b.css("a").attribute("href").text}", #url
      b.css(".num").text.strip, #rating
      b.css(".ibu").text.strip, #num_rating
      b.css(".abv").text.strip #num_beers
      )
  end

  def initialize(name=nil, url=nil, rating=nil, num_rating=nil, num_beers=nil)
    @name = name
    @url = url
    @rating = rating
    @num_rating = num_rating
    @num_beers = num_beers
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
