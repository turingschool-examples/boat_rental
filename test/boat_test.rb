require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'

class BoatTest < Minitest::Test
  def setup
    @kayak = Boat.new(:kayak, 20)
  end

  def test_it_exists
    assert_instance_of Boat, @kayak
  end

  def test_it_inits_with_type_and_price_per_hour
    assert_equal :kayak, @kayak.type
    assert_equal 20, @kayak.price_per_hour
  end
end
