class Dock
  attr_reader :name, :max_rental_time

  def initialize(name, max_time)
    @name = name
    @max_rental_time = max_time
  end
end
