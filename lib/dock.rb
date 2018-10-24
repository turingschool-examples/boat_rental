require './lib/boat'
class Dock
  attr_reader :name, :max_rental_time, :hours, :revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @hours = 0
  end


  def log_hour
    while @hours < @max_rental_time
      @hours += 1
    end
    @hours
  end

  def rent(boat, renter)
    log_hour
  end

  def charge_for_boat(boat)
    @revenue += boat.price_per_hour * @hours
    binding.pry
  end

  def return(boat)
    @hours = @hours
  end


end
