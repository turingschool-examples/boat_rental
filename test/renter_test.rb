require './lib/boat'
require './lib/renter'
require './lib/dock'
require 'minitest/autorun'
require 'minitest/pride'

class RenterTest < Minitest::Test
  def test_it_exists
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_instance_of Renter, renter
  end

  def test_for_name
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_equal "Patrick Star", renter.name
  end

  def test_for_credit_card_number
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_equal "4242424242424242", renter.credit_card_number
  end



end
