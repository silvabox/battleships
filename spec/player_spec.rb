require 'player'

describe Player do
  let(:board) { instance_double Board }
  let(:opponent) { instance_double Player }
  before(:each) do
    subject.board = board
    subject.opponent = opponent
  end

  it 'has a board' do
    expect(subject.board).to be board
  end

  it 'can place a ship on the board' do
    ship = double :ship
    expect(board).to receive(:place_ship).with ship, :A1
    subject.place_ship ship, :A1
  end

  it 'knows about the opponent' do
    expect(subject.opponent).to be opponent
  end

  it 'can take a shot' do
    expect(opponent).to receive(:receive_shot).with :A1
    subject.shoot :A1
  end
end
