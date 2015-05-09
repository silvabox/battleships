class Game
  BOARD_MARKERS = {
    miss: '-',
    hit: '*',
    none: ' '
  }.freeze

  BOARD_TEMPLATE = <<TEMPLATE
   ABCDEFGHIJ
  ------------
 1|<1>|1
 2|<2>|2
 3|<3>|3
 4|<4>|4
 5|<5>|5
 6|<6>|6
 7|<7>|7
 8|<8>|8
 9|<9>|9
10|<10>|10
  ------------
   ABCDEFGHIJ
TEMPLATE
  
  BOARD_TEMPLATE.freeze

  attr_reader :player_1, :player_2

  def initialize(playerClass, boardClass)
    @player_1 = initialize_player playerClass, boardClass
    @player_2 = initialize_player playerClass, boardClass


    player_1.opponent = player_2
    player_2.opponent = player_1
  end

  def initialize_player(playerClass, boardClass)
    player = playerClass.new
    player.board = boardClass.new
    player
  end

  def has_winner?
    players.any?(&:winner?)
  end

  def winner
    players.find(&:winner?)
  end

  def print_board player, board
    if board == player.board
      print_own_board board
    else
      print_opponent_board board
    end
  end

  private

  def players
    [player_1, player_2]
  end

  def print_own_board board
    create_print board do |cell|
      if cell.empty?
        BOARD_MARKERS[cell.status]
      else
        cell.shot? ? BOARD_MARKERS[:hit] : cell.content.type.to_s.upcase[0]
      end
    end
  end

  def print_opponent_board board
    create_print board do |cell|
      BOARD_MARKERS[cell.status]
    end
  end

  def create_print board
    coord_handler = CoordinateHandler.new

    output = BOARD_TEMPLATE

    coord_handler.each_row do |row, number|
      print_row = row.map do |coord|
        yield board[coord]
      end.join('')
      
      output = output.sub("<#{number}>", print_row)
    end
    output
  end
end
