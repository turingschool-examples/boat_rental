require 'pry'
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
    @rental_time
  end

  def revenue
    revenue_array = @revenue_multiplier.map do |price_per_hour|
      price_per_hour * @rental_time
    end
    revenue_array.sum
  end
end
