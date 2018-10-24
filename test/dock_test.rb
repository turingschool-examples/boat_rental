require 'minitest/autorun'
require 'minitest/pride'
require "./lib/dock"

class DockTest < Minitest::Test

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_it_has_attributes
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

end
