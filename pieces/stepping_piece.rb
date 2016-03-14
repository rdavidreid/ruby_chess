require_relative 'piece.rb'

class Stepping_Piece < Piece

  private

  def knight_moves(current_pos)
    dirs = [-2,2,-1,1]
    moves = []

    dirs.each do |k|
      dirs.each do |j|

        next if k.abs == j.abs

        if (current_pos[0] + k).abs < 0 || (current_pos[0] + k).abs > 7
          next

        elsif @board.grid[(current_pos[0] + k)].class == NilClass
          next

        elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].class == NilClass
          next

        elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].class == Nul_piece
          moves << [(current_pos[0] + k), (current_pos[1] + j)]

        elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].color == self.color
          next

        elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].color != nil
          moves << [(current_pos[0] + k), (current_pos[1] + j)]

        end

      end
    end

    return moves
  end

  def pawn_moves(current_pos)
    moves = []
    ydir = 1
    ydir = -1 if self.color == "black"

    return [] if self.color == "white" && current_pos[0] == 7
    return [] if self.color == "black" && current_pos[0] == 0

    # first move, two spaces ahead
    if self.color == "white" && current_pos[0] == 1
      if @board.grid[(current_pos[0] + (ydir * 2))][current_pos[1]].color != self.color
        moves << [(current_pos[0] + (ydir * 2)),current_pos[1]]
      end

    elsif self.color == "black" && current_pos[0] == 6
      if @board.grid[(current_pos[0] + (ydir * 2))][current_pos[1]].color != self.color
        moves << [ (current_pos[0] + (ydir * 2)),current_pos[1] ]
      end
    end

    # normal move, 1 space ahead
    if @board.grid[(current_pos[0] + ydir)][current_pos[1]].class == Nul_piece
      moves << [ (current_pos[0] + ydir),current_pos[1] ]
    end

    # Jump piece ahead
    if @board.grid[(current_pos[0] + ydir)][(current_pos[1] + 1)]
      if @board.grid[(current_pos[0] + ydir)][(current_pos[1] + 1)].color != self.color &&
         @board.grid[(current_pos[0] + ydir)][(current_pos[1] + 1)].class != Nul_piece
            moves << [ (current_pos[0] + ydir),(current_pos[1] + 1) ]
      end

      # Jump piece ahead
      if @board.grid[(current_pos[0] + ydir)][(current_pos[1] - 1)].color != self.color &&
         @board.grid[(current_pos[0] + ydir)][(current_pos[1] - 1)].class != Nul_piece
            moves << [ (current_pos[0] + ydir),(current_pos[1] - 1) ]
      end
    end

    return moves
  end

end
