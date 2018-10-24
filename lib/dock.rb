require './lib/boat'
require './lib/renter'

class Dock
  attr_reader :name,
              :max_rental_time,
              :rented_boats,
              :renters,
              :charges
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @renters = []
    @charges = []
  end

  def rent(boat, renter)
    @rented_boats << boat
    @renters << renter
  end

  def log_hour
    @rented_boats.each do |boat|
      boat.add_hour
    end
  end

  def return(boat)
    if boat.hours_rented > @max_rental_time
      @charges << @max_rental_time * boat.price_per_hr
    else
      @charges << boat.hours_rented * boat.price_per_hr
    end
    @rented_boats.delete(boat)
  end

end
