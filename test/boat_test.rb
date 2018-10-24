require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require 'pry'

# Use TDD to create a `Boat` class that responds to the following interaction pattern:

class BoatTest < Minitest::Test

  def test_it_exists
    kayak = Boat.new(:kayak, 20)
    assert_instance_of Boat, kayak
  #=> #<Boat:0x00007fceac8f0480...>
  end

  def test_it_has_a_type
    kayak = Boat.new(:kayak, 20)
    assert_equal :kayak, kayak.type
  #=> :kayak
  end

  def test_it_has_price_per_hour
    kayak = Boat.new(:kayak, 20)
    assert_equal 20, kayak.price_per_hour
  #=> 20
  end

  def test_it_has_rented_hours
    kayak = Boat.new(:kayak, 20)
    assert_equal 0, kayak.hours_rented
  #=> 0
  end

  def test_it_add_an_hour
    kayak = Boat.new(:kayak, 20)
    kayak.add_hour
    assert_equal 1, kayak.hours_rented
  #=> 1
  end

  def test_it_can_add_more_hours
    kayak = Boat.new(:kayak, 20)
    kayak.add_hour
    kayak.add_hour
    assert_equal 2, kayak.hours_rented
  #=> 2
  end

  def test_it_can_add_more_hours
    kayak = Boat.new(:kayak, 20)
    kayak.add_hour
    kayak.add_hour
    kayak.add_hour
    assert_equal 3, kayak.hours_rented
  #=> 3
  end

end
