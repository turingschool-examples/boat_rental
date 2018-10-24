class Boat

  attr_reader :type, :price_per_hour, :hours_rented

  def initialize(type, price)
    @type           = type
    @price_per_hour = price
    @hours_rented   = 0
  end
end
