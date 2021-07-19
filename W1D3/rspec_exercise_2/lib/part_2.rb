def palindrome?(str)
        i = 0
    while i < str.length - 1 
        return false if str[i] != str[-1 - i]
        i += 1 
    end 
    true 
end

def substrings(str)
    arr = []
    
    (0...str.length).each do |start_idx|
        (start_idx...str.length).each do |end_index|
            arr << str[start_idx..end_index]
        end 
    end 
    arr
end 

def palindrome_substrings(str)
    substrings(str).select {|sub| palindrome?(sub) && sub.length > 1 }
end 