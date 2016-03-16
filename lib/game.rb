require './display.rb'
require './player.rb'
require_relative 'manifest.rb'

class Game
  include Cursorable
  attr_reader :cursor_pos


  def initialize
    @board = Board.new(true)
    @display = Display.new(@board)
    @cursor_pos = [0,0]
    @player_black = Player.new(@display, "white")
    @player_white = Player.new(@display, "black")
    @current_player = @player_white
  end

  def play
    until game_over?
      good_input = false

      until good_input
        begin
          msg = ""

          if @board.in_check?(@current_player,other_player)
            msg =  "#{@current_player.color} is in check!"
          end

          pos = @current_player.move(msg)
          @display.selected = pos

          # = piece_at_pos(pos) = board fetches piece at given position method
          piece_at_pos = @board.find_piece(pos)
          # array_of_moves = piece_at_pos.valid_moves(@board,pos)
          array_of_moves = piece_at_pos.valid_moves(@board,pos,@current_player, other_player)
          # update display render with the array of valid moves
          @display.highlighted_pos = array_of_moves
          pos2 = @current_player.move(msg)


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
      # check_status = @board.in_check?(@current_player,other_player)
      switch_player
    end

    puts "#{other_player.color} won!"

  end

  def current_player
    @current_player
  end

  def other_player
    if @current_player == @player_white
      return @player_black
    end
    @player_white
  end

  def switch_player
    if @current_player == @player_white
      @current_player = @player_black
    else
      @current_player = @player_white
    end
  end

  def game_over?
    @board.checkmate?(@current_player,other_player)
  end

  def blackKingTaken
    @board.grid.each do |col|
      col.each do |cell|
        return false if cell.color == "black" && cell.class == King
      end
    end
    return true
  end

  def whiteKingTaken
    @board.grid.each do |col|
      col.each do |cell|
        return false if cell.color == "white" && cell.class == King
      end
    end
    return true
  end

end

game = Game.new
game.play
