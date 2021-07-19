def hipsterfy(word)
    vowels= "AEIOUaeiou"

    i = word.length - 1
    while i > 0 
        if vowels.include?(word[i])
            word[i] = ''
            return word 
        end 
        i -= 1
    end 
    return word 
end 

def vowel_counts(str)
    
    vowels = "AEIOUaeiou"
    hash = Hash.new(0)
    
    str.each_char {|char| hash[char.downcase] += 1 if vowels.include?(char) }
    hash 

end 

def caesar_cipher(str, n)
    alpha = ("a".."z").to_a
    new_word = []
   
    str.each_char do |char|
        if alpha.include?(char)
            old_idx = alpha.index(char)
            new_idx = old_idx + n 
            new_word << alpha[new_idx % 26 ]
        else 
            new_word << char
        end 
    end 

    new_word.join('')
end 

# ALPHABET = [*"a".."z", *"A".."Z"]

# def caesar_cipher(msg, n)
#     msg.split("").map { |char| ALPHABET.include?(char) ? ALPHABET[(ALPHABET.index(char) + n) % 26] : char }.join("")
# end