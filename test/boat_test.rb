require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/boat'

class BoatTest < Minitest::Test
  def test_it_exists
    boat = Boat.new(:kayak, 20)
    assert_instance_of Boat, boat
  end

  def test_it_can_return_type
    kayak = Boat.new(:kayak, 20)
    assert_equal :kayak, kayak.type
  end

  def test_it_can_return_price_per_hour
    kayak = Boat.new(:kayak, 20)
    assert_equal 20, kayak.price_per_hour
  end

  def test_it_can_return_hours_rented
    kayak = Boat.new(:kayak, 20)
    assert_equal 0, kayak.hours_rented
    kayak.add_hour
    assert_equal 1, kayak.hours_rented
    kayak.add_hour
    assert_equal 2, kayak.hours_rented
  end

  def test_it_returns_hours_rented_when_rented
    kayak = Boat.new(:kayak, 20)
    assert_equal 0, kayak.hours_rented
    return_1 = kayak.add_hour
    assert_equal 1, return_1
    return_2 = kayak.add_hour
    assert_equal 2, return_2
  end



end
