def partition(arr, num)
    larger = []
    smaller = []
    arr.each { |ele| ele < num ? smaller << ele : larger << ele } 
    [smaller, larger]
end 

def merge(hash_1, hash_2)
    new_hash = {}

    hash_1.each {|k, v| new_hash[k] = v}
    hash_2.each {|k, v| new_hash[k] = v}
    
    new_hash 
end 

def censor(sent, arr)
    new_sent = sent.split(' ').map {|word| arr.include?(word.downcase) ? new_word(word) : word }.join(" ")
end 

def new_word(word)
    new_word = ''
    word.each_char {|char| "aeiouAEIOU".include?(char) ? new_word += '*' : new_word += char}
    new_word 
end 
require 'byebug'
def power_of_two?(num)
    i = 1
    while i <= num 
        return true if num == i 
        i *= 2
    end  
    false           
end 