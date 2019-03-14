class Boat
  attr_reader :type, :cost

  def initialize(type, cost)
    @type = type
    @cost = cost
    @hours = 0
  end

  def price_per_hour
    @cost
  end

  def hours_rented
    @hours
  end

  def add_hour
    @hours += 1
  end
end
