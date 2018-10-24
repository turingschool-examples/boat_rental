require './lib/boat'
require './lib/dock'
require './lib/renter'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class DockTest < Minitest::Test

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_it_has_a_name
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
  end

end

# pry(main)> dock.name
# #=> "The Rowing Dock"
#
# pry(main)> dock.max_rental_time
# #=> 3
