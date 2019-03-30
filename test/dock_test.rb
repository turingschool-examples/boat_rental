require 'minitest/autorun'
require './lib/renter'
require './lib/boat'
require './lib/dock'

class DockTest < Minitest::Test
  attr_reader :dock,
              :kayak_1,
              :kayak_2,
              :sup_1,
              :sup_2,
              :canoe,
              :patrick,
              :eugene

  def setup
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @sup_2 = Boat.new(:standup_paddle_board, 15)
    @canoe = Boat.new(:canoe, 25)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  def test_it_exists
    assert_instance_of Dock, dock
  end

  def test_it_has_attributes
    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_it_can_rent_boats_to_renters
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)

    expected = {
      kayak_1 => patrick,
      kayak_2 => patrick,
      sup_1 => eugene
    }
    assert_equal expected, dock.rental_log
  end

  def test_it_can_charge_renter_of_boat
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)
    kayak_1.add_hour
    kayak_1.add_hour
    sup_1.add_hour
    sup_1.add_hour

    expected = {
      card_number: "4242424242424242",
      amount: 40
    }

    expected2 = {
      card_number: "1313131313131313",
      amount: 30
    }

    assert_equal expected, dock.charge(kayak_1)
    assert_equal expected2, dock.charge(sup_1)
  end

  def test_it_wont_charge_more_time_than_the_docks_max_rental_time
    dock.rent(sup_1, eugene)
    sup_1.add_hour
    sup_1.add_hour
    sup_1.add_hour
    sup_1.add_hour
    sup_1.add_hour

    expected = {
      :card_number => "1313131313131313",
      :amount => 45
    }

    assert_equal expected, dock.charge(sup_1)
  end

  def test_it_can_log_hour_for_each_boat_at_dock
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.log_hour

    assert_equal 1, kayak_1.hours_rented
    assert_equal 1, kayak_2.hours_rented

    dock.log_hour
    assert_equal 2, kayak_1.hours_rented
    assert_equal 2, kayak_2.hours_rented
  end

  def test_it_gets_revenue_after_boats_are_returned
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.log_hour
    dock.rent(canoe, patrick)
    dock.log_hour

    assert_equal 0, dock.revenue

    dock.return(kayak_1)
    dock.return(kayak_2)
    dock.return(canoe)

    assert_equal 105, dock.revenue
  end

  def test_it_will_take_max_rental_time_into_account_when_giving_dock_revenue
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.log_hour
    dock.rent(canoe, patrick)
    dock.log_hour
    dock.return(kayak_1)
    dock.return(kayak_2)
    dock.return(canoe)
    dock.rent(sup_1, eugene)
    dock.rent(sup_2, eugene)
    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.log_hour
    dock.return(sup_1)
    dock.return(sup_2)

    assert_equal 195, dock.revenue
  end
end
