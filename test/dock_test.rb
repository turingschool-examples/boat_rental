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
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_it_returns_name
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
  end

  def test_it_returns_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 3, dock.max_rental_time
  end

  def test_it_can_rent_boats
    assert_equal [], @dock.rented_boats
    @dock.rent(@kayak_1, @patrick)
    assert_equal [{boat: @kayak_1, renter: @patrick}], @dock.rented_boats
  end

  def test_it_can_log_an_hour
    @dock.rent(@kayak_1, @patrick)
    assert_equal 0, @dock.hours_logged_by_boat(@kayak_1)
    @dock.log_hour
    assert_equal 1, @dock.hours_logged_by_boat(@kayak_1)
  end

  def test_it_cant_be_rented_longer_than_max_time
    @dock.rent(@kayak_1, @patrick)
    @dock.log_hour
    @dock.log_hour
    @dock.log_hour
    assert_equal 3, @dock.hours_logged_by_boat(@kayak_1)
    @dock.log_hour
    assert_equal 3, @dock.hours_logged_by_boat(@kayak_1)
  end

  def test_it_can_return_a_boat
    assert_equal false, @dock.rented?(@kayak_1)
    @dock.rent(@kayak_1, @patrick)
    @dock.log_hour
    assert_equal true, @dock.rented?(@kayak_1)
    @dock.return(@kayak_1)
    assert_equal false, @dock.rented?(@kayak_1)
    @dock.rent(@kayak_1, @patrick)
    assert_equal 0, @dock.hours_logged_by_boat(@kayak_1)
  end

  def test_it_can_calculate_revenue
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    @dock.return(@canoe)
    assert_equal 105, @dock.revenue
    @dock.rent(@sup_1, @eugene)
    @dock.rent(@sup_2, @eugene)
    5.times { @dock.log_hour }
    @dock.return(@sup_1)
    @dock.return(@sup_2)
    assert_equal 195, @dock.revenue
  end

  def test_it_can_return_charges_per_credit_card
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    @dock.return(@canoe)
    @dock.rent(@sup_1, @eugene)
    @dock.rent(@sup_2, @eugene)
    5.times { @dock.log_hour }
    @dock.return(@sup_1)
    @dock.return(@sup_2)
    expected = {"4242424242424242" => 105, "1313131313131313" => 90}
    assert_equal expected, @dock.charges
  end

  def test_it_returns_total_hours_by_rental_type
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    @dock.return(@canoe)
    @dock.rent(@sup_1, @eugene)
    @dock.rent(@sup_2, @eugene)
    5.times { @dock.log_hour }
    @dock.return(@sup_1)
    @dock.return(@sup_2)
    expected = {:kayak => 4, :canoe => 1, :standup_paddle_board => 10}
    assert_equal expected, @dock.total_hours_by_rental_type
  end

end
