require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require 'pry'

class DockTest < Minitest::Test
  def test_a_dock_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_a_dock_has_a_name
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
  end

  def test_a_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 3, dock.max_rental_time
  end
end
