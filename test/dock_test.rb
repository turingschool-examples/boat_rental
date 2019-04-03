require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'

class DockTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  def test_it_exists
    assert_instance_of Dock, @dock
  end

  def test_it_inits_with_name_and_max_rental_time
    assert_equal "The Rowing Dock", @dock.name
    assert_equal 3, @dock.max_rental_time
  end

  def test_it_starts_with_no_revenue
    assert_equal 0, @dock.revenue
  end

  def test_rent_adds_to_rental_log_hash
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup, @eugene)

    expected = {
      @kayak_1 => @patrick,
      @kayak_2 => @patrick,
      @sup => @eugene
    }

    assert_equal expected, @dock.rental_log
  end

  def test_charge_returns_hash_with_card_number_and_amount_to_be_charged
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @kayak_1.add_hour
    @kayak_1.add_hour

    expected = {
      card_number: "4242424242424242",
      amount: 40
    }

    assert_equal expected, @dock.charge(@kayak_1)
  end

  def test_charge_returns_hash_with_card_number_and_amount_to_be_charged_up_to_max_rental_time
    @dock.rent(@sup_1, @eugene)
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour

    expected = {
      card_number: "1313131313131313",
      amount: 45
    }

    assert_equal expected, @dock.charge(@sup_1)
  end

  def test_log_hour_increases_hours_rented_for_all_boats_in_use
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)

    @dock.log_hour

    assert_equal 1, @kayak_1.hours_rented
    assert_equal 1, @kayak_2.hours_rented
    assert_equal 0, @sup_1.hours_rented
  end

  def test_return_removes_boat_from_rental_log_and_increases_revenue
    @dock.rent(@kayak_1, @patrick)
    @dock.log_hour
    @dock.return(@kayak_1)
    @dock.log_hour

    assert_equal ({}), @dock.rental_log
    assert_equal 20, @dock.revenue
  end
end
