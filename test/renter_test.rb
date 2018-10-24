require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/renter'

class RenterTest < Minitest::Test

  def test_renter_exists
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_instance_of Renter, renter
  end


  def test_renter_has_name
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_equal "Patrick Star", renter.name
  end

    def test_renter_has_ccn
      renter = Renter.new("Patrick Star", "4242424242424242")
      assert_equal "4242424242424242", renter.credit_card_number
    end
end
