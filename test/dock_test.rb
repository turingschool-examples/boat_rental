require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require 'pry'

class DockTest < Minitest::Test
  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

end
