require "pry"
class Dock
  attr_reader :name, :max_rental_time, :renters, :boats, :boats_and_owners

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time =  max_rental_time
    @renters = []
    @boats = []
    @boats_and_owners = {}
  end

  def rent(boat, renter)
    @boats << boat
    @renters << renter
    @boats_and_owners[renter] = boat
  end


end
