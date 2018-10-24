require 'time'

class Dock
  attr_reader :name,
              :max_rental_time
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time

  end

  def rent(boat, renter)
    boat.start_time = 0


  end
end
