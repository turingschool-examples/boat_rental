require './lib/boat'
require './lib/renter'
require './lib/dock'
require 'minitest/autorun'
require 'minitest/pride'

class DockTest < Minitest::Test

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)

    assert_instance_of Dock, dock
  end

  def test_for_name
    dock = Dock.new("The Rowing Dock", 3)
     assert_equal "The Rowing Dock", dock.name
  end

  def test_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 3, dock.max_rental_time
  end




end
