class BrewerySearch::CLI

  def start
      BrewerySearch::Scraper.scrape_data
      puts "Welcome to the top 50 Breweries in the United States!"
      puts "Here is a list of the top rated breweries according to UnTapped:"
      BrewerySearch::Brewery.all.each do |brewery|
        brewery_details = [
          " Name:",
          " Rating:",
          "",
          "",
        ]
      puts "------------------------------------"
        brewery.instance_variables.each_with_index do |var, index|
          puts "#{brewery_details[index]} #{brewery.instance_variable_get(var)}"
        end
      puts "------------------------------------"
    end

  end
end

























#class BrewerySearch::CLI

  #def call
  #  start
  #  list_breweries
  #  more_info
  #end

#  def start
#    puts "Welcome to the top 50 Breweries in the United States!"
#    puts "Here is a list of the top rated breweries according to UnTapped:"
#  end

#  def list_breweries
#    @breweries = BrewerySearch::Brewery.all
#    @breweries.each.with_index(1) do |brewery, i|
#      puts "#{i}. #{brewery.name} "
#    end
#  end

#  def more_info

#  def quit
#    puts ""
#    puts " Have fun! Please drink responsibily!"
#  end
