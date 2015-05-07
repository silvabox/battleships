require 'board'

describe Board do

  describe 'place_ship' do
    it 'adds a ship to the board' do
      ship = double :ship
      subject.place_ship ship, :A1
      expect(subject.ships).to include ship
    end
  end

  it 'is 10 squares wide' do
    expect(subject.width).to be 10
  end

  it 'is 10 squares high' do
    expect(subject.height).to be 10
  end

  context 'when initialized' do
    it 'has no ships' do
      expect(subject.ships).to be_empty
    end
  end
end
