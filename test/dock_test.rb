require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/dock'

class DockTest < MiniTest::Test

  def test_dock_exists
    dock = Dock.new("The Rowing Dock", 3)

    assert_instance_of Dock, dock
  end

  def test_dock_can_get_name
    dock = Dock.new("The Rowing Dock", 3)

    assert_equal "The Rowing Dock", dock.name
  end

  def test_it_can_get_max_rent_time
    dock = Dock.new("The Rowing Dock", 3)

    assert_equal 3, dock.max_rental_time
  end
end
