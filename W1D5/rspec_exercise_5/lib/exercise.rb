def zip(*arrs)
    new_arr = []

    i = 0
    while i < arrs[0].length
        temp = []
        arrs.each do |arr|
            temp << arr[i]
        end 
        i += 1
        new_arr << temp 
    end
    new_arr 
end 

# def zip(*arr)
#     #arr.transpose
#     (0...arr[0].length).map do |i| 
#         arr.map do |array| 
#             array[i]
#         end 
#     end
# end

def prizz_proc(arr, prc1, prc2)
    new_arr = arr.select {|ele| ele if (!prc1.call(ele) && prc2.call(ele)) || (prc1.call(ele) && !prc2.call(ele)) }
end 

def zany_zip(*arrs)
    length = arrs.map(&:length).max

    (0...length).map do |i|
        arrs.map { |arr| arr[i] }
    end
end

def maximum(arr, &prc)
    return nil if arr.empty? 
    new_hash = {}
    arr.each { |ele| new_hash[ele] = prc.call(ele) }
    sorted = new_hash.sort_by {|k, v| v}[-1][0]
end 

def my_group_by(arr, &prc)
    new_hash = Hash.new([])#Hash.new {|h, k| h[k] = [] }
    arr.each {|ele| new_hash[prc.call(ele)] << ele }
    new_hash
end 

def max_tie_breaker(arr, prc1, &prc2)
    arr.inject do |acc, el| 
        if prc2.call(acc) > prc2.call(el)
            acc
        elsif prc2.call(acc) < prc2.call(el)
            el 
        elsif prc2.call(acc) == prc2.call(el)
                if prc1.call(acc) > prc1.call(el)
                    return acc
                elsif prc1.call(acc) < prc1.call(el) 
                    return el 
                elsif prc1.call(acc) == prc1.call(el)
                    return acc
                end 
        end 
    end 
end 



def silly_syllables(sent)
    words = sent.split(' ')
    

    new_sent = words.map do |word|
        if vowel_count(word) >= 2 
            first_v = vowel_remove(word)
            second_v = vowel_remove(first_v.reverse)
            second_v.reverse
        else 
            word 
        end 
    end 
    new_sent.join(' ')

end

def vowel_remove(word)
    vowels = "AEIOUaeiou"
    word.each_char.with_index do |char, i|
        return word[i..-1] if vowels.include?(char)
    end
end 

def vowel_count(word)
    count = 0
    vowels = "AEIOUaeiou"
    word.each_char do |char|
        count += 1 if vowels.include?(char)
    end 
    count 
end  