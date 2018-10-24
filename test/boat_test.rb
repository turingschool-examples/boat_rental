require 'minitest/autorun'
require "minitest/pride"
require './lib/boat'

class BoatTest < MiniTest::Test
 def test_it_exists
   kayak = Boat.new(:kayak, 20)
   assert_instance_of Boat, kayak
 end

 def test_it_can_return_its_type_and_price
   kayak = Boat.new(:kayak, 20)
   assert_equal :kayak, kayak.type
   assert_equal 20, kayak.price_per_hour
 end

 def test_hours_rented_start_at_0
   kayak = Boat.new(:kayak, 20)
   assert_equal 0, kayak.hours_rented
 end

 def test_hours_rented_can_be_added
   kayak = Boat.new(:kayak, 20)
   kayak.add_hour
   kayak.add_hour
   kayak.add_hour
   assert_equal 3, kayak.hours_rented
 end

end
