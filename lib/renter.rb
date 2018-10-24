class Renter
  attr_reader :name,
              :credit_card_number,
              :rented_boats

  def initialize(name, credit_card_number)
    @name = name
    @credit_card_number = credit_card_number
    @rented_boats =[]
  end

  def add_boat(boat)
    @rented_boats << boat
  end

end
