require './lib/dock'
require './lib/renter'
require './lib/boat'

RSpec.describe Dock do

  it "has readable attributes" do
    dock = Dock.new("The Rowing Dock", 3)
    expect(dock.name).to eq("The Rowing Dock")
    expect(dock.max_rental_time).to eq(3)
  end

  it "can rent a boat to a renter" do
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)
    expect(dock.rental_log.count).to eq(3)
    expected = {
      kayak_1 => patrick,
      kayak_2 => patrick,
      sup_1 => eugene
    }
    expect(dock.rental_log).to eq(expected)
    # require 'pry';binding.pry
  end

  it "can charge a renter for a boat" do
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)
    kayak_1.add_hour
    kayak_1.add_hour
    expected = {
      :credit_card_number => "4242424242424242",
      :amount => 40
    }
    expect(dock.charge(kayak_1)).to eq(expected)
    sup_1.add_hour
    sup_1.add_hour
    sup_1.add_hour
    sup_1.add_hour
    sup_1.add_hour
    expected2 = {
      :credit_card_number => "1313131313131313",
      :amount => 45
    }
    expect(dock.charge(sup_1)).to eq(expected2)
  end

  it "can log hours to all boats at once and return boats" do
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.log_hour
    expect(kayak_1.hours_rented).to eq(1)
    expect(kayak_2.hours_rented).to eq(1)
    dock.rent(canoe, patrick)
    dock.log_hour
    expect(kayak_1.hours_rented).to eq(2)
    expect(kayak_2.hours_rented).to eq(2)
    expect(canoe.hours_rented).to eq(1)
    expect(dock.revenue).to eq(0)
    dock.return(kayak_1)
    dock.return(kayak_2)
    dock.return(canoe)
    expect(dock.revenue).to eq(105)
    expect(dock.rental_log).to eq({})
    dock.rent(sup_1, eugene)
    dock.rent(sup_2, eugene)
    5.times do
      dock.log_hour
    end
    dock.return(sup_1)
    dock.return(sup_2)
    expect(dock.revenue).to eq(195)
    expect(dock.rental_log).to eq({})
  end
end
