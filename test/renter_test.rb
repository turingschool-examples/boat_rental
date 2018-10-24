require "minitest/autorun"
require "minitest/pride"
require "./lib/renter"

class RenterTest < Minitest::Test
  def test_it_exists
    renter = Renter.new("Ringo Star", "4242424242424242")
    assert_instance_of Renter, renter
  end

  def test_renter_has_a_name
    renter = Renter.new("Ringo Star", "4242424242424242")

    assert_equal "Ringo Star", renter.name
  end

  def test_renter_has_a_credit_card
    renter = Renter.new("Ringo Star", "4242424242424242")

    assert_equal "4242424242424242", renter.credit_card_number
  end
  
end
