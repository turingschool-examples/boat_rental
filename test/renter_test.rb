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
end