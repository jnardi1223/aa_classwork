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
        queue = []
        self.employees.each do |employee|
            queue << employee
        end
        
        sum = 0
        until queue.empty?
            current_employee = queue.shift
            sum += current_employee.salary
            if current_employee.class == Manager 
                current_employee.employees.each { |employee| queue << employee }
            end
        end
            
        sum * multiplier
    end

end 

ned = Manager.new("Ned", "founder", 1000000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
p ned.bonus(5)
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000