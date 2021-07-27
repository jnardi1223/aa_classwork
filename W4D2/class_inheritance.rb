class Employee

    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss= nil)
        @name = name 
        @title = title 
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @bonus = @salary * multiplier
    end 


end

class Manager < Employee

    def initialize
        super 
        @employees = []
    end

    def bonus(multiplier)
        
    end 

end 

ned = Manager.new("Ned", "founder", 50000)
p ned.bonus(5)
darren = Manager.new("Darren", "TA Manager", 10000, ned)
p darren