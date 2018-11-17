class BrewerySearch::Brewery

  attr_accessor :name, :address, :city_state, :phone, :url, :brewery_type

  def self.all
    #puts <<-DOC.gsub /^\s*/, ''
    #  1. 1623 Brewing CO, LLC
    #  2. 7 Locks Brewing
    #  3. Antietam Brewery,LLC
    #DOC
    self.scrape_breweries
  end

  def self.scrape_breweries
    breweries = []

    breweries << self.scrape_site

    breweries
  end

  def self.scrape_site

    doc = Nokogiri::HTML(open("https://www.brewersassociation.org/directories/breweries/"))

    brewery = self.new
    brewery.name = doc.search("#vcard simple brewery-info span.name").text.strip
    brewery.address = doc.search("#vcard simple brewery-info span.address").text.strip
    brewery.city_state = doc.search("#vcard simple brewery-info span.li").first
    brewery.phone = doc.search("#vcard simple brewery-info span.telephone")
    brewery.url = doc.search("#vcard simple brewery-info span.url").first
    brewery.brewery_type = doc.search("#vcard simple brewery-info span.brewery_type")

    brewery
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

    							
