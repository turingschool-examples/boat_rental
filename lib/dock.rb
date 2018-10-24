class Dock
  attr_reader :name, :max_rental_time, :revenue, :rentals
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @rentals = {}
  end

  def rent(boat, renter)
    @rentals[boat] = renter
  end

  # def log_hour
  #   @rentals.each do |rental|
  #     rental.add_hour
  #     binding.pry
  #   end
  # end
end
