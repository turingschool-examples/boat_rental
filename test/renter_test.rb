require 'minitest/autorun'
require './lib/renter'


class RenterTest < Minitest::Test
  def setup
    @renter = Renter.new()
  end
  def test_it_exists
    assert_instance_of Renter, @renter
  end
end
