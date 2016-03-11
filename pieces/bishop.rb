require_relative 'piece.rb'

class Bishop < Piece

  def initialize(color)
    super(color)
    @icon = " ♝ "
    @slider = true
  end

  def moves(current_pos)
    moves = []
    (-7..7).each do |i|
      (-7..7).each do |j|

        if i.abs == j.abs
          moves << [(current_pos[0] + i),(current_pos[1] + j)]
        end
      end
    end
    moves
  end


  # def valid_moves(board,current_pos)
  #   all_moves = moves(current_pos)
  #
  #
  # end

end
