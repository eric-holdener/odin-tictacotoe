require "pry-byebug"

class Game
    @@board_array = Array.new(9)
    def initialize
        @board_array = @@board_array
        @player_x = Player.new('x')
        @player_o = Player.new('o')
    end

  def play_game(board_array)
    # code
  end

  def print_board(board_array)
        puts "#{board_array[0]} | #{board_array[1]} | #{board_array[2]}"
        puts "-----"
        puts "#{board_array[3]} | #{board_array[4]} | #{board_array[5]}"
        puts "-----"
        puts "#{board_array[6]} | #{board_array[7]} | #{board_array[8]}"
    end

    def check_for_winner(board_array)
        # code
    end
end

class Player
    def initalize(symbol)
        @symbol = symbol
    end

    def make_move()
        # code
    end
end

tic_tac_toe = Game.new()
tic_tac_toe.print_board