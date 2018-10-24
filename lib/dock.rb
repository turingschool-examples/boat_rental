class Dock
  attr_reader :name, :max_rental_time, :rented_boats, :revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @revenue = 0
  end

  def rent(boat, person)
    @rented_boats << {boat: boat, person: person}
  end

  def log_hour
    @rented_boats.each do |boat|
      boat[:boat].add_hour unless boat[:boat].hours_rented == @max_rental_time
    end
  end

  def hours_logged_by_boat(boat)
    selected_boat = find_boat(boat)
    selected_boat.hours_rented
  end

  def rented?(boat)
    find_boat(boat) != nil
  end

  def return(boat)
    boat = find_boat(boat)
    @revenue += boat.hours_rented * boat.price_per_hour
    remove_boat_from_rented_boats(boat)

  end

  def find_boat(boat)
    selected_boat = @rented_boats.find do |rented_boat|
      rented_boat[:boat] == boat
    end
    selected_boat[:boat] unless selected_boat == nil
  end

  def remove_boat_from_rented_boats(boat)
    @rented_boats.delete_if do |rented_boat|
      rented_boat[:boat] == boat
    end
  end

end
