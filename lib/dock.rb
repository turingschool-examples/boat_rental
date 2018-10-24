class Dock
  attr_reader :name, :max_rental_time, :rented_boats, :revenue
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @revenue = 0
    @charges = {}
  end

  def rent(boat, renter)
    @rented_boats << {boat: boat, renter_card_info: renter.credit_card_number}
  end

  def log_hour
    @rented_boats.each do |boat_hash|
      if boat_hash[:boat].hours_rented < max_rental_time
        @revenue += boat_hash[:boat].price_per_hour
      end
      boat_hash[:boat].hours_rented += 1
    end
  end

  def return(boat)
    return_boat = @rented_boats.find do |rented_boat_hash|
      rented_boat_hash[:boat] == boat
    end

    update_charges(return_boat)
    return_boat[:boat].hours_rented = 0

    @rented_boats.delete(return_boat)
  end

  def update_charges(return_boat)
    renter_card_number, boat = return_boat[:renter_card_info], return_boat[:boat]
    
    @charges[new_charge[]]
  end
end
