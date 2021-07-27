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
            if current_employee.employees != []
                current_employee.employees.each { |employee| queue << employee }
            end
        end
            
        # sum * multiplier
    end

end 

ned = Manager.new("Ned", "founder", 50000)
darren = Manager.new("Darren", "TA Manager", 10000, ned)
shawna = Employee.new("Shawna", "TA", 7000, darren)
david = Employee.new("David", "TA", 7000, darren)
darren.bonus(3)
# p david.boss