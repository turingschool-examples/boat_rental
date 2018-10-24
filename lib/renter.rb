require 'pry'

class Renter

  attr_reader :name, :credit_card_number

  def initialize(name, cc)
    @name               = name
    @credit_card_number = cc
  end

end
