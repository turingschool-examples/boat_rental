require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'

class BoatTest < Minitest::Test
  def setup
    @kayak = Boat.new(:kayak, 20)
  end

  def test_it_exists
    assert_instance_of Boat, @kayak
  end

  def test_it_inits_with_type_and_price_per_hour
    assert_equal :kayak, @kayak.type
    assert_equal 20, @kayak.price_per_hour
  end

  def test_hours_rented_inits_to_zero
    assert_equal 0, @kayak.hours_rented
  end

  def test_add_hour_increases_hours_rented_by_one
    @kayak.add_hour
    @kayak.add_hour
    @kayak.add_hour

    assert_equal 3, @kayak.hours_rented
  end
end
