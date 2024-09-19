require_relative 'player'
class GameBoard
  attr_accessor :board, :player_one, :player_two

  def initialize(player_one, player_two)
    @board = [1,2,3,4,5,6,7,8,9]
    @player_one = player_one
    @player_two = player_two
  end

  def update_board(symbol, move)
    @board[move-1] = symbol
  end

  def print_board
   puts "|#{self.board[0]}|" + " |#{self.board[1]}|" + " |#{self.board[2]}|"
   puts "-----------"
   puts "|#{self.board[3]}|" + " |#{self.board[4]}|" + " |#{self.board[5]}|"
   puts "-----------"
   puts "|#{self.board[6]}|" + " |#{self.board[7]}|" + " |#{self.board[8]}|"
   
  end
end

