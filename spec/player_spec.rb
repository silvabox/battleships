require 'battleships/player'

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

  it 'can place a ship horizontally on the board' do
    ship = double :ship
    expect(board).to receive(:place_ship).with ship, :A1, :horizontally
    subject.place_ship ship, :A1
  end

  it 'can place a ship vertically on the board' do
    ship = double :ship
    expect(board).to receive(:place_ship).with ship, :A1, :vertically
    subject.place_ship ship, :A1, :vertically
  end

  it 'knows about the opponent' do
    expect(subject.opponent).to be opponent
  end

  it 'can take a shot at the opponent' do
    expect(opponent).to receive(:receive_shot).with :A1
    subject.shoot :A1
  end

  describe 'shoot' do
    it 'fails if there is no opponent' do
      subject.opponent = nil
      expect{subject.shoot :A1}.to raise_error 'Player has no opponent'
    end
  end

  describe 'receive_shot' do
    it 'fails if there is no board' do
      subject.board = nil
      expect {subject.receive_shot :A1}.to raise_error 'Player has no board'
    end

    it 'sends the shot to the board' do
      expect(board).to receive(:receive_shot).with :A1
      subject.receive_shot :A1
    end
  end

  it 'knows when it is the winner' do
    allow(opponent).to receive(:all_ships_sunk?).and_return true
    expect(subject).to be_winner
  end

  describe 'winner?' do
    it 'fails if there is no opponent' do
      subject.opponent = nil
      expect{subject.winner?}.to raise_error 'Player has no opponent'
    end
  end

  it 'knows when all ships are sunk' do
    allow(board).to receive(:all_ships_sunk?).and_return true
    expect(subject.all_ships_sunk?).to be_truthy
  end

  describe 'all_ships_sunk?' do
    it 'fails if there is no board' do
      subject.board = nil
      expect{subject.all_ships_sunk?}.to raise_error 'Player has no board'
    end
  end
end
