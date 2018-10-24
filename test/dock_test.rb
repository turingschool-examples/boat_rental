require './lib/dock'
require './lib/boat'
require './lib/renter'
require 'minitest/autorun'
require 'minitest/pride'

class DockTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3)

    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @canoe = Boat.new(:canoe, 25)
  end

  def test_it_exists
    assert_instance_of Dock, @dock
  end

  def test_it_has_a_name
    assert_equal "The Rowing Dock", @dock.name
  end

  def test_it_has_a_max_rental_time
    assert_equal 3, @dock.max_rental_time
  end

  def test_it_starts_with_no_rented_boats
    assert_empty @dock.boats
  end

  def test_it_start_with_zero_revenue
    assert_equal 0, @dock.revenue
  end

  def test_it_keeps_track_of_rented_boats
    assert_equal []
  end
end
