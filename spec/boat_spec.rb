require './lib/boat'

RSpec.describe Boat do

  it "has readable attributes" do
    kayak = Boat.new(:kayak, 20)
    expect(kayak.type).to eq(:kayak)
    expect(kayak.price_per_hour).to eq(20)
  end

  it "can add hours to hours_rented" do
    kayak = Boat.new(:kayak, 20)
    expect(kayak.hours_rented).to eq(0)
    kayak.add_hour
    kayak.add_hour
    kayak.add_hour
    expect(kayak.hours_rented).to eq(3)
  end

end
