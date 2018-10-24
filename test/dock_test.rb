require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/dock'
require_relative '../lib/boat.rb'
require_relative '../lib/renter.rb'

class DockTest < Minitest::Test
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

  def test_it_can_log_time_for_boats_rented
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)    
    patrick = Renter.new("Patrick Star", "4242424242424242")

    @dock.rent(kayak_1, patrick)
    @dock.rent(kayak_2, patrick)

    @dock.log_hour

    assert_equal 1, @dock.current_rentals[0][:boat].hours_rented
    assert_equal 1, @dock.current_rentals[1][:boat].hours_rented

    @dock.log_hour

    assert_equal 2, @dock.current_rentals[0][:boat].hours_rented
    assert_equal 2, @dock.current_rentals[1][:boat].hours_rented
  end

  def test_it_can_return_rentals
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)     
    patrick = Renter.new("Patrick Star", "4242424242424242")

    @dock.rent(kayak_1, patrick)
    @dock.rent(kayak_2, patrick)

    @dock.return(kayak_1)

    assert_equal 1, @dock.current_rentals.count

    @dock.return(kayak_2)

    assert_equal 0, @dock.current_rentals.count
  end

  def test_it_does_not_charge_over_max_rental_time
    kayak_1 = Boat.new(:kayak, 20)
    patrick = Renter.new("Patrick Star", "4242424242424242")

    @dock.rent(kayak_1, patrick)
    5.times { @dock.log_hour }

    assert_equal 3, @dock.current_rentals[0][:boat].hours_rented
  end

  def test_it_can_track_revenue
    # Setup
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)    
    canoe = Boat.new(:canoe, 25)    
    sup_1 = Boat.new(:standup_paddle_board, 15)    
    sup_2 = Boat.new(:standup_paddle_board, 15)    
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")    

    # Rent Boats out to first Renter
    @dock.rent(kayak_1, patrick)
    @dock.rent(kayak_2, patrick)
    @dock.log_hour
    @dock.rent(canoe, patrick)
    @dock.log_hour
    @dock.return(kayak_1)
    @dock.return(kayak_2)
    @dock.return(canoe)
    # Revenue thus far
    assert_equal 105, @dock.revenue
    # Rent Boats out to second Renter
    @dock.rent(sup_1, eugene)
    @dock.rent(sup_2, eugene)
    3.times { @dock.log_hour }
    # Any hours rented past the max rental time are not counted
    2.times { @dock.log_hour }
    @dock.return(sup_1)
    @dock.return(sup_2)
    # Total revenue
    assert_equal 195, @dock.revenue
  end

end