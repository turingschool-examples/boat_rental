require './lib/renter'

RSpec.describe Renter do
  let!(:renter) { Renter.new('Patrick Star', '4242424242424242') }

  describe '#initialize' do
    it 'exists' do
      expect(renter).to be_instance_of(Renter)
    end

    it 'has a name' do
      expect(renter.name).to eq('Patrick Star')
    end

    it 'has a credit card number' do
      expect(renter.credit_card_number).to eq('4242424242424242')
    end
  end
end