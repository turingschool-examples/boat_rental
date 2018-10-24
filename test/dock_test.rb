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
    assert_equal [kayak_1, kayak_2, canoe, sup_1, sup_2], dock.boat_inventory
  end

end
