require_relative 'sliding_piece.rb'

class Queen < Sliding_Piece

  def initialize(color,board)
    super(color,board)

    if color == "white"
      @icon = " ♛ "
    else
      @icon = " ♕ "
    end

    @slider = true
  end

  def moves(current_pos)
    arr = []

    arr += cardinal_moves(current_pos,  0,  1)
    arr += cardinal_moves(current_pos,  0, -1)
    arr += cardinal_moves(current_pos,  1,  0)
    arr += cardinal_moves(current_pos, -1,  0)

    arr += diagonal_moves(current_pos,  1,  1)
    arr += diagonal_moves(current_pos,  1, -1)
    arr += diagonal_moves(current_pos, -1,  1)
    arr += diagonal_moves(current_pos, -1, -1)
  end

end
