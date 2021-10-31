class Dock
  attr_reader :name, :max_rental_time, :rental_log, :revenue
  # attr_accessor :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @revenue = 0
  end

  def rent(rented_boat, renter)
    @rental_log[rented_boat] = renter
  end

  def charge(rented_boat)
    if rented_boat.hours_rented > max_rental_time
      amount = max_rental_time * rented_boat.price_per_hour
      @revenue += amount
    else
      amount = rented_boat.hours_rented * rented_boat.price_per_hour
      @revenue += amount
    end

    {
     card_number: @rental_log[rented_boat].credit_card_number,
     amount: amount
    }
  end

  def log_hour
    @rental_log.each_key do |boat|
      boat.add_hour
    end
  end

  def return(rented_boat)
    charge(rented_boat)
    rented_boat.hours_rented = 0
    @rental_log.delete(rented_boat)
  end
end