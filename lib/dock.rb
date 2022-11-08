class Dock
  attr_reader :name, :max_rental_time, :rental_log, :revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @revenue = 0
  end

  def rent(boat,renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    charge_hash = {
      :credit_card_number => @rental_log[boat].credit_card_number,
      :amount =>
      if boat.hours_rented <= max_rental_time
        boat.hours_rented * boat.price_per_hour
      else
        boat.price_per_hour * max_rental_time
      end
    }
  end

  def log_hour
    @rental_log.each do |boat, renter|
      boat.hours_rented += 1
    end
  end

  def return(boat)
    if boat.hours_rented <= max_rental_time
      @revenue += (boat.hours_rented * boat.price_per_hour)
    else
      @revenue += (boat.price_per_hour * max_rental_time)
    end
    @rental_log.delete(boat)
  end

end
