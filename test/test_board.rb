require './lib/board'
require './lib/board_space'
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
      print "#{key} => #{val}"
      assert_equal(start, key)
      counter = 1
      val.each do |v|
        assert_equal( start + counter.to_s, v.position)
        assert_equal("E", v.state)
        counter += 1
      end
      start.succ!
      puts
    end
  end

  def test_is_valid_position_returns_true_for_ship_l_to_r

  end

  def test_is_valid_position_returns_true_for_ship_top_to_bottom

  end

  def test_is_valid_position_returns_false_for_ship_off_right_side

  end

  def test_is_valid_position_returns_false_for_ship_off_left_side

  end

  def test_is_valid_position_returns_false_for_ship_off_bottom

  end

  def test_is_valid_position_returns_false_for_ship_not_continuous

  end

end
