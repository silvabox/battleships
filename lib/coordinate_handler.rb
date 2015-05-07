module CoordinateHandler
  HORIZONTAL_COORDS = ('A'..'J').to_a
  VERTICAL_COORDS = (1..10).to_a
  COORD_REGEX = /^([A-J])([1-9]|10)$/

  def self.validate_coords coords
    fail 'Invalid coordinates' unless valid_coords? coords
  end

  def self.valid_coords? coords
    COORD_REGEX.match coords.to_s
  end

  def self.all_coords_for start, size
    match = COORD_REGEX.match start

    x = match.captures.first
    y = match.captures.last

    horizontal_coords_for x, y, size
  end

  def self.horizontal_coords_for x, y, size
    x_coords(x, size).map { |x| "#{x}#{y}".to_sym }
  end

  def self.x_coords x, size
    start = HORIZONTAL_COORDS.index x
    HORIZONTAL_COORDS.slice start, size
  end
end
