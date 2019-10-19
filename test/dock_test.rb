require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/renter'
require './lib/boat'
require './lib/dock'

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

  def test_it_initializes_with_attributes
    assert_equal "The Rowing Dock", @dock.name
    assert_equal 3, @dock.max_rental_time
  end

  def test_it_starts_with_empty_rental_log
    expected_hash = {}
    assert_equal expected_hash, @dock.rental_log
  end

  def test_it_can_rent_boat_to_renter
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    expected_hash = {
                      @kayak_1 => @patrick,
                      @kayak_2 => @patrick,
                      @sup_1 => @eugene
                    }
    assert_equal expected_hash, @dock.rental_log
  end

  def test_it_can_calculate_chargeable_hours_for_boat
    @dock.rent(@kayak_1, @patrick)
    2.times { @kayak_1.add_hour }
    assert_equal 2, @dock.chargeable_hours(@kayak_1)

    @dock.rent(@sup_1, @eugene)
    5.times { @sup_1.add_hour }
    assert_equal 3, @dock.chargeable_hours(@sup_1)
  end

  def test_it_can_calculate_total_rental_price_for_boat
    @dock.rent(@kayak_1, @patrick)
    2.times { @kayak_1.add_hour }
    assert_equal 40, @dock.total_rental_price(@kayak_1)

    @dock.rent(@sup_1, @eugene)
    5.times { @sup_1.add_hour }
    assert_equal 45, @dock.total_rental_price(@sup_1)
  end

  def test_it_can_return_charge_for_a_boat_rental
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    2.times { @kayak_1.add_hour }
    expected_hash_1 = {
                      card_number: "4242424242424242",
                      amount: 40
                    }
    assert_equal expected_hash_1, @dock.charge(@kayak_1)

    @dock.rent(@sup_1, @eugene)
    5.times { @sup_1.add_hour }
    expected_hash_2 = {
                        card_number: "1313131313131313",
                        amount: 45
    }
    assert_equal expected_hash_2, @dock.charge(@sup_1)
  end

  def test_it_can_find_renter_card_for_boat
    @dock.rent(@kayak_1, @patrick)
    assert_equal "4242424242424242", @dock.renter_card(@kayak_1)
  end

  def test_it_can_return_a_boat
    @dock.rent(@kayak_1, @patrick)
    @dock.return(@kayak_1)
    assert_equal false, @kayak_1.rented
  end

  def test_it_can_log_hour_of_rental_time_for_all_rented_boats
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@sup_1, @eugene)
    @dock.log_hour
    assert_equal 1, @kayak_1.hours_rented
    assert_equal 1, @sup_1.hours_rented
    @dock.log_hour
    assert_equal 2, @kayak_1.hours_rented
    assert_equal 2, @sup_1.hours_rented
  end

  def test_it_can_find_rented_boats
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@canoe, @patrick)
    @dock.rent(@sup_1, @eugene)
    assert_equal [@kayak_1, @kayak_2, @canoe, @sup_1], @dock.rented_boats
    @dock.return(@kayak_2)
    assert_equal [@kayak_1, @canoe, @sup_1], @dock.rented_boats
  end

  def test_it_can_return_total_revenue_from_charges
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    assert_equal 0, @dock.revenue
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

end
