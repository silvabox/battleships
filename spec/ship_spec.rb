require 'ship'

describe Ship do
  it 'creates destroyers' do
    ship = Ship.destroyer

    expect(ship.size).to be 2
  end

  it 'creates crusiers' do
    ship = Ship.cruiser

    expect(ship.size).to be 3
  end

  it 'creates submarines' do
    ship = Ship.submarine

    expect(ship.size).to be 3
  end

  it 'creates battleships' do
    ship = Ship.battleship

    expect(ship.size).to be 4
  end

  it 'creates aircraft carriers' do
    ship = Ship.aircraft_carrier

    expect(ship.size).to be 5
  end
end
