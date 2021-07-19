class Board 
    def initialize 
        @grid = Array.new(3) {Array.new(3, "_")}
    end 

    # def [](position)
    #     row, col = position
    #     @grid[row][col]
    # end 

    # def []=(position, value)
    #     row, col = position
    #     @grid[row][col] = value
    # end  

    def valid?(position)
        #row, col = position
        position.each do |spot|
            return false  if spot < 0 || spot > 2 
        end 
        true 
    end 

    def empty?(position)
        row, col = position
        @grid[row][col] == '_'
    end 

    def place_mark(pos, mark)
        if !empty?(pos) || !valid?(pos)
            raise 'error'
        else 
            row, col = pos 
            self[pos] = mark 
        end 
    end 

    def print
        @grid.each do |row|
            puts row.join(' ')
        end 
    end 

    def win_row?(mark)
        @grid.any? do |row| 
            row.all? {|ele| ele == mark}
        end  
    end 

    def win_col(mark)
        @grid.transpose.any? do |row|
            row.all? {|ele| ele == mark}
        end  
    end     

    def win_diagnol(mark)
        @grid[0][0] == @grid[1][1] == @grid[2][2] || @grid[2][0] == @grid[1][1] == @grid[0][2]
    end 

end 