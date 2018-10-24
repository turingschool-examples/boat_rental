require './lib/boat'
require 'minitest/autorun'
require 'minitest/pride'

class BoatTest < Minitest::Test
  def test_it_exists
    kayak = Boat.new(:kayak, 20)

    assert_instance_of Boat, kayak
  end

  def test_the_type_of_boat
    kayak = Boat.new(:kayak, 20)

    assert_equal :kayak, kayak.type
  end

  def test_price_per_hour
    kayak = Boat.new(:kayak, 20)

    assert_equal 20, kayak.price_per_hour
  end

  def test_hours_rented
    kayak = Boat.new(:kayak, 20)
    assert_equal 0, kayak.hours_rented(0)

    kayak.add_hour
    kayak.add_hour
    kayak.add_hour
    assert_equal 3, kayak.total_hours
  end

end
