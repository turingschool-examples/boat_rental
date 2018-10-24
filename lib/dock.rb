class Dock
  attr_reader :name, :max_rental_time, :current_rentals

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @current_rentals = []
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
    @current_rentals.delete_if do |rental|
      rental[:boat] == boat
    end
  end
end