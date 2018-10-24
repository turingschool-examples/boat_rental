class Dock

  attr_accessor :name,
                :max_rental_time,
                :revenue,
                :active_boat_hours_rented,
                :in_the_water

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @active_boat_hours_rented = 0
    @in_the_water = []
  end

  def rent(boat, renter)
    @in_the_water << boat
  end

  def log_hour
    @active_boat_hours_rented += 1
    if @active_boat_hours_rented <= @max_rental_time
      summed_hours = @in_the_water.sum {|boat| boat.price_per_hour }
      @revenue += summed_hours
    end
  end


  def return(boat)
    @in_the_water.delete(boat)
    if @in_the_water.count == 0
      @active_boat_hours_rented = 0
    end
  end



end
