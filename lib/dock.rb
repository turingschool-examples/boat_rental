class Dock

  attr_reader :name,
              :max_rental_time

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @renters = {}
    @log_hour = 0
  end

  def rent(boat, renter)
    @renters[boat] = renter
    @renters
  end

  # def return(boat, renter)
  #   @renters.delete(boat)
  # end

  def log_hour
    @log_hour += 1
  end

#   When the Dock's rent method is called, it begins tracking
#    how long the Boat is rented for.
# When the Dock's return method is called, the Dock stops
# tracking how long the Boat is rented for.
# Every time the Dock's log_hour method is called, any
# Boat that has been rented but not returned is considered
# to have been rented an additional hour.




end
