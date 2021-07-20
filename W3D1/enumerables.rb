class Array
    require 'byebug'
    def my_each(&prc)
        i = 0 
        #debugger 
        while i < self.length 
            ele = self[i]
            prc.call(ele) 
            i += 1 
        end

        self
    end

    # def my_each(&prc)
    #     self.length.times do |i|
    #       prc.call(self[i])
    #     end
    
    #     self
    #   end

end

# arr = [1, 2, 3]
# p arr.my_each { |ele| puts ele }

return_value = [1, 2, 3].my_each do |num|
    puts num
  end.my_each do |num|
    puts num
  end
  # => 1
       2
       3
       1
       2
       3
  
  p return_value  # => [1, 2, 3]

