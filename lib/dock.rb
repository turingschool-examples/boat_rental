
require 'pry'
class Dock
  attr_reader :name, :max_rental_time, :rented_boat, :renters
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boat = []
    @renters = []

  end



  def rent(boat, renter)
  @rented_boat << boat
  @renters << renter
  end


  def log_hour
    @rented_boat.each do |boat|
     boat.add_hour
   end
    total_hours = @rented_boat.map do |boat|
     boat.hours_rented
    end
     total_hours.sum
  end

end
