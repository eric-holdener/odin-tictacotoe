require './lib/ttt.rb'

describe Game do
  # test implementation of tic tac toe game
  
  # create a subject instance
  subject(:test_game) { described_class.new }

  describe '#play_game' do
    # public script method to play the game
    # all methods inside should be tested
  end

  describe '#print_board' do
    # functionality to print the board to console
    it 'prints an empty board' do
      game_board = "0|1|2\n-----\n3|4|5\n-----\n6|7|8"
      board_array = [*0..8]
      expect { test_game.print_board(board_array) }.to output(game_board).to_stdout
    end
  end
end