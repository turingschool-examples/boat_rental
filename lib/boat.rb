class Boat
  attr_reader :type

  def initialize(type, quantity)
    @type = type
    @quantity = quantity
  end
end


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
