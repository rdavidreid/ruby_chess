require 'byebug'

class Piece

  attr_reader :color, :icon, :slider
  attr_accessor :pos

  def initialize(color, board)
    @color = color
    @board = board
  end

  def valid_moves(board, current_pos, player)
    if board.grid[current_pos[0]][current_pos[1]].color != player.color
      return []
    end
    array_of_moves = moves(current_pos)

    array_of_moves.delete_if {|pair| pair.min < 0 || pair.max > 7}
    array_of_moves.delete_if {|pair| pair == current_pos}
  end

end
