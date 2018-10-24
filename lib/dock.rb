class Dock
  
  attr_reader :name, :max_rental_time, :rented_boats, :revenue
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @rented_boats = []
  end
  
  def rent(boat, renter)
    @rented_boats << {boat: boat, renter: renter}
  end
  
  def log_hour
    @rented_boats.each do |r_boat|
      r_boat[:boat].add_hour
    end
  end
  
  def return(boat)
    returned_boat = @rented_boats.find do |r_boat|
      r_boat[:boat] == boat
    end
    calculate_revenue(returned_boat[:boat])
    @rented_boats.delete(returned_boat)
  end
  
  def calculate_revenue(boat)
    if boat.hours_rented > @max_rental_time
      @revenue += boat.price_per_hour * @max_rental_time
    else
      @revenue += boat.price_per_hour * boat.hours_rented
    end
  end
  
end