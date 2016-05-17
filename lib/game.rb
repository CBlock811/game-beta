require 'gosu'
require 'gosu_tiled'
require_relative './player'

class Game < Gosu::Window

  PIT_OFFSET = 96

  def initialize(*args)
    super
    @map = Gosu::Tiled.load_json(self, 'maps/pit.json')
    @player = Player.new
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def update
    if button_down?(Gosu::KbLeft)
      @player.move(:left) unless @player.x <= PIT_OFFSET
    end

    if button_down?(Gosu::KbRight)
      @player.move(:right) unless @player.x >= (self.width - @player.sprite.width - (@player.speed + PIT_OFFSET))
    end

    if button_down?(Gosu::KbUp)
      @player.move(:up) unless @player.y <= PIT_OFFSET
    end

    if button_down?(Gosu::KbDown)
      @player.move(:down) unless @player.y >= (self.height - @player.sprite.height - (@player.speed + PIT_OFFSET))
    end
  end

  def draw
    @map.draw(0, 0)
    @player.draw
  end
end
