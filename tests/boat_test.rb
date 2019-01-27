require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'

class BoatTest < Minitest::Test

  def setup
    @kayak = Boat.new(:kayak, 20)
  end

  def test_boat_has_a_type
    assert_equal :kayak, @kayak.type
  end

  def test_boat_has_price_per_hour
    assert_equal 20, @kayak.price_per_hour
  end

  def test_hours_rented_works
    assert_equal 0, @kayak.hours_rented
    @kayak.add_hour
    @kayak.add_hour
    @kayak.add_hour
    assert_equal 3, @kayak.hours_rented
  end

end
