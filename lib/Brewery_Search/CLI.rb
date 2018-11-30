class BrewerySearch::CLI

  def call
    start
    list_breweries
  end

  def start
    puts "Welcome to the top 50 Breweries in the United States!"
    puts "Here is a list of the top rated breweries according to UnTapped:"
  end

  def list_breweries
    @breweries = BrewerySearch::Brewery.all
    @breweries.each.with_index(1) do |brewery, i|
      puts "#{i}. #{deal.name} - #{deal.rating} - #{deal.num_beers}"
    end
  end
    

end