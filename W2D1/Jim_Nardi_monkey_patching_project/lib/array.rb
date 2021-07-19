# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span 
        return nil if self.empty?
        self.max - self.min 
    end 

    def average
        return nil if self.empty?
        (self.sum * 1.0) / self.length 
    end

    def median 
        return nil if self.empty?
        sorted = self.sort 
        if self.length.odd? 
            sorted[self.length/ 2]
        else
            (sorted[(self.length / 2) - 1] + sorted[self.length / 2]) * 1.0 / 2 
        end 
    end 

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end

    def my_count(ele)
        self.counts[ele]
    end 

    def my_index(ele)
        return nil if !self.include?(ele)
        self.each_with_index do |let, i|
            return i if ele == let
        end 
    end 

    def my_uniq
        self.counts.keys
    end 

    def my_transpose
        height = self.length 
        width = self[0].length
        new_arr = Array.new(height) {Array.new(width)}
            (0...height).each do |r|
                (0...width).each do |c|
                    new_arr[r][c] = self[c][r]
                end
            end 
        new_arr
    end 
end
