require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/boat'

class RenterTest < Minitest::Test

  def test_it_exists
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_instance_of Renter, renter
  end

  def test_it_has_attributes
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_equal "Patrick Star", renter.name
    assert_equal "4242424242424242", renter.credit_card_number
  end

  def test_rented_boats_is_initialized_as_empty_array
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_equal [], renter.rented_boats
  end

  def test_add_boat_adds_boat_to_rented_boats
    renter = Renter.new("Patrick Star", "4242424242424242")
    kayak_1 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    renter.add_boat(kayak_1)
    assert_equal [kayak_1], renter.rented_boats
    renter.add_boat(canoe)
    assert_equal [kayak_1, canoe], renter.rented_boats
  end



end
