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

    def initialize(name, title, salary, boss= nil)
        super
        @employees = [self]
    end

    def bonus(multiplier)
        sum = 0
        @employees.each do |employee|
        end
    end

end 

ned = Manager.new("Ned", "founder", 50000)
darren = Manager.new("Darren", "TA Manager", 10000, ned)
shawna = Employee.new("Shawna", "TA", 7000, darren)
david = Employee.new("David", "TA", 7000, darren)
# p ned.bonus(5)
p shawna.boss