require_relative "order"
require_relative "customer"

class Restaurant

  attr_reader :name, :adress, :menu, :orders
  attr_accessor :customers, :employees

  MENU = {main: "salade caesar"}

  def initialize(name, address)
    @name = name
    @address = address
    @employees = []
    @customers = []
    @orders = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def add_order(order)
    @orders << order
  end

  def cancel_order(number)
    unless @orders[number].assigned_to == "unassigned"
      @employees.each do |d_boy|
        d_boy.orders.delete_if {|order| order == @orders[number]} unless d_boy.class == Manager
      end
    end
    @orders.delete_at(number)
  end

  def retrieve_orders
    @orders.each_with_index { |order, index| puts "#{index + 1} - #{order.customer.name} --> #{order.assigned_to.name unless order.assigned_to == "unassigned"}"}
  end

  def retrieve_dboys_orders(employee)
    @orders.each_with_index { |order, index| puts "#{index + 1} - #{order.customer.name} --> #{order.assigned_to.name == employee.name ? order.assigned_to.name : "not yours!"}"}
  end



  def retrieve_customers
    @customers.each_with_index { |customer, index| puts "#{index + 1} - #{customer.name}, #{customer.address}"}
  end

  def retrieve_employees
    @employees.each_with_index { |employee, index| puts "#{index + 1} - #{employee.name}, #{employee.class}"}
  end

end

#chez_claudie = Restaurant.new("Chez Claudie", "3 rue de l'échaudée")
#john = Manager.new("John","labiteadudule", "Chez Claudie")
#thomas = Customer.new("Thomas", "Rue du petit Musc")
#
#chez_claudie.employees << john
#chez_claudie.customers << thomas
#p chez_claudie


