require './lib/boat'
require 'minitest/autorun'
require 'minitest/pride'

class BoatTest < Minitest::Test
  def setup
    @boat = Boat.new(:kayak, 20)
  end

  def test_it_exists
    assert_instance_of Boat, @boat
  end

  def test_it_has_a_type
    assert_equal :kayak, @boat.type
  end

  def test_it_has_a_price_per_hour
    assert_equal 20, @boat.price_per_hour
  end

  def test_it_start_with_zero_for_hours_rented
    assert_equal 0, @boat.hours_rented
  end

  def test_it_can_add_hours_to_hours_rented
    assert_equal 0, @boat.hours_rented

    @boat.add_hour
    @boat.add_hour
    @boat.add_hour

    assert_equal 3, @boat.hours_rented
  end
end
