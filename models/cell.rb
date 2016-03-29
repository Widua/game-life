class Cell
  attr_accessor :x, :y, :living

  def initialize(x, y)
    @x = x
    @y = y
    @living = false
  end

  def toggle!
    @living = !living
  end
end
