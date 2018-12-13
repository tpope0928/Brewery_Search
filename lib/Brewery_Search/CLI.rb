class BrewerySearch::CLI

  SIMPLE_DETAILS = [
    " Name:",
    " Rating:",
  ]

  MORE_DETAILS = [
    " Name:",
    " Rating:",
    "", #num_rating
    "", #num_beers
  ]


  def start
      BrewerySearch::Scraper.scrape_data
      @breweries = BrewerySearch::Brewery.all
      puts "Welcome to the top 50 Breweries in the United States!"
      puts "Here is a list of the top rated breweries according to UnTapped:"
      list_breweries
    end
  end

def list_breweries
    BrewerySearch::Brewery.all.each do |brewery|
      brewery_details = [
    " Name:",
    " Rating:",
    "", #num_rating
    "", #num_beers
    ]

    puts " "
    puts "-----------------------------------------"
    brewery.instance_variables.each_with_index do |var, index|
        puts "#{brewery_details[index]} #{brewery.instance_variable_get(var)}"
      end
    end
    puts " "
    puts "-----------------------------------------"
  end
