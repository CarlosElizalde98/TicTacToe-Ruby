class Player
  attr_reader :symbol, :win_status
  def initialize(symbol)
    @symbol = symbol
    @win_status = false
  end
end