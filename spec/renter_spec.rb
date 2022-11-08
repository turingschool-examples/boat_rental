require './lib/renter'

RSpec.describe Renter do

  it "has readable attributes" do
    renter = Renter.new("Patrick Star", "4242424242424242")
    expect(renter.name).to eq("Patrick Star")
    expect(renter.credit_card_number).to eq("4242424242424242")
  end

end
