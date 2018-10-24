require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require './lib/renter'
require './lib/dock'

class RenterTest < Minitest::Test

  def test_it_exists
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_instance_of Renter, renter
  end

  def test_it_has_a_name
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_equal "Patrick Star", renter.name
  end

end
