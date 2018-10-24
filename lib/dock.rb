class Dock
  attr_reader :name, :max_rental_time, :currently_rented_boats,
              :revenue, :total_hours_by_rental_type, :charges
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @currently_rented_boats = []
    @revenue = 0
    @total_hours_by_rental_type = Hash.new(0)
    @rentals_by_ccn = Hash.new([])
    @charges = Hash.new(0)
  end

  def rent(boat, renter)
    @rentals_by_ccn[boat] = renter.credit_card_number
    @currently_rented_boats << boat
  end

  def return(boat)
    @currently_rented_boats.delete(boat)
    price = boat.hours_rented * boat.price_per_hour
    @revenue += price
    @charges[@rentals_by_ccn[boat]]  += price
  end

  def log_hour
    @currently_rented_boats.each do |boat|
      boat.add_hour unless boat.hours_rented >= @max_rental_time
      @total_hours_by_rental_type[boat.type] += 1
    end
  end
end
