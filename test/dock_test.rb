require './lib/boat'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class DockTest < Minitest::Test

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

end

# pry(main)>
# #=> #<Dock:0x00007fb5efb36148...>
#
# pry(main)> dock.name
# #=> "The Rowing Dock"
#
# pry(main)> dock.max_rental_time
# #=> 3
