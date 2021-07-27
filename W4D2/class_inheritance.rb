class Employee

    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss= nil)
        @name = name 
        @title = title 
        @salary = salary
        self.boss = boss
    end

    def bonus(multiplier)
        @bonus = @salary * multiplier
    end 

    def boss=(boss)
        @boss = boss

        if !@boss.nil?
            @boss.employees << self
        end
    end

end

class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss= nil)
        super
        @employees = []
    end

    def bonus(multiplier)
        return 0 if employees.empty?

        @employees.each do |employee|
            
        end
    end

end 

ned = Manager.new("Ned", "founder", 50000)
darren = Manager.new("Darren", "TA Manager", 10000, ned)
shawna = Employee.new("Shawna", "TA", 7000, darren)
david = Employee.new("David", "TA", 7000, darren)
# p ned.bonus(5)
p david.boss