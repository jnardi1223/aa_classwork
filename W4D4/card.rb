require_relative "deck"
class Card 

    attr_reader :card

    def initialize
        @card = @deck.shuffle.shift 
    end 

end 


card_1 = Card.new 

card_1.card