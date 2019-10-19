class Boat
  attr_reader :type, :price_per_hour, :hours_rented
  attr_accessor :rented

  def initialize(type, price_per_hour)
    @type = type
    @price_per_hour = price_per_hour
    @hours_rented = 0
    @rented = false
  end

  def add_hour
    @hours_rented += 1
  end
end
