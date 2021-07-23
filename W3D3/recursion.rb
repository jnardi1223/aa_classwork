# def range(first, last)
#     return [] if last < first
#     [first] + range(first + 1, last)
# end

# #p range(1, 5)

# def sum_arr(arr)
#     return 0 if arr.empty?
#     arr[0] + sum_arr(arr[1..-1])
# end 

# #p sum_arr([1, 2, 5, 7])

# def exponent(base, num)
#     return 1 if num == 0 
#     base * exponent(base, num - 1)
# end 

# #p exponent(5, 2)

# def exponent_(base, num)
#     return 1 if num == 0 
#     if num.even?
#         base * exponent_(base, (num / 2) ** 2) 
#     else 
#         base * (exponent_(base, (num - 1) / 2) ** 2)
#     end 

# end 

# def exp1(base, power)
#     power == 0 ? 1 : base * exp1(base, power - 1)
# end
  
# def exp2(base, power)
#     return 1 if power == 0

#     half = exp2(base, power / 2)

#         if power.even?
#             half * half
#         else
#         # note that (power / 2) == ((power - 1) / 2) if power.odd?
#         base * half * half
#         end

# end

#p exponent_(5, 2)















# def upcase(str)
#     return str if str.length == 0
#     str[0].upcase + upcase(str[1..-1])
# end 

# p  upcase('hello')

# def reverse(str)
#     return str if str[0] == str[-1]
#     str[-1] + reverse(str[0..-2])
# end 

# def quick_sort(arr)
#     return arr if arr.length <= 1 
#     pivot_arr = [arr.first]
#     left_side = arr[1..-1].select {|ele| ele < arr.first}
#     right_side = arr[1..-1].select {|ele| ele >= arr.first}
#     quick_sort(left_side) + pivot_arr + quick_sort(right_side) 
# end 

# def sum_to(n)
#     return nil if n < 0 
#     return n if n == 1 
#     n + sum_to(n - 1)
# end 


# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil


# def add_numbers(arr)
#     return arr.first if arr.legnth <= 1 

#     arr.pop + add_numbers(arr)
# end 


# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

# def gamma_fnc(num)
#     return nil if num == 0 
#     return num if num == 1 

#     (num - 1) * gamma_fnc(num - 1)
# end 



# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040

# def ice_cream_shop(flavors, favorite)
#     #flavors.include?(favorite)
#     return false if flavors.empty?
#     return true if flavors.last == favorite

#     ice_cream_shop(flavors[0...-1], favorite)
# end 

# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

# def reverse(word)
#     return "" if word.empty? 

#     reverse(word[1..-1]) + word[0])
# end 


# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""

# def range(first, last)                                         # range(1, 5)
#   return [] if first >= last                                   # [1, 2, 3, 4] = [1] + [2, 3, 4]
#                                                                #    arr = [2] + [3, 4]      
#   arr = [first] + range(first + 1, last)                       #        arr = [3] + [4]
# end                                                            #            arr = [4] + []
#                                                                #                []
# def exp(b, n); end 

# p range(1, 5)

# # 
# arr = [1,2,3]

# def sum_array(array)
#     array.inject { |acc, val| acc + val }
# end

# def sum_array(array)
#     return array[0] if array.length <= 1

#     sum = 0
#     sum += array[0] + sum_array(array.drop(1))
#     sum
# end

# def sum_array(array)
#     array.length <= 1 ? array[0] : array[0] + sum_array(array.drop(1))
# end

# p sum_array(arr)

# def exponent(base, power)
#     return 1 if power == 0 

#     base * exponent(base, power - 1)
# end 

# def exponent(base, power)
#   return 1 if power == 0
#   return base if power == 1  

#   if power.even?
#     exponent(base, power / 2) * exponent(base, power / 2) 
#   else 
#     base * (exponent(base, ((power - 1) / 2) ) *  exponent(base, ((power - 1) / 2) ) )
#   end 

# end 


# p exponent(2, 3)
# class Array


#     def deep_dup

#       duplicate = []

#       self.each do |ele|
#         if ele.is_a?(Array)
#           duplicate << ele.deep_dup
#         else 
#           duplicate << ele
#         end 
#       end 

#       duplicate

#     end  
# end 

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robo_parts_copy = robot_parts.deep_dup
# robo_parts_copy[1] << "LEDs"
# p robot_parts[1]

# def deep_dup
#     self.inject([]) { |duplicate, ele| ele.is_a?(Array) ? duplicate << ele.deep_dup : duplicate << ele }
# end

# def deep_dup
#     self.map { |ele| ele.is_a?(Array) ? ele.deep_dup : ele }
# end

# # [] << [1, 2, 3, [[4], 5, 7].deep_dup
# # [] << 1
# end
# test_arr_nums = [[1, 2, 3,[[4], 5, 7]],[1, 2, 3,[4, [5, 7]]]]

# second = test_arr_nums.deep_dup

# # p test_arr_nums.object_id
# puts "DEEP DUP"
# p second
# second << 4
# p second
# p test_arr_nums
# puts
# puts
# puts "SHALLOW DUP"
# test_2 = [[1, 2, 3,[[4], 5, 7]],[1, 2, 3,[4, [5, 7]]]]
# test_2_dup = test_2.dup
# # p test_2_dup
# # test_2_dup[1] << 4
# # p test_2_dup
# # p test_2
# p test_2_dup
# test_2_dup << 4
# p test_2_dup
# p test_2

# def fibonacci(n)
#   return [0] if n == 1
#   return [0, 1] if n == 2
#   sequence = fibonacci(n-1)
#   sequence << sequence[-2] + sequence[-1]

#   sequence
# end

# def bsearch(arr, target)
#    return nil if arr.length == 0 
#    middle = arr.length / 2
 
#    if arr[middle] == target 
#         middle
#    elsif arr[middle] < target 
#     # sum += (arr.length / 2) + 1 
#     temp = bsearch(arr.drop(middle + 1), target) 
#     temp.nil? ? nil : middle + temp + 1 
#    else 
#     bsearch(arr.take(middle), target)
#    end 

# end 


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# def sum_nums(arr)
#     return 0 if arr.empty? 
#     arr[0] + sum_nums(arr[1..-1])
# end 

#arr = [4, 5, 16, 6, 7]
# p sum_nums(arr) 

# def has_num?(arr, value)
#     return false if arr.empty?
#     arr[0] == value ? true : has_num?(arr[1..-1], value)
# end 

# p has_num?(arr, value)
# arr = [4, 5, 16, 6, 7]
# value = 58

# def count(arr, value)
#    return 0 if arr.empty?
#    count_update = arr.first == value ? 1 : 0 
#    count_update + (count(arr.drop(1), value))
# end 

# arr = [4, 5, 16, 6, 7, 6, 6]
# value = 6
# p count(arr, value)


# require "byebug"
# def adj_elements(arr)
#     return false if arr.length == 1 
#     arr[0] + arr[1] == 12 ? true : adj_elements(arr.drop(1))
    
#     # i = 0 
#     # #debugger
#     # while i < arr.length - 1 
#     #     if arr[i] + arr[i + 1] == 12 
#     #         return true 
#     #     end 
#     #     i += 1 
#     # end 
#     # false 
# end 

# arr = [4, 5, 16, 6, 7, 4, 6]

# p adj_elements(arr)

# def sorted?(arr)
#     return nil if arr.empty?

#     mid_idx = arr.length / 2 



# end 

# arr = [4, 5, 16, 6, 7, 4, 6]

# p sorted?(arr)

def reverse_str(word)
    return "" if word.length == 0
    word[-1] + reverse_str(word[0...-1])
end 

p reverse_str('')