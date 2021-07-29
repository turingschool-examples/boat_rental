require './lib/boat'
require './lib/renter'

RSpec.describe Renter do
  before(:each) do
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  it 'exists' do
    expect(@renter).to be_a(Renter)
  end

  it 'gives a name' do
    expect(@renter.name).to eq("Patrick Star")
  end

  it 'gives a credit_card_number' do
    expect(@renter.credit_card_number).to eq("4242424242424242")
  end
end
