require_relative "card.rb"
require_relative "game.rb"


class Board

    attr_reader :board

    def initialize(size = 4)
        @board = Array.new(size) { Array.new(size) } #creates a square board with the size given, if no size give then 4x4
        @size = size 
        populate
    end

    def [](pos)
        @board[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @board[pos[0]][pos[1]] = value
    end

    def populate
    num_pairs = (size**2) / 2 #making the number of pairs the size** (number of spots) divided by 2 
    cards = Card.shuffled_pairs(num_pair) #making cards and a if shuffled pairs 
        @board.each_with_index do |i1|
            @board.each_with_index do |i2|
                self[[i1, i2]] = cards.pop #putting in a car out of shuffled cards array at the possition and poping it out so its not used again 
            end 
        end
    end 

    def render 
        system("clear")
        puts " #{(0...size).to_a.join(' ')}"
        rows.each
    end 


end