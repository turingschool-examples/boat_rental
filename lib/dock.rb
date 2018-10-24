require './lib/boat'
require './lib/renter'

class Dock
  attr_reader :name,
              :max_rental_time
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
  end

  def rent(boat, renter)
    @rented_boats << [boat, boat.hours_rented, renter]
  end

  def return(boat)
    
  end

end
