class Board

  attr_accessor :board_spaces

  def initialize(size=4)
    @board_spaces = {}
    start_char = "A"
    size.times do |i|
      arr = []
      size.times { |j| arr.push(BoardSpace.new(start_char + (j+1).to_s, :E ) ) }
      @board_spaces[start_char] = arr
      start_char.succ!
    end
  end

  def add_ship(ship)

  end

  def is_valid_position?(ship_position_array)
    return false if ship_position_array == nil
    return false if ship_position_array.length == 0

    start_row = nil
    start_col = nil
    horizontal = true
    ship_position_array.each_with_index do |pos, index|
      pos_arr = pos.split('')
      if index == 0
        start_row = pos[0]
        start_col = pos[1].to_i
      end
      # Check if position taken
      if(is_spot_taken(pos_arr[0], pos))
        return false
      end

      # General range check
      this_row = pos_arr[0]
      this_col =  pos_arr[1].to_i
      return false if (!in_row_range?(this_row))
      return false if !in_col_range?(this_col)

      next if index == 0

      #Continuous check
      if(pos_arr[0] != start_row)
        horizontal = false
      end

      # horizontal should be continuous columns
      if horizontal
        return false if (start_row != pos_arr[0])
        return false if (start_col + index) != this_col
      else
        # vertical should be continuous rows and in range
        return false if (start_col != pos_arr[1].to_i)
        # Get an ordinal value and add the index, then translate to a character
        expected_row = (start_row.ord + index).chr
        return false if (this_row != expected_row)
      end

    end

    return true
  end

  # Check the row for all data to see if the spot is not :E (empty)
  def is_spot_taken(start_row, start)
    row_data = @board_spaces[start_row]
    if (row_data != nil)
      row_data.each do |space|
        if space.position == start
          if(space.state != :E)
            return true
          else
            break
          end
        end
      end
    end
    return false
  end

  def in_row_range?(row)
    @board_spaces.key?(row)
  end

  def in_col_range?(col)
    col >= 1 && col <= @board_spaces.size
  end

  def display_obfuscated

  end

  def display_all

  end
end
