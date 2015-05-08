feature 'player adds ships' do
  scenario 'a player can place 2 ships on their board' do
    player = Player.new
    player.board = Board.new

    player.place_ship :destroyer, :A1
    player.place_ship :ship, :D8

    [:destroyer, :ship].each { |ship| expect(player.board.ships).to include ship }
  end
end
