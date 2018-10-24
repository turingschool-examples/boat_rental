class Dock
  attr_reader :name, :max_rental_time, :revenue, :rented_boats
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @rented_boats = []
  end

  def rent(boat, name)
    @rented_boats << boat
  end

  def log_hour
    @rented_boats.each do |boat|
      boat.add_hour
    end
  end

  def return(boat)
    hours_charged = 0
    if boat.hours_rented >= @max_rental_time
      hours_charged = @max_rental_time
    else
      hours_charged = boat.hours_rented
    end
    @revenue += hours_charged * boat.price_per_hour
    boat.reset_hours
    @rented_boats.delete(boat)
  end
end
