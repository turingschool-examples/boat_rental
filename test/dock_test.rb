require "minitest/autorun"
require "minitest/pride"
require "./lib/dock"
require "./lib/renter"
require "./lib/boat"

class DockTest < Minitest::Test
  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_dock_has_a_name
    dock = Dock.new("The Rowing Dock", 3)

    assert_equal "The Rowing Dock", dock.name
  end

  def test_dock_has_max_rental_time

    dock = Dock.new("The Rowing Dock", 3)

    assert_equal 3, dock.max_rental_time
  end

  def test_dock_can_have_boat_and_boats_can_have_renters
    dock = Dock.new("The Rowing Dock", 3)
    ringo = Renter.new("Ringo Star", "4242424242424242")
    kayak_1 = Boat.new(:kayak, 20)
    dock.rent(kayak_1, ringo)

    assert_instance_of Renter, dock.renters.last
    assert_instance_of Boat, dock.boats.last 
  end

  def test_dock_can_log_hours
    dock = Dock.new("The Rowing Dock", 3)
    ringo = Renter.new("Ringo Star", "4242424242424242")
    kayak_1 = Boat.new(:kayak, 20)
    dock.rent(kayak_1, ringo)
    dock.log_hour

    assert_equal 1, dock.boats[0].hours_rented
  end

  def test_dock_can_return_boats
    dock = Dock.new("The Rowing Dock", 3)
    ringo = Renter.new("Ringo Star", "4242424242424242")
    kayak_1 = Boat.new(:kayak, 20)
    dock.rent(kayak_1, ringo)

    assert_equal kayak_1, dock.return(kayak_1)
  end

  def test_dock_can_count_revenue_and_that_it_deletes_if_boat_has_overstayed
    dock = Dock.new("The Rowing Dock", 3)
    ringo = Renter.new("Ringo Star", "4242424242424242")
    kayak_1 = Boat.new(:kayak, 20)
    dock.rent(kayak_1, ringo)
    dock.log_hour
    dock.log_hour
    dock.log_hour # should add 20 to 40 (60)
    dock.log_hour # shouldn't add anything


    assert_equal 60, dock.revenue
  end

end
