require "minitest/autorun"
require "minitest/pride"
require "./lib/boat"

class BoatTest < Minitest::Test
  def test_it_exists
    boat = Boat.new(:kayak, 20)

    assert_instance_of Boat, boat
  end

  def test_it_has_a_type
    boat = Boat.new(:kayak, 20)

    assert_equal :kayak, boat.type
  end

  def test_it_has_hourly_cost
    boat = Boat.new(:kayak, 20)

    assert_equal 20, boat.price_per_hour
  end

  def test_its_hours_rented_starts_at_0
    boat = Boat.new(:kayak, 20)

    assert_equal 0, boat.hours_rented
  end

  def test_it_can_be_rented_by_the_hour
    boat = Boat.new(:kayak, 20)
    boat.add_hour

    assert_equal 1, boat.hours_rented

    boat.add_hour
    boat.add_hour

    assert_equal 3, boat.hours_rented
  end
end
