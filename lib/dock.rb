require 'pry'
class Dock
  attr_reader :name, :max_rental_time, :revenue, :rented_boats
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @rented_boats = []
  end

  def rent(boat, name)
    @rented_boats << {boat => name}
  end

  def log_hour
    @rented_boats.each do |boat|
      boat.keys[0].add_hour
    end
  end

  def return(boat)
  returned_boat = @rented_boats.find do |boat_pair|
      boat_pair.keys[0] == boat
    end
    hours_charged = 0
    if returned_boat.keys[0].hours_rented >= @max_rental_time
      hours_charged = @max_rental_time
    else
      hours_charged = returned_boat.keys[0].hours_rented
    end
    @revenue += hours_charged * returned_boat.keys[0].price_per_hour
    returned_boat.keys[0].reset_hours
    @rented_boats.delete(returned_boat)

  end
end
