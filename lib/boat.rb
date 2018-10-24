class Boat
  attr_reader :type,
              :price_per_hr,
              :hours_rented
  def initialize(type, price_per_hr)
    @type = type
    @price_per_hr = price_per_hr
    @hours_rented = 0
  end

end
