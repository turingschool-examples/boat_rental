class Dock
  attr_reader :name, :max_rental_time, :rented_boats

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = Hash.new
  end

  def rent(boat, renter)
    @rented_boats[boat] = renter
  end

  def log_hour
    add_hour_array = @rented_boats.keys
    add_hour_array.each do |boat|
      boat.add_hour
    end
  end

  def return(boat, renter)
    @rented_boats.delete_if do |boat_key, renter_value|
      boat_key == boat && renter_value == renter
    end
  end
end
