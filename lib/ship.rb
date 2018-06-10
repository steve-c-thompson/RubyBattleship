
class Ship
  attr_accessor :spaces

  def initialize(arr)
    #@spaces = Array.new(size){|i| :empty}
    # spaces will be filled with BoardSpaces on the board
    @spaces = arr.map do |i|
      BoardSpace.new(i, "S")
    end
  end

  def hit_space(space)
    @spaces.each do |sp|
      sp.state = "H" if sp.position == space
    end
  end

  def is_sunk
    not_hits = @spaces.select {|sp| sp.state != 'H'}
    not_hits.length == 0 
  end
end
