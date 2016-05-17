class Player

  attr_accessor :speed, :x, :y, :sprite
  attr_accessor :max_health, :health, :damage

  PIT_OFFSET = 96

  def initialize(speed = 4)
    @sprite = Gosu::Image.new("graphics/smiley.gif")
    @health_sprite = Gosu::Image.load_tiles("graphics/health.gif", 32, 32, {tileable: true})
    @speed = speed
    @max_health = @health = 6
    @damage = 1
    @x = @y = PIT_OFFSET
  end

  def move(direction)
    @x -= speed if direction == :left
    @x += speed if direction == :right
    @y -= speed if direction == :up
    @y += speed if direction == :down
  end

  def take_damage(amount = 1)
    @health -= amount
  end

  def heal_damage(amount = 1)
    @health += amount
    @health = @max_health if @health >= @max_health
  end

  def alive?
    @health > 0
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

  def draw
    @sprite.draw(@x, @y, 0)
  end

end
