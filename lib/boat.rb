class Boat
  attr_reader :type, :price_per_hour

  def initialize(type, price_per_hour)
    @type = type
    @price_per_hour = price_per_hour
  end
end


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
