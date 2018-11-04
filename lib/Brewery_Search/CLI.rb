class Breweries::CLI

  def call
    Brewery:Scraper.new.make_brewery
    puts "Welcome to Brewery Finder!"
    start
  end
  
  def start
    puts ""
    puts "What state would you like a list of Breweries? Please put the states abbriviation."
    input = gets.upcase

    print_breweries(input)

    puts ""
    puts "What brewery would you like more information on? Please enter the brewery number."
    input = gets.strip.to_i

    brewery = Breweries::Brewery.find(input.to_i)

    print_breweries(brewery)

    puts ""
    puts "Would you like to see another brewery? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you! Have a great day!"
      exit
    else
      puts ""
      puts "I don't understand that answer."
      start
    end
  end

  def print_breweries(brewery)
      puts ""
      puts "----------- #{brewery.name} -----------"
      puts ""
      puts "Location:           #{brewery.location}"
      puts "Type:               #{brewery.type}"
      puts "Contact:            #{brewery.contact}"
      puts "Website:            #{brewery.website_url}"
      puts ""
    end
  
    def print_breweries(state)
      puts ""
      puts "---------- #{state} Breweries ----------"
      puts ""
      Breweries::Brewery.all[state-1, 10].each.with_index(state) do |brewery, index|
        puts "#{index}. #{brewery.name}"
      end
    end
  end