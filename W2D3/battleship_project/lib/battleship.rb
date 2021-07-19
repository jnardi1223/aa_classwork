require_relative "board"
require_relative "player"

class Battleship

    attr_reader 

    def initialize(n)
        # everthing in here, is an instance variable
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end 

    def board
        @board 
    end 

    def player
        @player 
    end 

    def start_game
        @board.place_random_ships
        p @board.num_ships 
        @board.print  #we have print in board class 
    end 

    def lose?
        if @remaining_misses <= 0 
            p 'you lose'
            return true 
        else 
            return false 
        end 
    end 

    def win?
        if @board.num_ships == 0 
            p 'you win'
            return true 
        else 
            return false 
        end
    end 

    def game_over?
        self.lose? || self.win? ?  
    end

    def turn 
        guess = @player.get_move
        if !@board.attack(guess)
            @remaining_misses -= 1 
        end 
        @board.print 
        p @remaining_misses

    end 
end
