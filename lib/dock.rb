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
end
