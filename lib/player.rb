class Player

  attr_accessor :speed
  attr_accessor :x
  attr_accessor :y
  attr_accessor :sprite

  def initialize(speed = 3)
    @sprite = Gosu::Image.new("graphics/smiley.gif")
    @speed = speed
    @x = @y = 0
  end

  def move(direction)
    # @x -= speed if direction == :left
    # @x += speed if direction == :right
    # @y -= speed if direction == :up
    # @y += speed if direction == :down
  end

  def draw
    @sprite.draw_rot(320/2, 600/2, 0, 0)
  end

end
