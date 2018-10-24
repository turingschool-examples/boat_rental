require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/dock'
require './lib/renter'
require './lib/boat'

class DockTest < Minitest::Test

  def test_that_it_exists
    dock = Dock.new("The Rowing Dock", 3)

    assert_instance_of Dock, dock
  end

  def test_that_it_has_a_name
    dock = Dock.new("The Rowing Dock", 3)

    assert_equal "The Rowing Dock", dock.name
  end

  def test_that_it_has_a_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)

    assert_equal 3, dock.max_rental_time
  end

  def test_that_it_can_rent_a_boat_out_and_log_only_up_to_max_hours
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.log_hour
    expected = 3

    assert_equal expected, dock.hours
  end

  def test_that_it_can_charge_per_hour_for_boat_rental
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    dock.log_hour
    dock.log_hour
    dock.rent(kayak_2, patrick)
    dock.log_hour
    dock.charge_for_boat(kayak_1)
    dock.charge_for_boat(kayak_2)

    assert_equal 80, dock.revenue
  end

  def test_that_it_can_rent_and_charge_multiple_boats_to_a_renter
    skip
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.log_hour
    dock.rent(canoe, patrick)
    dock.log_hour
    dock.charge_for_boat(kayak_1)
    dock.charge_for_boat(kayak_2)
    dock.charge_for_boat(canoe)
    dock.return(kayak_1)
    dock.return(kayak_2)
    dock.return(canoe)

    assert_equal 105, dock.revenue

    dock.rent(sup_1, eugene)
    dock.rent(sup_2, eugene)
    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.charge_for_boat(sup_1)
    dock.charge_for_boat(sup_1)
    dock.return(sup_1)
    dock.return(sup_2)
    assert_equal 195, dock.revenue
  end

end
