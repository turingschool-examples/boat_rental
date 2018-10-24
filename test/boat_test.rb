require 'minitest/autorun'
require './lib/boat'

class BoatTest < Minitest::Test
  def setup
    @boat = Boat.new(:kayak, 20)
  end
  def test_it_exists
    assert_instance_of Boat, @boat
  end
  def test_it_can_be_initialized_with_type_and_price_per_hour
    assert_equal :kayak, @boat.type
    assert_equal 20, @boat.price_per_hour
  end
end



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
