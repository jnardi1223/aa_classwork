class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? { |color| POSSIBLE_PEGS.include?(color.upcase) }
  end 

  def self.random(num)
    random = []
    num.times { random << POSSIBLE_PEGS.keys.sample}
    Code.new(random)
  end 

  def self.from_string(pegs)
    chars = []
    pegs.each_char {|char| chars << char}
    Code.new(chars)
  end 

  def initialize(pegs)
      Code.valid_pegs?(pegs) ? @pegs = pegs.map {|ele| ele.upcase} : (raise "error") 
  end 

  def [](i)
    pegs[i]
  end 

  def length
    pegs.length 
  end 


 def num_exact_matches(guess)
    (0...guess.length).count do |i|
      guess[i] == pegs[i]
    end 
 end 

 def num_near_matches(guess)
  peg_clone = pegs.clone # created a clone of pegs array 
  guess_clone = guess.pegs.clone #create a clone of guess array 

  guess_clone.each_with_index do |g, i| 
    if peg_clone[i] == g 
       guess_clone[i] = nil #here we just made very exeact match in guess and @peg to nil 
      peg_clone[i] = nil
    end
  end

  peg_clone.delete(nil)   #here we delete all the nils (all the exact matches)
  guess_clone.delete(nil)


  count = 0 

  guess_clone.each_with_index do |g, i|
      if peg_clone.include?(g)
        count += 1
          peg_clone.delete_at(peg_clone.index(g))
          # peg_clone.delete_at(index of peg in peg_clone)
          # how do I get the index of peg in peg_clone
      end
  end

  count

end


 # we are going to create duplicates of guess.pegs AND pegs
 # iterate through guess.pegs, and assign all matching EXACT MATCHES to nil
 # then, array#delete(element), we're going to use this to delete all nil's
 # THUS, we will have deleted all EXACT MATCHES

 # create count variable, which we will return
 # iterate again through guess.pegs.clone, and for each element that is in pegs, count += 1
  # if pegs.clone.include?(peg) <-- peg is from guess.pegs.clone
      # count += 1
      # delete the peg at the exact index in peg.clone, array#delete_at(index)

  # return count

 def ==(guess)
  pegs == guess.pegs
 end 

end
