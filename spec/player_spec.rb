require 'player'

describe Player do
  let(:board) { double :board }
  before(:each) { subject.board = board }

  it 'has a board' do
    expect(subject.board).to be board
  end
end
