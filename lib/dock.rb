class Dock
  attr_reader :name, :max_rental_time, :rented_boats, :revenue
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @revenue = 0
  end

  def rent(boat, renter)
    @rented_boats << boat
  end

  def log_hour
    @rented_boats.each do |boat|
      @revenue += boat.price_per_hour if boat.hours_rented < max_rental_time
      boat.hours_rented += 1
    end
  end

  def return(boat)
    return_boat = @rented_boats.find {|rented_boat| rented_boat == boat}
    return_boat.hours_rented = 0
    
    @rented_boats.delete(return_boat)
  end
end
