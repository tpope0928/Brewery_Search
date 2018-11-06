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
        puts @breweries[input.to_i-1]
      elsif input == "list"
        list_breweries
      elsif input == "exit"
        goodbye
      else
        puts "Are you drunk? Please type list or exit."
      end
    end
  end

  def goodbye
    puts "See you next time! Drink responsibly!"
  end
end
