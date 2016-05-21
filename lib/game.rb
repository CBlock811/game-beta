require 'gosu'
require 'gosu_tiled'
require_relative './player'
require_relative './enemy'

class Game < Gosu::Window

  PIT_OFFSET = 96

  def initialize(*args)
    super
    @map = Gosu::Tiled.load_json(self, 'maps/pit.json')
    @player = Player.new('default_player', 6)
    @enemies = []
  end

  def button_down(id)
    close if id == Gosu::KbEscape

    @player.take_damage if id == Gosu::KbT
    @player.heal_damage if id == Gosu::KbY

    if id == Gosu::KbSpace
      @enemies << Enemy.new('dead', 2, 1, 3)
    end
  end

  def update

    @enemies.each do |enemy|
      if @player.x < enemy.x
        enemy.move(:left) unless enemy.x <= PIT_OFFSET
      elsif @player.x > enemy.x
        enemy.move(:right) unless enemy.x >= (self.width - enemy.sprite.width - (enemy.speed + PIT_OFFSET))
      end

      if @player.y < enemy.y
        enemy.move(:up) unless enemy.y <= PIT_OFFSET
      elsif @player.y > enemy.y
        enemy.move(:down) unless enemy.y >= (self.height - enemy.sprite.height - (enemy.speed + PIT_OFFSET))
      end
    end

    if @player.alive?
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
  end

  def draw
    @map.draw(0, 0)
    @player.draw

    @enemies.each do |enemy|
      enemy.draw
    end

    @player.draw_health

    if !@player.alive?
      game_over_text = Gosu::Image.from_text("YOU DEDED!", 64, {align: :center})
      text_x = (self.width/2) - game_over_text.width/2
      text_y = (self.height/2) - game_over_text.height/2
      game_over_text.draw(text_x, text_y, 1, 1, 1, Gosu::Color::BLACK)
    end
  end
end
