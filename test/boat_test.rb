require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/boat'

class MerchantTest < Minitest::Test
  def setup
    @kayak = Boat.new(:kayak, 20)
  end

  def test_it_exists
    assert_instance_of Boat, @kayak
  end
end