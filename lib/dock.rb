class Dock

  attr_accessor :name, :max_rental_time, :revenue, :service_hours, :in_the_water

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @in_the_water = []

  end

  def rent(boat, renter)
    @in_the_water << boat
  end

  def log_hour
    summed_hours = @in_the_water.sum {|boat| boat.price_per_hour }
    @revenue += summed_hours
  end


  def return(boat)
    @in_the_water.delete(boat)
  end



end
