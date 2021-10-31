require './lib/renter'
require './lib/boat'
require './lib/dock'

RSpec.describe Dock do
  let!(:patrick) { Renter.new('Patrick Star', '4242424242424242') }
  let!(:eugene)  { Renter.new('Eugene Crabs', '1313131313131313') }
  let!(:kayak_1) { Boat.new(:kayak, 20) }
  let!(:kayak_2) { Boat.new(:kayak, 20) }
  let!(:canoe)   { Boat.new(:canoe, 25) }
  let!(:sup_1)   { Boat.new(:standup_paddle_board, 15) }
  let!(:sup_2)   { Boat.new(:standup_paddle_board, 15) }
  let!(:dock)    { Dock.new('The Rowing Dock', 3) }

  describe '#initialize' do
    it 'exists' do
      expect(dock).to be_instance_of(Dock)
    end

    it 'has a name' do
      expect(dock.name).to eq('The Rowing Dock')
    end

    it 'has a max rental time' do
      expect(dock.max_rental_time).to eq(3)
    end

    it 'has zero revenue initially' do
      expect(dock.revenue).to eq(0)
    end
  end

  describe '#rental_log' do
    it 'initially has no rentals in the log' do
      expect(dock.rental_log).to eq({})
    end
  end

  describe '#rent' do
    it 'can rent a specific boat to a renter' do
      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      dock.rent(sup_1, eugene)
      
      expected = {
                  kayak_1 => patrick,
                  kayak_2 => patrick,
                  sup_1 => eugene
                 }
      expect(dock.rental_log).to eq(expected)
    end
  end
  
  describe '#charge' do
    it 'can charge the card number of the rental for their rental time' do
      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      dock.rent(sup_1, eugene)
      kayak_1.add_hour
      kayak_1.add_hour
      
      expected = {
                  :card_number => '4242424242424242',
                  :amount => 40
                 }
      expect(dock.charge(kayak_1)).to eq(expected)
    end
    
    it "doesn't charge for hours over max rental time" do
      dock.rent(sup_1, eugene)
      sup_1.add_hour
      sup_1.add_hour
      sup_1.add_hour
      sup_1.add_hour
      sup_1.add_hour
      
      expected = {
                  :card_number => '1313131313131313',
                  :amount => 45
                 }
      expect(dock.charge(sup_1)).to eq(expected)      
    end
  end

  describe '#log_hour' do
    it 'can increase all rented boats by one hour' do
      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      dock.log_hour
      
      expect(kayak_1.hours_rented).to eq(1)
      expect(kayak_2.hours_rented).to eq(1)
    end
  end
  
  describe '#return' do
    it 'will charge customer card, remove renter and add value to revenue' do
      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      dock.log_hour
      dock.rent(canoe, patrick)    
      dock.log_hour

      expected = {
                  kayak_1 => patrick,
                  kayak_2 => patrick,
                  canoe => patrick
                 }
      expect(dock.rental_log).to eq(expected)
      expect(dock.revenue).to eq(0)

      dock.return(kayak_1)
      dock.return(kayak_2)
      dock.return(canoe)

      expect(dock.rental_log).to eq({})
      expect(dock.revenue).to eq(105)
    end

    it 'will not charge over hours to the value of revenue' do
      dock.rent(sup_1, eugene)
      dock.rent(sup_2, eugene)

      dock.log_hour
      dock.log_hour
      dock.log_hour
      dock.log_hour
      dock.log_hour
      dock.return(sup_1)
      dock.return(sup_2)

      expect(dock.revenue).to eq(90)
    end
  end
end