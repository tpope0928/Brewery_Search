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
      menu
    end
  end

  def list_breweries
    @breweries.each do |brewery|
      puts " "
      puts "----------------------------------------"
      print_details(brewery, 50, SIMPLE_DETAILS)
      puts " "
      puts "----------------------------------------"
    end
  end

  def print_details(brewery, number, details)
    brewery.instance_variables.each_with_index do |var, index|
      if index < number
        puts "#{details[index]} #{brewery.instance_variable_get(var)}"
      end
    end
  end

  def menu
    puts "Would you like more information?"
    puts "Please put the number for the brewery you would like more information on:"
    input = gets.strip_to_i
    if input == 0 || input > 50 || input == nil
      menu
    end
    print_details(@books[input], 50, MORE_DETAILS)
    menu
  end
