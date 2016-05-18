require_relative './combatant'

class Player < Combatant

  def initialize(*args)
    super
    @health_sprite = Gosu::Image.load_tiles("graphics/health.gif", 32, 32, {tileable: true})
  end

  def draw_health
    pip = 1
    while pip <= @max_health do
      if pip <= @health
        @health_sprite[1].draw(32 * (pip - 1), 0, 0)
      else
        @health_sprite[0].draw(32 * (pip - 1), 0, 0)
      end

      pip += 1
    end
  end

end
