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
    # debugger
    return arr
  end



  # No longer need march10 4:27
  # def moves(current_pos)
  #   moves = []
  #   (-7..7).each do |i|
  #     (-7..7).each do |j|
  #
  #       if i.abs == j.abs
  #         moves << [(current_pos[0] + i),(current_pos[1] + j)]
  #       end
  #     end
  #   end
  #   (0..7).each do |i|
  #     (0..7).each do |j|
  #       if current_pos[0] == i
  #         moves << [i,j]
  #       elsif current_pos[1] == j
  #         moves << [i,j]
  #       end
  #     end
  #   end
  #
  #   moves
  # end

  # def valid_moves(board,current_pos)
  #   all_moves = moves(current_pos)
  # end

end
