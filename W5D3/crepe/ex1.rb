# Given a string s, find the longest palindrome substring in s. You may assume that the maximum length of s is 1000.

def longest_palindrom(str)
    substrings = []
    (str.length - 1).times do |i1|
        ((i1 + 1)..(str.length-1)).each do |i2|
            substr = str[i1..i2]
            substrings << substr if substr == substr.reverse
        end
    end
    substrings.inject {|acc, palindrome| palindrome.length > acc.length ? acc = palindrome : acc}
end

string1 = "babad"
string2 = "cbbd"

p longest_palindrom(string1)  # => bab
p longest_palindrom(string2) # => bb


# Example 1:

# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:

# Input: "cbbd"
# Output: "bb"