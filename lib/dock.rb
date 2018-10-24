require './lib/boat'
require './lib/renter'
require 'pry'

class Dock

attr_reader :name, :max_rental_time, :log_hour, :boats, :renters

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @log_hour = 0
    @boats = []
    @renters = []
  end

  def rent(boat, renters)
    @boats << boat
    if @renters.include?(renters)
    else
    @renters << renters
    end
  end

  def log_hour
    @boats.each do |boat|
      boat.add_hour
    end
  end

  def return(boat)
    @hours_rented = if boat.hours_rented > 3
      3
    else
    boat.hours_rented
    end
    @hours_rented
  end

  def revenue
    revenue = 0
    @boats.each do |boat|
      revenue = @price_per_hour * @rented_hours
    end
    revenue.sum
  end

end
