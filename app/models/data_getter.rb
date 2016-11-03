require_relative './listing'
require_relative './user'
require_relative './booking'



class Data_getter

  def initialize
    @listings_arr = []
    @total_arr = []
  end

  def listings(your_listings)

    your_listings.each do |listing|
      @listings_arr << listing.name
      @listings_arr << listing.description
      @listings_arr << listing.price
      @listings_arr << listing.id

      listing.days.each do |day|
        @listings_arr << day.date.strftime('%d %b %Y')
      end
      @total_arr << @listings_arr
    end

  end

  def return_listings(your_listings)
    listings(your_listings)
    @total_arr
  end

end
