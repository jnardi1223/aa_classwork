class Flight 
    
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end 

    def passengers
        @passengers
    end 

    def full?
        @passengers.length >= @capacity
    end 

    def board_passenger(passenger) #instance of passenger 
        if !self.full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end 
    end 

    def list_passengers
        @passengers.map { |passenger| passenger.name }
    end 

    def [](number)
        @passengers[number]
    end 

    def <<(passenger) #passenger instance 
        self.board_passenger(passenger)
    end 
end 