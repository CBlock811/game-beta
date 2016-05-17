class Player

  attr_accessor :speed, :x, :y, :sprite, :rotation, :window

  def initialize(window)
    @window = window
    @sprite = Gosu::Image.new("graphics/smiley.gif")
    @speed = 3
    @x = 500/2
    @y = 600/2
    @rotation = 0
  end

  def set_speed(speed)
    @speed = 9 if speed == :sprint
    @speed = 3 if speed == :walk
  end

  def turn(direction)
    @rotation = 90 if direction == :left
    @rotation = 270 if direction == :right
    @rotation = 180 if direction == :up
    @rotation = 0 if direction == :down
  end

  def move(direction)
    if direction == :left
      @x -= @speed unless @x <= @sprite.width/2
    end

    if direction == :right
      @x += @speed unless @x >= (@window.map.tileset.width - @window.width) - @sprite.width/2
    end

    if direction == :up
      @y -= @speed unless @y <= @sprite.height/2
    end

    if direction == :down
      @y += @speed unless @y >= (@window.map.tileset.height - @window.height) - @sprite.height/2
    end
  end

  def draw
    @sprite.draw_rot(@x, @y, 0, @rotation)
  end

end
