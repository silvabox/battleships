require 'player'
require 'board'
require 'ship'

feature 'player adds ships' do
  let(:player) { Player.new }

  before { player.board = Board.new }

  scenario 'a player can place 2 ships on their board' do
    player.place_ship :destroyer, :A1
    player.place_ship :ship, :D8

    [:destroyer, :ship].each { |ship| expect(player.board.ships).to include ship }
  end

  scenario 'player adds ships of a different size' do
    destroyer = Ship.destroyer
    carrier = Ship.aircraft_carrier

    player.place_ship destroyer, :A1
    player.place_ship carrier, :D8

    [:A1, :A2].each { |coord| expect(player.board[coord]).to be destroyer }
    [:D8, :E8, :F8, :G8, :H8].each { |coord| expect(player.board[coord]).to be carrier }
  end
end
