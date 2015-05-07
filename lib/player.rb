class Player
  attr_accessor :board

  def place_ship ship, coordinate
    board.place_ship ship, coordinate
  end
end
