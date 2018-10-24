require 'minitest/autorun'
require 'lib/boat'

class BoatTest < Minitest::Test
  def setup
    @boat = Boat.new
  end
  def test_it_exists
    assert_instance_of Boat, @boat
  end
end


#
# ```ruby
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
