class Dock

  attr_reader :name, :max_rental_time, :boat_inventory
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @boat_inventory = []
  end

  def add_boats_to_inventory(boat)
    @boat_inventory << boat
  end

end
