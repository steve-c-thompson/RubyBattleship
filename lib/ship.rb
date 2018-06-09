class Ship
  attr_accessor :spaces

  def initialize(size)
    @spaces = Array.new(size){|i| :empty}
  end

  def hit_space(index)

  end
end
