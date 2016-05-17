class Player

  attr_accessor :speed, :x, :y, :sprite

  PIT_OFFSET = 96

  def initialize(speed = 4)
    @sprite = Gosu::Image.new("graphics/smiley.gif")
    @speed = speed
    @x = @y = PIT_OFFSET
  end

  def move(direction)
    @x -= speed if direction == :left
    @x += speed if direction == :right
    @y -= speed if direction == :up
    @y += speed if direction == :down
  end

  def draw
    @sprite.draw(@x, @y, 0)
  end

end
