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
    moves = []
    (1..7).each do |a|
      (1..7).each do |b|
        k = a * mult1
        j = b * mult2
        if k.abs == j.abs

          if (current_pos[0] + k).abs < 0 || (current_pos[0] + k).abs > 7
            return moves

          elsif @board.grid[(current_pos[0] + k)].class == NilClass
            return moves

          elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].class == NilClass
            return moves

          elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].class == Nul_piece
            moves << [(current_pos[0] + k), (current_pos[1] + j)]

          elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].color == self.color
            return moves

          elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].color != nil
            moves << [(current_pos[0] + k), (current_pos[1] + j)]
            return moves

          end

        end
      end
    end
    moves
  end

  def cardinal_moves(current_pos, mult1, mult2)
    moves = []
    (0..7).each do |a|
      (0..7).each do |b|
        # debugger

        # break if a == 0 && b == 0
        k = a * mult1
        j = b * mult2
        next if j == 0 && k == 0

        if !(current_pos[0] + k).between?(0,7)
          return moves

        elsif !(current_pos[1] + j).between?(0,7)
          return moves

        elsif @board.grid[current_pos[0] + k][(current_pos[1] + j)].class == Nul_piece
          moves << [(current_pos[0] + k), (current_pos[1] + j)]

        elsif @board.grid[current_pos[0] + k][(current_pos[1] + j)].color == self.color
          return moves

        elsif @board.grid[current_pos[0] + k][(current_pos[1] + j)].color != nil
          moves << [(current_pos[0] + k), (current_pos[1] + j)]
          return moves
        end
      end
    end

    return moves
  end

  # def hmoves(current_pos, mult)
  #   debugger
  #   moves = []
  #
  #   (0..7).each do |a|
  #     j = a * mult
  #
  #     if (current_pos[1] + j) > 7 || (current_pos[1] + j) < 0
  #       return moves
  #
  #     elsif @board.grid[current_pos[0]][(current_pos[1] + j)].class == Nul_piece
  #       moves << [(current_pos[0]), (current_pos[1] + j)]
  #
  #     elsif @board.grid[current_pos[0]][(current_pos[1] + j)].color == self.color
  #       return moves
  #
  #     elsif @board.grid[current_pos[0]][(current_pos[1] + j)].color != nil
  #       moves << [ (current_pos[0]), (current_pos[1] + j)]
  #       return moves
  #     end
  #
  #   end
  #   debugger
  #   return moves
  # end

end
