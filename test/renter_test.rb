require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/dock'

class RenterTest < Minitest::Test

  def test_renter_exists
    renter = Renter.new("Patrick Star", "4242424242424242")

    assert_instance_of Renter, renter
  end

end
