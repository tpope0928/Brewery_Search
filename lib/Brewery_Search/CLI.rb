class BrewerySearch::CLI

  def call
    list_breweries
    info
    goodbye
  end

  def list_breweries
    puts "Breweries!"

    @breweries = BrewerySearch::Brewery.all
    @breweries.each.with_index(1) do |deal, i|
      puts "#{i}. #{@breweries}"
    end
  end

  def info
    puts "Please enter the number for the brewery you would like more information about, list to go back to list of breweries, or type exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        the_brewery = @breweries[input.to_i-1]
        puts "#{the_brewery.name} - #{the_brewery.address} - #{the_brewery.phone} - #{the_brewery.url} - #{the_brewery.brewery_type}"
      elsif input == "list"
        list_breweries
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "See you next time! Drink responsibly!"
  end
end
