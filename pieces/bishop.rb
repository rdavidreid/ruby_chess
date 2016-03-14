require_relative 'sliding_piece.rb'

class Bishop < Sliding_Piece

  def initialize(color,board)
    super(color,board)
    if color == "white"
      @icon = " ♝ "
    else
      @icon = " ♗ "
    end

    @slider = true
  end

  def moves(current_pos)
    arr = []

    arr += diagonal_moves(current_pos,  1,  1)
    arr += diagonal_moves(current_pos,  1, -1)
    arr += diagonal_moves(current_pos, -1,  1)
    arr += diagonal_moves(current_pos, -1, -1)

    return arr
  end

end
