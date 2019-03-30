require "./lib/renter"

describe Renter do

  before do
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  it "has a name" do
    expect(@renter.name)to eq("Patrick Star")
  end

  it "has a credit card number" do
    expect(@renter.credit_card_number).to eq("4242424242424242")
  end

end
