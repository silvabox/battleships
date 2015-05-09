class Ship
  SIZES = {
    destroyer: 2,
    cruiser: 3,
    submarine: 3,
    battleship: 4,
    aircraft_carrier: 5
  }

  attr_reader :size

  def initialize size
    @size = size
    @hits = 0
  end

  def hit
    @hits += 1
  end

  def sunk?
    @hits >= size
  end

  def self.destroyer
    Ship.new(SIZES[:destroyer])
  end

  def self.cruiser
    Ship.new(SIZES[:cruiser])
  end

  def self.submarine
    Ship.new(SIZES[:submarine])
  end

  def self.battleship
    Ship.new(SIZES[:battleship])
  end

  def self.aircraft_carrier
    Ship.new(SIZES[:aircraft_carrier])
  end
end
