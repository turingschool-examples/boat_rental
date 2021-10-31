require './lib/renter'
require './lib/boat'

RSpec.describe Boat do
  let!(:kayak)   { Boat.new(:kayak, 20) }
  let!(:patrick) { Renter.new('Patrick Star', '4242424242424242') }

  describe 'attributes' do
    it 'exists' do
      expect(kayak).to be_instance_of(Boat)
    end

    it 'has a type' do
      expect(kayak.type).to eq(:kayak)
    end

    it 'has a price per hour' do
      expect(kayak.price_per_hour).to eq(20)
    end

    it 'initially has 0 hours rented' do
      expect(kayak.hours_rented).to eq(0)
    end
  end

  describe '#add_hour' do
    it 'can add hours incrementally to hours_rented time' do
      kayak.add_hour
      expect(kayak.hours_rented).to eq(1)
      kayak.add_hour
      expect(kayak.hours_rented).to eq(2)
      kayak.add_hour
      expect(kayak.hours_rented).to eq(3)
    end
  end
end