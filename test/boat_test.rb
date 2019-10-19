require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/boat'

class BoatTest < Minitest::Test

  def setup
    @kayak = Boat.new(:kayak, 20)
  end

  def test_it_exists
    assert_instance_of Boat, @kayak
  end

  def test_it_initializes_with_attributes
    assert_equal :kayak, @kayak.type
    assert_equal 20, @kayak.price_per_hour
    assert_equal 0, @kayak.hours_rented
    assert_equal false, @kayak.rented
  end

  def test_its_rented_status_can_change
    @kayak.rented = true
    assert_equal true, @kayak.rented
  end

  def test_it_can_add_hours_rented
    @kayak.add_hour
    @kayak.add_hour
    @kayak.add_hour
    assert_equal 3, @kayak.hours_rented
  end
end
