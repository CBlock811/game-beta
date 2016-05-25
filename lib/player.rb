require_relative './combatant'

class Player < Combatant

  def initialize(*args)
    super
    @health_sprite = Gosu::Image.load_tiles("graphics/health.gif", DEFAULT_SPRITE_SIZE, DEFAULT_SPRITE_SIZE, {tileable: true})
  end

  def draw_health
    pip = 1
    while pip <= @max_health do
      if pip <= @health
        @health_sprite[1].draw(DEFAULT_SPRITE_SIZE * (pip - 1), 0, 0)
      else
        @health_sprite[0].draw(DEFAULT_SPRITE_SIZE * (pip - 1), 0, 0)
      end

      pip += 1
    end
  end

end
