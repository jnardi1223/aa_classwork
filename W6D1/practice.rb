# Given an integer x, return true if x is palindrome integer.

# An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.

 

# Example 1:

# Input: x = 121
# Output: true
# Example 2:

# Input: x = -121
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
# Example 3:

# Input: x = 10
# Output: false

def is_palindrome(int)
  str = int.to_s
  return true if str.reverse == str
  false
end

p is_palindrome(121) #true
p is_palindrome(-121) #false
p is_palindrome(123) #false

def eff_palindrome(int)
  str = int.to_s
  
end

# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

 

# Example 1:

# Input: strs = ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

def longest_prefix(arr)
  result = ''
  i = 0
  while i < arr[0].length
    bool = arr.all? do |word|
      arr[0][i] == word[i]
    end
    if bool
      result += arr[0][i]
      i += 1
    else
      return result
    end
  end
end

p longest_prefix(["flower","flow","flight"])
p longest_prefix(["dog","racecar","car"])





