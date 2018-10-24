require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/dock'
require './lib/renter'
require './lib/boat'

class DockTest < Minitest::Test

  def test_dock_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_dock_has_name
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
  end

  def test_dock_has_MRT
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 3, dock.max_rental_time
  end

  def test_renting_puts_boat_in_water
    dock = Dock.new("The Rowing Dock", 3)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    assert_equal 2, dock.in_the_water.count
  end

  def test_dock_returns_boat
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.return(kayak_1)
    dock.return(kayak_2)
    assert_equal 0, dock.in_the_water.count
  end

  def test_it_can_track_revenue
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.log_hour
    dock.rent(canoe, patrick)
    dock.log_hour
    dock.return(kayak_1)
    dock.return(kayak_2)
    dock.return(canoe)
    assert_equal 105, dock.revenue
  end



end
