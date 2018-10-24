require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/boat'
require './lib/renter'
require 'pry'

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
    
    def test_it_can_rent_out_boats
      dock = Dock.new("The Rowing Dock", 3)
      kayak_1 = Boat.new(:kayak, 20)
      patrick = Renter.new("Patrick Star", "4242424242424242")
      dock.rent(kayak_1, patrick)
      assert_equal [{boat: kayak_1, renter: patrick}], dock.rented_boats 
    end
    
    def test_it_can_log_hours_for_rented_boats
      dock = Dock.new("The Rowing Dock", 3)
      kayak_1 = Boat.new(:kayak, 20)
      patrick = Renter.new("Patrick Star", "4242424242424242")
      dock.rent(kayak_1, patrick)
      dock.log_hour
      assert_equal 1, kayak_1.hours_rented
    end
    
    def test_it_can_return_rented_boats
      dock = Dock.new("The Rowing Dock", 3)
      kayak_1 = Boat.new(:kayak, 20)
      patrick = Renter.new("Patrick Star", "4242424242424242")
      dock.rent(kayak_1, patrick)
      dock.return(kayak_1)
      assert_equal [], dock.rented_boats
    end
    
    
    def test_it_can_calculate_revenue
      dock = Dock.new("The Rowing Dock", 3)
      kayak_1 = Boat.new(:kayak, 20)
      kayak_2 = Boat.new(:kayak, 20)    
      canoe = Boat.new(:canoe, 25)    
  
      patrick = Renter.new("Patrick Star", "4242424242424242")
      
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
    
    def test_it_can_calculate_revenue_when_over_max_rental_time
      dock = Dock.new("The Rowing Dock", 3)
      kayak_1 = Boat.new(:kayak, 20)
      kayak_2 = Boat.new(:kayak, 20)    
      canoe = Boat.new(:canoe, 25)  
      patrick = Renter.new("Patrick Star", "4242424242424242")
      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      dock.log_hour
      dock.rent(canoe, patrick)
      dock.log_hour
      dock.return(kayak_1)
      dock.return(kayak_2)
      dock.return(canoe)
      sup_1 = Boat.new(:standup_paddle_board, 15)
      sup_2 = Boat.new(:standup_paddle_board, 15)  
      eugene = Renter.new("Eugene Crabs", "1313131313131313")
      dock.rent(sup_1, eugene)
      dock.rent(sup_2, eugene)
      dock.log_hour
      dock.log_hour
      dock.log_hour
      # Any hours rented past the max rental time are not counted
      dock.log_hour
      dock.log_hour
      dock.return(sup_1)
      dock.return(sup_2)
      
      assert_equal 195, dock.revenue
    end
    
  
end
