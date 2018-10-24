require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/boat'
require './lib/renter'

class DockTest < Minitest::Test
  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_it_has_attributes
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_it_can_log_hour
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    assert_equal 1, dock.log_hour.count
  end

  def test_it_can_return_boats
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)

    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    3.times {dock.log_hour}
    assert_equal [kayak_1], dock.return(kayak_1)

    dock.rent(kayak_2, patrick)
    4.times {dock.log_hour}
    assert_equal [kayak_1, kayak_2], dock.return(kayak_2)
  end

  def test_it_can_track_total_dock_revenue
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)

    patrick = Renter.new("Patrick Star", "4242424242424242")
    dock.rent(kayak_1, patrick)
    3.times {dock.log_hour}
    dock.return(kayak_1)
    assert_equal 60, dock.revenue

    dock.rent(kayak_2, patrick)
    4.times {dock.log_hour}
    dock.return(kayak_2)
    assert_equal 120, dock.revenue
  end

  def test_it_can_track_rev_w_multiple_renters
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)

    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)
    dock.rent(sup_2, eugene)
    4.times {dock.log_hour}
    dock.return(kayak_1)
    dock.return(kayak_2)
    dock.return(sup_1)
    dock.return(sup_2)

    assert_equal 210, dock.revenue
  end

  def test_it_can_set_up_credit_card_with_total_hours_rented
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)

    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)
    dock.rent(sup_2, eugene)
    4.times {dock.log_hour}
    dock.return(kayak_1)
    dock.return(kayak_2)
    dock.return(sup_1)
    dock.return(sup_2)

    expected = {"4242424242424242" => 120, "1313131313131313" => 90}
    assert_equal expected, dock.charges
  end
end
