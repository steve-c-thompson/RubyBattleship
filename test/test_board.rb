require './lib/board'
require './lib/board_space'
require './lib/ship_state'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class BoardTests < MiniTest::Test

  def test_board_initialized_with_4_board_spaces_A14_to_D14
    board = Board.new
    board_spaces = board.board_spaces

    assert_equal(4, board_spaces.length)
    start = "A"
    board_spaces.each do |key, val|
      assert_equal(start, key)
      counter = 1
      val.each do |v|
        assert_equal( start + counter.to_s, v.position)
        assert_equal(BoardState::E, v.state)
        counter += 1
      end
      start.succ!
    end
  end

  def test_board_initialized_with_5_board_spaces_A15_to_E15
    board = Board.new(5)
    board_spaces = board.board_spaces

    assert_equal(5, board_spaces.length)
    start = "A"
    board_spaces.each do |key, val|
      #print "#{key} => #{val}"
      assert_equal(start, key)
      counter = 1
      val.each do |v|
        assert_equal( start + counter.to_s, v.position)
        assert_equal(BoardState::E, v.state)
        counter += 1
      end
      start.succ!
      #puts
    end
  end

  def test_is_valid_position_returns_true_for_ship_horizontal
    ship_pos = ["A1", "A2"]
    board = Board.new(4)
    assert(board.is_valid_position?(ship_pos))
  end

  def test_is_valid_position_returns_true_for_ship_vertical
    ship_pos = ["A1", "B1"]
    board = Board.new(4)
    assert(board.is_valid_position?(ship_pos))
  end

  def test_is_valid_position_returns_false_for_ship_out_of_bounds_right
    board = Board.new(4)
    ship_pos = ["A4", "A5"]
    refute(board.is_valid_position?(ship_pos))
  end

  def test_is_valid_position_returns_false_for_ship_out_of_bounds_bottom
    board = Board.new(4)
    ship_pos = ["D4", "E4"]
    refute(board.is_valid_position?(ship_pos))
  end

  def test_is_valid_position_returns_false_for_ship_not_continuous_horizontal
    board = Board.new(4)
    ship_pos = ["A1", "A3"]
    refute(board.is_valid_position?(ship_pos))
  end

  def test_is_valid_position_returns_false_for_ship_not_continuous_vertical
    board = Board.new(4)
    ship_pos = ["A1", "C1"]
    refute(board.is_valid_position?(ship_pos))
  end

  def test_is_valid_position_returns_false_for_ship_not_continuous_either
    board = Board.new(4)
    ship_pos = ["A1", "B2"]
    refute(board.is_valid_position?(ship_pos))
  end

  def test_is_valid_position_returns_false_for_spot_already_taken_vertical
    board = Board.new(4)
    board_spaces = board.board_spaces
    board_spaces["B"][0].state = BoardState::S
    refute(board.is_valid_position?(["A1", "B1"]))
    board_spaces["B"][0].state = BoardState::E

    board_spaces["A"][0].state = BoardState::H
    refute(board.is_valid_position?(["A1", "B1"]))

    board_spaces["A"][0].state = BoardState::M
    refute(board.is_valid_position?(["A1", "B1"]))
  end

  def test_is_valid_position_returns_false_for_spot_already_taken_horizontal
    board = Board.new(4)
    board_spaces = board.board_spaces
    board_spaces["A"][0].state = BoardState::S
    refute(board.is_valid_position?(["A1", "A2"]))
    board_spaces["A"][0].state = BoardState::E

    board_spaces["A"][1].state = BoardState::H
    refute(board.is_valid_position?(["A1", "A2"]))

    board_spaces["A"][1].state = BoardState::M
    refute(board.is_valid_position?(["A1", "A2"]))
  end

  def test_add_ship_adds_board_spaces_to_ship

  end

  def test_fire_at_position_returns_false_for_invalid_move
    board = Board.new(4)
    refute(board.fire_at_position("E1"))
    refute(board.fire_at_position("A5"))
  end

  def test_fire_at_position_returns_true_for_valid_move
    board = Board.new(4)
    assert(board.fire_at_position("A1"))
    assert(board.fire_at_position("D4"))
  end

  def test_fire_at_position_changes_board_state_to_hit_when_ship_present

  end

  def test_fire_at_position_changes_board_state_to_miss_when_ship_not_present

  end

end
