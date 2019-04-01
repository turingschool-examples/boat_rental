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

    context "add canoe and log hour for kayaks" do

      before do
        @canoe = Boat.new(:canoe, 25)
        @dock.rent(@kayak_1, @patrick)
        @dock.rent(@kayak_2, @patrick)
        @dock.log_hour
        @dock.rent(@canoe, @patrick)
        @dock.log_hour
      end

      it "Does not generate revenue until the boats are returned" do
        expect(@dock.revenue).to eq(0)
      end

      context "Return boats and log hours past dock maximum" do
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
      end

      it "Calculates revenue with kayaks and canoe only" do
        expect(@dock.revenue).to eq(105)
      end

      it "Totals revenue for all rentals" do
        @dock.return(@sup_1)
        @dock.return(@sup_2)
        expect(@dock.revenue).to eq(195)
      end
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
