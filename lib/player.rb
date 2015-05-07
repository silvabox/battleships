class Player
  attr_accessor :board, :opponent

  def place_ship ship, coordinate
    board.place_ship ship, coordinate
  end

  def receive_shot coordinate
    fail 'Player has no board' unless board
    board.receive_shot coordinate
  end

  def shoot coordinate
    opponent.receive_shot coordinate
  end
end
