class Dock
  attr_reader :name, :max_rental_time, :currently_rented_boats, :revenue
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @currently_rented_boats = []
    @revenue = 0
  end

  def rent(boat, renter)
    @currently_rented_boats << boat
  end

  def return(boat)
    @currently_rented_boats.delete(boat)
    @revenue += boat.hours_rented * boat.price_per_hour
  end

  def log_hour
    @currently_rented_boats.each do |boat|
      boat.add_hour unless boat.hours_rented >= @max_rental_time
    end
  end
end
