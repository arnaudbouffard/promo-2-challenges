require_relative "order"
require_relative "customer"
require_relative "restaurant"
require_relative "customer"
require_relative "employee"

class Controller

  attr_accessor :restaurant

  def initialize(restaurant)
    @restaurant = restaurant
  end

########## Actions pour le manager
  def listor
    puts "\n -- List of orders --"
    @restaurant.retrieve_orders
  end

  def ass(a,b)
    @restaurant.orders[a.to_i-1].assigned_to = (b)
  end

  def listcu
    puts "\n -- List of customers --"
    @restaurant.retrieve_customers
  end

  def listemployee
    @restaurant.retrieve_employees
  end

  def cancel(number)
    @restaurant.cancel_order(number)
  end

  def exit
  end
#Actions pour le dboy

  def vieworder
  end

  def tick
  end

  def exit
  end


end
