class Dock
  attr_reader     :name,
                  :max_rental_time

  def initialize(name, max_time)
    @name            = name
    @max_rental_time = max_time
    @active_rentals  = []
    @active_renters  = []
    @return_boat     = []
    @total_charges   = Hash.new(0)
  end

  def rent(boat, renter)
    boat.rent_now
    @active_rentals << boat
    @active_renters << renter
  end

  def log_hour
    @active_rentals.each do |rental|
      rental.add_hour if rental.rented?
    end
  end

  def return(boat)
    if boat.hours_rented >= @max_rental_time
      @return_boat << boat
    end
  end

  def revenue
    total = @return_boat.map do |rental|
      if rental.hours_rented > @max_rental_time
        rental.price_per_hour * @max_rental_time
      else
        rental.price_per_hour * rental.hours_rented
      end
    end
    total.sum
  end

  def zippidy_do_da
    @active_renters.zip(@active_rentals)
  end

  def charges
    zippidy_do_da.each do |renter|
      @total_charges[renter.first.credit_card_number] = renter.last.price_per_hour * 3
    end
    @total_charges
    # require 'pry';binding.pry
  end
end
