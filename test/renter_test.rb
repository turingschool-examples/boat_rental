require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/boat'
require_relative '../lib/renter'

class RenterTest < Minitest::Test 


  def setup
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  def test_it_exists
    assert_instance_of Renter, @renter
  end 

  def test_it_has_attributes
    assert_equal "Patrick Star", @renter.name
    assert_equal "4242424242424242", @renter.credit_card_number
  end

end