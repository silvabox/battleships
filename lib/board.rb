require_relative 'cell'

class Board
  SIZE = 10
  HORIZONTAL_COORDS = ['A'..'J']
  VERTICAL_COORDS = [1..10]
  COORD_REGEX = /^[A-J]([1-9]|10)$/

  attr_accessor :width

  def initialize
    @grid = {}
  end

  def place_ship ship, coordinate
    validate_coord coordinate
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

  def receive_shot coordinate
    validate_coord coordinate
    @grid[coordinate] ? :hit : :miss
  end

  def [] coordinate
    validate_coord coordinate
    @grid[coordinate]
  end

  private

  def validate_coord coord
    fail 'Invalid coordinate' unless valid_coord? coord
  end

  def valid_coord? coord
    COORD_REGEX.match coord.to_s
  end
end
