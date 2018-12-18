class BrewerySearch::CLI

  def call
    BrewerySearch::Scraper.new.create_brewery
    run
  end

  def run
    print_brewery_list

    puts "Enter the number of the brewery you would like to get " \
    "more information on, or type 'exit' to quit."

    input = gets.strip  ##INPUT

    # Invalid input handling
    while !(input == 'exit' || input.to_i >= 1 && input.to_i <= 50)
        puts "Input was invalid. Please try again."
        input = gets.strip
    end

    if input != "exit"
        brewery = BrewerySearch::Brewery.find(input.to_i)

        print_brewery_detail(brewery)

        puts "Type 'back' to return to brewery list, or 'exit' to quit."

        input_2 = gets.strip  ##INPUT

            # Invalid input handling
            while !(input_2 == 'exit' || input_2 == 'back')
                puts "Input was invalid. Please try again."
                input_2 = gets.strip
            end

            if input_2 == "back"
                run
            end
        end
    end

    def print_brewery_list
        puts ""
        puts "------ Untappd Top 50 US Breweries ------"
        puts ""

        BrewerySearch::Brewery.all.each_with_index do |brewery, i|
            puts "#{i+1}.  #{brewery.name}, #{brewery.rating}"
        end

        puts ""
    end

    def print_brewery_detail(brewery)
        puts ""
        print "--------"
        print " #{brewery.name}"
        puts ""
        puts ""
        puts "Rating: #{brewery.rating}"
        puts "Number of Ratings: #{brewery.num_rating}"
        puts "Number of Beers: #{brewery.num_beers}"
        puts "Untappd URL: #{brewery.url}"
    end
end
