class Dock

  attr_reader :name,
              :max_rental_time,
              :boat_inventory,
              :total_renters
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @boat_inventory = {}
    @total_renters = []
  end

  def add_boats_to_inventory(type)
    @boat_inventory[type] = type.price_per_hour
  end

  # def add_renter(renter)
  #   @total_renters << renter
  # end
  #
  # def rent(boat, renter)
  #   @log_hour = 0
  #   @boat_inventory.each do |boat|
  #     boat.
  # end

  def log_hour
    @log_hour += 1
  end
end
