require './lib/boat'
require './lib/renter'
require './lib/dock'
require 'minitest/autorun'
require 'minitest/pride'

class DockTest < Minitest::Test

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)

    assert_instance_of Dock, dock
  end




end
