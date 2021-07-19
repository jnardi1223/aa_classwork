class Board

    def initialize
        @grid = Array.new(3) { Array.new(3, "_") }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def valid?(pos)
        row, col = pos
        if (row <= 2 && col <= 2) && (row >= 0 && col >= 0)
            return true
        else
            return false
        end
    end

    def empty?(pos)
        row, col = pos
        if @grid[row][col] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(pos, mark)
        if !valid?(pos) || !empty?(pos)
            raise "invalid position"
        else
            row, col = pos
            self[pos] = mark
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_diagonal?(mark)
        (@grid[1][1] == mark && @grid[2][2] == mark && @grid[3][3] == mark) || (@grid[1][3] == mark && @grid[2][2] == mark && @grid[3][1] == mark)
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win?(mark)
        win_diagonal?(mark) || win_col?(mark) || win_row?(mark)
    end

    def empty_positions?
        indices = (0...@grid.length).to_a
        positions = indices.product(indices)
        positions.any? { |pos| empty?(pos) }

    #     # @grid.each do |row|
    #     #     if row.any? { |ele| ele == "_" }
    #     #         return true
    #     #     else
    #     #         return false
    #     #     end
    #     # end
    end
end