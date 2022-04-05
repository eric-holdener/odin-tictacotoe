require 'pry-byebug'

# creates the singular game of tic tac toe. Will delete instance after winner, and new instance will have to be created
class Game
  def initialize
    @board_array = [*0..8]
    @last_play = 'o'
    @winner = false
    @rounds = 0
    @player_x = Player.new('x')
    @player_o = Player.new('o')
    @move = nil
  end

  def play_game
    winning_player = check_for_winner(@board_array)
    # binding.pry
    if winning_player[0] == true
      puts "The winner is #{winning_player[1]}!"
      print_board(@board_array)
    elsif @rounds == 9
      puts 'Looks like this was a cats game!'
      print_board(@board_array)
    else
      @rounds += 1
      valid_moves = get_valid(@board_array)
      @last_play = check_player
      hash = round_iterator(@last_play, valid_moves)
      @board_array[hash[:move]] = hash[:symbol]
      play_game
    end
  end

  def print_board(board_array)
    puts "#{board_array[0]}|#{board_array[1]}|#{board_array[2]}"
    puts '-----'
    puts "#{board_array[3]}|#{board_array[4]}|#{board_array[5]}"
    puts '-----'
    puts "#{board_array[6]}|#{board_array[7]}|#{board_array[8]}"
  end

  def check_for_winner(board_array)
    if board_array[0] == board_array[1] && board_array[1] == board_array[2]
      [true, board_array[0]]
    elsif board_array[3] == board_array[4] && board_array[4] == board_array[5]
      [true, board_array[3]]
    elsif board_array[6] == board_array[7] && board_array[7] == board_array[8]
      [true, board_array[6]]
    elsif board_array[0] == board_array[3] && board_array[3] == board_array[6]
      [true, board_array[0]]
    elsif board_array[1] == board_array[4] && board_array[4] == board_array[7]
      [true, board_array[1]]
    elsif board_array[2] == board_array[5] && board_array[5] == board_array[8]
      [true, board_array[1]]
    elsif board_array[0] == board_array[4] && board_array[4] == board_array[8]
      [true, board_array[0]]
    elsif board_array[6] == board_array[4] && board_array[4] == board_array[2]
      [true, board_array[6]]
    else
      [false, nil]
    end
  end

  def check_player
    if @last_play == 'x'
      'o'
    else
      'x'
    end
  end

  def get_move(player, valid_moves)
    valid_inputs = ['0', '1', '2', '3', '4', '5', '6', '7', '8']
    puts "It is player #{player}'s turn! Please enter the number where you would like to play."
    index = gets.chomp
    if valid_inputs.include? index
      index = index.to_i
      if index.between?(0, 8) && valid_moves.include?(index)
        @move = index
      else
        puts "That doesn't appear to be a valid entry. Please try again."
        get_move(player, valid_moves)
      end
    else
      puts "It doesn't appear you've entered a valid number. Please try again."
      get_move(player, valid_moves)
    end
  end

  def round_iterator(last_play, valid_moves)
    print_board(@board_array)
    get_move(last_play, valid_moves)
    if last_play == 'x'
      hash = @player_x.make_move(@move)
    else
      hash = @player_o.make_move(@move)
    end
    hash
  end

  def get_valid(board)
    valid = []
    board.each do |move_spot|
      if move_spot.is_a? Integer
        valid.push(move_spot)
      end
    end
    valid
  end
end

# creates player object for tic tac toe game, intended to create two for each instance of game
class Player
  def initialize(symbol)
    @symbol = symbol
  end

  def make_move(move_location)
    { symbol: @symbol, move: move_location }
  end
end
