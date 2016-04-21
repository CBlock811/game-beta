require 'gosu'
require 'gosu_tiled'

class Game < Gosu::Window
  def initialize(*args)
    super
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

window = Game.new(800, 700, false)
window.show