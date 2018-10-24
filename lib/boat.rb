class Boat
  attr_reader :type,
              :price_per_hour

  attr_accessor :rented_status, :hours_rented

  def initialize(type, price_per_hour)
    @type           = type
    @price_per_hour = price_per_hour
    @hours_rented   = 0
    @rented_status  = false
  end

  def add_hour
    @hours_rented += 1
  end

end
