class Board

  attr_accessor :board_spaces

  def initialize(size=4)
    @board_spaces = {}
    start_char = "A"
    size.times do |i|
      arr = []
      size.times { |j| arr.push(BoardSpace.new(start_char + (j+1).to_s, "E" ) ) }
      @board_spaces[start_char] = arr
      start_char.succ!
    end
  end

  def is_valid_position(ship_position_array)
    
  end

  def display

  end
end
