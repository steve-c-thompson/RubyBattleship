require './lib/ship'
require './lib/board_space'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class ShipTest < MiniTest::Test
  def test_new_ship_with_array_spaces_creates_internal_array_of_board_spaces
    ship = Ship.new(["A1", "A2"])
    arr = ship.spaces
    assert_equal(2, arr.length)
    counter = 1
    arr.each do |i|
      assert_equal(BoardSpace.new("A" + counter.to_s , "S"), i)
      counter += 1
    end
  end

  def test_hit_space_sets_space_to_hit
    ship = Ship.new(["A1", "A2"])
    ship.hit_space("A2")
    arr = ship.spaces
    assert_equal(arr[1].state, "H")
  end

  def test_is_sunk_returns_true_for_all_spaces_hit
    ship = Ship.new(["A1", "A2"])
    # hit twice
    ship.hit_space("A2")
    ship.hit_space("A1")
    assert(ship.is_sunk)
  end

  def test_is_sunk_returns_false_for_one_space_empty
    ship = Ship.new(["A1", "A2"])
    ship = Ship.new(["A1", "A2"])
    # hit once
    ship.hit_space("A2")
    refute(ship.is_sunk)
  end
end
