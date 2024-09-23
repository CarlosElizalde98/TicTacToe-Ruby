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

  protected

  def play()
    until @game_end == true
      @board.print_board
      current_player = alternate_turn(@turn_number)
      puts "#{current_player.symbol}, Choose a number between 1-9 to play a move!"
      sanitize_input(current_player.symbol)
      check_status(current_player, @board)
    end
  end
   

  def alternate_turn(turn_num)
    if turn_num == 1
      @turn_number = 2
      return @player_one
    else
      @turn_number = 1
      return @player_two
    end
  end

  def check_status(current_player, board)
    if board.check_board(current_player.symbol, WINS) == true
      game_over(current_player.symbol)
    else
      draw_check
    end
  end

  def game_over(winner)
    @game_end = true
    puts "#{winner} has won the game! Would you like to play again?"
    puts "Press E to play again or any other key to quit."
    response = gets.chomp
    if response == "e" || response == "E"
      @game_end = false
      @board = GameBoard.new(@player_one, @player_two)
      game_start
    end
  end

  def draw_check
    if @board.board.all? { |spot| (spot.is_a? Integer) == false } && @game_end == false
      game_over("Nobody")
    end
  end

  def sanitize_input(symbol)
    move = gets.chomp.to_i
    while move.between?(1,9) == false
      puts "Only enter a number between 1 and 9."
      move = gets.chomp.to_i
    end
    while (@board.board[move - 1].is_a? Integer) == false
      p @board.board[move - 1]
      puts "Woah that's already occupied! Please try again"
      move = gets.chomp.to_i
    end
    @board.update_board(symbol, move)
  end
end
