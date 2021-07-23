require 'set'



class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    words = File.readlines(dictionary_file_name).map(&:chomp)
    @dictionary = Set.new(words)
  end

  def adjacent_words(word_1)
    # puts @dictionary.class
    @dictionary.select do |word_2|
      if word_2.length == word_1.length && word_2 != word_1
      (0...word_2.length).one? { |idx| word_1[idx] != word_2[idx]}
      end
    end
  end

  def run(source, *target)
    @current_words = [source] # #["apple"]
    @all_seen_words = [source] # ["apple"]

    until @current_words.empty? #["ample", "apply"]

      new_current_words = []
      @current_words.each do |current_word| # #["ample", "apply"]
        self.adjacent_words(current_word).each do |adj_word| # ""
          if !@all_seen_words.include?(adj_word)
      
            @all_seen_words << adj_word # ["apple", "ample", "apply", "amble, amply", "apply"
            new_current_words << adj_word #["amble, amply", "apply"
          end 
        end 
      end
      puts new_current_words
      puts "break"
      @current_words = new_current_words #["amble, amply", "apply"
    end

    @all_seen_words

  end

  
  


end
