require './lib/boat'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BoatTest < Minitest::Test
  def test_it_exists
    kayak = Boat.new(:kayak, 20)
    assert_instance_of Boat, kayak
  end
end
