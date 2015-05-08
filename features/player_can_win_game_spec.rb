require 'game'
require 'board'
require 'player'

feature 'player can win game' do
  let(:game) { Game.new Player, Board }

  scenario 'Player 1 wins the game when all player 2 ships are sunk' do
    game.player_2.place_ship Ship.destroyer, :A1
    game.player_2.place_ship Ship.battleship, :B2, :vertically

    [:A1, :B1, :B2, :B3, :B4, :B5].each do |coord|
      game.player_1.shoot coord
    end

    expect(game).to have_winner
    expect(game.winner).to be game.player_1
  end

  scenario 'Player 2 wins the game when all player 1 ships are sunk' do
    game.player_1.place_ship Ship.destroyer, :A1
    game.player_1.place_ship Ship.battleship, :B2, :vertically

    [:A1, :B1, :B2, :B3, :B4, :B5].each do |coord|
      game.player_2.shoot coord
    end

    expect(game).to have_winner
    expect(game.winner).to be game.player_2
  end
end
