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

  def test_it_has_a_name
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_equal "Patrick Star", renter.name
  end

  def test_it_has_a_credit_card
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_equal "4242424242424242", renter.credit_card_number
  end

end

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
