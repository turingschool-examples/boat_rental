require './lib/boat'
class Dock
  attr_reader :name, :max_rental_time, :revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @hours = 0
  end


  def log_hour
    @hours += 1
    #this needs to be per boat
    #this is why my test isn't passing
    #i needed to use the boat methods for this
    #so that it could be per boat
    #probably not the instance variable hours
    #this method would need to come back
    #with hours per boat
    #probably needed and array of boats and
    #hours to iterate over and then
    #add to revenue
  end


  def rent(boat, renter)
    # if log_hour
      # boat.hours_rented += 1
    # end
    # for each boat, the hours need to be logged
    # i forgot about my boat methods. again.
    # once the boat is rented, the boat.hours rented
    # need to start adding up for that specific
    # boat. this has to do with log_hour
  end

  def charge_for_boat(boat)
    @revenue += boat.price_per_hour * @hours
  end


end
