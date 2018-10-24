class Dock
  attr_reader     :name,
                  :max_rental_time

  def initialize(name, max_time)
    @name            = name
    @max_rental_time = max_time
    @active_rentals  = []
    @active_renters  = []
    @return_boat     = []
  end

  def rent(boat, renter)
    boat.rent_now
    @active_rentals << boat
    @active_renters << renter
  end

  def log_hour
    @active_rentals.each do |rental|
      rental.add_hour if rental.rented?
    end
  end

  def return(boat)
    if boat.hours_rented >= @max_rental_time
      @return_boat << boat
    end
  end

  def revenue
    total = @active_rentals.map do |rental|
      if rental.hours_rented > @max_rental_time
        rental.price_per_hour * @max_rental_time
      else
        rental.price_per_hour * rental.hours_rented
      end
    end
    total.sum
    # require 'pry';binding.pry
  end

end
