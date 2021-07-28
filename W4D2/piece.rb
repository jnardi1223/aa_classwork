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

end

class Queen < Piece

end

class Knight < Piece

end

class Pawn < Piece

end

module Stepable
   
    def moves 
    #    possible_moves = [[1, 1], [1, -1], [-1, 1] [-1, -1] [1, 0], [-1, 0], [0, 1], [0 -1]] 
        possible_moves = [0, 1, -1]
        b = [1, -1]
        possible_moves.product(b) 

    end

end 