require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/renter'

class RenterTest < Minitest::Test
  def setup
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  def test_it_exists
    assert_instance_of Renter, @renter
  end

  def test_it_has_name
    skip
    assert_equal "Patrick Star", @renter.name
  end

  def test_it_has_credit_card
    skip
    assert_equal "4242424242424242", @renter.credit_card_number
  end


end
