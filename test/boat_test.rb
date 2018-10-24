require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require 'pry'

class BoatTest < Minitest::Test
  def test_a_boat_exists
    kayak = Boat.new(:kayak, 20)
    assert_instance_of Boat, kayak
  end
end
