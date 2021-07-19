require './board.rb'
require './human_player.rb'

class Game
    attr_reader :current_player, :players

    def initialize(length, *marks)
        # @player_1 = HumanPlayer.new(player_1_mark)
        # @player_2 = HumanPlayer.new(player_2_mark)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
        @current_player = @player_1
        @board = Board.new(length)
    end

    def switch_turn
        # current_idx = @players.index(@current_player)
        # if current_idx == @players.length - 1
        #     next_idx = 0
        #     @current_player = @players[next_idx]
        # else
        #     next_idx = current_idx + 1
        #     @current_idx = @players[next_idx]
        # end
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "victory"
                puts @current_player.to_s + " won"
                return
            else
                switch_turn
            end
        end

        puts "draw"
    end
end