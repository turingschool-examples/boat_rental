class Dock
  attr_reader :name, :max_rental_time

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
  end
end

# pry(main)> dock = Dock.new("The Rowing Dock", 3)
# #=> #<Dock:0x00007fb5efb36148...>
#
# pry(main)> dock.name
# #=> "The Rowing Dock"
#
# pry(main)> dock.max_rental_time
# #=> 3
# ```
