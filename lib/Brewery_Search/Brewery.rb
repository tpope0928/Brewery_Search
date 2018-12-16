class BrewerySearch::Brewery

    attr_accessor :name, :rating, :num_rating, :num_beers, :url

    @@all = []

    def initialize(name=nil, rating=nil, url=nil)
        @name = name
        @rating = rating
        @url = url
        @@all << self
    end

    def self.new_from_url(brewery_url)
          self.new(
              brewery_url.css(".name").text, #name
              brewery_url.css(".num").text.strip, #rating

          )
    end

    def num_rating
      doc.css(".ibu").text.strip
    end

    def num_beers
      doc.css(".abv").text.strip
    end

    def url
      doc.css("div.beer-item a").text
    end

    def doc
      Nokogiri::HTML(open(self.url))
    end

    def self.find_by_num_beers(search_num_beers)
        all.each do |brewery|
            if brewery.num_beers == search_num_beers
                return brewery
            end
        end
    end

    def self.all
      @@all
    end
end
