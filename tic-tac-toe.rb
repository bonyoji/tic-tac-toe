class Game
  def initialize()
    board = [1,2,3,4,5,6,7,8,9]
    puts 'Game of Tic-Tac-Toe'
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "--------"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "--------"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end
end

class Player
  def initialize(symbol)
    @symbol = symbol
  end
end

p1 = Player.new('X')
p2 = Player.new('O')

game = Game.new()
