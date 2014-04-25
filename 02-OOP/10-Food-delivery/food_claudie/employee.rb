require_relative 'order'
require_relative 'customer'
require_relative 'restaurant'

class Employee

  attr_reader :name, :password, :d_boy

  def initialize (name, password)
    @name = name
    @password = password
  end

  def access_interface(input)
    input == @password
  end
end

class Manager < Employee
  def assign_order(order, d_boy)
    d_boy.orders << order
    order.assigned_to = d_boy
    #@restaurant.list_order.select {|order| order if order.id_order == order_id}.d_boy = d_boy
  end
end

class D_boy < Employee
attr_accessor :orders
    def initialize(name, password)
      super(name, password)
      @orders = []
    end
end

#chez_claudie = Restaurant.new("Chez Claudie", "3 rue de l'échaudée")
#brandon = Manager.new("Brandon", "1234")
#momo = D_boy.new("Momo","0000")
#chez_claudie.list_employees << brandon << momo
#vincent = Customer.new("Vincent", "64 rue du jeu")
#quick_please = Order.new(chez_claudie, vincent)
#brandon.assign_order(quick_please, momo)


#p brandon
#puts "\n"
#p vincent
#puts "\n"
#p quick_please
#puts "\n"
#p momo
#puts "\n"
#p chez_claudie
#puts "\n"
#chez_claudie.cancel_order(0)
#
#p chez_claudie