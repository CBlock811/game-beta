require_relative './movement_determiner'

class Map

  include MovementDeterminer

  attr_accessor :speed, :x, :y, :tileset, :window

  def initialize(window)
    @window = window
    @tileset = Gosu::Tiled.load_json(window, 'maps/terrain.json')
    @speed = 3
    @x = @y = 0
  end

  def set_speed(speed)
    @speed = 9 if speed == :sprint
    @speed = 3 if speed == :walk
  end

  def move(direction)
    self.can_move?(direction)

    if direction == :left
      @x -= @speed
    end

    if direction == :right
      @x += @speed
    end

    if direction == :up
      @y -= @speed
    end

    if direction == :down
      @y += @speed
    end
  end

  def draw
    @tileset.draw(@x, @y)
  end

end
