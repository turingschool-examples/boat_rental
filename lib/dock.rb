class Dock
  attr_reader :name,
              :max_rental_time,
              :rental_log

  def initialize(name, max_rental_time)
    @name             = name
    @max_rental_time  = max_rental_time
    @rental_log       = {}
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
end
