require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'

class BoatTest < MiniTest::Test

  def test_boat_exists
    kayak = Boat.new(:kayak, 20)

    assert_instance_of Boat, kayak
  end

  def test_it_can_give_type
    kayak = Boat.new(:kayak, 20)

    assert_equal :kayak, kayak.type
  end

  def test_it_can_giv_pph
    kayak = Boat.new(:kayak, 20)

    assert_equal 20, kayak.price_per_hour
  end
end
