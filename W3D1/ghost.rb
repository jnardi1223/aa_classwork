require './player.rb'
require 'set'

class Game 
    MAX_LOSS_COUNT = 5 #class variabel bc every player only gets 5 losses, does not rely on any classs instances 
    ALPHABET = Set.new("a".."z") #class variable becuase everyoen will use the same alphabet, does not rely on any classs instances 
   

    def initialize
        words = File.readlines("dictionary.txt").map(&:chomp) #we are setting words to an array of each word in dictionary.txt file/chomp the end off 
        @dictionary = Set.new(words) #making dictionary a set of each word in the words array 
        @players = players
        @losses = Hash.new {|losses, player| losses[player] = 0 } #creating a hash to hold a count of each players losses
    end 

    def play_round

    end 

    def current

end 

