class Player
  attr_accessor :board, :opponent

  def place_ship ship, coordinates, orientation = :horizontally
    board.place_ship ship, coordinates, orientation
  end

  def receive_shot coordinates
    fail 'Player has no board' unless board
    board.receive_shot coordinates
  end

  def shoot coordinates
    opponent.receive_shot coordinates
  end
end
