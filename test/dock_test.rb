require './lib/boat'
require './lib/renter'
require './lib/dock'
require 'minitest/autorun'
require 'minitest/pride'

class DockTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @canoe = Boat.new(:@canoe, 25)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @sup_2 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")

  end

  def test_it_exists
    assert_instance_of Dock, @dock
    assert_instance_of Boat, @kayak_1
    assert_instance_of Boat, @kayak_2
    assert_instance_of Boat, @canoe
    assert_instance_of Boat, @sup_1
    assert_instance_of Boat, @sup_2
    assert_instance_of Renter, @patrick
    assert_instance_of Renter, @eugene
  end

  def test_for_name
     assert_equal "The Rowing Dock", @dock.name
  end

  def test_max_rental_time
    assert_equal 3, @dock.max_rental_time
  end

  def test_boat_rental_and_return_in_terms_of_revenue
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.log_hour
    assert_equal 1, @dock.rental_time
    @dock.rent(@canoe, @patrick)
    @dock.log_hour
    @dock.log_hour
    assert_equal 2, @dock.rental_time
    @dock.return(@kayak_1)
    @dock.return(@kayak_2)
    @dock.return(@canoe)

    assert_equal 105, @dock.revenue

  end


end
