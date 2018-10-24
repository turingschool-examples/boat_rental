require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/dock'
require './lib/boat'

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

  def test_dock_has_revenue
    dock = Dock.new("The Rowing Dock", 3)

    assert_equal 0, dock.revenue
  end

  def test_dock_knows_what_boats_are_rented
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")

    assert_equal [kayak_1], dock.rent(kayak_1, patrick)
  end
end
