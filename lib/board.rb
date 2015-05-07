class Board
  SIZE = 10
  HORIZONTAL_COORDS = ['A'..'Z']
  VERTICAL_COORDS = [1..10]
  COORD_REGEX = /^[A..Z]([1..9]|10)$/

  attr_accessor :width

  def initialize
    @grid = {}
  end

  def place_ship(ship, coordinate)
    fail 'Invalid coordinate' unless valid_coord? coordinate
    @grid[coordinate] = ship
  end

  def width
    SIZE
  end

  def height
    SIZE
  end

  def ships
    @grid.values
  end

  private

  def valid_coord?(coord)
    COORD_REGEX.match coord.to_s
  end
end
