require_relative 'tic_tac_toe'

class TicTacToeNode
  
  attr_reader :board, :next_mover_mark, :prev_move_pos
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    
  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    arr=[]

    @board.rows.each_with_index do |row, row_num| 
      row.each_with_index do |spot, spot_num| 
        
        if @board.empty?([row_num, spot_num])
          self.next_mover_mark == :x ? next_mark = :o : next_mark = :x
          new_board = self.board.dup
          new_board[[row_num, spot_num]] = next_mover_mark
          arr << TicTacToeNode.new(new_board, next_mark, [row_num, spot_num])
        end

      end
    end

    
    #@board.dup
    arr
  end
end
