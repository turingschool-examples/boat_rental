class Boat

  attr_reader :type, :price_per_hour

  def initialize(type, price)
    @type           = type
    @price_per_hour = price
  end
end
