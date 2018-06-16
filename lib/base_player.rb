class BasePlayer
  attr_reader :ships
  attr_reader :name
  attr_reader :board
  def initialize(name, board, ships_arr)
    @name = name
    @board = board
    @ships = ships_arr
  end

=begin
  def place_ships()

  end
=end

  def select_opposing_board_position(opposing_board, position)
    # return true if the board changed
    opposing_board.fire_at_position(position)
  end

end
