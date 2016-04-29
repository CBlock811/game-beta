require 'gosu'
require 'gosu_tiled'
require_relative './player'

class Game < Gosu::Window
  def initialize(*args)
    super
    @map = Gosu::Tiled.load_json(self, 'maps/terrain1.json')
    @x = @y = 0
    @speed = 3
    @player = Player.new
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def update
    @speed = 3

    if button_down?(Gosu::KbLeftShift)
      @speed = 9
    end

    if button_down?(Gosu::KbLeft)
      @player.turn(:left)
      @x -= @speed unless @x <= 0
    end

    if button_down?(Gosu::KbRight)
      @player.turn(:right)
      @x += @speed unless @x >= (@map.width - self.width)
    end

    if button_down?(Gosu::KbUp)
      @player.turn(:up)
      @y -= @speed unless @y <= 0
    end

    if button_down?(Gosu::KbDown)
      @player.turn(:down)
      @y += @speed unless @y >= (@map.height - self.height)
    end
  end

  def draw
    @map.draw(@x, @y)
    @player.draw
  end
end
