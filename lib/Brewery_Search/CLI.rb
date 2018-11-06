class BrewerySearch::CLI

  def call
    list_breweries
    info
    goodbye
  end

  def list_breweries
    puts "Breweries!"
    puts <<-DOC.gsub /^\s*/, ''
      1. 1623 Brewing CO, llc
      2. 7 Locks Brewing
      3. Antietam Brewery,LLC
    DOC
  end

  def info
    puts "Please enter the number for the brewery you would like more information about or type exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on brewery 1"
      when "2"
        puts "More info on brewery 2"
      when "3"
        puts "More info on brewery 3"
      end
    end
  end

  def goodbye
    puts "See you next time! Drink responsibly!"
  end

end
