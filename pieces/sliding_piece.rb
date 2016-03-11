require_relative 'piece.rb'

class Sliding_Piece < Piece

  private

  # def diagonal_moves(current_pos, board)
  #   moves = []
  #   (-7..7).each do |i|
  #     (-7..7).each do |j|
  #       if i.abs == j.abs
  #         moves << [(current_pos[0] + i),(current_pos[1] + j)]
  #       end
  #     end
  #   end
  #   moves
  # end

  def diagonal_moves(current_pos, mult1,mult2)
    # debugger
    @board
    moves = []
    # range = [1,2,3,4,5,6,7,-1,-2,-3,-4,-5,-6,-7]

    (1..7).each do |a|
      (1..7).each do |b|
        k = a * mult1
        j = b * mult2
        # debugger
        if k.abs == j.abs
          # debugger
          if (current_pos[0] + k).abs < 0 || (current_pos[0] + k).abs >= 7
            return moves
          elsif @board.grid[(current_pos[0] + k)].class == NilClass
            # debugger
            return moves
          elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].class == NilClass
            # debugger
            return moves
          elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].class == Nul_piece
            moves << [(current_pos[0] + k), (current_pos[1] + j)]
          elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].color == self.color
            # debugger
            return moves

          elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].color != nil
            # should be hostile piece
            moves << [(current_pos[0] + k), (current_pos[1] + j)]
            # debugger
            return moves
          end

        end
      end
    end
    moves
  end

  def cardinal_moves(current_pos)
    @board
    moves = []
    (0..7).each do |i|
      (0..7).each do |j|
        if current_pos[0] == i
          moves << [i,j]
        elsif current_pos[1] == j
          moves << [i,j]
        end
      end
    end
    moves
  end

end
