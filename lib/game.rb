class Game < Gosu::Window

  attr_accessor :map, :player

  def initialize(*args)
    super

    @map = Map.new(self)
    @player = Player.new(self)
  end

  def update
    self.close if button_down?(Gosu::KbEscape)

    @map.set_speed(:walk)
    @map.set_speed(:sprint) if button_down?(Gosu::KbLeftShift)

    if button_down?(Gosu::KbLeft)
      @map.move(:left)
      @player.turn(:left)
      @player.move(:left)
    end

    if button_down?(Gosu::KbRight)
      @map.move(:right)
      @player.turn(:right)
    end

    if button_down?(Gosu::KbUp)
      @map.move(:up)
      @player.turn(:up)
    end

    if button_down?(Gosu::KbDown)
      @map.move(:down)
      @player.turn(:down)
    end
  end

  def draw
    Gosu::draw_rect(0, 0, self.width, self.height, Gosu::Color::GRAY)
    @map.draw
    @player.draw
  end
end
