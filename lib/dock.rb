class Dock
  attr_reader :name, :max_rental_time, :current_rentals, :rental_history

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @current_rentals = []
    @rental_history = []
  end

  def rent(boat, renter)
    @current_rentals << {boat: boat, renter: renter}
  end

  def log_hour
    @current_rentals.each do |rental|
      boat = rental[:boat]
      boat.add_hour if boat.hours_rented < @max_rental_time
    end
  end
  
  def return(boat)
    @current_rentals.each do |rental|
      @rental_history << rental if rental[:boat] == boat
    end
    @current_rentals.delete(@rental_history.last)
  end
  
  def revenue
    @rental_history.reduce(0) do |revenue, rental|
      revenue += rental[:boat].price_per_hour * rental[:boat].hours_rented
      revenue
    end
  end
end