require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require './lib/dock'
require './lib/renter'

class DockTest < Minitest::Test

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_it_has_a_name
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
  end

  def test_it_has_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 3, dock.max_rental_time
  end

  def test_it_has_a_boat_inventory
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    dock.add_boats_to_inventory(kayak_1)
    dock.add_boats_to_inventory(kayak_2)
    dock.add_boats_to_inventory(canoe)
    dock.add_boats_to_inventory(sup_1)
    dock.add_boats_to_inventory(sup_2)
    assert_equal 5, dock.boat_inventory.count
  end

  def test_can_add_renters
    dock = Dock.new("The Rowing Dock", 3)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    dock.add_renters(patrick)
    dock.add_renters(eugene)
    assert_equal [patrick, eugene], dock.total_renters
  end

  def test_renter_can_rent_boats
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    canoe = Boat.new(:canoe, 25)
    dock.rent(canoe, patrick)
    assert_equal 3, dock.total_rental_by_person.count
  end

  def test_log_hour_adds_one_when_first_called
    dock = Dock.new("The Rowing Dock", 3)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    # eugene = Renter.new("Eugene Crabs", "1313131313131313")
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    assert_equal 1, dock.log_hour
  end

end
