require_relative "piece.rb"

class Board 

    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8, :E) }
        # @board = Array.new(8) { [] }
        self.populate
    end 

    def populate
        (0..7).each do |i|
            (0..7).each do |j|
                @board[i].each do |row|
                    if i == 0 || i == 1 || i == 6 || i == 7
                        @board[i][j] = Piece.new.symbol
                    end
                end
            end
        end
    end

    
    def [](pos)
        # row, col = pos 
        row = pos[0]
        col = pos[1]
        @board[row][col]
    end 
    
    def []=(pos, val)
        # row, col = pos
        row = pos[0]
        col = pos[1]
        @board[row][col] = val
    end
    
    def move_piece(start_pos, end_pos)
        start_piece = self.board[start_pos[0]][start_pos[1]]
        end_piece = self.board[end_pos[0]][end_pos[1]]
        self.board[end_pos[0]][end_pos[1]] = start_piece
        self.board[start_pos[0]][start_pos[1]] = end_piece
        # self.board[end_pos[0]][end_pos[1]] = self.board[start_pos[0]][start_pos[1]]
        # self.board[start_pos] = self.board[end_pos]
        raise "Please select a Piece" if self.board[start_pos[0]][start_pos[1]] != :E
        raise "Place your piece on an empty spot" if self.board[end_pos[0]][end_pos[1]] == :E
    end
end 

# b = Board.new
# # p b
# # p b[0, 0]
# p b.move_piece([1, 0], [2, 0])
# p b

