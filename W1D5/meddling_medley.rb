# def duos(str)
#     str.each_char.with_index.count { |char, i|  char == str[i + 1] }
# end 

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

# def sentence_swap(sent, hash)
#     new_sent = sent.split(' ').map {|word| hash.has_key?(word) ? hash[word] : word}.join(' ')
# end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

# def hash_mapped(hash, prc1, &bloc)
#     new_hash = {}
#     hash.each { |k, v| new_hash[bloc.call(k)] = prc1.call(v) }
#     new_hash
# end 

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

# def counted_characters(str)
#     hash = Hash.new(0)
#     new_arr = []
#     str.each_char {|char| hash[char] += 1 }
#     hash.each do |k, v|
#         new_arr << k  if v > 2 
#     end 
#     new_arr 
# end 

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

# def triplet_true(str)
#     str.each_char.with_index.count { |char, i| char == str[i + 1] || char == str[i + 2] } > 1
# end 

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

# def energetic_encoding(str, hash)
#     new_sent = ''
#     str.each_char { |char| hash.has_key?(char) ? new_sent += hash[char] : char == ' ' ?  new_sent += ' ' : new_sent += "?" }
#     new_sent 
# end 

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

# def uncompress(word)
#     new_word = word.each_char.with_index.map { |char, i| char * word[i + 1].to_i if i.even? }.join('')
# end 

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# def conjunct_select(arr, *prcs)
#     new_arr = arr.select { |ele| prcs.all? { |prc| prc.call(ele) } }
# end 

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# def convert_pig_latin(sent)
#     new_sent = sent.split(" ").map { |word| word.length > 2 ? word[0].upcase == word[0] ? translate(word).capitalize : translate(word) : word}.join(' ')
# end 

# def translate(word)
#     return word + 'yay' if "aeiouAEIOU".include?(word[0]) || word.each_char.with_index { |char, i| return word[i..-1] + word[0...i] + 'ay' if "aeiouAEIOU".include?(char) }
# end 

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# def reverberate(sent)
#     words = sent.split(' ')
#     new_sent = words.map { |word| word.length < 3 ? word : translate(word) } 
#     new_sent.join(' ')
# end

# def translate(word)
#     vowels = 'AEIOUaeiou'
#     return word + word.downcase if vowels.include?(word[-1])
#     reversed = word.reverse
#     reversed.each_char.with_index do |char, i| 
#     return (reversed[0..i] + reversed).reverse if vowels.include?(char)
#     end 
# end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

# def disjunct_select(arr, *prcs)
#     new_arr = arr.select do |ele| 
#         prcs.any? { |prc| prc.call(ele) } 
#     end 
#     new_arr
# end 

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

# def alternating_vowel(sent)
#     sent.split(' ').each_with_index.map { |word, i| i.even? ? remove_vowel(word) : remove_vowel(word.reverse).reverse }.join(' ')
# end 

# def remove_vowel(word)
#     word.each_char.with_index { |char, i| return word[0...i] + word[i + 1..-1] if "AEIOUaeiou".include?(char) } 
# end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

# def silly_talk(sent) 
#     sent.split(' ').map { |word| "AEIOUaeiou".include?(word[-1]) ? word + word[-1] : translate(word) }.join(' ')
# end 

# def translate(word)
#     new_word = word.each_char.map { |char| "AEIOUaeiou".include?(char) ? char + 'b' + char : char }.join
# end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(string)
    compressed = ''
    i = 0
    while i < string.length
        char = string[i]
        count = 1
        i += 1
        while char == string[i]
            count += 1
            i += 1
        end

        if count > 1
            compressed += char + count.to_s
        else
            compressed += char
        end
    end

    compressed
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"

#We need to check the first char to the second 
#if same add one to count and move to next one / if not same return char and count if count > 1 
#if same add one to count/ if not return char and count if count > 1 
