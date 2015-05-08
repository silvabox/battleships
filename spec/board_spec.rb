require 'board'

describe Board do
  let(:invalid_coords) {   [:A11, :A0, :K1, :K10] }

  it 'is 10 squares wide' do
    expect(subject.width).to eq 10
  end

  it 'is 10 squares high' do
    expect(subject.height).to eq 10
  end

  context 'when initialized' do
    it 'has no ships' do
      expect(subject.ships).to be_empty
    end
  end

  describe 'place_ship' do
    let(:ship) { double :ship, size: 1 }

    it 'adds a ship to the board' do
      subject.place_ship ship, :A1
      expect(subject.ships).to include ship
    end

    it 'fails if coordinates are invalid' do
      invalid_coords.each do |coord|
        expect { subject.place_ship ship, coord }.to raise_error 'Invalid coordinates'
      end
    end

    it 'handles larger ships' do
      ship = double :ship, size: 4
      subject.place_ship ship, :A1
      [:A1, :B1, :C1, :D1].each do |coord|
        expect(subject[coord]).to be ship
      end
    end

    it 'fails if ship is out of bounds horizontally' do
      ship = double :ship, size: 2
      expect{subject.place_ship ship, :J2}.to raise_error 'Out of bounds'
    end

    it 'allows ships to be placed vertically' do
      ship = double :ship, size: 3
      subject.place_ship ship, :J2, :vertically
      [:J2, :J3, :J4].each do |coords|
        expect(subject[coords]).to be ship
      end
    end

    it 'fails if ship is out of bounds vertically' do
      ship = double :ship, size: 2
      expect{subject.place_ship ship, :E10, :vertically}.to raise_error 'Out of bounds'
    end

    it 'fails if ships overlap' do
      ship1 = double :ship, size: 4
      ship2 = double :ship, size: 3

      subject.place_ship ship1, :B2
      expect{subject.place_ship ship2, :C1, :vertically}.to raise_error 'Coordinates already occupied'
    end
  end

  describe '[]' do
    it 'fails if coordinates are invalid' do
      invalid_coords.each do |coord|
        expect { subject[coord] }.to raise_error 'Invalid coordinates'
      end
    end
    it 'returns the entry in the grid' do
      subject.place_ship :ship, :C9
      expect(subject[:C9]).to be :ship
    end
  end

  describe 'receive_shot' do
    it 'fails if coordinates are invalid' do
      invalid_coords.each do |coord|
        expect { subject.receive_shot coord }.to raise_error 'Invalid coordinates'
      end
    end

    it 'returns :miss for a miss' do
      expect(subject.receive_shot :A1).to eq :miss
    end

    it 'returns :hit for a ship' do
      ship = double :ship, size: 1
      subject.place_ship ship, :A1
      expect(subject.receive_shot :A1).to eq :hit
    end
  end
end
