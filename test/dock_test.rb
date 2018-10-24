require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/dock'
require_relative '../lib/boat.rb'
require_relative '../lib/renter.rb'

class MerchantTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3)
  end

  def test_it_exists
    assert_instance_of Dock, @dock
  end

  def test_it_has_a_name
    assert_equal "The Rowing Dock", @dock.name
  end

  def test_it_has_a_max_rental_time
    assert_equal 3, @dock.max_rental_time
  end

  def test_it_has_no_current_rentals
    assert_equal [], @dock.current_rentals
  end

  def test_it_can_rent_boats_to_renters
    kayak_1 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    @dock.rent(kayak_1, patrick)

    assert_equal [{:boat=>kayak_1, :renter=>patrick}], @dock.current_rentals
  end
end