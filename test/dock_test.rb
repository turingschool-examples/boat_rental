require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/boat'
require './lib/renter'

class DockTest < Minitest::Test
    
    def test_it_exsists
      dock = Dock.new("The Rowing Dock", 3)
      assert_instance_of Dock, dock
    end
    
    def test_it_has_a_name
      dock = Dock.new("The Rowing Dock", 3)
      assert_equal "The Rowing Dock", dock.name
    end
    
    def test_it_has_a_max_rental_time
      dock = Dock.new("The Rowing Dock", 3)
      assert_equal 3, dock.max_rental_time
    end
    
    def test_it_starts_with_zero_revenue
      dock = Dock.new("The Rowing Dock", 3)
      assert_equal 0, dock.revenue
    end
    
    def test_it_can_calculate_revenue
      dock = Dock.new("The Rowing Dock", 3)
      kayak_1 = Boat.new(:kayak, 20)
      kayak_2 = Boat.new(:kayak, 20)    
      canoe = Boat.new(:canoe, 25)    
      sup_1 = Boat.new(:standup_paddle_board, 15)    
      sup_2 = Boat.new(:standup_paddle_board, 15)    
      patrick = Renter.new("Patrick Star", "4242424242424242")
      eugene = Renter.new("Eugene Crabs", "1313131313131313")  
      
      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      dock.log_hour
      dock.rent(canoe, patrick)
      dock.log_hour
      dock.return(kayak_1)
      dock.return(kayak_2)
      dock.return(canoe)
      assert_equal 105, dock.revenue
    end
    
  
end
