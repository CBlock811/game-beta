module MovementDeterminer

  def can_move?(direction)
    output = nil

    case self.class
      when Player
        output = "player"
      when Map
        output = "map"
      else
        output = false
      end

    output
  end
end
