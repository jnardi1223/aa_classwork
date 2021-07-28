require 'singleton'

class Piece 


    def initialize 
        @queen 
        @rook
        @knight 
        @nil = Null_piece.instance 
    end


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

class King_Knight



end