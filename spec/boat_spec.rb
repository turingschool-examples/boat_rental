require "./lib/boat"

describe Boat do

  before do
    @kayak = Boat.new(:kayak, 20)
  end

  it "has a type" do
    expect(@kayak.type).to eq(:kayak)
  end

  it "has a price per hour"
    expect(@kayak.price_per_hour).to eq(20)
  end

  it "starts with zero hours rented" do
    expect(@kayak.hours_rented).to eq(0)
  end

  context "add hours" do

    before do
      @kayak.add_hour
      @kayak.add_hour
      @kayak.add_hour
    end

    it "tracks rented hours" do
      expect(@kayak.hours_rented).to eq(3)
    end
  end
end
