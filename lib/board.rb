require_relative 'cell'
require_relative 'coordinate_handler'

class Board
  SIZE = 10

  attr_accessor :width

  def initialize
    @grid = {}
  end

  def place_ship ship, coordinates
    CoordinateHandler.validate_coords coordinates

    ship_coords = CoordinateHandler.all_coords_for coordinates, ship.size

    ship_coords.each { |coords| CoordinateHandler.validate_coords coords }

    ship_coords.each { |coords| @grid[coords] = ship }
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

  def receive_shot coordinates
    CoordinateHandler.validate_coords coordinates
    @grid[coordinates] ? :hit : :miss
  end

  def [] coordinates
    CoordinateHandler.validate_coords coordinates
    @grid[coordinates]
  end
end
