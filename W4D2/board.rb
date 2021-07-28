require_relative "piece.rb"

class Board 

    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8, "_") }
        self.populate
    end 

    def populate
        @board.each.with_index do |row, idx|
            if idx == 0 || idx == 1 || idx == 6 || idx == 7
            row.each do |spot|
                    spot = :X
                end
            end
        end
    end

    def move_piece(start_pos, end_pos)
        raise if start_pos == nil 
        raise if end_pos != nil 
    end

    def [](pos)
        row, col = pos 
        @board[row][col]
    end 

    def []=(pos, val)
        row, col = pos 
        @board[row][col] = value 
    end

end 

b = Board.new
# p b.populate
p b