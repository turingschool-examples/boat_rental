require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/dock'

class DockTest < MiniTest::Test

  def test_dock_exists
    dock = Dock.new("The Rowing Dock", 3)

    assert_instance_of Dock, dock
  end


end
