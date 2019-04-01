class Dock

  attr_reader :name, :max_rental_time, :rental_log, :revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @revenue = 0
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

  def return(boat)
    revenue_from_boat = charge(boat)
    @revenue += revenue_from_boat[:amount]
    @rental_log.delete(boat)
  end

  def log_hour
    @rental_log.each_key{|key| key.add_hour}
  end

end
