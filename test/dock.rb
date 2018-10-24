require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require './lib/renter'
require './lib/dock'
require 'pry'

class DockTest < Minitest::Test

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  #=> #<Dock:0x00007fb5efb36148...>
  end
  def test_it_can_have_a_name

    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
  #=> "The Rowing Dock"
  end
  def test_it_can_have_max_rental_time

    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 3, dock.max_rental_time
  #=> 3
  end

  def test_it_can_calulate_revenue

  dock = Dock.new("The Rowing Dock", 3)
  kayak_1 = Boat.new(:kayak, 20)
  kayak_2 = Boat.new(:kayak, 20)
  canoe = Boat.new(:canoe, 25)
  sup_1 = Boat.new(:standup_paddle_board, 15)
  sup_2 = Boat.new(:standup_paddle_board, 15)
  patrick = Renter.new("Patrick Star", "4242424242424242")
  eugene = Renter.new("Eugene Crabs", "1313131313131313")

  # Rent Boats out to first Renter
  dock.rent(kayak_1, patrick)
  dock.rent(kayak_2, patrick)
  assert_equal [kayak_1, kayak_2], dock.boats
  assert_equal [patrick], dock.renters

   dock.log_hour
   dock.rent(canoe, patrick)
   dock.log_hour
   dock.return(kayak_1)
   dock.return(kayak_2)
   dock.return(canoe)
   # Revenue thus far
   dock.revenue
  #=> 105
  end

  def test_it_can
    skip
  # Rent Boats out to second Renter
  dock.rent(sup_1, eugene)

  dock.rent(sup_2, eugene)

  dock.log_hour

  dock.log_hour

  dock.log_hour

  # Any hours rented past the max rental time are not counted
  dock.log_hour

  dock.log_hour

  dock.return(sup_1)

  dock.return(sup_2)

  # Total revenue
  dock.revenue
  #=> 195
  end
end
