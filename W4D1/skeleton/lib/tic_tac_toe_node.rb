require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark= next_mover_mark
    @prev_move_pos= prev_move_pos
  end

  def losing_node?(evaluator)
    
  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    arr=[]

    @board.rows.each_with_index do |row, rownum| 
      row.each_with_index do |grid, colnum| 
        if @board.empty?([rownum, colnum])
          #if arr[-1].nextmovemark = :x, selfmovemark=:o
          self.next_mover_mark == :x ? next_mark = :o : next_mark = :x
          newboard= self.board.dup
          newboard[[rownum, colnum]]= next_mover_mark
          arr<< TicTacToeNode.new(newboard, next_mark, [rownum, colnum])
        end
      end
    end

    
    #@board.dup
    arr
  end
end
