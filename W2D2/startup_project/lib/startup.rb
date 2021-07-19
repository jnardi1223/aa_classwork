require "employee"

class Startup
    attr_reader :name, :funding, :employees, :salaries

    def initialize(name, funding, salaries)
        @name = name 
        @funding = funding 
        @salaries = salaries
        @employees = []
    end 

    def valid_title?(title)
        salaries.has_key?(title) ? true : false 
    end 

    def >(start_up)
        self.funding > start_up.funding ? true : false 
    end 

    def hire(name, title)
        if valid_title?(title)
            @employees << Employee.new(name, title)
        else 
            raise "Already a Position"
        end 
    end 

    def size
        @employees.length
    end 

    def pay_employee(person)
        if @funding > salaries[person.title]
            person.pay(salaries[person.title])
            @funding -= salaries[person.title]
        else 
            raise "not enough money"
        end 
    end 

    def payday
        employees.each { |employee| pay_employee(employee) } 
    end 

    def average_salary
        sals = []
        employees.each { |employee| sals << salaries[employee.title] } 
        sals.sum / sals.length
    end 

    def close 
        @employees = []
        @funding = 0
    end 

    def acquire(start_up)
        @funding += start_up.funding
        start_up.salaries.each do |title, salary|
            salaries[title] = salary if !salaries.has_key?(title)
        end 
        start_up.employees.each { |new_e| employees << new_e }
        start_up.close
    end 

end
