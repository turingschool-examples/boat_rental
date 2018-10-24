require './lib/boat'
require './lib/dock'
require './lib/renter'
require 'minitest/autorun'
require 'minitest/pride'
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

  def test_it_has_a_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 3, dock.max_rental_time
  end

  def test_it_can_start_with_zero_rentals
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal [], dock.rentals
  end

  def test_it_can_rent_one_boat
  skip
  dock = Dock.new("The Rowing Dock", 3)
  kayak_1 = Boat.new(:kayak, 20)
  patrick = Renter.new("Patrick Star", "4242424242424242")
  dock.rent(kayak_1, patrick)
  dock.log_hour
  dock.return(kayak_1)
  assert_equal 20, dock.revenue
  end

  #
  # def test_it_can_calculate_revenue
  #   dock = Dock.new("The Rowing Dock", 3)
  #   kayak_1 = Boat.new(:kayak, 20)
  #   kayak_2 = Boat.new(:kayak, 20)
  #   canoe = Boat.new(:canoe, 25)
  #   sup_1 = Boat.new(:standup_paddle_board, 15)
  #   sup_2 = Boat.new(:standup_paddle_board, 15)
  #   patrick = Renter.new("Patrick Star", "4242424242424242")
  #   eugene = Renter.new("Eugene Crabs", "1313131313131313")
  #   dock.rent(kayak_1, patrick)
  #   dock.rent(kayak_2, patrick)
  #   dock.log_hour
  #   dock.rent(canoe, patrick)
  #   dock.log_hour
  #   dock.return(kayak_1)
  #   dock.return(kayak_2)
  #   dock.return(canoe)
  #   assert_equal 105, dock.revenue
  # end




end
