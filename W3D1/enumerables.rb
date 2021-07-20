class Array
    def my_each(&prc)
        i = 0 
        while i < self.length 
            prc.call(self[i]) 
            i += 1 
        end
        self
    end

      def my_select(&prc)
    selects = []

    self.my_each do |item|
      selects << item if prc.call(item)
    end

    selects
  end

  def my_reject(&prc)
    selects = []

    self.my_each do |item|
      selects << item unless prc.call(item)
    end

    selects
  end

  def my_any?(&prc)
    self.my_each do |num|
      if prc.call(num)
        return true 
      end
    end  
    false 
  end

  def my_all?(&prc) 
    self.my_each do |num|
      if !prc.call(num)
        return false 
      end 
    end 
    true 
  end 

  def my_flatten
     if self.length == 1
      return self
     else 
      return self.flatten 
     end 
  end 

  def my_zip(*args)
    
  end 
 
  def my_rotate(num = 1)
    split = num % self.length
    
    self.drop(split) + self.take(split)
     
  end 

  def my_join(space = "")
    new_str = ""
    self.my_each do |ele|
      new_str += ele  
      new_str += space 
    end 
    new_str
  end 

  require "byebug"
  def my_reverse 
      new_arr = []
      debugger 
      self.each do |ele|
        new_arr.unshift(ele)
      end
    new_arr 

  end 



end
 #END OF CLASS 

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

#  a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

#  a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


#  a = [ 4, 5, 6 ]
#  b = [ 7, 8, 9 ]
#  [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
#  a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
#  [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
 
#  c = [10, 11, 12]
#  d = [13, 14, 15]
#  [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

#  a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

#  a = [1, 2, 3]
#  p a.my_reject { |num| num > 1 } # => [1]
#  p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end


# arr = [1,2,3]
#   .map { |ele| ele * 2 }.select { |ele| ele < 5|} # then does this

# # => 1
#      2
#      3
#      1
#      2
#      3

# p return_value  # => [1, 2, 3]
