require './lib/boat'
require './lib/renter'
require './lib/dock'

RSpec.describe Dock do
  before(:each) do
    @dock     = Dock.new("The Rowing Dock", 3)

    @kayak_1  = Boat.new(:kayak, 20)
    @kayak_2  = Boat.new(:kayak, 20)
    @canoe    = Boat.new(:canoe, 25)
    @sup_1    = Boat.new(:standup_paddle_board, 15)
    @sup_2    = Boat.new(:standup_paddle_board, 15)

    @patrick  = Renter.new("Patrick Star", "4242424242424242")
    @eugene   = Renter.new("Eugene Crabs", "1313131313131313")
  end

  it 'exists' do
    expect(@dock).to be_a(Dock)
  end

  it 'gives a name' do
    expect(@dock.name).to eq("The Rowing Dock")
  end

  it 'gives a max rental time' do
    expect(@dock.max_rental_time).to eq(3)
  end

  it 'rents out boats' do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)

    expect(@dock.rental_log).to eq(
      @kayak_1  => @patrick,
      @kayak_2  => @patrick,
      @sup_1    => @eugene
    )
  end

  it 'charges for boats' do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)

    @kayak_1.add_hour
    @kayak_1.add_hour

    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour

    expect(@dock.charge(@kayak_1)).to eq(
      :card_number  => @patrick.credit_card_number,
      :amount       => 40
    )

    expect(@dock.charge(@sup_1)).to eq(
      :card_number  => @eugene.credit_card_number,
      :amount       => 45
    )
  end

  it 'has revenue' do
    expect(@dock.revenue).to eq (0)
  end

  describe 'revenue process' do
    before(:each) do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)

      @dock.log_hour

      @dock.rent(@canoe, @patrick)

      @dock.log_hour
    end

    it 'waits until return to charge' do
      expect(@dock.revenue).to eq(0)
    end

    it 'tracks revenue' do
      @dock.return(@kayak_1)
      @dock.return(@kayak_2)
      @dock.return(@canoe)

      expect(@dock.revenue).to eq(105)
    end

    it 'tracks revenue from multiple renters' do
      @dock.return(@kayak_1)
      @dock.return(@kayak_2)
      @dock.return(@canoe)

      @dock.rent(@sup_1, @eugene)
      @dock.rent(@sup_2, @eugene)

      @dock.log_hour
      @dock.log_hour
      @dock.log_hour
      @dock.log_hour
      @dock.log_hour

      @dock.return(@sup_1)
      @dock.return(@sup_2)

      expect(@dock.revenue).to eq(195)
    end
  end
end
