require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/boat'

class BoatTest < Minitest::Test
  def test_it_exists
    boat = Boat.new(:kayak, 20)
    assert_instance_of Boat, boat
  end



end
