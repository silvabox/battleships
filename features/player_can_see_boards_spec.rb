feature 'player can see boards' do
  let(:game) { Game.new Player, Board }
  let(:player1) { game.player_1 }
  let(:player2) { game.player_2 }

  before(:each) do
    player1.place_ship Ship.aircraft_carrier, :B1
    player1.place_ship Ship.battleship, :G2, :vertically
    player1.place_ship Ship.cruiser, :D9
    player1.place_ship Ship.destroyer, :C10
    player1.place_ship Ship.submarine, :C6

    [:B1, :C1, :H1, :G2, :I2, :G4, :G5, :A6, :B6, :B8, :F8, :J8, :D9, :E9, :F9].each do |coord|
      player2.shoot coord
    end
  end

  scenario 'own board shows hits, misses and ships' do
    view = game.own_board_view(player1)
    puts view
    expect(view).to eq OWN_BOARD_VIEW
  end

  scenario 'opponent board only shows hits and misses' do
    view = game.opponent_board_view(player2)
    puts view
    expect(view).to eq OPPONENT_BOARD_VIEW
  end
end

OWN_BOARD_VIEW = <<BOARD
   ABCDEFGHIJ
  ------------
 1| **AAA -  |1
 2|      * - |2
 3|      B   |3
 4|      *   |4
 5|      *   |5
 6|--S       |6
 7|          |7
 8| -   -   -|8
 9|   ***    |9
10|  DD      |10
  ------------
   ABCDEFGHIJ
BOARD

OPPONENT_BOARD_VIEW = <<BOARD
   ABCDEFGHIJ
  ------------
 1| **    -  |1
 2|      * - |2
 3|          |3
 4|      *   |4
 5|      *   |5
 6|--        |6
 7|          |7
 8| -   -   -|8
 9|   ***    |9
10|          |10
  ------------
   ABCDEFGHIJ
BOARD
