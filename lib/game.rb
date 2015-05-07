class Game
  attr_reader :player_1, :player_2

  def initialize(playerClass, boardClass)
    @player_1 =  initialize_player playerClass, boardClass
    @player_2 = initialize_player playerClass, boardClass


    player_1.opponent = player_2
    player_2.opponent = player_1
  end

  def initialize_player(playerClass, boardClass)
    player = playerClass.new
    player.board = boardClass.new
    player
  end
end
