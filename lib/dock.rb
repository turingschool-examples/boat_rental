require "pry"
class Dock
  attr_reader :name, :max_rental_time, :renters, :boats, :boats_and_owners, :revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time =  max_rental_time
    @renters = []
    @boats = []
    @boats_and_owners = {}
    @revenue = 0
  end

  def rent(boat, renter)
    @boats << boat
    @renters << renter
    @boats_and_owners[renter] = boat
  end

  def log_hour
    @boats.delete_if do |boat|
      boat.hours_rented == @max_rental_time
    end

    @boats.each do |boat|
      @revenue += boat.cost
    end

    @boats.map do |boat|
      boat.add_hour
    end
  end

  def return(boat)
    delete_this_boat = @boats.find_index do |ship|
      ship == boat
    end
    @boats.delete_at(0)
  end

end
