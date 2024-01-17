class Game
  @@turn_count = 1
  @@winner = ""

  def initialize()
    @player1 = 'Player 1'
    @player2 = 'Player 2'
    @board = Array(1..9)
  end

  def display_board(board)
    puts "\r"
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "---------"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "---------"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
    puts "\r"
  end

  def player_turn(turn)
    if turn.odd?
      player_choice(@player1, 'X')
    else
      player_choice(@player2, 'O')
    end
  end

  def player_choice(player, symbol)
    puts "#{player} please enter an available number"
    input = input_to_index(gets.chomp)
    add_to_board(input, symbol)
  end

  def add_to_board(index, symbol)
    @board[index] = symbol
    @@turn_count += 1
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def play
    puts "\r"
    puts "Welcome to Tic-Tac-Toe"
    display_board(@board)

    until @@turn_count > 9 do
      player_turn(@@turn_count)
      display_board(@board)
    end
  end

end

game = Game.new()
game.play
