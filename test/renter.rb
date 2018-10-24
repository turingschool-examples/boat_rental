## Iteration 2

# Use TDD to create a `Renter` and a `Dock` class that respond to the following interaction pattern:

require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require './lib/renter'
require './lib/dock'
require 'pry'

class RenterTest < Minitest::Test

  def test_it_exists
    renter = Renter.new("Patrick Star", "4242424242424242")
    assert_instance_of Renter, renter
  #=> #<Renter:0x00007fb5ef98b118...>
  end
  def test_it_can_have_a_name
    renter = Renter.new("Patrendick Star", "4242424242424242")
    assert_equal "Patrendick Star", renter.name
  #=> "Patrendick Star"
  end
  def test_it_can_have_a_credit_card
    renter = Renter.new("Patrendick Star", "4242424242424242")
    assert_equal "4242424242424242", renter.credit_card_number
  #=> "4242424242424242"
  end

end
