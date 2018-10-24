class Dock
  attr_reader :name, :max_rental_time, :rented_boats, :revenue
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = Hash.new
    @revenue = 0
  end

  def rent(boat, renter)
    @rented_boats[boat] = renter
  end

  def log_hour
    rented_boats_array = @rented_boats.keys
    non_maxed_boats =
    rented_boats_array.select do |boat|
      boat.hours_rented < @max_rental_time
    end
    non_maxed_boats.each do |boat|
         boat.add_hour
    end
  end

  def return(boat)
    returned_boat =
    @rented_boats.delete_if do |boat_key, renter_value|
      boat_key == boat
    end
    if returned_boat
      @revenue += (boat.price_per_hour * boat.hours_rented)
    end
  end
end
