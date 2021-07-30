# When we're writing code, we're concerned with how fast it is - but what does it mean to be faster? ie algo A is "faster" than algo B
#   What we can control/optimize for is:
#     (1) number of steps
#     (2) input size - can control


#     def add_ten(num1, num2)
#       suppose num2 is always 10
#       num1 = num1 + num2 #time complexit is O(4) --> O(1)
#     end

#     add_ten(any_num, 10)

#Rules are:
  # constants go to 1
    # 5794375n^2 --> 1 * n^2 --> n^2
  # loops n * number of steps in each loop
    # n represents the input size
    # array.each do |ele| n * ( 3 + 2 ) --> n + 5 --> O(n)
    #   ele = ele + 10 # ( +3 )
    #   ele / 50 # ( +2 )
    # end
  # how to count steps
    # all one step
      # +
      # -
      # *
      # /
      # <, > <=m >=
      # ==, !=, &&, ||
      # memory access and reassignment
        # def say_name(name)
        #   name --. O(1)
        # end

        # say_name("Jim")

# Big(O) Classifications
# O(1) -- constant --> ie, algo adds a number, just calls a value
# O(logn) -- log   --> ie, cutting an array in half, so never iterating over the entire array
# O(n) -- linear   --> ie iterating over an array
# O(nlogn) -- loglinear/super linear --> most sorting algo, merge_sort/quick_sort
# O(n^2) --> quadratic --> two nest loops
# ---------------^ try to stay above this
# O(n^num) --> polynomial --> num number of nested loops
# O(2^n) --> subsets
# O(n!) --> permutations

