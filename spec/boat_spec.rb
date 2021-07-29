require './lib/boat'
require './lib/renter'

RSpec.describe do
  before(:each) do
    @kayak = Boat.new(:kayak, 20)
  end

  it 'exists' do
    expect(@kayak).to be_a(Boat)
  end

  it 'gives type' do
    expect(@kayak.type).to eq(:kayak)
  end

  it 'gives price per hour' do
    expect(@kayak.price_per_hour).to eq(20)
  end

  it 'gives hours rented' do
    expect(@kayak.hours_rented).to eq(0)
  end

  it 'adds hours' do
    @kayak.add_hour
    @kayak.add_hour
    @kayak.add_hour

    expect(@kayak.hours_rented).to eq(3)
  end
end
