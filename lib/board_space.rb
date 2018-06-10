class BoardSpace
  attr_accessor :position
  attr_accessor :state
  def initialize(position, state)
    @position = position
    @state = state
  end


  def ==(other)
    self.position == other.position &&
    self.state == other.state
  end


end
