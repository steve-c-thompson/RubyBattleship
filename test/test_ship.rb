require './lib/ship'
require './lib/board_space'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class ShipTest < MiniTest::Test
  def test_new_ship_with_board_spaces_sets_each_to_state_S
    board_spaces = [BoardSpace.new("A1", :E), BoardSpace.new("A2", :E)]
    ship = Ship.new(board_spaces)
    arr = ship.spaces
    assert_equal(2, arr.length)
    assert_equal(board_spaces.length, arr.length)

    board_spaces.length.times do |i|
      assert_equal(board_spaces[i], arr[i])
    end
    assert_equal("S", board_spaces[0].state)
  end

  def test_hit_space_sets_space_to_hit
    board_spaces = [BoardSpace.new("A1", :E), BoardSpace.new("A2", :E)]
    ship = Ship.new(board_spaces)
    ship.hit_space("A2")
    arr = ship.spaces
    assert_equal(arr[1].state, :H)
  end

  def test_is_sunk_returns_true_for_all_spaces_H
    board_spaces = [BoardSpace.new("A1", :E), BoardSpace.new("A2", :E)]
    ship = Ship.new(board_spaces)
    # hit twice
    ship.hit_space("A2")
    ship.hit_space("A1")
    assert(ship.is_sunk)
  end

  def test_is_sunk_returns_false_for_one_space_empty
    board_spaces = [BoardSpace.new("A1", :E), BoardSpace.new("A2", :E)]
    ship = Ship.new(board_spaces)
    # hit once
    ship.hit_space("A2")
    refute(ship.is_sunk)
  end
end
