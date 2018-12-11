class BrewerySearch::Brewery

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
