require_relative 'board'
require_relative 'cursorable.rb'
require_relative 'manifest.rb'

require 'colorize'

# require_relative 'pieces/nul_piece'
# require_relative 'pieces/rook'

class Display
  include Cursorable
  attr_accessor :selected,  :highlighted_pos
  attr_reader :cursor_pos

  def initialize(board)
    @cursor_pos = [0,0]
    @selected = nil             #array of coords
    @highlighted_pos
    @board = board
  end

  def render
    # system("clear")
    background_toggle = true

    @board.grid.each_with_index do |row, i|
      background_toggle = !background_toggle

      row.each_with_index do |piece, j|
        if [i,j] == @selected
          print piece.icon.colorize(:color => :white, :background => :yellow)
        elsif [i,j] == @cursor_pos
          print piece.icon.colorize(:color => :white, :background => :black)
        elsif @highlighted_pos != nil && @highlighted_pos.include?([i,j])
          print piece.icon.colorize(:color => :white, :background => :red)
        elsif background_toggle
          print piece.icon.colorize(:color => :white, :background => :magenta)
        else
          print piece.icon.colorize(:color => :white, :background => :blue)
        end
        background_toggle = !background_toggle
      end
      puts

    end
    nil

  end

end
