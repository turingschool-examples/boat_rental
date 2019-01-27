require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'

class BoatTest < Minitest::Test

  def setup
    @kayak = Boat.new(:kayak, 20)
  end

  def test_boat_has_a_type
    assert_equal :kayak, @kayak.type
  end

  

end
