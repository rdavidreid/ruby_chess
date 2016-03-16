require 'byebug'

class Piece

  attr_reader :color, :icon, :slider
  attr_accessor :pos

  def initialize(color, board)
    @color = color
    @board = board
  end

  def valid_moves(board, current_pos, player, other_player)
    
    if @board.grid[current_pos[0]][current_pos[1]].color != player.color
      return []
    end

    array_of_moves = moves(current_pos)

    array_of_moves.delete_if { |pos| pos.min < 0 || pos.max > 7}
    array_of_moves.delete_if { |pos| pos == current_pos}

    p array_of_moves.delete_if { |pos| move_into_check(current_pos, pos, player, other_player) }
    array_of_moves.delete_if { |pos| move_into_check(current_pos, pos, player, other_player) }

  end
# need to change all moves to accept board and not look at @board
  def all_moves(board, current_pos, player, other_player)

    if board.grid[current_pos[0]][current_pos[1]].color != player.color
      return []
    end

    array_of_moves = moves(current_pos)

    array_of_moves.delete_if { |pos| pos.min < 0 || pos.max > 7}
    array_of_moves.delete_if { |pos| pos == current_pos}
  end

  def move_into_check(current_pos, new_pos, player, opponent)

    dup_board = @board.deep_dup
    dup_board.move(current_pos, new_pos)

    if dup_board.in_check?(player, opponent)
      return true
    end
    return false
  end

end
