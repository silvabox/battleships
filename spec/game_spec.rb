require 'game'

describe Game do
  let(:player) { double :player }
  let(:playerClass) { double :Player, new: player }
  let(:board) { double :board }
  let(:boardClass) { double :Board, new: board }

  subject { Game.new playerClass, boardClass }

  before do
    allow(player).to receive(:board=)
    allow(player).to receive(:opponent=)
  end

  it 'creates player 1' do
    expect(subject.player_1).to be player
  end

  it 'creates player_2' do
    expect(subject.player_2).to be player
  end

  it 'creates a board for each player' do
    expect(player).to receive(:board=).with(board).twice
    Game.new playerClass, boardClass
  end

  it 'knows when there is a winner' do
    allow(player).to receive(:winner?).and_return true
    expect(subject).to have_winner
  end

  it 'knows who the winner is' do
    allow(player).to receive(:winner?).and_return true
    expect(subject.winner).to be player
  end
end
