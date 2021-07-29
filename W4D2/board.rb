require_relative "piece.rb"

class Board 

    attr_reader :board

    def initialize
         rows = Array.new(8) { Array.new(8, :E) }
         self.populate
    end 

    def populate
        (0..7).each do |i|
            (0..7).each do |j|
                 rows[i].each do |row|
                    if i == 0 || i == 1 || i == 6 || i == 7
                         rows[i][j] = Piece.new.symbol
                    end
                end
            end
        end
    end

    
    def [](pos)
        row = pos[0]
        col = pos[1]
         rows[row][col]
    end 
    
    def []=(pos, val)

        row = pos[0]
        col = pos[1]
         rows[row][col] = val
    end
    
    def move_piece(start_pos, end_pos)
        start_piece = self.rows[start_pos[0]][start_pos[1]]
        end_piece = self.rows[end_pos[0]][end_pos[1]]
        self.rows[end_pos[0]][end_pos[1]] = start_piece
        self.rows[start_pos[0]][start_pos[1]] = end_piece
        raise "Please select a Piece" if self.rows[start_pos[0]][start_pos[1]] != :E
        raise "Place your piece on an empty spot" if self.rows[end_pos[0]][end_pos[1]] == :E
    end
end 

# b = rows.new
# # p b
# # p b[0, 0]
# p b.move_piece([1, 0], [2, 0])
# p b


sorted = true
while sorted
sorted = false

sorted = true

