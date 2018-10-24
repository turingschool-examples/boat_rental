class Dock
  attr_reader :name, :max_rental_time, :rented_boats, :revenue

  def initialize(name, max_rental_time )
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @revenue = 0
  end

  def rent(boat, person)
    @rented_boats << boat
  end

  def log_hour
    @rented_boats.each do |boat|
      boat.add_hour
    end
  end

  def return(boat)
    if boat.hours_rented >= max_rental_time
      charge = max_rental_time * boat.price_per_hour
    else
      charge = boat.hours_rented * boat.price_per_hour
    end
    @revenue += charge
    boat.reset_hours
    @rented_boats.delete_at(@rented_boats.index(boat))
  end

end
