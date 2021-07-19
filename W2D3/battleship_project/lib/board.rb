class Board

  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) {Array.new(n) {:N}} #each subarray will be a seperate :N
    @size = n * n
  end

  def [](pair) # getter @grid
    row, col = pair
    @grid[row][col]
  end


  def []=(position, value) # setter for @grid
    row, col = position
    @grid[row][col] = value
  end

#   self[pos] <-- getter for @grid
#   self[pos] = val <-- setter for @grid


  def num_ships
    count = 0
    @grid.each do |row|
      row.each do |ele|
        if ele == :S
          count += 1
        end
      end
    end

    count
  end

  def attack(position)
    # self with inside an instance method, is an instance
    if self[position] == :S
      self[position] = :H
      p 'you sunk my battleship!'
      return true
    else
      self[position] = :X
      return false
    end
  end

#   rand(0..1)

  def place_random_ships
    quarter_size = size / 4
    until num_ships == quarter_size
        row = rand(0...@grid.length)
        col = rand(0...@grid.length)
        pos = [row, col]
        self[pos] =:S
    end
  end

  def hidden_ships_grid
# array#map
    @grid.map do |sub|
      sub.map do |ele|
        if ele == :S
            :N
        else
            ele
        end
      end
    end
  end

def self.print_grid(grid)
    grid.each do |row|
        puts row.join(" ")
    end
end

def cheat
  Board.print_grid(@grid)
end

def print
  Board.print_grid(hidden_ships_grid)
end 



    # real_grid = [
    #       [:S, :N], <-- row1
    #       [:X, :S] <-- row 2
    #     ]


    #     :S :N
    #     :X :S
end


# for classes, we have two types of methods
#     class --> methods Board.class_method_name
#     instance methods --> instance_of_class.instance_method_name


# class methods
#     def self.class_method_name

#     end

# instance methods

#     def instance_method

#     end
