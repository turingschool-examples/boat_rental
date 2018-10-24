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
end
