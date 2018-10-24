class Dock
  attr_reader :name, :max_rental_time
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @boats = []
    @revenue = 0
  end
end
