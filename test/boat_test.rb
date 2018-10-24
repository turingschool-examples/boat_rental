require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/boat'

class BoatTest < Minitest::Test
  def test_that_it_exists
    kayak = Boat.new(:kayak, 20)

    assert_instance_of Boat, kayak
  end

  def test_that_it_is_a_type_of_boat
    kayak = Boat.new(:kayak, 20)

    assert_equal :kayak, kayak.type
  end

  def test_that_it_has_a_price_per_hour_cost
    kayak = Boat.new(:kayak, 20)

    assert_equal 20, kayak.price_per_hour
  end
end
