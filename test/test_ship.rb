require './lib/ship'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class ShipTest < MiniTest::Test
  def test_new_ship_with_array_size_creates_internal_array_of_empty
    ship = Ship.new(2)
    arr = ship.spaces
    assert_equal(2, arr.length)
    arr.each { |i| assert_equal(:empty, i) }
  end

  def test_hit_space_sets_space_to_hit

  end

  def test_is_sunk_returns_true_for_all_spaces_hit

  end

  def test_is_sunk_returns_false_for_one_space_empty

  end
end
