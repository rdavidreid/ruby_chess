require_relative 'piece.rb'

class Rook < Piece

  def initialize(color)
    super(color)
    @icon = " ♜ "
    @slider = true

  end

  def moves(current_pos)
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

  #
  # def valid_moves(board,current_pos)
  #   all_moves = moves(current_pos)
  #
  # end


end
