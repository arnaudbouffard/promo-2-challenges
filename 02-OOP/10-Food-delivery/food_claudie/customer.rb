require_relative 'restaurant'

class Customer

  attr_reader :name, :address, :id_customer

  def initialize(restaurant, name, address)
    @name = name
    @address = address
    restaurant.add_customer(self)
  end

end

