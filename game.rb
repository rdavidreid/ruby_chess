require './display.rb'
require './player.rb'
require_relative 'manifest.rb'

class Game
  include Cursorable
  attr_reader :cursor_pos

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @cursor_pos = [0,0]
    @player_black = Player.new(@display)
    @player_white = Player.new(@display)
  end

  def play
    until game_over?
      good_input = false

      until good_input
        begin
          pos = @player_white.move
          @display.selected = pos

          # = piece_at_pos(pos) = board fetches piece at given position method
          piece_at_pos = @board.find_piece(pos)
          # array_of_moves = piece_at_pos.valid_moves(@board,pos)
          array_of_moves = piece_at_pos.valid_moves(@board,pos)
          # update display render with the array of valid moves
          @display.highlighted_pos = array_of_moves
          pos2 = @player_white.move
          # throw error unless array_of_moves.include?(pos2)

          unless array_of_moves.include?(pos2)
            @display.selected = nil
            @display.highlighted_pos = nil
            puts "not valid move!"
            redo
          end
          good_input = true
        end

        @display.selected = nil
        @display.highlighted_pos = nil
      end

      @board.move(pos, pos2)

    end

  end

  def game_over?
    false
  end

end

game = Game.new
game.play
