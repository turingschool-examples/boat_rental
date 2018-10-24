class Dock
  attr_reader :name, :max_rental_time, :rental_time
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue_multiplier = []
    @rental_time
  end

  def rent(boat, renter)
    @revenue_multiplier << boat.price_per_hour
    @rental_time = 0
  end

  def log_hour
    @rental_time += 1
  end

  def return(boat)
    if @rental_time >= @max_rental_time
      @max_rental_time
    else
      @rental_time
    end
  end

  def revenue
    revenue_array = @revenue_multiplier.map do |price_per_hour|
      price_per_hour * @rental_time
                      #^^^trying to use the return value of my 'return' method as a multiplier here but it kept failing"
    end
    revenue_array.sum
  end
end
