require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/boat'

class MerchantTest < Minitest::Test
  def setup
    @kayak = Boat.new(:kayak, 20)
  end

  def test_it_exists
    assert_instance_of Boat, @kayak
  end

  def test_it_has_a_type
    assert_equal :kayak, @kayak.type
  end

  def test_it_has_a_price_per_hour
    assert_equal 20, @kayak.price_per_hour
  end

  def test_it_starts_at_0_hours_rented
    assert_equal 0, @kayak.hours_rented
  end
end