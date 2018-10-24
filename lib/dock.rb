class Dock
  attr_reader :name,
              :max_rental_time,
              :renters

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @renters = []
  end

  def rent(boat, renter)
    person = @renters.find {|person| person.name == renter.name}
    if person
      person.add_boat(boat)
    else
      renter.add_boat(boat)
      @renters << renter
    end
  end

end
