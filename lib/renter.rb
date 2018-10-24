class Renter
  attr_reader :name, :credit_card_number
  def initialize(name, credit_card_number)
    @name = name
    @credit_card_number = credit_card_number
  end

end


# pry(main)> renter.name
# #=> "Patrick Star"
#
# pry(main)> renter.credit_card_number
# #=> "4242424242424242"
#
# pry(main)> dock = Dock.new("The Rowing Dock", 3)
# #=> #<Dock:0x00007fb5efb36148...>
#
# pry(main)> dock.name
# #=> "The Rowing Dock"
#
# pry(main)> dock.max_rental_time
# #=> 3
# ```
