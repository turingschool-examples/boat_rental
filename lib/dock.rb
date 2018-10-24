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
    if @hours < @max_rental_time
      @hours += 1
    end
    #this needs to be per boat
    #this is why my test isn't passing
  end

  def rent(boat, renter)

  end

  def charge_for_boat(boat)
    @revenue += boat.price_per_hour * @hours
  end


end
