require 'game'

describe Game do
  let(:player) { double :player }
  let(:playerClass) { double :Player, new: player }
  let(:board) { double :board }
  let(:boardClass) { double :Board, new: board }

  subject { described_class.new playerClass, boardClass }

  before do
    allow(player).to receive(:board=)
      allow(player).to receive(:opponent=)
  end

  it 'creates player_1' do
    expect(subject.player_1).to be player
  end

  it 'creates player_2' do
    expect(subject.player_2).to be player
  end


end
