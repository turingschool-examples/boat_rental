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

    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
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
    assert_empty @dock.rented_boats
  end

  def test_it_start_with_zero_revenue
    assert_equal 0, @dock.revenue
  end

  def test_it_keeps_track_of_rented_boats
    expected = [
      {boat: @kayak_1, renter_card_info: "4242424242424242"},
      {boat: @kayak_2, renter_card_info: "4242424242424242"}
    ]

    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)

    result = @dock.rented_boats

    assert_equal expected, result
  end

  def test_log_hours_updates_revenue_based_on_current_rented_boats
    assert_equal 0, @dock.revenue

    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour

    assert_equal 40, @dock.revenue

    @dock.rent(@canoe, @patrick)
    @dock.log_hour

    assert_equal 105, @dock.revenue
  end

  def test_logging_hours_past_max_rental_time_does_not_charge_boat_and_update_revenue
    assert_equal 0, @dock.revenue

    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour

    assert_equal 40, @dock.revenue

    @dock.rent(@canoe, @patrick)
    @dock.log_hour

    assert_equal 105, @dock.revenue

    @dock.log_hour

    assert_equal 170, @dock.revenue

    @dock.log_hour
    @dock.log_hour
    @dock.log_hour

    assert_equal 195, @dock.revenue
  end

  def test_return_removes_boat_from_rented_boats
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)

    expected = [
      {boat: @kayak_1, renter_card_info: "4242424242424242"},
      {boat: @kayak_2, renter_card_info: "4242424242424242"}
    ]

    assert_equal expected, @dock.rented_boats

    @dock.return(@kayak_1)

    expected = [{boat: @kayak_2, renter_card_info: "4242424242424242"}]
    result = @dock.rented_boats

    result.each_with_index do |boat_hash, index|
      assert boat_hash == expected[index]
    end
  end

  def test_log_hours_increments_hours_rented_for_each_boat
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)

    @dock.rented_boats.each do |boat_hash|
      assert boat_hash[:boat].hours_rented == 0
    end

    @dock.log_hour
    @dock.log_hour
    @dock.log_hour

    @dock.rented_boats.each do |boat_hash|
      assert boat_hash[:boat].hours_rented == 3
    end
  end

  def test_returning_a_boat_resets_hours_rented
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)

    @dock.rented_boats.each do |boat_hash|
      assert boat_hash[:boat].hours_rented == 0
    end

    @dock.log_hour
    @dock.log_hour
    @dock.log_hour

    @dock.rented_boats.each do |boat_hash|
      assert boat_hash[:boat].hours_rented == 3
    end

    @dock.return(@kayak_1)
    @dock.return(@kayak_2)

    assert_equal 0, @kayak_1.hours_rented
    assert_equal 0, @kayak_1.hours_rented
  end
end
