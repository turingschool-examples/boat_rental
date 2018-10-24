class Dock
  
  attr_reader :name, :max_rental_time, :rented_boats
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
    @revenue += returned_boat[:boat].price_per_hour * returned_boat[:boat].hours_rented
    @rented_boats.delete(returned_boat)
  end
  
  def revenue
    @rented_boats.each do |r_boat|
      @revenue += r_boat[:boat].price_per_hour * r_boat[:boat].hours_rented
    end
    @revenue
  end
  
end