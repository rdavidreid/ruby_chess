class Nul_piece
  attr_reader :icon

  def initialize
    @icon = "   "
    @color = "unique"
  end

  def valid_moves(board, pos)
    []
  end

end
