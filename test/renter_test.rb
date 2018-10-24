require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/renter'

class MerchantTest < Minitest::Test
  def setup
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  def test_it_exists
    assert_instance_of Renter, @renter
  end

  def test_it_has_a_name
    assert_equal "Patrick Star", @renter.name
  end

  def test_it_has_a_cc_number
    assert_equal "4242424242424242", @renter.credit_card_number
  end
end