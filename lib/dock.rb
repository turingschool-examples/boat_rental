class Dock
  attr_reader :name, :max_rental_time, :rentals

  def initialize(name, max_time)
    @name            = name
    @max_rental_time = max_time
    @rentals         = []
  end

  def rent(type, renter)

  end

  def log_hour
  end

  def return(type)
  end

  def revenue
  end

end
