class Dock
  attr_reader :name, :max_rental_time, :rented_boats, :charges,
              :total_hours_by_rental_type

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @charges = {}
    @total_hours_by_rental_type = {}
  end

  def rent(boat, renter)
    @rented_boats << {boat: boat, renter: renter}
  end

  def log_hour
    @rented_boats.each do |boat|
      boat[:boat].add_hour unless boat[:boat].hours_rented == @max_rental_time
      add_hours_to_boat_rental_history(boat[:boat])
    end
  end

  def add_hours_to_boat_rental_history(boat)
    if @total_hours_by_rental_type.has_key?(boat.type)
      @total_hours_by_rental_type[boat.type] += 1
    else
      @total_hours_by_rental_type[boat.type] = 1
    end
  end

  def hours_logged_by_boat(boat)
    boat.hours_rented
  end

  def rented?(boat)
    find_boat(boat) != nil
  end

  def find_boat(boat)
    selected_boat = @rented_boats.find do |rented_boat|
      rented_boat[:boat] == boat
    end
    selected_boat[:boat] unless selected_boat == nil
  end

  def return(boat)
    rental_cost = boat.hours_rented * boat.price_per_hour
    renter = find_renter(boat)
    remove_boat_from_rented_boats(boat)
    charge_credit_card(renter, rental_cost)
  end

  def find_renter(boat)
    selected_boat = @rented_boats.find do |rented_boat|
      rented_boat[:boat] == boat
    end
    selected_boat[:renter] unless selected_boat == nil
  end

  def charge_credit_card(renter, invoice_amount)
    card_number = renter.credit_card_number
    if @charges.has_key?(card_number)
      @charges[card_number] += invoice_amount
    else
      @charges[card_number] = invoice_amount
    end
  end

  def remove_boat_from_rented_boats(boat)
    boat.hours_rented = 0
    @rented_boats.delete_if do |rented_boat|
      rented_boat[:boat] == boat
    end
  end

  def revenue
    revenue = 0
    @charges.each_value do |value|
      revenue += value
    end
    revenue
  end

end
