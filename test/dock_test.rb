require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/dock'

class MerchantTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3)
  end

  def test_it_exists
    assert_instance_of Dock, @dock
  end
end