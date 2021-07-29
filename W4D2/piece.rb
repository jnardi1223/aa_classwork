# require 'singleton'

class Piece 

    attr_reader :pos, :board, :color

    def initialize(color, board, pos)
       @color = color 
       @board = board
       @pos = pos
    end

    def to_s
        
    end

    def empty?(pos) 

    end

    def valid_moves
        valid = []
        @board.each do |row|
            row.each do |spot|
                if spot == :E  
                    valid << [row, spot]
                end 
            end 
        end 
        valid 
    end 

    def pos=(val)

    end 

    def Symbol 

    end

    def move_into_check?(end_pos)


end

class Null_piece < Piece
    include Singleton 
    
    def initialize
       super 
    end 

    def moves 
        puts "..."
    end 

    def symbol 
        :n
    end 


end

class King < Piece
  include Stepable 
end

class Queen < Piece

end

class Knight < Piece

end

class Pawn < Piece

end

module Stepable
   
    def moves(pos)
      valid = []
      possible_moves = [[1, 1], [1, -1], [-1, 1] [-1, -1] [1, 0], [-1, 0], [0, 1], [0 -1]]

      possible_moves.each do |move|
          valid << [move[0] + pos[0] , move[1] + pos[1]]
        end

      valid.select { |el| (el[0] >= 0 && el[0] < 8) && (el[1] >= 0 && el[1] < 8) && (el.empty?) }
    end

end 

module Slidable
        # a = [0, 1, -1]
        # b = [0, 1, -1]
        # possible_moves = a.product(b)
    def diag_moves(pos)
        a = (0..7).to_a
        b = (0..7).to_a
        possible_moves = a.product(b)
        possible_moves

    end

    def linear_moves(pos)

    end

end