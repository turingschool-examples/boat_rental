require 'minitest/autorun'
require "minitest/pride"
require './lib/dock'
require './lib/renter'
require './lib/boat'

class DockTest < MiniTest::Test
  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_it_can_return_its_attributes
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_boats_can_be_rented
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    assert_equal [kayak_1], dock.rented_boat
    assert_equal [patrick], dock.renters
  end

  def test_hours_can_be_loged
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.log_hour
    assert_equal 2, dock.log_hour
  end

def test_revenue_can_be_calculated
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
    assert_equal 105, dock.revenue
end



end
