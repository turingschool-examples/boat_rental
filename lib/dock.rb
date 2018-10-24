require './lib/boat'
require './lib/renter'

class Dock
  attr_reader :name,
              :max_rental_time,
              :rented_boats,
              :renters
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @returned_boats = []
    @renters = {}
  end

  def rent(boat, renter)
    @rented_boats << boat
    if @renters.has_key?(renter)
      @renters[renter] << boat
    else
      @renters[renter] = [boat]
    end
  end

  def log_hour
    @rented_boats.each do |boat|
      boat.add_hour
    end
  end

  def return(boat)
    @returned_boats << @rented_boats.delete(boat)
  end

  def revenue
    total = []
    @returned_boats.each do |boat|
      if boat.hours_rented > @max_rental_time
        total << @max_rental_time * boat.price_per_hr
      else
        total << boat.hours_rented * boat.price_per_hr
      end
    end
    total.sum
  end

  def charges
    charges_by_card = {}
    @renters.each do |renter, boats|
      charges_by_card[renter.credit_card_number] => boats.map do |boat|
        if boat.hours_rented > @max_rental_time
          @max_rental_time * boat.price_per_hr
        else
          boat.hours_rented * boat.price_per_hr
        end
      end
    end
    
  end

end
