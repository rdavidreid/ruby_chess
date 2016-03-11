require_relative 'pieces/nul_piece'
require_relative 'manifest.rb'

class Board
  attr_accessor :grid


  def initialize
    @grid = Array.new(8){Array.new(8){Nul_piece.new}}
    @grid[0][0] = Queen.new("white", self)
    @grid[0][5] = Queen.new("black", self)
  end

  def in_bounds?(pos)
    return false if pos.min < 0 || pos.max > 7
    true
  end

  #assume start & end pos == array for now

  def move(start_pos,end_pos)
    selected_piece = @grid[start_pos[0]][start_pos[1]]
    selected_destination = @grid[end_pos[0]][end_pos[1]]

    if selected_piece.is_a?(Nul_piece)
      raise NoPieceError.new "There's no piece at that location."
      #also something for selecting opponent's pieces
    end

    if end_pos.min < 0 || end_pos.max > 7
      raise OutOfRangeError.new "Out of range."
    end

    @grid[end_pos[0]][end_pos[1]] = @grid[start_pos[0]][start_pos[1]]
    @grid[start_pos[0]][start_pos[1]] = Nul_piece.new

  end

  def find_piece(pos)
    @grid[pos[0]][pos[1]]
  end

end
