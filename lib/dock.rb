class Dock
  attr_reader :name,
              :max_rental_time,
              :rental_log,
              :revenue

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
    charge_report = {}
    renter = @rental_log[boat]
    if boat.hours_rented > @max_rental_time
      boat.hours_rented = @max_rental_time
    end
    charged_amount = boat.price_per_hour * boat.hours_rented
    charge_report[:card_number] = renter.credit_card_number
    charge_report[:amount] = charged_amount
    charge_report
  end

  def log_hour
    @rental_log.each do |boat, renter|
      boat.add_hour
    end
  end

  def return(boat)
    @revenue += charge(boat)[:amount]
    @rental_log.delete(boat)
  end
end
