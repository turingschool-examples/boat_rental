class Dock
  attr_reader :name, :max_rental_time, :revenue
  def initialize(name, max_rental_time)
    @boats_being_rented = {}
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @charges = {}
  end
  def rent(boat, renter)
    @boats_being_rented[boat] = renter
  end
  def log_hour
    @boats_being_rented.each do |boat, renter|
      boat.add_hour unless boat.hours_rented >= @max_rental_time
    end
  end
  def return(boat)
    credit_card_number = @boats_being_rented[boat].credit_card_number
    amount_charged = boat.hours_rented * boat.price_per_hour
    @charges[credit_card_number] = amount_charged
    @revenue += amount_charged
    @boats_being_rented.delete(boat)
  end
end
