require './lib/boat'
require './lib/renter'
require './lib/dock'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RenterTest < Minitest::Test

  def test_it_exists
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_instance_of Renter, renter
  end

end

# 
# pry(main)> renter.name
# #=> "Patrick Star"
#
# pry(main)> renter.credit_card_number
# #=> "4242424242424242"
#
# pry(main)> dock = Dock.new("The Rowing Dock", 3)
# #=> #<Dock:0x00007fb5efb36148...>
#
# pry(main)> dock.name
# #=> "The Rowing Dock"
#
# pry(main)> dock.max_rental_time
# #=> 3
