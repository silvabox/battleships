require 'ship'

describe Ship do

  subject { Ship.new 2 }

  it 'can be hit' do
    expect(subject).to respond_to :hit
  end

  it 'can be sunk' do
    subject.size.times { subject.hit }
    expect(subject).to be_sunk
  end

  it 'creates destroyers' do
    ship = Ship.destroyer

    expect(ship.size).to eq 2
  end

  it 'creates crusiers' do
    ship = Ship.cruiser

    expect(ship.size).to eq 3
  end

  it 'creates submarines' do
    ship = Ship.submarine

    expect(ship.size).to eq 3
  end

  it 'creates battleships' do
    ship = Ship.battleship

    expect(ship.size).to eq 4
  end

  it 'creates aircraft carriers' do
    ship = Ship.aircraft_carrier

    expect(ship.size).to eq 5
  end
end
