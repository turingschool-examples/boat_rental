require './lib/boat'
require './lib/renter'
require './lib/dock'
require 'minitest/autorun'
require 'minitest/pride'

class DockTest < Minitest::Test

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    assert_instance_of Dock, dock
    assert_instance_of Boat, kayak_1
    assert_instance_of Boat, kayak_2
    assert_instance_of Boat, canoe
    assert_instance_of Boat, sup_1
    assert_instance_of Boat, sup_2
    assert_instance_of Renter, patrick
    assert_instance_of Renter, eugene
  end

  def test_for_name
    dock = Dock.new("The Rowing Dock", 3)
     assert_equal "The Rowing Dock", dock.name
  end

  def test_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 3, dock.max_rental_time
  end




end
