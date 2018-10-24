require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/dock'
require './lib/renter'
require './lib/boat'

class DockTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @canoe = Boat.new(:canoe, 25)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @sup_2 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  def test_it_exists
    assert_instance_of Dock, @dock
  end

  def test_it_has_name
    assert_equal "The Rowing Dock", @dock.name
  end

  def test_it_has_max_rental_time
    assert_equal 3, @dock.max_rental_time
  end

  def test_it_has_rented_boats
    assert_equal [], @dock.rented_boats
  end

  def test_it_rents_boats
    @dock.rent(@kayak_1, @patrick)
    assert_equal [@kayak_1], @dock.rented_boats
  end

  def test_it_logs_hour
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    assert_equal 1, @dock.rented_boats[0].hours_rented
    assert_equal 1, @dock.rented_boats[1].hours_rented
  end

  def test_it_has_total_revenue
    assert_equal 0, @dock.revenue
  end

  def test_it_returns_boats
    @dock.rent(@kayak_1, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@canoe)
    assert_equal [], @dock.rented_boats
  end

  def test_it_returns_revenue
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    @dock.return(@canoe)
    assert_equal 105, @dock.revenue
  end

  def test_it_resets_hours
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    @dock.return(@canoe)
    assert_equal 0, @kayak_1.hours_rented
    assert_equal 0, @kayak_2.hours_rented
    assert_equal 0, @canoe.hours_rented
  end

end
