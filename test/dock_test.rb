require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/renter'
require './lib/boat'

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

  def test_it_can_be_rented
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    assert_equal true, kayak_1.rented_status
  end

  def test_it_can_log_hours
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    assert_equal 1, dock.log_hour
  end

  def test_it_can_return
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    dock.return(kayak_1)
    assert_equal false, kayak_1.rented_status
  end

  def test_it_does_not_count_past_max_rental_time
    skip
    assert_equal
  end

  def test_it_has_total_revenue
skip
    assert_equal f, dock.revenue
  end

end

# # Revenue thus far
# pry(main)> dock.revenue
# #=> 105
#
# # Rent Boats out to second Renter
# pry(main)> dock.rent(sup_1, eugene)
#
# pry(main)> dock.rent(sup_2, eugene)
#
# pry(main)> dock.log_hour
#
# pry(main)> dock.log_hour
#
# pry(main)> dock.log_hour
#
# # Any hours rented past the max rental time are not counted
# pry(main)> dock.log_hour
#
# pry(main)> dock.log_hour
#
# pry(main)> dock.return(sup_1)
#
# pry(main)> dock.return(sup_2)
#
# # Total revenue
# pry(main)> dock.revenue
# #=> 195


# dock = Dock.new("The Rowing Dock", 3)
# kayak_1 = Boat.new(:kayak, 20)
# kayak_2 = Boat.new(:kayak, 20)
# canoe = Boat.new(:canoe, 25)
# sup_1 = Boat.new(:standup_paddle_board, 15)
# sup_2 = Boat.new(:standup_paddle_board, 15)
# patrick = Renter.new("Patrick Star", "4242424242424242")
# eugene = Renter.new("Eugene Crabs", "1313131313131313")
