require "minitest/autorun"
require "minitest/pride"
require "./lib/dock"

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
    dock.rent(ringo, kayak)

    assert_instance_of Renter, dock.renters
    assert_instance_of Boat, dock.boats[:kayak_1]
  end

  def test_dock_can_log_hours
    dock = Dock.new("The Rowing Dock", 3)
    ringo = Renter.new("Ringo Star", "4242424242424242")
    kayak_1 = Boat.new(:kayak, 20)
    dock.rent(ringo, kayak)
    dock.log_hour

    assert_equal 1, dock.boats[:kayak_1].hours_rented
  end

  def test_dock_can_return_boats
    dock = Dock.new("The Rowing Dock", 3)
    ringo = Renter.new("Ringo Star", "4242424242424242")
    kayak_1 = Boat.new(:kayak, 20)
    dock.rent(ringo, kayak)

    assert_nil boats.find(:kayak_1)
  end

  def test_dock_can_count_revenue
    dock = Dock.new("The Rowing Dock", 3)
    ringo = Renter.new("Ringo Star", "4242424242424242")
    kayak_1 = Boat.new(:kayak, 20)
    dock.rent(ringo, kayak)
    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.log_hour

    assert_equal 60, dock.revenue 
  end

end
