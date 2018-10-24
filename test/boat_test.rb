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
  def test_hours_rented_starts_at_0
    assert_equal 0, @boat.hours_rented
  end
  def test_add_hour_adds_hour_to_hours_rented
    @boat.add_hour
    assert_equal 1, @boat.hours_rented
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
