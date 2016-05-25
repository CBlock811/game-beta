require 'gosu'
require 'gosu_tiled'
require_relative './constants'
require_relative './player'
require_relative './enemy'

class Game < Gosu::Window

  def initialize(*args)
    super
    @map = Gosu::Tiled.load_json(self, 'maps/pit.json')
    @player = Player.new('default_player', 6)
    @enemy = nil
  end

  def button_down(id)
    close if id == Gosu::KbEscape

    @player.take_damage if id == Gosu::KbT
    @player.heal_damage if id == Gosu::KbY

    if id == Gosu::KbSpace
      @enemy ||= Enemy.new('dead', 2, 1, 3)
    end
  end

  def detect_collision(entity, direction)
    if @enemy && @player
      opposite = entity == @enemy ? @player : @enemy

      if direction == :left
        (entity.x - entity.speed).between?(opposite.x, opposite.x + DEFAULT_SPRITE_SIZE)
      elsif direction == :right
        (DEFAULT_SPRITE_SIZE + entity.x + entity.speed).between?(opposite.x, opposite.x + DEFAULT_SPRITE_SIZE)
      elsif direction == :up
        (entity.y - entity.speed).between?(opposite.y, opposite.y + DEFAULT_SPRITE_SIZE)
      elsif direction == :down
        (DEFAULT_SPRITE_SIZE + entity.y + entity.speed).between?(opposite.y, opposite.y + DEFAULT_SPRITE_SIZE)
      end
    end
  end

  def update
    if @enemy
      if @player.x < @enemy.x
        @enemy.move(:left) unless @enemy.x <= PIT_OFFSET || detect_collision(@enemy, :left)
      elsif @player.x > @enemy.x
        @enemy.move(:right) unless @enemy.x >= (WINDOW_WIDTH - DEFAULT_SPRITE_SIZE - (@enemy.speed + PIT_OFFSET)) || detect_collision(@enemy, :right)
      end

      if @player.y < @enemy.y
        @enemy.move(:up) unless @enemy.y <= PIT_OFFSET || detect_collision(@enemy, :up)
      elsif @player.y > @enemy.y
        @enemy.move(:down) unless @enemy.y >= (WINDOW_HEIGHT - DEFAULT_SPRITE_SIZE - (@enemy.speed + PIT_OFFSET)) || detect_collision(@enemy, :down)
      end
    end

    if @player.alive?
      if button_down?(Gosu::KbLeft)
        @player.move(:left) unless @player.x <= PIT_OFFSET
      end

      if button_down?(Gosu::KbRight)
        @player.move(:right) unless @player.x >= (WINDOW_WIDTH - DEFAULT_SPRITE_SIZE - (@player.speed + PIT_OFFSET))
      end

      if button_down?(Gosu::KbUp)
        @player.move(:up) unless @player.y <= PIT_OFFSET
      end

      if button_down?(Gosu::KbDown)
        @player.move(:down) unless @player.y >= (WINDOW_HEIGHT - DEFAULT_SPRITE_SIZE - (@player.speed + PIT_OFFSET))
      end
    end
  end

  def draw
    @map.draw(0, 0)
    @player.draw

    @enemy.draw if @enemy

    @player.draw_health

    if !@player.alive?
      game_over_text = Gosu::Image.from_text("YOU DEDED!", 64, {align: :center})
      text_x = (WINDOW_WIDTH/2) - game_over_text.width/2
      text_y = (WINDOW_HEIGHT/2) - game_over_text.height/2
      game_over_text.draw(text_x, text_y, 1, 1, 1, Gosu::Color::BLACK)
    end
  end
end
