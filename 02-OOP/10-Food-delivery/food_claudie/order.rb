require_relative 'restaurant'

class Order

  attr_reader :customer
  attr_accessor :assigned_to

  def initialize(restaurant, customer)
    @customer = customer
    @assigned_to = "unassigned"
    restaurant.add_order(self)
  end

end
