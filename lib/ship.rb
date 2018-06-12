
class Ship
  attr_accessor :spaces

  def initialize(arr)
    # spaces will be filled from BoardSpaces on the board
    @spaces = arr.map! do |s|
      s.state = :S
      s
    end
  end

  def hit_space(space)
    @spaces.each do |sp|
      sp.state = :H if sp.position == space
    end
  end

  def is_sunk
    not_hits = @spaces.select {|sp| sp.state != :H}
    not_hits.length == 0
  end
end
