require_relative 'piece.rb'

class King < Piece

  def initialize(color,board)
    super(color,board)

    if color == "white"
      @icon = " ♚ "
    else
      @icon = " ♔ "
    end

  end

  def moves(current_pos)
    arr = []
    (-1..1).each do |k|
      (-1..1).each do |j|

        if (current_pos[0] + k).abs < 0 || (current_pos[0] + k).abs > 7
          next

        elsif @board.grid[(current_pos[0] + k)].class == NilClass
          next

        elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].class == NilClass
          next

        elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].class == Nul_piece
          arr << [(current_pos[0] + k), (current_pos[1] + j)]

        elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].color == self.color
          next

        elsif @board.grid[(current_pos[0] + k)][(current_pos[1] + j)].color != nil
          arr << [(current_pos[0] + k), (current_pos[1] + j)]

        end

      end
    end
    arr
  end

end
