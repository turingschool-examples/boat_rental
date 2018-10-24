require 'minitest/autorun'
require 'minitest/pride'

require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @dock = Dock.new("The Rowing Dock", 3)
  end

  def test_it_exists
    assert_instance_of Dock, @dock
  end

  def test_it_has_a_name
    assert_equal "The Rowing Dock", dock.name
  end

  def test_it_has_a_max_rental_time
    assert_equal 3, dock.max_rental_time
  end
end
