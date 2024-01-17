class Game
  @@turn_count = 1
  @@winner = ""
  WIN_COMBOS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]


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
    puts "#{player}: Please enter an available number"
    input = ((gets.chomp).to_i)

    if valid?(input)
      input = input - 1
      add_to_board(input, symbol)
    else
      display_board(@board)
      player_choice(player, symbol)
    end
  end

  def valid?(input)
    if input.between?(1,9)
      if taken?(input)
        return false
      else
        return true
      end
    else
      return false
    end
  end

  def taken?(input)
  index = input - 1
    if @board[index].to_i.between?(1,9)
      return false
    else
      return true
    end
  end

  def add_to_board(index, symbol)
    @board[index] = symbol
    @@turn_count += 1
  end

  def winner?
    WIN_COMBOS.each do |win_combo|
      win_i_1 = win_combo[0]
      win_i_2 = win_combo[1]
      win_i_3 = win_combo[2]

      pos_1 = @board[win_i_1]
      pos_2 = @board[win_i_2]
      pos_3 = @board[win_i_3]

      if (pos_1 == pos_2) && (pos_2 == pos_3)
        if pos_1 == 'X'
          @@winner = @player1
        else
          @@winner = @player2
        end
        return true
      end
    end
    return false
  end

  def play
    puts "\r"
    puts "Welcome to Tic-Tac-Toe"
    display_board(@board)

    until @@turn_count > 9 do
      if winner?()
        puts "WINNER! Congratulations #{@@winner}"
        break
      else
        player_turn(@@turn_count)
        display_board(@board)
      end
    end

    if @@turn_count > 9
      if winner?()
        puts "WINNER! Congratulations #{@@winner}"
      else
        puts 'DRAW! NO WINNER'
      end
    end
  end

end

game = Game.new()
game.play
