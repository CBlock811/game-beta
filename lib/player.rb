class Player

  attr_accessor :speed
  attr_accessor :x
  attr_accessor :y
  attr_accessor :sprite
  attr_accessor :rotation

  def initialize
    @sprite = Gosu::Image.new("graphics/smiley.gif")
    @x = @y = @rotation = 0
  end

  def turn(direction)
    @rotation = 90 if direction == :left
    @rotation = 270 if direction == :right
    @rotation = 180 if direction == :up
    @rotation = 0 if direction == :down
  end

  def draw
    @sprite.draw_rot(320/2, 600/2, 0, @rotation)
  end

end
