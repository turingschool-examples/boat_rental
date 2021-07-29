class Dock
  attr_reader :name,
              :max_rental_time,
              :rental_log,
              :revenue

  def initialize(name, max_rental_time)
    @name             = name
    @max_rental_time  = max_rental_time
    @rental_log       = {}
    @revenue          = 0
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    payment = {}
    payment[:card_number] = @rental_log.fetch(boat).credit_card_number
    if boat.hours_rented < @max_rental_time
      payment[:amount] = boat.price_per_hour * boat.hours_rented
    else
      payment[:amount] = @max_rental_time * boat.price_per_hour
    end
    payment
  end

  def return(boat)
    @revenue += charge(boat).fetch(:amount)
    @rental_log.delete(boat)
  end

  def log_hour
    @rental_log.map do |boat|
      boat[0].add_hour
    end
  end
end
