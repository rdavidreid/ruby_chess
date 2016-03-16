require_relative 'pieces/nul_piece'
require_relative 'manifest.rb'

class Board
  attr_accessor :grid

  def initialize(populate)
    @grid = Array.new(8){Array.new(8){Nul_piece.new}}
    if populate == true
      populate_rear_row(7, "black", self)
      populate_rear_row(0, "white", self)
      populate_pawns(1, "white", self)
      populate_pawns(6, "black", self)
    end
  end

  def in_bounds?(pos)
    return false if pos.min < 0 || pos.max > 7
    true
  end

  def populate_rear_row(row,color,board)
    @grid[row][7] = Rook.new(color, board)
    @grid[row][6] = Knight.new(color, board)
    @grid[row][5] = Bishop.new(color, board)
    @grid[row][4] = King.new(color, board)
    @grid[row][3] = Queen.new(color, board)
    @grid[row][2] = Bishop.new(color, board)
    @grid[row][1] = Knight.new(color, board)
    @grid[row][0] = Rook.new(color, board)
  end

  def populate_pawns(row, color, board)
    @grid[row].map! do |cell|
      cell = Pawn.new(color,board)
    end
  end

  def move(start_pos,end_pos)
    selected_piece = @grid[start_pos[0]][start_pos[1]]
    selected_destination = @grid[end_pos[0]][end_pos[1]]

    if selected_piece.is_a?(Nul_piece)
      raise NoPieceError.new "There's no piece at that location."
    end

    if end_pos.min < 0 || end_pos.max > 7
      raise OutOfRangeError.new "Out of range."
    end

    @grid[end_pos[0]][end_pos[1]] = @grid[start_pos[0]][start_pos[1]]
    @grid[start_pos[0]][start_pos[1]] = Nul_piece.new

  end

  def find_piece(pos)
    @grid[pos[0]][pos[1]]
  end

  def find_king(color)
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        if cell.class == King && cell.color == color
          return [row_idx,col_idx]
        end
      end
    end
  end


  def in_check?(player,opponent)
    king_pos = find_king(player.color)

    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|

        if cell.color != player.color && cell.color != 'unique'
          return true if cell.moves([row_idx,col_idx]).include?(king_pos)
        end

      end
    end

    return false
  end

  def checkmate?(player,opponent)

    if in_check?(player,opponent)
      @grid.each_with_index do |row, row_idx|
        row.each_with_index do |cell, col_idx|

          if cell.color == player.color
            return false if cell.valid_moves(self, [row_idx,col_idx], player, opponent) != []
          end

        end
      end
      return true

    else
      return false
    end

  end

  def deep_dup
    new_board = Board.new(false)

    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|

        if cell.class != Nul_piece
          new_board.grid[row_idx][col_idx] = cell.class.new(cell.color, new_board)
        end

      end
    end

    return new_board
  end

  def pawn_promotion
    @grid[0].each_with_index do |cell, cell_idx|
      if cell.class == Pawn
        @grid[0][cell_idx] = Queen.new(cell.color, self)
      end
    end

    @grid[7].each_with_index do |cell, cell_idx|
      if cell.class == Pawn
        @grid[7][cell_idx] = Queen.new(cell.color, self)
      end
    end

  end

end
