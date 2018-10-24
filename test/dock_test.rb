require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/boat'
require "./lib/dock"

class DockTest < Minitest::Test

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_it_has_attributes
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_renters_is_initialized_as_empty_array
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal [], dock.renters
  end

  def test_it_can_rent_boat
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    # Rent Boats out to first Renter
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    assert_equal [patrick], dock.renters
  end

  def test_it_can_log_hour
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    # Rent Boats out to first Renter
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.log_hour
    assert_equal 1, kayak_1.hours_rented
    assert_equal 1, kayak_1.hours_rented
  end




end
