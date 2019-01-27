require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test

  def setup
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  def test_renter_has_a_name
    assert_equal "Patrick Star", @renter.name
  end

  def test_renter_has_a_credit_card_number
    assert_equal "4242424242424242", @renter.credit_card_number
  end

end
