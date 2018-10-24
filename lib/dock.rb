class Dock

  attr_reader :name,
              :max_rental_time

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @total_revenue = 0
  end

  def rent(boat, renter)
    boat.rented_status = true
    @rented_boats << boat
  end

  def return(boat)
    boat.rented_status = false
    # @rented_boats.delete(boat)
  end

  def log_hour
    @rented_boats.each do |boat|
      if boat.rented_status == true
        boat.hours_rented += 1
      end
    end
  end

  def revenue
    @rented_boats.each do |boat|
      @total_revenue + (boat.hours_rented * boat.price_per_hour)
    end
    @total_revenue
  end

end
