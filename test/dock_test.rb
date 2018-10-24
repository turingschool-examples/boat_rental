require 'minitest/autorun'
require './lib/dock'


class DockTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3)
  end
  def test_it_exists
    assert_instance_of Dock, @dock
  end
  def test_it_can_be_initialized_with_name
    assert_equal "The Rowing Dock", @dock.name
  end
  def test_it_can_be_initialized_with_max_rental_time
    assert_equal "The Rowing Dock", @dock.max_rental_time
  end
end
