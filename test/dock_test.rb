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
    binding.pry
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
    #this is failing because it ISNT tracking hours seperately
    #something to do with the rent method and tracking EACH boat
    # in a seperate way
    assert_equal 80, dock.revenue
  end

end
