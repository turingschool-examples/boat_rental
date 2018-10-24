require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'

class BoatTest < MiniTest::Test

  def test_boat_exists
    kayak = Boat.new(:kayak, 20)
    
    assert_instance_of Boat, kayak
  end
end
