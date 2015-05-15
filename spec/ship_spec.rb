require 'battleships/ship'

module Battleships
  describe Ship do

    subject { Ship.new :destroyer }

    it 'can be hit' do
      expect(subject).to respond_to :hit
    end

    it 'can be sunk' do
      subject.size.times { subject.hit }
      expect(subject).to be_sunk
    end

    it 'can be initialized with a string name' do
      ship = Ship.new 'cruiser'

      expect(ship.size).to eq Ship::SIZES[:cruiser]
    end

    it 'creates submarines' do
      ship = Ship.submarine

      expect(ship.size).to eq 1
      expect(ship.type).to eq :submarine
    end

    it 'creates destroyers' do
      ship = Ship.destroyer

      expect(ship.size).to eq 2
      expect(ship.type).to eq :destroyer
    end

    it 'creates crusiers' do
      ship = Ship.cruiser

      expect(ship.size).to eq 3
      expect(ship.type).to eq :cruiser
    end

    it 'creates battleships' do
      ship = Ship.battleship

      expect(ship.size).to eq 4
      expect(ship.type).to eq :battleship
    end

    it 'creates aircraft carriers' do
      ship = Ship.aircraft_carrier

      expect(ship.size).to eq 5
      expect(ship.type).to eq :aircraft_carrier
    end
  end
end