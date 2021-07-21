# def upcase(str)
#     return str if str.length == 0 
#     puts str
#     p output = str[0].upcase + upcase(str[1..-1])
# end 

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

