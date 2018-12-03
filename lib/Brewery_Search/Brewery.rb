class BrewerySearch::Brewery

  attr_accessor :name, :location, :type, :num_beers, :rating, :num_rating :website, :description

  @@all = []

  def self.all
    self.scrape_breweries
  end

  def scrape_site
    breweries = []

    breweries < self.scrape_untappd

    breweries
  end

end


    #brewery_1 = self.new
    #brewery_1.name = "1623 Brewing CO, LLC"
    #brewery_1.address = "1146 colonel Joshua Ct"
    #brewery_1.city_state = "Westminister, MD 21157"
    #brewery_1.phone = "unavailible"
    #brewery_1.url = "unavailible"
    #brewery_1.brewery_type = "Contract"#

    #brewery_2 = self.new
    #brewery_2.name = "7 Locks Brewing"
    #brewery_2.address = "12227 Wilkins Ave"
    #brewery_2.city_state = "Rockville, MD 20852-1833"
    #brewery_2.phone = "(301) 841-7123"
    #brewery_2.url = "www.7locksbrewing.com"
    #brewery_2.brewery_type = "Micro"

    #brewery_3 = self.new
    #brewery_3.name = "Antietam Brewery,LLC"
    #brewery_3.address = "140 Western Maryland Pkwy Unit G"
    #brewery_3.city_state = "Hagerstown, MD 21740-5197"
    #brewery_3.phone = "(301) 791-5915"
    #brewery_3.url = "www.antietambrewery.com"
    #brewery_3.brewery_type = "Micro"

    #[brewery_1, brewery_2, brewery_3]
