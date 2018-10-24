class Renter
  attr_reader   :name,
                :credit_card_number
                
  def initialize(name, cc_number)
    @name               = name
    @credit_card_number = cc_number
  end
end
