
require 'byebug'

class Piece
#   DIAGS = [
#   [1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7]
#   [-1,-1],[-2,-2],[-3,-3],[-4,-4],[-5,-5],[-6,-6],[-7,-7]
#   [1,-1],[2,-2],[3,-3],[4,-4],[5,-5],[6,-6],[7,-7]
#   [-1,1],[-2,2],[-3,3],[-4,4],[-5,5],[-6,6],[-7,7]
#   ]
#   VERTS = [ ]
#

  attr_reader :color, :icon, :slider
  attr_accessor :pos

  def initialize(color, board)
    @color = color
    @icon
    @board = board
    # @pos
  end


#if the space contains a a nulpiece, that's fine. TRUE

  def valid_moves(board, current_pos)
    array_of_moves = moves(current_pos)
    array_of_moves.delete_if {|pair| pair.min < 0 || pair.max > 7}
    array_of_moves.delete_if {|pair| pair == current_pos}

    #  array_of_moves = array_of_moves.select {|pos| obstructed?(current_pos,pos,board)} if slider
     #
    #  puts array_of_moves
    #  sleep 2

  end

  # def moves
  #   available_moves = []
  #
  #   move_dirs.each do |dir|
  #
  #   end
  # end


  def obstructed?(current_pos,other_pos,board)
    tester = other_pos
    # puts tester
    # sleep 2

    # (-1..1).each do |i|
    #   (-1..1).each do |j|


    if other_pos[0] > current_pos[0]              #New position is below us
      if other_pos[1] > current_pos[1]            #new position is on our right--bishop move
        tester[0] -= 1
        tester[1] -= 1
        until tester == current_pos
          # puts board.grid[tester[0]][tester[1]]
          # puts !board.grid[tester[0]][tester[1]].is_a?(Nul_piece)
          # sleep 2
          return false if !board.grid[tester[0]][tester[1]].is_a?(Nul_piece)
          # return false if the piece at tester is not a nul piece
          tester[0] -= 1
          tester[1] -= 1
        end

      elsif other_pos[1] < current_pos[1]         #new position on our left
        until tester == current_pos
          tester[0] -= 1
          tester[1] += 1
          return false if !board.grid[tester[0]][tester[1]].is_a?(Nul_piece)
        end
      elsif other_pos[1] == current_pos[1]             #new position is on our level horizontally
        until tester == current_pos
          tester[1] -= 1
          return false if !board.grid[tester[0]][tester[1]].is_a?(Nul_piece)
        end
      end

    elsif other_pos[0] < current_pos[0]           #New position is above us
      if other_pos[1] > current_pos[1]            #new position is on our right
        until tester == current_pos
          tester[0] += 1
          tester[1] -= 1
          return false if !board.grid[tester[0]][tester[1]].is_a?(Nul_piece)
        end

      elsif other_pos[1] < current_pos[1]         #new position on our left
        until tester == current_pos
          tester[0] += 1
          tester[1] += 1
          return false if !board.grid[tester[0]][tester[1]].is_a?(Nul_piece)
        end

      else                                        #new position is on our level horizontally
        until tester == current_pos
          tester[0] += 1
          return false if !board.grid[tester[0]][tester[1]].is_a?(Nul_piece)
        end
      end

    else                                          #new position is at our level vertically
      if other_pos[1] > current_pos[1]            #new position is on our right
        until tester == current_pos
          tester[1] -= 1
          return false if !board.grid[tester[0]][tester[1]].is_a?(Nul_piece)
        end

      elsif other_pos[1] < current_pos[1]         #new position on our left
        until tester == current_pos
          tester[1] += 1
          return false if !board.grid[tester[0]][tester[1]].is_a?(Nul_piece)
        end

      end
    end

    return false if board.grid[other_pos[0]][other_pos[1]].color == self.color
    # puts "hello"
    # sleep(2)
    true

  end


  private

  # def diagonal_moves(current_pos)
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
  #
  # def cardinal_moves(current_pos)
  #   moves = []
  #   (0..7).each do |i|
  #     (0..7).each do |j|
  #       if current_pos[0] == i
  #         moves << [i,j]
  #       elsif current_pos[1] == j
  #         moves << [i,j]
  #       end
  #     end
  #   end
  #   moves
  # end


end


# arr.sort{|el1,el2| el1[1] <=> el2[1]}
# arr.sort{|el1,el2| el1[0] <=> el2[0]}
# arr
