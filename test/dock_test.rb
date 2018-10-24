require 'minitest/autorun'
require './lib/dock'
require './lib/boat'
require './lib/renter'


class DockTest < Minitest::Test
  def setup
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @canoe = Boat.new(:canoe, 25)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @sup_2 = Boat.new(:standup_paddle_board, 15)
    @dock = Dock.new("The Rowing Dock", 3)
  end
  def test_it_exists
    assert_instance_of Dock, @dock
  end
  def test_it_can_be_initialized_with_name
    assert_equal "The Rowing Dock", @dock.name
  end
  def test_it_can_be_initialized_with_max_rental_time
    assert_equal 3, @dock.max_rental_time
  end
  def test_log_hour_causes_revenue_to_increase_when_boats_are_rented
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    assert_equal 40, @dock.revenue
  end

  def test_log_hour_causes_revenue_to_increase_when_boats_are_rented_accross_hours_with_variable_amounts_of_boats_not_having_been_returned

    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    @dock.return(@canoe)
    # Revenue thus far
    assert_equal 105, @dock.revenue
  end


  def test_log_hour_with_second_customer_renting_past_max_but_not_being_charged_for_extra

    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    @dock.return(@canoe)
    # Rent Boats out to second Renter
    @dock.rent(@sup_1, @eugene)
    @dock.rent(@sup_2, @eugene)
    @dock.log_hour
    @dock.log_hour
    @dock.log_hour
    # Any hours rented past the max rental time are not counted
    @dock.log_hour
    @dock.log_hour
    @dock.return(@sup_1)
    @dock.return(@sup_2)
    # Total revenue
    @dock.revenue
    assert_equal 195, @dock.revenue
  end

  def test_charges_returns_credit_card_and_amount_charged_per_renter

    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    @dock.return(@canoe)
    # Rent Boats out to second Renter
    @dock.rent(@sup_1, @eugene)
    @dock.rent(@sup_2, @eugene)
    @dock.log_hour
    @dock.log_hour
    @dock.log_hour
    # Any hours rented past the max rental time are not counted
    @dock.log_hour
    @dock.log_hour
    @dock.return(@sup_1)
    @dock.return(@sup_2)
    # Total revenue
    @dock.revenue
    expected = {"4242424242424242" => 105, "1313131313131313" => 90}
    assert_equal expected, @dock.charges
  end

  def test_total_hours_by_rental_type_returns_type_and_hour_pairs

    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    @dock.return(@canoe)
    # Rent Boats out to second Renter
    @dock.rent(@sup_1, @eugene)
    @dock.rent(@sup_2, @eugene)
    @dock.log_hour
    @dock.log_hour
    @dock.log_hour
    # Any hours rented past the max rental time are not counted
    @dock.log_hour
    @dock.log_hour
    @dock.return(@sup_1)
    @dock.return(@sup_2)
    # Total revenue
    @dock.revenue
    expected = {:kayak => 4, :canoe => 1, :standup_paddle_board => 10}
    assert_equal expected, @dock.total_hours_by_rental_type
  end
end
