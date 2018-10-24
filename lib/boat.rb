class Boat
  attr_reader :type, :price_per_hour, :total_hours
  def initialize(type, price_per_hour)
    @type = type
    @price_per_hour = price_per_hour
    @total_hours
  end

  def hours_rented(time)
    @total_hours = time
  end

  def add_hour
    @total_hours += 1
  end
end
