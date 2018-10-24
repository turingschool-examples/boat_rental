require 'minitest/autorun'
require './lib/dock'


class DockTest < Minitest::Test
  def setup
    @dock = Dock.new()
  end
  def test_it_exists
    assert_instance_of Dock, @dock
  end
end
