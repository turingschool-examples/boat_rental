require "./lib/renter"
require "./lib/boat"
require "./lib/dock"

describe Dock do

  before do
    @dock = Dock.new("The Rowing Dock", 3)
  end

  it "has a name" do
    expect(@dock.name).to eq("The Rowing Dock")
  end

  it "has a maximum rental time" do
    expect(@dock.max_rental_time).to eq(3)
  end

  context "add boats and renters" do

    before do
      @kayak_1 = Boat.new(:kayak, 20)
      @kayak_2 = Boat.new(:kayak, 20)
      @sup_1 = Boat.new(:standup_paddle_board, 15)
      @patrick = Renter.new("Patrick Star", "4242424242424242")
      @eugene = Renter.new("Eugene Crabs", "1313131313131313")
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
    end

    it "has a rental log" do
      expected = {
        @kayak_1 => @patrick,
        @kayak_2 => @patrick,
        @sup_1 => @eugene,
      }

      expect(@dock.rental_log).to eq(expected)
    end

    context "add time before testing charge method" do

      before do
        @kayak_1.add_hour
        @kayak_1.add_hour
        @sup_1.add_hour
        @sup_1.add_hour
        @sup_1.add_hour
        @sup_1.add_hour
        @sup_1.add_hour
      end

      it "has a charge method" do
        expected = {:card_number => "4242424242424242", :amount => 40}

        expect(@dock.charge(@kayak_1)).to eq(expected)
      end

      it "ignores the time over the dock maximum" do
        expected = {:card_number => "1313131313131313", :amount => 45}

        expect(@dock.charge(@sup_1)).to eq(expected)
      end
    end
  end
end
