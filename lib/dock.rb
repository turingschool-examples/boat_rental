require './lib/boat'
require './lib/renter'
require 'pry'

class Dock

attr_reader :name, :max_rental_time, :log_hour, :rented_boats

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @log_hour = 0
    @rented_boats = {}
  end

  def rent(boat, customer)
    @rented_boats[boat] = customer
  end

  def log_hour
    binding.pry
    @rented_boats[boat][hours_rented] += 1
  end

  def return(boat)
    hours = if boat.hours_rented > 3
      3
    else
    boat.hours_rented
    end
    hours
  end

  def revenue
    return(boat)
    revenue = @rented_boats.each do |boat|
      boat.price_per_hour * hours
    end
    revenue.sum
  end

end
