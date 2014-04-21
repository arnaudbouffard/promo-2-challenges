# blabla
class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :average_rating, :city

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @ratings = []
    @average_rating = 0
    @name = name
  end

  # TODO: implement #filter_by_city and #rate methods
  def self.filter_by_city(restaurants, queried_city)
    restaurants.select { |restaurant| restaurant.city == queried_city }
  end

  def rate(rating)
    @ratings << rating
    @average_rating = @ratings.reduce(:+) / @ratings.length
  end
end
