require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/boat'
require './lib/renter'
require 'pry'

class DockTest < Minitest::Test
  def test_a_dock_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_a_dock_has_a_name
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
  end

  def test_a_dock_has_a_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 3, dock.max_rental_time
  end

  def test_a_dock_has_revenue
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 0, dock.revenue
  end

  def test_a_dock_can_rent_a_boat
    dock = Dock.new("The Rowing Dock", 3)

    kayak_1 = Boat.new(:kayak, 20)

    patrick = Renter.new("Patrick Star", "4242424242424242")

    dock.rent(kayak_1, patrick)
    assert_equal [[kayak_1, patrick]], dock.rentals
  end
end
