class Board
  SIZE = 10

  attr_accessor :width

  def initialize
    @grid = {}
  end

  def place_ship ship, at
    @grid[at] = ship
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
end
