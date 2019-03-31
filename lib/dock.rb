class Dock

  attr_reader :name, :max_rental_time, :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
      @rental_log[boat] = renter
  end

  def charge(boat)
    charge_result = {}
    charge_result[:card_number] = @rental_log[boat].credit_card_number
    hours_charged = boat.hours_rented
    hours_charged = @max_rental_time if boat.hours_rented >= @max_rental_time
    charge_result[:amount] = hours_charged * boat.price_per_hour
    charge_result
  end


end
