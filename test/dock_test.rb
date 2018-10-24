require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/boat'
require './lib/renter'
require 'pry'

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

  def test_it_can_get_revenue_for_renting_boat
    dock = Dock.new("The Rowing Dock", 3)
    kayak = Boat.new(:kayak, 20)
    renter = Renter.new("Patrick Star", "4242424242424242")
    dock.rent_boat(renter, kayak, 1)
    assert_equal 20, dock.revenue 
  end

end
