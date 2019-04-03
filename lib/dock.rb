require './lib/boat'
require './lib/renter'

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
    renter = @rental_log[boat]
    hours_charged = [boat.hours_rented, @max_rental_time].min
    charge_hash = {}
    charge_hash[:card_number] = renter.credit_card_number
    charge_hash[:amount] = hours_charged * boat.price_per_hour
    charge_hash
  end

  def log_hour
    @rental_log.each do |boat, renter|
      boat.add_hour
    end
  end

  def return(boat)
    @rental_log.delete(boat)
  end
end
