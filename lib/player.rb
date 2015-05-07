class Player
  attr_accessor :board, :opponent

  def place_ship ship, coordinates
    board.place_ship ship, coordinates
  end

  def receive_shot coordinates
    fail 'Player has no board' unless board
    board.receive_shot coordinates
  end

  def shoot coordinates
    opponent.receive_shot coordinates
  end
end
