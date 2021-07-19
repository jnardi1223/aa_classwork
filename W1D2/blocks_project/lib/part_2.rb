def all_words_capitalized?(arr)
    arr.all? {|word| word.capitalize == word}
end 

def no_valid_url?(urls)
    endings = ['.com', '.net', '.io', '.org']
    
    urls.none? do |url| 
        endings.any? { |ending| url.end_with?(ending) }
    end 

end 

def any_passing_students?(arr)
    arr.any? {|student| student[:grades].sum / student[:grades].length >= 75}
end 