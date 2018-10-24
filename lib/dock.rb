class Dock
  attr_reader :name, :max_rental_time, :rentals

  def initialize(name, max_time)
    @name            = name
    @max_rental_time = max_time
    @rentals         = []
  end

  def rent(type,renter)
    @rentals << {:type=>type, :renter=>renter}
  end

  def log_hour
  @rentals.each do |rental|
    rental[0][:type].add_hour
    end
  end

  def return(type)
  end

  def revenue
  end

end
