require_relative 'game_board'
require_relative 'player'

class GameController
  WINS = [[1,2,3],[4,5,6],[7,8,9],
  [1,5,9],[7,5,3],[1,4,7],[2,5,8],[3,6,9]]
  
  def initialize()
    @game_end = false
    @player_one = Player.new('X')
    @player_two = Player.new('O')
    @turn_number = 1
    @board = GameBoard.new(@player_one, @player_two)
  end

  def game_start
    play()
  end

  def play()
    9.times do
      @board.print_board
      current_player = alternate_turn(@turn_number)
      puts "#{current_player.symbol}, Choose a number between 1-9 to play a move!"
      move = gets.chomp.to_i
      @board.update_board(current_player.symbol, move)
      check_status(@board)
    end
  end

  def alternate_turn(turn_num)
    p "turn num #{turn_num}"
    if turn_num == 1
      @turn_number = 2
      return @player_one
    else
      @turn_number = 1
      return @player_two
    end
  end

  def check_status(board)
    
  end

  def game_over
    
  end
end

game_test = GameController.new()
game_test.play