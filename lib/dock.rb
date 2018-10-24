class Dock
  attr_reader :name, :max_rental_time

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = 3
    @revenue = 0
    @boats = {}

  end

  def rent(boat,renter)
    @boats[boat] = renter
  end

  def log_hour
    @boats.each do |boat, renter|
        boat.add_hour
      end
  end

  def return(boat)
    boat
    # @boats.each do |boat, rented|
    #   boat.hours_rented = 0
    #   binding.pry
    # end
  end

  def revenue
    boat_array = @boats.map do |boat, renter|
      if boat.hours_rented > dock.max_rental_time
        boat.hours_rented == 3
       @revenue += boat.hours_rented * boat.price_per_hour
     end
     boat_array.last
  end

end


# def return(boat)
#   boat
# end
#




#max_rental_time = boat can't be charged for longer than this!

#dock charges the boat's price per hour for hours rented

#rent method: begins tracking boat.hours_rented

#return method: stops tracking boat.hours_rented

#log_hour : +1 hour for any boat thats not yet returned
