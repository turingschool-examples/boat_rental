class Boat
  def initialize(boat_type, quantity)
    @boat_type = boat_type
    @quantity = quantity 
  end
end

#
# pry(main)> require './lib/boat'
# #=> true
#
# pry(main)> kayak = Boat.new(:kayak, 20)
# #=> #<Boat:0x00007fceac8f0480...>
#
# pry(main)> kayak.type
# #=> :kayak
#
# pry(main)> kayak.price_per_hour
# #=> 20
#
# pry(main)> kayak.hours_rented
# #=> 0
#
# pry(main)> kayak.add_hour
# #=> 1
#
# pry(main)> kayak.add_hour
# #=> 2
#
# pry(main)> kayak.add_hour
# #=> 3
#
# pry(main)> kayak.hours_rented
# #=> 3
# ```
