require 'player'

describe Player do
  let(:board) { double :board }
  before(:each) { subject.board = board }

  it 'has a board' do
    expect(subject.board).to be board
  end

  it 'can place a ship on the board' do
    ship = double :ship
    expect(board).to receive(:place_ship).with ship, :A1
    subject.place_ship ship, :A1
  end
end
