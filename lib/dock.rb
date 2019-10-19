class Dock
  attr_reader :name, :max_rental_time, :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
    boat.rented = true
  end

  def total_rental_price(boat)
    boat.price_per_hour * chargeable_hours(boat)
  end

  def chargeable_hours(boat)
    if boat.hours_rented < @max_rental_time
      boat.hours_rented
    else
      @max_rental_time
    end
  end

  def renter_card(boat)
    @rental_log[boat].credit_card_number
  end

  def charge(boat)
    {card_number: renter_card(boat),
    amount: total_rental_price(boat)}
  end

  def return(boat)
    boat.rented = false
  end

  def rented_boats
    @rental_log.keys.find_all do |boat|
      boat.rented
    end
  end

  def log_hour
    rented_boats.each do |boat|
      boat.add_hour
    end
  end

  def revenue
    @rental_log.sum do |boat, renter|
      unless boat.rented
        charge(boat)[:amount]
      else
        0
      end
    end
  end
end
