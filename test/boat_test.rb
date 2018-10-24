require './lib/boat'
require 'minitest/autorun'
require 'minitest/pride'
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

  def test_it_has_a_price_per_hour
    kayak = Boat.new(:kayak, 20)
    assert_equal 20, kayak.price_per_hour
  end

  def test_it_starts_with_zero_hours_rented
    kayak = Boat.new(:kayak, 20)
    assert_equal 0, kayak.hours_rented
  end

  def test_it_can_add_one_hour_rented
    kayak = Boat.new(:kayak, 20)
    assert_equal 1, kayak.add_hour
  end




  # pry(main)> kayak.add_hour
  # #=> 2
  #
  # pry(main)> kayak.add_hour
  # #=> 3
  #
  # pry(main)> kayak.hours_rented
  # #=> 3




end
