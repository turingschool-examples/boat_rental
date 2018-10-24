class Dock

  attr_reader :name,
              :max_rental_time

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
  end

  def rent(boat, renter)
    boat.rented_status = true
  end

  def return(boat)
    boat.rented_status = false
  end

  def log_hour
    require 'pry';binding.pry
    if boat.rented_status == true
      boat.hours_rented += 1
    end
  end

#   When the Dock's rent method is called, it begins tracking
#    how long the Boat is rented for.
# When the Dock's return method is called, the Dock stops
# tracking how long the Boat is rented for.
# Every time the Dock's log_hour method is called, any
# Boat that has been rented but not returned is considered
# to have been rented an additional hour.

end
