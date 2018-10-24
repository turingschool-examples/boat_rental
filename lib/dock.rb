class Dock
  attr_reader :name, :max_rental_time, :boats_rented

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @boats_rented = []
  end

  def rent(boat, renter)
    @boats_rented << boat
  end

  def return(boat)
    @boats_rented.delete(boat)
  end

  def log_hour
    @boats_rented
    @boats_rented.each do |boat|
      boat.add_hour
      boat.hours_rented
    end

  end

  def revenue

  end
end


# # Rent Boats out to first Renter
# pry(main)> dock.rent(kayak_1, patrick)
#
# pry(main)> dock.rent(kayak_2, patrick)
#
# pry(main)> dock.log_hour
#
# pry(main)> dock.rent(canoe, patrick)
#
# pry(main)> dock.log_hour
#
# pry(main)> dock.return(kayak_1)
#
# pry(main)> dock.return(kayak_2)
#
# pry(main)> dock.return(canoe)
#
# # Revenue thus far
# pry(main)> dock.revenue
# #=> 105
#
# # Rent Boats out to second Renter
# pry(main)> dock.rent(sup_1, eugene)
#
# pry(main)> dock.rent(sup_2, eugene)
#
# pry(main)> dock.log_hour
#
# pry(main)> dock.log_hour
#
# pry(main)> dock.log_hour
#
# # Any hours rented past the max rental time are not counted
# pry(main)> dock.log_hour
#
# pry(main)> dock.log_hour
#
# pry(main)> dock.return(sup_1)
#
# pry(main)> dock.return(sup_2)
#
# # Total revenue
# pry(main)> dock.revenue
# #=> 195
# ```
