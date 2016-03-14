require_relative 'stepping_piece.rb'

class Knight < Stepping_Piece

  def initialize(color, board)
    super(color,board)
    if color == "white"
      @icon = " ♞ "
    else
      @icon = " ♘ "
    end
  end

  def moves(current_pos)
    return knight_moves(current_pos)
  end

end
