class Dock
  
  attr_reader :name, :max_rental_time, :rented_boats, :revenue, :all_boats
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @revenue = 0
    @rented_boats = []
    @all_boats = []
  end
  
  def rent(boat, renter)
    rentee = {boat: boat, renter: renter, charges: 0}
    @rented_boats << rentee
    @all_boats << rentee
  end
  
  def log_hour
    @rented_boats.each do |r_boat|
      r_boat[:boat].add_hour
    end
  end
  
  def return(boat)
    returned_boat = @rented_boats.find do |r_boat|
      r_boat[:boat] == boat
    end
    add_revenue(returned_boat[:boat])
    add_charges(returned_boat)
    @rented_boats.delete(returned_boat)
  end
  
  def add_revenue(boat)
    if boat.hours_rented > @max_rental_time
      @revenue += boat.price_per_hour * @max_rental_time
    else
      @revenue += boat.price_per_hour * boat.hours_rented
    end
  end
  
  def add_charges(boat)
    if boat[:boat].hours_rented > @max_rental_time
      boat[:charges] += boat[:boat].price_per_hour * @max_rental_time
    else
      boat[:charges] += boat[:boat].price_per_hour * boat[:boat].hours_rented
    end
  end
  
  def charges
    charges = Hash.new(0)
    @all_boats.each do |boat|
      charges[boat[:renter].credit_card_number] += boat[:charges]
    end
    charges
  end
end