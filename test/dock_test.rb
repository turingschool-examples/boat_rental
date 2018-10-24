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
end
