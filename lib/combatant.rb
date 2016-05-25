class Combatant

  attr_accessor :speed, :x, :y, :sprite
  attr_accessor :max_health, :health, :damage

  def initialize(type, max_health, damage = 1, speed = 4)
    @sprite = Gosu::Image.new("graphics/#{type}.gif")
    @speed = speed
    @max_health = @health = max_health
    @damage = damage
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

  def determine_hitbox

  end

  def draw
    @sprite.draw(@x, @y, 0)
  end

end
