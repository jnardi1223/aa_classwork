def element_count(arr)
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1}
    hash
end

def char_replace!(str, hash)
    str.each_char.with_index { |char, i| str[i] = hash[char] if hash.has_key?(char) }
end 

def product_inject(arr)
    arr.inject {|acc, ele| acc * ele }
end 