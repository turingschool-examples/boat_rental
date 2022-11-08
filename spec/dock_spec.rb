require './lib/dock'
require './lib/renter'
require './lib/boat'

RSpec.describe Dock do

  it "has readable attributes" do
    dock = Dock.new("The Rowing Dock", 3)
    expect(dock.name).to eq("The Rowing Dock")
    expect(dock.max_rental_time).to eq(3)
  end

end
