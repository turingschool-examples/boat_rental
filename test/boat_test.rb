require "minitest/autorun"
require "minitest/pride"
require "./lib/boat"

class BoatTest < Minitest::Test
  def test_it_exists
    kayak = Boat.new(:kayak, 20)

    assert_instance_of Boat, kayak
  end
  def test_boat_has_a_type
    kayak = Boat.new(:kayak, 20)

    assert_equal :kayak, kayak.type
  end
  def test_boat_has_price_per_hour
      kayak = Boat.new(:kayak, 20)
      assert_equal 20, kayak.price_per_hour
  end
  def test_boat_can_store_rented_hours
    kayak = Boat.new(:kayak, 20)
    assert_equal 0, kayak.hours_rented
  end
  def test_it_can_add_hour
    kayak = Boat.new(:kayak, 20)
    assert_equal 1, kayak.add_hour
  end
end
