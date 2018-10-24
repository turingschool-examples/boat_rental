require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require 'pry'

class BoatTest < Minitest::Test
  def test_it_exists
    kayak = Boat.new(:kayak, 20)
    assert_instance_of Boat, kayak
  end

  def test_it_has_a_type
    kayak = Boat.new(:kayak, 20)
    assert_equal :kayak, kayak.type
  end

  def test_it_has_a_price_per_hr
    kayak = Boat.new(:kayak, 20)
    assert_equal 20, kayak.price_per_hr
  end

  def test_it_has_zero_hours_rented_by_default
    kayak = Boat.new(:kayak, 20)
    assert_equal 0, kayak.hours_rented 
  end

end
