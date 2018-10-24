require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/boat'

class BoatTest < Minitest::Test

  def test_boat_exists
    kayak = Boat.new(:kayak, 20)
    assert_instance_of Boat, kayak
  end

  def test_boat_has_type
    boat_1 = Boat.new(:kayak, 20)
    assert_equal :kayak, boat_1.type
  end

  def test_boat_has_pph
    boat_1 = Boat.new(:kayak, 20)
    assert_equal 20, boat_1.price_per_hour
  end

  def test_hours_rented_starts_at_0
    boat_1 = Boat.new(:kayak, 20)
    assert_equal 0, boat_1.hours_rented
  end

  def test_hours_can_be_added
    boat_1 = Boat.new(:kayak, 20)
    boat_1.add_hour
    boat_1.add_hour
    boat_1.add_hour
    assert_equal 3, boat_1.hours_rented
  end


end
