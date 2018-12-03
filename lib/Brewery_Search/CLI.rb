class BrewerySearch::CLI

  def call
    start
    list_breweries
    more_info
  end

  def start
    puts "Welcome to the top 50 Breweries in the United States!"
    puts "Here is a list of the top rated breweries according to UnTapped:"
  end

  def list_breweries
    @breweries = BrewerySearch::Brewery.all
    @breweries.each.with_index(1) do |brewery, i|
      puts "#{i}. #{brewery.name} - #{brewery.rating} - #{brewery.num_beers}"
    end
  end

  def more_info
    input = nil
    puts ""
    puts "What restaurant would you like more information on?"
    input = gets.strip.downcase

    if input.to_i > 0
        the_brewery = @breweries[input.to_i-1]
        puts "#{brewery.name} - #{brewery.rating} - #{brewery.num_rating} - #{brewery.num_beers} - #{brewery.type}"
        puts ""
        puts "#{brewery.description}"
        puts ""
        puts "#{brewery.location} - #{brewery.phone} - #{brewery.website}"
      elsif input == "list"
        list_breweries
      elsif input == "exit"
        quit
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def quit
    puts ""
    puts " Have fun! Please drink responsibily!"
  end
