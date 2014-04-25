require_relative 'ui'
require_relative 'controller'

restaurant_controller = Controller.new(Restaurant.new("Chez Claudie", "3 rue de l'échaudée"))

bob = Manager.new("Bob", "1")
momo = D_boy.new("Momo","0")
restaurant_controller.restaurant.employees << bob << momo
vincent = Customer.new(restaurant_controller.restaurant, "Vincent", "64 rue du jeu")
quick_please = Order.new(restaurant_controller.restaurant, vincent)
bob.assign_order(quick_please, momo)

restaurant_ui = UI.new(restaurant_controller)

restaurant_ui.display