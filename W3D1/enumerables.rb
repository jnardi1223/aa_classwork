class Array

    def my_each(&prc)

        # self.map! do |ele|
           p prc.call(ele)
        # end

        p self
    end

end

arr = [1, 2, 3]
p arr.my_each({ |ele| puts ele })

# do you see this?