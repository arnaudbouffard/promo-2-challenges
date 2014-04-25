require_relative 'controller'

class UI

  TASKSMANAGER = {
    listor:  "     - List all orders [listor]",
    add:     "     - Add a new orders [add]",
    ass:     "     - Assign orders [ass]",
    listcu:  "     - List all customers [listcu]",
    cancel:  "     - Cancel an order [cancel]",
    logout:  "     - Logout [logout]",
    exit:    "     - Exit [exit]"
  }

  TASKSDBOY = {
    vieworder:  "     - List my orders [vieworder]",
    tick:       "     - Tick an order [tick]",
    logout:     "     - Logout [logout]",
    exit:       "     - Exit [exit]"
  }



  def initialize(controller)
    @controller = controller
    @restaurant = controller.restaurant
    @running = true
  end

  def listor
    @controller.listor
  end

  def listcu
    @controller.listcu
  end

  def cancel
    listor
    puts "\n --Enter number of order you want to cancel --"
    @controller.cancel(user_input.to_i-1)
  end

  def listemployee
    @controller.listemployee
  end

  def ass
    listor
    puts "\n -- Enter number of order you want to assign --"
    a = user_input

    puts "\n Given"
    listemployee
    puts "\n-- Enter id of D_boy you want to task: --"
    b = user_input.to_i
    @controller.ass(a, @controller.restaurant.employees[b-1])

    puts "Order number #{a} has been tasked to poor #{@controller.restaurant.employees[b-1].name}"

  end

  def add
    puts "Is it a new customer? (y/n)"
    if user_input == "y"
      Order.new(@restaurant, create_customer)
      puts " \n -- order successfully added"
    else
      puts "Given"

      listcu

      puts "What is customer_id?"
      current_customer = @restaurant.customers[user_input.to_i-1]
      Order.new(@restaurant, current_customer)
      puts "\n -- #{current_customer.name}'s order has been added--"
    end

    def logout

    end

    def exit
      @running = false
    end

  end

  def create_customer
    puts "\n --What is customer name? --"
    new_customer_name = user_input.downcase
    puts "\n --What is customer adress? --"
    new_customer_address = user_input
    new_customer = Customer.new(@controller.restaurant ,new_customer_name, new_customer_address)
    puts "\n -- customer details saved in system --"
    new_customer

  end

######################### D_boy tasks

def tick
  listor
  puts "\n -- Enter number of order you did deliver --"
  c = user_input
  @controller.cancel(c.to_i-1)
  puts "\n -- Order #{c} has been taken out of your list --"
end

def vieworder
  listor
end

def user_input
  user_answer = gets.chomp
end

def display
  puts "-- Welcome to Alf 9000 --"

 #   until @current_user
 #     authenticate
 #   end

  print "\n"

  while @running
      employee = authenticate
      unless employee.is_a? NilClass
        display_tasks(employee)
        dispatch(user_input)
      end

    print "\n"
  end
  @running = false
end

def display_tasks(employee)
  puts "\n-- What do you want to do? -- \n"
  if employee.is_a? Manager
    puts TASKSMANAGER.values
  elsif employee.is_a? D_boy
    puts TASKSDBOY.values
  else
    "-- Not allowed --\n"
  end
end

def dispatch(task)
  self.send(task.to_sym)
end

def authenticate

  puts "\n -- What's your name? --"
  name_input = user_input

  puts "\n -- What's your password? --"
  pwd_input = user_input

#   employee = @restaurant.employees.find { |employee| employee.name == name_input }

#   if employee
#     employee.password == pwd_input ? #....
#   end

#    employee.is_a? Manager
#
#    @current_user = user
if @restaurant.employees.find {|employee| employee.name.downcase == name_input.downcase}
  if @restaurant.employees.find {|employee| employee.name.downcase == name_input.downcase}.password == pwd_input
    @restaurant.employees.find {|employee| employee if employee.name.downcase == name_input.downcase}
  else
    puts "Wrong password"
  end
else
  puts "No user with this name"
end
end

end


#############################################################################

#chez_claudie = Restaurant.new("Chez Claudie", "3 rue de l'échaudée")
#brandon = Manager.new("Brandon", "1234")
#momo = D_boy.new("Momo","0000")
#chez_claudie.employees << brandon << momo
#vincent = Customer.new("Vincent", "64 rue du jeu")
#quick_please = Order.new(chez_claudie, vincent)
#brandon.assign_order(quick_please, momo)
#
#alf = UI.new(chez_claudie)
#
#alf.display







#ruby restaurant.rb
#> Welcome to CORBA SALONU
#> -------------------------------
#> Please enter your username:
#> john_doe
#> Please enter your password:
#> ********
#> -------------------------------
#> Welcome, john_doe.  Your access level is : MANAGER
#> -------------------------------
#> What would you like to do?
#> Options:
#> 1. List customers
#> 2. Add customer
#> 3. View orders <customer_id>
#> 4. Add order <customer_id>, <employee_id_>
#> 5. Remove order <order_id>
#> 6. List employees
#> 7. Log out#