def select_even_nums(arr)
    arr.select(&:even?)
end 

def reject_puppies(arr)
    arr.reject { |hash| hash["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count {|sub| sub.sum > 0 }
end 

def aba_translate(word)
    new_word = ''
    vowels = "aeiouAEIOU"
    word.each_char { |char| vowels.include?(char) ? new_word += char + "b" + char : new_word += char }
    new_word 
end


def aba_array(arr)
    arr.map {|word| aba_translate(word)}
end 